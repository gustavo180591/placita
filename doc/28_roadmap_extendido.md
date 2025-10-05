# Roadmap Extendido — placita
**Fecha:** 2025-10-05

Este roadmap baja a tierra todo lo documentado (schema.prisma, reglas, rutas, vistas, offline, seguridad) y lo organiza en **fases, sprints**, con **DOR/DOD**, **criterios de aceptación**, **dependencias**, **riesgos** y **métricas** claras.

> Principios: móvil primero, offline-first, rapidez de venta (≤10s), simplicidad de uso, sincronización robusta y datos seguros.

---

## Visión de Alto Nivel (Hitos)
- **H1 — MVP operativo en feria**: POS rápido, productos, clientes+fiado, compras básicas, reportes esenciales, offline real, exportación.
- **H2 — Eficiencia y rentabilidad**: promos/cobos, múltiples precios por medio, reportes avanzados, conciliación QR, arqueo.
- **H3 — Escala y calidad**: performance, UX avanzada, seguridad, backups, observabilidad.
- **H4 — Expansión**: integraciones (WhatsApp/pagos), analítica, planificación compras, multi-sucursal.

---

## Estructura de Trabajo por Tracks
- **FE** (Frontend web móvil / PWA).
- **BE** (API + Prisma + lógica de dominio).
- **SYNC** (offline, colas, reconciliación).
- **DATA** (migraciones, semillas, export/import).
- **QA** (tests unitarios, integración, E2E, UAT).
- **DEVOPS** (CI/CD, Docker, entornos, observabilidad).
- **SEC** (seguridad, cumplimiento, cifrado).

---

## Fase 0 — Preparación y Configuración (1 semana)
**Objetivo:** Base estable de proyecto, CI/CD y docs vivas.

### Entregables
- Repos mono-repo (packages: fe, be, infra).
- CI/CD: lint, typecheck, unit tests, pr checks.
- Entornos: dev, stage, prod (Docker Compose).
- Documentación base:
  - `25_vistas_y_rutas_frontend.md` (hecho)
  - `26_routes_frontend.md` (hecho)
  - `27_rules.md` (hecho)
  - `schema.prisma` (hecho)

### Tareas clave
- FE: bootstrap (SvelteKit/React), routing, layouts (public/private).
- BE: Nest/Fastify/Express + PrismaClient; seeds mínimas.
- DEVOPS: pipelines, imágenes Docker, variables .env, volúmenes persistentes.
- QA: plantilla de test, utilidades de datos fake.
- SEC: política de secretos (.env), rotación local.

**DOD (Definition of Done)**
- Pipeline verde (build+lints+tests).
- Deploy local con `docker compose up -d`.
- Docs publicadas en repo `/docs`.

---

## Fase 1 — MVP (4–6 semanas, 3 sprints)
**Objetivo:** Operar ventas reales en feria, sin fricción.

### Sprint 1 (Semana 1–2): Autenticación + Catálogo + POS básico
- FE: login (email/clave), guard, home, POS (búsqueda, agregar ítems, total).
- BE: endpoints productos, ventas, clientes.
- DATA: semillas top SKUs, 10 clientes fiado.
- QA: tests unitarios precio línea (PRC-CAL-001), validaciones venta vacía (POS-VLD-002).
- SEC: hashing passwords, rate limit login.

**Criterios de aceptación**
- Crear venta con efectivo (sin fiado) ≤10s.
- Búsqueda de producto <200ms con 500 SKUs.

### Sprint 2 (Semana 3–4): Pagos múltiples + Fiado + Clientes
- FE: selección de medio (efectivo/QR/fiado), detalle cliente, registrar pago parcial fiado.
- BE: saldo deudor en `DeudaCliente`, endpoints pagos.
- SYNC: cola offline para ventas y pagos (append-only).
- QA: UAT fiado (FIA-RUL-001/002), errores claros (`FIA-LIM-001`).

**Criterios de aceptación**
- Venta con fiado afecta saldo.
- Modo offline permite vender; al reconectar sincroniza sin duplicar (SYNC-MER-004).

### Sprint 3 (Semana 5–6): Compras + Reportes esenciales + Cierre de caja
- FE: ABM compras, foto de remito, reportes (ventas del día, stock mínimo, fiado).
- BE: costo promedio móvil (CMP-CAL-001), alertas stock crítico.
- QA: E2E venta→reporte día; compra actualiza stock/costo.
- DEVOPS: backup volumen DB (cron) y restauración.

**Criterios de aceptación**
- Reporte ventas del día consistente.
- Cierre de caja con desglose por medio de pago.

**DOD Fase 1**
- Manual rápido de uso (PDF).
- Exportación CSV de ventas y clientes.
- UAT en dispositivo gama media sin errores críticos.

---

## Fase 2 — Funcionalidades Avanzadas (4 semanas, 2 sprints)
**Objetivo:** Más margen y automatización.

### Sprint 4 (Semana 7–8): Promos/Combos + Precios por medio
- FE: reglas por cantidad, combos, UI de precios por medio (QR %).
- BE: engine de pricing (PRC-CAL-001, PRM-RUL-002, PRM-RUL-003).
- QA: tests paramétricos de pricing (matriz casos).

**Aceptación**
- 3x2 y precio por cantidad aplican auto en POS.
- Precio QR % respeta `listaQrPct` y `rules.md`.

### Sprint 5 (Semana 9–10): Compras avanzadas + Reportes avanzados
- FE: cuentas por pagar, filtro por proveedor, rentabilidad por producto.
- BE: costo promedio vs último costo (flag), KPIs avanzados.
- QA: E2E compras→rentabilidad mensual.

**Aceptación**
- Top vendidos y stock inmóvil funcionando.
- Rentabilidad por producto con muestras.

---

## Fase 3 — Optimización y Escalabilidad (3 semanas, 1–2 sprints)
**Objetivo:** Rendimiento, UX y seguridad robustas.

### Sprint 6 (Semana 11–13)
- FE: atajos, personalización mínima, tutoriales (coach marks).
- BE: caché selectiva (catalog), N+1 killer, índices adicionales.
- SYNC: reconciliación avanzada (conflictos de stock/precio).
- SEC: cifrado en reposo (DB) y en tránsito (TLS), PIN de app.
- QA: pruebas de carga con dataset 10k ítems/100k ventas.

**Aceptación**
- P95 operación POS < 1s.
- Sincronización consistente bajo pérdida intermitente de red.

---

## Fase 4 — Crecimiento y Expansión (4 semanas, 2 sprints)
**Objetivo:** Integraciones y features premium.

### Sprint 7 (Semana 14–15)
- Integración WhatsApp (deeplink) para: cobrar fiado, enviar ticket.
- Export contable (CSV estándar), pasarelas extra (mock).

### Sprint 8 (Semana 16–17)
- Dashboard analítico (tendencias MoM), planificación de compras (sugerencias).
- Multi-sucursal (feature flag; modelos ya preparados para escalar).

**Aceptación**
- Envío de recordatorios con deeplink correcto.
- Sugerencias de reposición a partir de ventas/stock mínimo.

---

## Matriz DOR/DOD por Feature (extracto)
| Feature | DOR (Definition of Ready) | DOD (Definition of Done) |
|---|---|---|
| POS básico | Rutas definidas, mocks de producto, `rules.md` pricing | Tests unitarios pricing, E2E venta, performance OK |
| Fiado | `limiteFiado` definido, UX de selección de cliente | Saldo correcto, pagos parciales, reporte de deuda |
| Compras | Proveedores cargados, esquema costos | Stock y costo actualizados, foto remito |
| Promos | Reglas por cantidad especificadas | Casos E2E, no rompe otros medios de pago |

---

## Dependencias y Riesgos
- **Conectividad**: señal débil → priorizar offline y reconciliación. Mitigar con cola persistente y tests de red.
- **Curva de adopción**: POS debe ser ultra simple; sesiones de capacitación y tooltips.
- **Inflación**: actualizaciones masivas de precios; vista previa de margen y undo.
- **Dispositivo de gama media**: performance y memoria; medir P95 en hardware real.

---

## Observabilidad
- Logs estructurados (correlación por venta/reserva/compra).
- Métricas: tiempo de venta, errores por módulo, tamaño de cola offline, confirmaciones QR.
- Alertas: pagos QR sin confirmar, stock negativo post-sync, caída de conexión prolongada.

---

## Métricas de Éxito (cuantificables)
- **Tiempo por venta** ≤ 10 s (mediana); P95 ≤ 20 s.
- **Errores de inventario**: -80% en 60 días.
- **Cobro de fiados**: +30% tasa de recuperación en 90 días.
- **Disponibilidad local** (offline útil): 100% en horario operativo.

---

## Checklist Operativo por Release
- Migraciones Prisma aplicadas y backfilled.
- Seeds y scripts de rollback de datos de prueba.
- Backups de volumen (pre y post).
- UAT firmado por usuario clave.
- Tag en git + changelog publicado.

---

## Apéndice A — Tabla de Historias de Usuario (extracto)
- **US-001**: “Como vendedor, quiero cerrar una venta en 3 toques…” (POS básico).
- **US-014**: “Como Juan, quiero fiar hasta mi límite…” (Fiado).
- **US-021**: “Como encargado, quiero registrar compras con foto…” (Compras).
- **US-033**: “Como operador, quiero ver productos en stock crítico…” (Inventario).

---

## Apéndice B — Scripts útiles
- **Actualizar contenedor sin perder datos** (compose): `docker compose pull && docker compose up -d`
- **Backup volumen DB**: ver `infra/backup.sh` (programar cron).

