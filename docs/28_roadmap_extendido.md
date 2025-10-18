# Roadmap Extendido — placita
**Fecha:** 2025-10-05
**Versión:** 1.1.0

Este roadmap baja a tierra todo lo documentado (schema.prisma, reglas, rutas, vistas, offline, seguridad) y lo organiza en **fases, sprints**, con **DOR/DOD**, **criterios de aceptación**, **dependencias**, **riesgos** y **métricas** claras.

> Principios: móvil primero, offline-first, rapidez de venta (≤10s), simplicidad de uso, sincronización robusta y datos seguros.

---

## Visión de Alto Nivel (Hitos)
- [ ] **H1 — MVP operativo en feria**: POS rápido, productos, clientes+fiado, compras básicas, reportes esenciales, offline real, exportación.
- [ ] **H2 — Eficiencia y rentabilidad**: promos/cobos, múltiples precios por medio, reportes avanzados, conciliación QR, arqueo.
- [ ] **H3 — Escala y calidad**: performance, UX avanzada, seguridad, backups, observabilidad.
- [ ] **H4 — Expansión**: integraciones (WhatsApp/pagos), analítica, planificación compras, multi-sucursal.

---

## Equipo y Responsabilidades

### Liderazgo Técnico
- **Arquitecto de Soluciones (SA)**: Define arquitectura técnica, patrones y estándares
- **Tech Lead (TL)**: Lidera implementación, revisiones de código, mentoría
- **Product Owner (PO)**: Prioriza backlog, define criterios de aceptación
- **Scrum Master (SM)**: Facilita procesos ágiles, remueve impedimentos

### Estructura del Proyecto

#### Arquitectura General
- **Frontend**: Aplicación SvelteKit 2 con arquitectura basada en componentes
- **Backend**: API RESTful con NestJS
- **Base de Datos**: PostgreSQL con Prisma ORM
- **Sincronización**: Estrategia offline-first con cola de operaciones
- **Despliegue**: Contenedores Docker con orquestación

#### Estructura de Directorios Clave
```
placita/
├── .github/            # CI/CD y plantillas
├── docker/             # Configuraciones Docker
├── prisma/             # Esquema y migraciones
├── src/
│   ├── app/            # Rutas SvelteKit
│   ├── lib/
│   │   ├── components/ # Componentes reutilizables
│   │   ├── services/   # Lógica de negocio
│   │   ├── stores/     # Estado global
│   │   └── utils/      # Utilidades
│   └── styles/         # Estilos globales
└── tests/              # Pruebas automatizadas
```

#### Estándares Técnicos
- **Código**: TypeScript estricto, ESLint, Prettier
- **Pruebas**: 80% cobertura mínima
- **Seguridad**: JWT, CORS estricto, headers de seguridad
- **Monitoreo**: Métricas, logs y alertas

### Equipos Funcionales

#### Frontend (FE) - 2-3 desarrolladores
- **Tecnologías**: SvelteKit 2, TypeScript, Tailwind CSS 4
- **Responsabilidades**:
  - UI/UX responsiva móvil-first
  - Estado de la aplicación
  - Integración con APIs
  - Optimización de rendimiento

#### Backend (BE) - 2-3 desarrolladores
- **Tecnologías**: Node.js, NestJS, Prisma, PostgreSQL
- **Responsabilidades**:
  - API RESTful
  - Lógica de negocio
  - Modelo de datos
  - Integraciones

#### DevOps - 1-2 ingenieros
- **Tecnologías**: Docker, GitHub Actions, AWS/GCP
- **Responsabilidades**:
  - CI/CD
  - Infraestructura como código
  - Monitoreo y alertas
  - Despliegues

#### QA - 1-2 ingenieros
- **Tecnologías**: Playwright, Jest, Postman
- **Responsabilidades**:
  - Automatización de pruebas
  - Pruebas de rendimiento
  - Aseguramiento de calidad
  - Documentación de pruebas

---

## Fase 0 — Preparación y Configuración (1 semana)
**Objetivo:** Base estable de proyecto, CI/CD y docs vivas.

**Líder Técnico:** [Nombre del TL]
**Scrum Master:** [Nombre del SM]
**Product Owner:** [Nombre del PO]

### Entregables
- [ ] **Repositorio**
  - [ ] Estructura mono-repo con pnpm workspaces
  - [ ] Configuración de husky + commitlint + commitizen
  - [ ] Plantillas de PR y issues

- [ ] **CI/CD**
  - [ ] GitHub Actions para build/test/lint
  - [ ] Despliegue automático a entornos
  - [ ] Monitoreo básico con Prometheus/Grafana

- [ ] **Entornos**
  - [ ] Docker Compose para desarrollo local
  - [ ] Configuración de staging y producción
  - [ ] Variables de entorno por entorno

- [ ] **Documentación**
  - [x] `25_vistas_y_rutas_frontend.md` (FE)
  - [x] `26_routes_frontend.md` (FE/BE)
  - [x] `27_rules.md` (TL/PO)
  - [x] `schema.prisma` (BE)
  - [ ] Guía de contribución
  - [ ] Estándares de código

### Plan de Implementación

#### Frontend (FE)
- [ ] Setup SvelteKit 2 con TypeScript
  - [ ] Configuración de ESLint/Prettier
  - [ ] Estructura de carpetas
  - [ ] Sistema de diseño con Tailwind
  - [ ] Manejo de rutas y layouts

#### Backend (BE)
- [ ] API Base con NestJS
  - [ ] Módulo de autenticación
  - [ ] Configuración de Prisma
  - [ ] Validación de datos con class-validator
  - [ ] Documentación con Swagger

#### DevOps
- [ ] Infraestructura como Código
  - [ ] Dockerfiles para cada servicio
  - [ ] docker-compose.yml para desarrollo
  - [ ] Scripts de despliegue

#### QA
- [ ] Configuración de pruebas
  - [ ] Unit tests con Jest
  - [ ] E2E con Playwright
  - [ ] Pruebas de carga con k6

#### Seguridad
- [ ] Hardening de la aplicación
  - [ ] Política de CORS
  - [ ] Headers de seguridad
  - [ ] Rate limiting
  - [ ] Rotación de secretos

## Criterios de Aceptación (DOD)

### Para cada tarea:
- [ ] Código revisado por al menos un par
- [ ] Pruebas unitarias pasando (>80% cobertura)
- [ ] Pruebas de integración pasando
- [ ] Documentación actualizada
- [ ] Cumple con estándares de código

### Para cada sprint:
- [ ] Demo funcional al equipo
- [ ] Retrospectiva realizada
- [ ] Métricas de calidad cumplidas
- [ ] Documentación actualizada

### Para cada release:
- [ ] Pruebas de regresión completadas
- [ ] Documentación de usuario actualizada
- [ ] Plan de rollback probado
- [ ] Monitoreo en producción configurado

---

## Fase 1 — MVP (4–6 semanas, 3 sprints)
**Objetivo:** Operar ventas reales en feria, sin fricción.

### Sprint 1 (Semana 1–2): Autenticación + Catálogo + POS básico

**Objetivo:** Sistema de autenticación funcional y POS básico operativo

#### Equipo Asignado
- **TL**: Supervisión técnica
- **FE**: 2 desarrolladores
- **BE**: 2 desarrolladores
- **QA**: 1 ingeniero
- **SEC**: Consultoría (20%)

#### Tareas Detalladas

- [x] **Autenticación**
  - [x] Pantalla de login/registro
  - [x] Guard de rutas protegidas
  - [x] Manejo de sesión y tokens
- [ ] **POS Básico**
  - [ ] Búsqueda de productos
  - [ ] Carrito de compras
  - [ ] Cálculo de totales
  - [ ] Interfaz táctil optimizada

**Backend (BE)**
- [x] **Autenticación**
  - [x] Endpoints de registro/login
  - [x] Middleware de autenticación
  - [x] Renovación de tokens
- [ ] **Catálogo**
  - [ ] CRUD de productos
  - [ ] Búsqueda y filtrado
  - [ ] Gestión de inventario

**Base de Datos (DATA)**
- [ ] Esquema inicial
- [ ] Datos de prueba
  - [ ] 100 productos de ejemplo
  - [ ] 10 clientes con histórico
  - [ ] Categorías y variantes

**Calidad (QA)**
- [ ] Pruebas unitarias (80% cobertura)
- [ ] Pruebas de integración
- [ ] Pruebas de rendimiento

**Seguridad (SEC)**
- [ ] Hashing de contraseñas (bcrypt)
- [ ] Rate limiting
- [ ] Headers de seguridad

#### Métricas de Éxito
- Tiempo de respuesta de búsqueda < 200ms
- Autenticación en < 2s
- Cobertura de pruebas > 80%
- Sin vulnerabilidades críticas

**Criterios de Aceptación**
- [ ] Crear venta con efectivo en ≤10s
- [ ] Búsqueda de producto <200ms con 500 SKUs
- [ ] Autenticación segura con JWT
- [ ] Interfaz usable en móviles

### Sprint 2 (Semana 3–4): Pagos múltiples + Fiado + Clientes

**Objetivo:** Sistema de pagos flexible con soporte offline

#### Equipo Asignado
- **TL**: Supervisión técnica
- **FE**: 2 desarrolladores
- **BE**: 2 desarrolladores
- **SYNC**: 1 desarrollador
- **QA**: 1 ingeniero
- **SEC**: Consultoría (10%)

#### Tareas Detalladas

**Frontend (FE)**
- [ ] **Gestión de Clientes**
  - [ ] Búsqueda y selección de clientes
  - [ ] Perfil de cliente con historial
  - [ ] Límites de crédito
- [ ] **Sistema de Pagos**
  - [ ] Selección múltiple de medios de pago
  - [ ] Cálculo de cambio
  - [ ] Comprobantes digitales
- [ ] **Offline Mode**
  - [ ] Indicador de estado de conexión
  - [ ] Cola de operaciones pendientes

**Backend (BE)**
- [ ] **Módulo de Pagos**
  - [ ] Endpoints para procesar pagos
  - [ ] Cálculo de comisiones
  - [ ] Integración con pasarelas
- [ ] **Gestión de Fiados**
  - [ ] Modelo de deudas
  - [ ] Historial de pagos
  - [ ] Notificaciones de vencimiento

**Sincronización (SYNC)**
- [ ] **Offline First**
  - [ ] Cola de operaciones
  - [ ] Resolución de conflictos
  - [ ] Sincronización bidireccional
- [ ] **Performance**
  - [ ] Indexado para búsquedas rápidas
  - [ ] Caché de datos frecuentes

**Calidad (QA)**
- [ ] Pruebas de flujo de pago
- [ ] Pruebas de sincronización
- [ ] Pruebas de carga

**Seguridad (SEC)**
- [ ] Validación de pagos
- [ ] Cifrado de datos sensibles

#### Métricas de Éxito
- Tiempo de procesamiento de pago < 3s
- Sincronización en < 5s
- < 0.1% de conflictos no resueltos
- 100% de operaciones offline recuperadas

**Criterios de Aceptación**
- [ ] Venta con fiado actualiza saldo en tiempo real
- [ ] Sistema opera sin conexión por hasta 4 horas
- [ ] Sincronización automática al recuperar conexión
- [ ] Sin pérdida de datos en modo offline

### Sprint 3 (Semana 5–6): Compras + Reportes esenciales + Cierre de caja

**Objetivo:** Gestión completa de inventario y reportes operativos

#### Equipo Asignado
- **TL**: Supervisión técnica y resolución de bloqueos
- **FE**: 2 desarrolladores
- **BE**: 2 desarrolladores
- **DATA**: 1 ingeniero
- **QA**: 1 ingeniero
- **DEVOPS**: 1 ingeniero

#### Tareas Detalladas

**Frontend (FE)**
- [ ] **Gestión de Compras**
  - [ ] ABM de órdenes de compra
  - [ ] Carga de remitos con cámara
  - [ ] Validación de datos de entrada
  - [ ] Historial de compras con filtros
- [ ] **Reportes**
  - [ ] Panel de reportes esenciales
  - [ ] Exportación a PDF/CSV
  - [ ] Filtros por fecha y vendedor
  - [ ] Gráficos de tendencias
- [ ] **Cierre de Caja**
  - [ ] Resumen diario de ventas
  - [ ] Desglose por medio de pago
  - [ ] Conciliación con efectivo físico

**Backend (BE)**
- [ ] **Módulo de Compras**
  - [ ] Endpoints para gestión de compras
  - [ ] Cálculo de costo promedio móvil (CMP-CAL-001)
  - [ ] Actualización de stock automática
  - [ ] Historial de movimientos
- [ ] **Reportes**
  - [ ] Generación de reportes en tiempo real
  - [ ] Cálculo de métricas clave
  - [ ] API para filtros avanzados
- [ ] **Seguridad**
  - [ ] Validación de permisos
  - [ ] Auditoría de operaciones

**Base de Datos (DATA)**
- [ ] **Modelo de Datos**
  - [ ] Optimización de consultas
  - [ ] Índices para reportes
  - [ ] Datos de prueba realistas
- [ ] **Rendimiento**
  - [ ] Monitoreo de consultas lentas
  - [ ] Optimización de índices

**DevOps**
- [ ] **Backups**
  - [ ] Configuración de backup automático
  - [ ] Scripts de restauración
  - [ ] Monitoreo de espacio
- [ ] **Monitoreo**
  - [ ] Alertas de espacio en disco
  - [ ] Métricas de rendimiento

**Calidad (QA)**
- [ ] **Pruebas**
  - [ ] E2E flujo completo compra→stock
  - [ ] Validación de reportes
  - [ ] Pruebas de rendimiento
  - [ ] Pruebas de usabilidad

#### Métricas de Éxito
- Generación de reportes < 3s
- 100% de trazabilidad compra→stock
- 0% de pérdida de datos en backups
- < 1% de discrepancias en cierre de caja

**Criterios de Aceptación**
- [ ] Reporte de ventas del día con totales correctos
- [ ] Cierre de caja con desglose por medio de pago
- [ ] Actualización en tiempo real de stock al cargar compras
- [ ] Backups diarios verificables
- [ ] Exportación a CSV/PDF sin errores

**DOD Fase 1**
- [ ] Manual rápido de uso (PDF)
- [ ] Exportación CSV de ventas y clientes funcional
- [ ] UAT exitoso en dispositivo gama media
- [ ] Documentación técnica actualizada

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

