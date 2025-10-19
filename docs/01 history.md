# Placita — Historias de Usuario (history.md)
**Fecha:** 2025-10-19  
**Contexto:** Marketplace estilo Mercado Libre para Argentina (AR).  
**Objetivo:** Definir historias de usuario con criterios de aceptación (CA), reglas y ejemplos (Gherkin) para guiar diseño, desarrollo y QA.

---

## 0) Convenciones
- **Prioridad:** `MVP` (primera entrega), `SIG` (siguiente), `FUT` (futuro).
- **Rol:** Comprador, Vendedor, Admin.
- **Definición de Hecho (DoD):** Tests unit/e2e pasan; mediciones de rendimiento OK; trazas Sentry sin errores críticos; accesibilidad mínima (labels, foco, contraste).
- **Glosario rápido:** PDP = Product Detail Page; CP = código postal; MP = Mercado Pago.

---

## Épica A — Publicación de productos (Vendedor)
**Meta:** Crear/gestionar publicaciones con fotos, precio, stock, variantes y estado.

### A1 — Crear publicación básica (MVP)
**Como** vendedor **quiero** cargar título, categoría, descripción, fotos (≤10), precio ARS, stock y condición (nuevo/usado) **para** publicar y vender.
- **CA**
  - Valida campos obligatorios (título, categoría, precio ≥ 0, stock ≥ 0).
  - Soporta JPG/PNG ≤ 5MB c/u (máx 10).
  - Estado: `BORRADOR` o `PUBLICADA`.
  - Slug SEO autogenerado y único por publicación.
- **Gherkin**
```gherkin
Feature: Crear publicación
Scenario: Publicación válida
  Given soy vendedor logueado
  And completo título, categoría, precio 10000, stock 5
  And subo 3 fotos válidas
  When hago clic en "Publicar"
  Then la publicación queda en estado "PUBLICADA"
  And puedo abrir la URL SEO única
```

### A2 — Editar/pausar/republicar (MVP)
- Cambiar precio, stock y descripción.
- **Pausar** (no indexada/visible) y **republicar** sin perder SEO.
- Historial mínimo de cambios (timestamp, usuario).

### A3 — Variantes (SIG)
- Atributos (talle, color); stock y precio por variante.
- Selector de variante en PDP; validación stock por variante.

### A4 — Herramientas masivas (FUT)
- Importación CSV/Excel para alta/edición bulk con reporte de errores.

---

## Épica B — Descubrimiento y búsqueda (Comprador)
**Meta:** Encontrar productos rápido con búsqueda, filtros y orden.

### B1 — Búsqueda y filtros (MVP)
- **CA**
  - Búsqueda por título/categoría/popularidad (Meilisearch).
  - Filtros: precio min/max, categoría, condición, ubicación (provincia), envío gratis, 24h.
  - Orden: relevancia (default), precio ↑/↓, más vendidos.
- **Gherkin**
```gherkin
Scenario: Búsqueda con filtros
  Given estoy en la home
  When busco "mochila escolar"
  And aplico filtro "Envío gratis" y "Precio hasta $20.000"
  Then veo resultados acordes a los filtros
```

### B2 — Sugerencias/autocomplete (SIG)
- Sugerencias de términos y categorías más buscados.

### B3 — Guardados/historial (FUT)
- Búsquedas recientes, favoritos, alertas de precio.

---

## Épica C — Página de producto (PDP)
**Meta:** Detalle claro para decidir compra.

### C1 — PDP completa (MVP)
- Galería, título, precio, stock/variantes, reputación del vendedor.
- Envío estimado por CP, políticas de devolución/garantía.
- CTA: **Agregar al carrito** y **Comprar ahora**.

---

## Épica D — Carrito y Checkout (Comprador)
**Meta:** Agregar productos y completar compra con métodos locales.

### D1 — Carrito (MVP)
- Agregar/quitar/editar cantidades.
- Validar stock al confirmar.

### D2 — Checkout con Mercado Pago (MVP)
- Dirección de entrega o retiro en punto.
- Cálculo de envío por CP.
- Pago por MP (redirect/widget) o transferencia (si habilitado).
- Estados: `CREADA` → `PENDIENTE_PAGO` → `PAGADA` (webhook) → `EN_PREPARACION`.
```gherkin
Scenario: Checkout exitoso con MP
  Given tengo productos en el carrito
  And selecciono envío al CP 3300
  When pago con Mercado Pago exitosamente
  Then la orden cambia a "PAGADA"
  And recibo confirmación
```

### D3 — Múltiples vendedores (SIG)
- Split de envíos y liquidación por vendedor en una misma compra.

---

## Épica E — Envíos y logística
**Meta:** Gestionar envíos, estados y tracking.

### E1 — Métodos simples (MVP)
- Opciones: Retiro en persona y Envío por correo/moto.
- Cálculo simple por tabla de tarifas + CP.

### E2 — Integración logística (SIG)
- Etiquetas PDF y tracking; estados: `PREPARANDO`, `EN_CAMINO`, `ENTREGADO`, `DEVUELTO`.

---

## Épica F — Mensajería y preguntas
**Meta:** Resolver dudas antes de comprar.

### F1 — Q&A en PDP (MVP)
- Preguntas públicas con moderación básica.
- Notificación al vendedor (email/WhatsApp).
- Respuestas visibles en PDP.

---

## Épica G — Reputación y calificaciones
**Meta:** Construir confianza.

### G1 — Rating post-entrega (SIG)
- 1–5 estrellas + comentario opcional.
- Score agregado por vendedor (ocultar con N<5).

---

## Épica H — Órdenes y post-venta
**Meta:** Ver historial, estados y gestionar cambios.

### H1 — Historial de órdenes (MVP)
- Comprador: lista/detalle (pagos, envío, factura).
- Vendedor: ventas, impresión de comprobante, export CSV.

### H2 — Devoluciones y reclamos (SIG)
- Ventana configurable (p.ej., 7 días); flujo de autorización; guía de retorno.

---

## Épica I — Autenticación y cuentas
**Meta:** Accesos seguros y perfiles.

### I1 — Registro/Login email+clave (MVP)
- Validación, rate-limit, CAPTCHA tras 3 intentos fallidos.
- JWT + cookie segura; perfiles y direcciones.

### I2 — Login social (SIG)
- Google OAuth2; vinculación con cuenta existente.

---

## Épica J — Pagos y liquidaciones (Vendedor)
**Meta:** Transparencia en ingresos.

### J1 — Wallet/Liquidación (SIG)
- Resumen de ventas, comisiones y transferencias a CBU/alias.
- Reporte descargable mensual.

---

## Épica K — Administración (Ops)
**Meta:** Moderación, catálogo y métricas.

### K1 — Panel admin (MVP)
- ABM categorías, moderar publicaciones/preguntas.
- Reportes: ventas por día, top categorías, usuarios activos.

---

## Reglas de Negocio (extracto clave)
- Moneda: ARS; comisiones por categoría/plan.
- Stock: descuenta al confirmar compra o al pagar (configurable).
- Devoluciones: ventana configurable; electrónicos con verificación.
- Reputación: mostrar promedio con N≥5; penalizar cancelaciones del vendedor.
- Seguridad: 2FA opcional; rate-limit login; CORS con credenciales en dev/prod.
- Fiscal/Comprobantes: factura/ticket (AFIP más adelante).

---

## No Funcionales
- Performance: TTFB < 300ms en catálogos; LCP < 2.5s (p75).
- Escalabilidad: colas (BullMQ) para webhooks/notificaciones.
- Disponibilidad: 99.5% objetivo; backups diarios DB (7/30 días).
- Observabilidad: Sentry FE/BE; logs estructurados (Pino).
- Privacidad: PII mínima en logs; cookies httpOnly, SameSite adecuado.

---

## Dependencias y Roadmap (MVP sugerido)
1) Búsqueda + Catálogo (B1, C1)
2) Publicación simple (A1–A2)
3) Carrito + Checkout MP (D1–D2)
4) Órdenes (H1)
5) Auth básica (I1)
6) Envíos simples (E1)
7) Admin mínimo (K1)

---

## Métricas de Éxito
- % conversión PDP→Checkout
- Tiempo medio de publicación (A1)
- Tasa de éxito de pagos (D2)
- NPS compradores y vendedores
- Tasa de resolución en primer contacto (F1)

---

## Historias técnicas relacionadas (DoR)
- CORS con credenciales (`enableCors` en Nest + proxy Vite en dev).
- Offline y cola de sincronización básica.
- Indexación Meilisearch (sinónimos: birome/lapicera/bolígrafo).
- Auditoría de cambios en publicaciones y órdenes.

---

## Cambios y versión
- v1.0 — Bootstrap de historias MVP (esta versión).
- Próximas: variantes (A3), Q&A (F1), rating (G1), devoluciones (H2), wallet (J1), logística (E2).
