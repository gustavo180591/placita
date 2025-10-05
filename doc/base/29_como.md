# Placita — **Cómo hacerlo** (Implementation Playbook)
**Fecha:** 2025-10-05  
**Objetivo:** Guía paso a paso para pasar de documentos (**qué**) a implementación (**cómo**). Incluye estructura del repo, comandos, patrones de código y checklists para FE (SvelteKit), BE (NestJS+Prisma), DB (Postgres), Offline/Sync, Auth, Búsqueda, Testing, CI/CD y Docker.

> Stack base (confirmado): Node 22, SvelteKit 2 + Svelte 5, TypeScript 5.6, Vite 6, Tailwind 4, NestJS 10, Prisma 6 (client), Postgres 16, Redis 7, Meilisearch 1.7, n8n 1.74, Sentry, Vitest/Playwright.  
> Nombre del proyecto: **placita**.

---

## 0) Estructura del Monorepo
```
placita/
├─ apps/
│  ├─ web/                 # SvelteKit (FE)
│  └─ api/                 # NestJS (BE)
├─ packages/
│  ├─ shared/              # tipos compartidos (DTOs), utils
│  └─ sdk/                 # SDK generado desde OpenAPI para FE
├─ infra/
│  ├─ docker/              # Dockerfiles, compose, scripts
│  ├─ backup.sh            # backup de DB (cron)
│  └─ meili-seed.mjs       # indexación inicial de búsqueda
├─ prisma/
│  ├─ schema.prisma        # (con relaciones de Usuario añadidas)
│  └─ migrations/          # auto por Prisma
├─ docs/                   # 25_vistas..., 26_routes..., 27_rules..., 28_roadmap...
├─ tools/
│  └─ generate-openapi-sdk.mjs
├─ .github/workflows/ci.yml
└─ package.json            # scripts root
```

**Comandos globales (root `package.json`):**
```json
{
  "scripts": {
    "dev:web": "npm --prefix apps/web run dev",
    "dev:api": "npm --prefix apps/api run start:dev",
    "dev:all": "concurrently -k "npm:dev:api" "npm:dev:web"",
    "db:generate": "prisma generate",
    "db:migrate": "prisma migrate dev",
    "db:deploy": "prisma migrate deploy",
    "lint": "eslint .",
    "format": "prettier --write .",
    "test": "vitest run",
    "test:ui": "playwright test",
    "openapi:gen": "nest build && node tools/generate-openapi-sdk.mjs"
  }
}
```

---

## 1) Infra local (Docker) — Postgres, Redis, Meili, n8n
**`docker-compose.yml` (extracto):**
```yaml
services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: placita
    ports: ["5432:5432"]
    volumes: ["pgdata:/var/lib/postgresql/data"]

  redis:
    image: redis:7-alpine
    ports: ["6379:6379"]

  meilisearch:
    image: getmeilisearch/meilisearch:v1.7
    environment:
      MEILI_MASTER_KEY: ${MEILI_MASTER_KEY}
    ports: ["7700:7700"]
    volumes: ["meili_data:/meili_data"]

  n8n:
    image: n8nio/n8n:1.74.0
    environment:
      N8N_HOST: localhost
      N8N_PORT: 5678
    ports: ["5678:5678"]
    volumes: ["n8n_data:/home/node/.n8n"]

volumes:
  pgdata:
  meili_data:
  n8n_data:
```

**Levantar infra:**
```bash
docker compose up -d postgres redis meilisearch n8n
```

---

## 2) Base de Datos (Postgres + Prisma)
1. Configurar `.env` en root:
```bash
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/placita?schema=public"
```
2. Colocar `schema.prisma` en `/prisma/` (usa el que preparamos con **Usuario** referenciado en entidades críticas).  
3. Generar cliente y migrar:
```bash
npx prisma generate
npx prisma migrate dev --name init
```
4. Semillas (opcional):
```ts
// prisma/seed.ts (ejemplo rápido)
import { PrismaClient } from "@prisma/client";
const p = new PrismaClient();
await p.usuario.upsert({ where:{ email:"admin@placita.ar" }, update:{}, create:{ nombre:"Admin", email:"admin@placita.ar", hash:"<hash-argon2>", rol:"ADMIN" }});
await p.$disconnect();
```

---

## 3) Backend (NestJS 10 + Prisma + Auth JWT)
### 3.1 Crear proyecto Nest
```bash
npm create @nestjs/cli@latest apps/api
cd apps/api
npm i @nestjs/common @nestjs/core @nestjs/platform-express reflect-metadata rxjs
npm i @prisma/client
npm i -D prisma
npx prisma generate
```

### 3.2 Módulos principales
- `AuthModule` (login, refresh, guard JWT)
- `UsersModule` (CRUD mínimo)
- `ProductsModule` (ABM, búsqueda, stock)
- `SalesModule` (ventas, pagos)
- `ClientsModule` (clientes, deudas)
- `PurchasesModule` (compras, proveedores)
- `ReportsModule` (KPIs)
- `SyncModule` (hooks offline, conciliación QR futura)

**Estructura típica:**
```
apps/api/src/
├─ main.ts
├─ app.module.ts
├─ prisma/
│  └─ prisma.service.ts
├─ auth/
├─ users/
├─ products/
├─ sales/
├─ clients/
├─ purchases/
├─ reports/
└─ common/ (guards, pipes, interceptors, dto base)
```

### 3.3 Auth (cómo)
- **Hash**: `argon2` (recomendado) o `bcrypt`.
```bash
npm i argon2 jsonwebtoken @nestjs/jwt cookie-parser helmet
```
- **Login** `POST /auth/login` recibe `{ email, password, captchaToken? }`.  
  - Validar intentos (Nest rate-limit + Redis si lo querés server-side).  
  - Si ok, firmar **JWT** con `JWT_SECRET`, `expiresIn: 12h` (o 30d si remember).  
  - Devolver `{ accessToken }`.
- **Guard**: `JwtAuthGuard` en rutas privadas (ventas, compras, etc.).
- **Cookies**: FE guarda `placita_session` (httpOnly). BE debe aceptar `Authorization: Bearer` o cookie.

**Ejemplo service de login (simplificado):**
```ts
const user = await this.prisma.usuario.findUnique({ where: { email } });
if (!user) throw new UnauthorizedException('ERR_AUTH_001');
const ok = await argon2.verify(user.hash, password);
if (!ok) throw new UnauthorizedException('ERR_AUTH_001');
if (user.disabled) throw new ForbiddenException('ERR_AUTH_002');

const token = await this.jwt.signAsync({ sub: user.id, role: user.rol }, { expiresIn: remember ? '30d' : '12h' });
return { accessToken: token };
```
> Implementar **bloqueo temporal** tras 5 intentos: persistir contador en DB/Redis con expiración 30'.

### 3.4 Endpoints mínimos para Home y Login
- `GET /health` → `{ ok: true }`
- `GET /reports/kpis` →
```json
{ "kpis": [
  { "label": "Ventas hoy $", "value": 152300 },
  { "label": "Tickets", "value": 27 },
  { "label": "Fiado pendiente $", "value": 48200 },
  { "label": "Stock crítico", "value": 5 }
], "syncQueue": 0 }
```

---

## 4) Frontend (SvelteKit 2 + Svelte 5 + Tailwind 4)
### 4.1 Bootstrap
```bash
cd apps/web
npm create svelte@latest .
npm i @tanstack/svelte-query zod
npm i -D tailwindcss @tailwindcss/typography @tailwindcss/forms
npx tailwindcss init -p
```

### 4.2 Rutas y vistas
- Usar los docs: **25_vistas_y_rutas_frontend.md** y **26_routes_frontend.md** para crear rutas.  
- Implementar **Home** `/` (canvas entregado) y **Login** `/login` (canvas entregado).  
- Guards: layout + hooks para verificar cookie `placita_session`.

**Autenticación en FE (cómo)**
- `src/hooks.server.ts` — leer cookie `placita_session`; si falta en rutas privadas → redirect `/login`.
- `+page.server.ts` en `/login` ya implementa action con contador y captcha (en canvas).  
- Integrar con `API_BASE=/auth/login` (Nest).

### 4.3 UI y Accesibilidad
- Tailwind: componentes livianos (pill, cards).  
- Aria y etiquetas conectadas (`aria-errormessage`).  
- Modo **offline**: `navigator.onLine` store (ya incluido).

---

## 5) Inventario, Ventas y Fiado (cómo conectarlo)
### 5.1 Productos (API)
- `GET /products?query=&page=1` (listado, filtros, stock crítico)
- `POST /products` (Alta) — validado con DTO + `zod`/`class-validator`
- `PATCH /products/:id` (Editar), `DELETE` (si aplica)
- `GET /products/:id/prices` (histórico)

### 5.2 Ventas (API)
- `POST /sales` → body con ítems, medio(s) de pago, cliente opcional, `canal`.  
  - Aplica **PRC-CAL-001** y promo por cantidad (**PRM-RUL-002**).  
  - Descuenta stock y registra pagos.  
  - Si `FIADO`, actualiza `DeudaCliente` (**FIA-RUL-001**).
- `POST /sales/:id/payments` → pagos parciales (fiado) (**FIA-RUL-002**).
- `GET /sales?from=&to=` → para reportes y conciliación.

### 5.3 Clientes y Deudas
- `GET/POST /clients` (alta rápida: nombre+tel)  
- `GET /clients/:id` con saldo
- `POST /clients/:id/payments` → pagos de fiado

**Front POS (cómo)**
- `/pos` — formulario rápido con búsqueda (Svelte Query), agregar ítems, seleccionar medio, confirmar.  
- `/pos/conciliar` — listar pagos `QR confirm=false` y botón confirmar.

---

## 6) Reservas y Señales (cómo)
- `POST /reservas` → items + `seniaARS`; marcar stock **comprometido** (flag).  
- `PATCH /reservas/:id/entregar` → genera `sale` usando `seniaARS` como pago parcial.
- `PATCH /reservas/:id/cancelar` → libera stock; si `devolverSeña=true`, registrar devolución.

---

## 7) Compras y Costeo (cómo)
- `POST /purchases` → items (productoId, cantidad, costoUnit, moneda, subtotal), proveedorId, adjunto.  
- **Costo promedio móvil** (**CMP-CAL-001**) al confirmar compra.  
- **Ajustes**: `POST /inventory/adjustments` con `tipo=MERMA|RECONTEO|DEVOLUCION_PROVEEDOR`.

**Front**
- `/compras/nueva` formulario con captura de foto (File API) → upload a API (S3/local).

---

## 8) Reportes y KPIs (cómo)
- `/reports/kpis` (día actual) — ventas por medio, stock crítico, fiado.
- `/reports/ventas` (filtros, MoM)
- `/reports/fiado` (antigüedad deuda)
- `/reports/inventario` (top vendidos, inmóviles)

**FE**: páginas `/reportes/*` usando Svelte Query + tablas paginadas (50 filas).

---

## 9) Búsqueda (Meilisearch) — productos y clientes
1. **Crear índice** `products` con campos: nombre, categoría, variante, estado, precio.  
2. Semilla: `node infra/meili-seed.mjs`.
3. API: al crear/editar producto → sync en Meili.  
4. FE: `GET /search?q=` → delegar a API (que a su vez consulta Meili).

---

## 10) Offline-First y Sincronización (cómo)
- **Cola local** (FE): IndexedDB / localForage (o Svelte store persistente).  
- Eventos: `venta.creada`, `pago.creado`, `reserva.creada`.  
- `SYNC-RUL-001`: reintentos exponenciales; idempotencia (`uuid`).  
- **Resolución de conflictos** (precio/stock): `last-write-wins` + banner y bitácora (**SYNC-CFL-002/003**).  
- **Monitoreo**: contador `syncQueue` mostrado en Home.

---

## 11) Seguridad (cómo)
- Cookies **httpOnly**, `sameSite=lax`, `secure` en prod.  
- **Helmet**, CORS en API, límites de tasa en `/auth/login`.  
- Role guard (ADMIN/OPERADOR) en endpoints críticos.  
- Auditoría: registrar `creadoPorId/registradoPorId` en ventas, compras, precios.

---

## 12) Testing (cómo)
- **Unit** (Vitest): pricing (`PRC-CAL-001`), promos, fiado, costo promedio.  
- **API e2e** (supertest): login, crear venta, fiado, compras.  
- **FE e2e** (Playwright): `/login` (flujos válido/erróneo/captcha/bloqueo), `/` KPIs y navegación, `/pos` venta completa.

**Ejemplo Vitest (precio):**
```ts
import { calcLinea } from '@/domain/pricing';
it('aplica qr markup', () => {
  const r = calcLinea({ lista: 1000, oferta: null, qrPct: 0.1, medio: 'QR', cant: 2 });
  expect(r.subtotal).toBe(2200);
});
```

---

## 13) Observabilidad (cómo)
- **Sentry** FE/BE: capturar errores + performance.  
- Logging estructurado (Pino) con IDs de correlación por venta.  
- Métricas (opcional): Prometheus/Grafana.  

---

## 14) CI/CD (cómo)
- **GitHub Actions**:
  - Jobs: lint → test → build → prisma migrate deploy → docker build → push → compose up.  
  - Variables: `DATABASE_URL`, `JWT_SECRET`, `SENTRY_DSN`, `MEILI_MASTER_KEY`.
- **Estrategia**: main → tag `release-x.y`. Rollback: último tag + restore DB backup.

---

## 15) Despliegue (Docker)
- Build imágenes `api` y `web` con Node 22.  
- `docker compose pull && docker compose up -d` para actualizar **sin perder datos** (volúmenes).  
- Backup volumen DB (pre y post) — ver `infra/backup.sh`.

---

## 16) Checklists por Feature (DoD)
**Login**  
- [ ] 3rd fail → CAPTCHA (gate)  
- [ ] 5th fail → bloqueo 30' (server)  
- [ ] Cookie segura, redirect a `/`  
- [ ] No revelar campo incorrecto

**POS básico**  
- [ ] Venta ≤ 10s (3 toques)  
- [ ] Descuento/override por línea  
- [ ] Stock descuenta; si offline, en cola  
- [ ] Recibo descargable/enviable

**Fiado**  
- [ ] Límite por cliente aplicado  
- [ ] Pago parcial, resumen de deuda  
- [ ] Reporte de vencidos

**Compras**  
- [ ] Costo promedio móvil actualizado  
- [ ] Foto de remito adjunta  
- [ ] Alerta de stock crítico

**Reportes**  
- [ ] KPIs diarios correctos  
- [ ] Top vendidos / inmóviles  
- [ ] Export CSV

---

## 17) Rutas y Vistas (referencias)
- **Routes:** ver `26_routes_frontend.md`  
- **Vistas:** ver `25_vistas_y_rutas_frontend.md`  
- **Reglas:** ver `27_rules.md`  
- **Roadmap:** ver `28_roadmap_extendido.md`

---

## 18) FAQ de implementación
- **¿Cómo manejo el CAPTCHA real?** Reemplazá `CaptchaGate.svelte` por **Cloudflare Turnstile** o **hCaptcha**, validando token en BE.  
- **¿Cómo pruebo offline?** Chrome DevTools → Network → Offline. Ver que la cola crezca y se vacíe al volver.  
- **¿Cómo tipar el SDK?** Generá OpenAPI en BE y corré `npm run openapi:gen` para crear `packages/sdk`.

---

## 19) Próximo paso recomendado
1) Implementar `/auth/login` en Nest y conectar el `/login` del FE (canvas).  
2) Exponer `/reports/kpis` y pintar KPIs reales en Home.  
3) Crear `/pos` con pricing (reglas de `rules.md`) y ventas **offline** a cola.

---

**Hecho con foco en rapidez de venta, resiliencia offline y control total de stock y fiado.**
