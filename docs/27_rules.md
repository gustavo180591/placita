# Reglas de Negocio — placita
**Fecha:** 2025-10-05

## Propósito
Este documento define las reglas de negocio, validaciones, estados y cálculos que rigen el comportamiento de **placita**. Es la referencia única para desarrollo, QA y producto.

---

## Índice
1. [Alcance, Precedencia y Feature Flags](#alcance-precedencia-y-feature-flags)
2. [Convenciones e Identificadores](#convenciones-e-identificadores)
3. [Reglas Transversales: Moneda, Redondeo y Totales](#reglas-transversales-moneda-redondeo-y-totales)
4. [Máquinas de Estado](#máquinas-de-estado)
5. [Validaciones Duras (Bloqueos)](#validaciones-duras-bloqueos)
6. [Precios, Descuentos y Promos](#precios-descuentos-y-promos)
7. [Fiado, Pagos Parciales, Reservas y Señas](#fiado-pagos-parciales-reservas-y-señas)
8. [Compras, Costeo y Ajustes](#compras-costeo-y-ajustes)
9. [Reportes y KPIs](#reportes-y-kpis)
10. [Seguridad, Roles y Permisos](#seguridad-roles-y-permisos)
11. [Offline, Sync y Conflictos](#offline-sync-y-conflictos)
12. [Errores y Alertas](#errores-y-alertas)
13. [Retención y Auditoría](#retención-y-auditoría)
14. [Cumplimiento y Documentos](#cumplimiento-y-documentos)
15. [Rendimiento y Límites](#rendimiento-y-límites)
16. [Plantilla de Regla](#plantilla-de-regla)
17. [Mantenimiento y Historial](#mantenimiento-y-historial)

---

## Alcance, Precedencia y Feature Flags
- **RUL-000 (precedencia):** Si hay conflicto, aplicar **Bloqueos > Seguridad > Validaciones > Cálculos > UI**.
- **RUL-001 (feature flags):** Toda regla puede condicionarse por `featureFlag` (p. ej. `pricing.qrMarkup`, `inventory.allowNegativeOffline`).

## Convenciones e Identificadores
- **Formato ID:** `MÓDULO-CATEGORÍA-NÚMERO` (ej. `POS-CAL-001`).
- **Plantilla por regla:** ID, Descripción, Condición, Acción/Fórmula, Prioridad, Ejemplos, Errores/Alertas, Flags/Config, Trazabilidad.

## Reglas Transversales: Moneda, Redondeo y Totales
- **TAX/MON-001 (moneda):** Montos en **ARS** `Decimal(14,2)`; porcentajes `Decimal(6,4)`.
- **TAX/MON-002 (redondeo):** Redondeo **comercial** a 2 decimales por línea y totales.
- **TAX/MON-003 (total ticket):** `total = Σ(subtotales_línea) – descuentos_ticket + recargos_medios_pago`.
- **TAX/MON-004 (redondeo amigable):** Si `pricing.redondeoAmigable=on`, ajustar total a múltiplo de $100 (diferencia=“ajuste redondeo”).

## Máquinas de Estado
- **POS-STA-001 (Venta):** `ABIERTA → CERRADA → [ANULADA] (solo ADMIN)`.
  - Cierre exige `≥1 ítem` y `estadoPago ∈ {PENDIENTE, PARCIAL, PAGADO}`.
- **PAY-STA-001 (Pago QR):** `registrado(confirmado=false) → confirmado=true` (conciliación). Alerta si >24h sin confirmar.
- **RSV-STA-001 (Reserva):** `ABIERTA (compromete stock) → ENTREGADA | CANCELADA (libera stock)`.
- **RET-STA-001 (Devolución/Cambio):** `SOLICITADA → APROBADA → APLICADA | RECHAZADA`.

## Validaciones Duras (Bloqueos)
- **INV-VLD-001 (stock negativo):** Bloqueado **online**. **Permitido offline** si `inventory.allowNegativeOffline=on`; en sync, si `stock<0` ⇒ `INV-ALR-001` y revisión.
- **POS-VLD-002 (venta vacía):** Prohibida. Error `POS-EMPTY-001`.
- **CLI-VLD-003 (fiado):** Requiere cliente. `saldoCliente + totalFiado ≤ limiteFiado` (o warn si `fiado.allowOverdraft=on`).

## Precios, Descuentos y Promos
- **PRC-CAL-001 (precio de línea):**
  ```
  precioBase  = ofertaActiva ? precioOferta : precioLista
  precioMedio = (medio==QR && pricing.qrMarkup) ? precioBase*(1+listaQrPct) : precioBase
  precioFinal = override ?? precioMedio
  subtotal    = round(cantidad * precioFinal, 2)
  ```
- **PRM-RUL-002 (promo por cantidad):** Si `cantidad ≥ umbral`, usar `precioPromoUnit`.
- **PRM-RUL-003 (combo):** Vender `SKU_COMBO` descuenta componentes (stock) y usa precio del combo.
- **PRC-UPD-004 (actualización masiva):** `%` por categoría/proveedor; vista previa de **margen** resultante.

## Fiado, Pagos Parciales, Reservas y Señas
- **FIA-RUL-001 (apertura de fiado):** `VentaPago(FIADO, confirmado=true)` actualiza `DeudaCliente.saldo`.
- **FIA-RUL-002 (pagos parciales):** Aplicar por **FIFO** o selección de venta; registrar recibo.
- **RSV-RUL-001 (seña):** `seniaARS` se descuenta al concretar venta; cancelación retorna o no la seña según `reservas.devolverSeña`.

## Compras, Costeo y Ajustes
- **CMP-CAL-001 (costo promedio móvil):**
  ```
  nuevoCosto = (stockPrev*costoPrev + qty*costoUnit) / (stockPrev + qty)
  ```
  Si `pricing.promedioMovil=off`, se usa costo último.
- **CMP-VLD-002 (compra con ítems):** Al menos 1 ítem válido. Error `CMP-EMPTY-001`.
- **AJU-RUL-001 (merma):** No revaloriza costo; ajusta stock y bitácora.

## Reportes y KPIs
- **RPT-KPI-001 (Ventas del día):** Σ ventas **CERRADAS** del día (hora local).
- **RPT-KPI-002 (Margen estimado):** `Σ(ventaItem.subtotal) – Σ(costoUnit*cantidad)`.
- **RPT-KPI-003 (Stock inmóvil):** productos sin ventas en `X` días.
- **RPT-KPI-004 (Fiado vencido):** `hoy > fechaCompromiso AND saldo > 0`.

## Seguridad, Roles y Permisos
- **SEC-ROL-001 (OPERADOR):** Crear ventas, pagos, ver stock, NO precios/costos masivos.
- **SEC-ROL-002 (ADMIN):** Todo, incl. anulaciones, precios masivos, usuarios, exportación.
- **SEC-RUL-003 (auditoría):** Persistir `registradoPorId/creadoPorId` en operaciones críticas.

## Offline, Sync y Conflictos
- **SYNC-RUL-001 (cola offline):** Eventos **append-only** (UUID), reintentos exponenciales.
- **SYNC-CFL-002 (precio concurrente):** `last-write-wins` + log + banner.
- **SYNC-CFL-003 (stock negativo tras sync):** Mantener venta; marcar `STOCK_REVISAR` y tarea de reconteo.
- **SYNC-MER-004 (idempotencia):** No duplicar operaciones por reintentos.

## Errores y Alertas
| Código         | Mensaje (UX)                                       | Nivel  | Acción sugerida |
|----------------|-----------------------------------------------------|--------|------------------|
| POS-EMPTY-001  | No podés cerrar una venta sin ítems.               | error  | Agregar ítems    |
| INV-ALR-001    | Stock negativo detectado tras sincronizar.         | warn   | Revisar conteo   |
| PAY-ALR-001    | Tenés pagos QR sin confirmar por más de 24 horas.  | info   | Conciliar ahora  |
| FIA-LIM-001    | Límite de fiado superado.                          | error  | Reducir monto o autorizar |
| CMP-EMPTY-001  | La compra debe incluir al menos un ítem.           | error  | Agregar ítems    |

## Retención y Auditoría
- **AUD-RUL-001 (retención):** Movimientos conservados indefinidamente; exportación CSV/PDF.
- **AUD-RUL-002 (histórico de precio):** Cada cambio crea `Precio` con `creadoPorId` y vigencias.

## Cumplimiento y Documentos
- **DOC-RUL-001 (Ticket simple):** Campos mínimos + leyenda de garantía opcional (3–7 días).
- **DOC-RUL-002 (Factura C):** Si `fiscal.facturaElectronica=on`, emitir con datos fiscales cargados.

## Rendimiento y Límites
- **NFR-PRF-001:** Venta típica en ≤ **10 s** (3 toques).
- **NFR-PRF-002:** Búsqueda local < **200 ms**.
- **NFR-PRF-003:** Listas paginadas (50 filas) en móvil.

---

## Plantilla de Regla
```
### <ID> — <Nombre corto>
**Descripción:** <1–3 líneas claras>

**Condición de aplicación**
- <Precondiciones, contexto, flags>

**Acción / Fórmula**
- <Pseudocódigo o fórmula exacta>

**Prioridad:** Alta | Media | Baja

**Ejemplos**
- Input → Output

**Errores/Alertas**
- <CODE> — <mensaje> — (nivel)

**Flags/Config**
- <featureFlag / parámetro>

**Trazabilidad**
- Endpoints, modelos/campos afectados, test cases
```

## Mantenimiento y Historial
- Toda modificación debe incluir **fecha**, **motivo** y **autor**.
- Mantener un **changelog** interno en la cola de abajo.

---

### Changelog
- 2025-10-05: Creación inicial del documento.
