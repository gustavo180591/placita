# Requisitos No Funcionales & Tecnología

## UX/Performance
- 3 toques para venta típica; búsqueda <200 ms local (índice).
- App ligera; consumo de datos mínimo; soporte **Android gama media**.

## Offline-first
- Base local (SQLite/IndexedDB); cola de operaciones; **idempotencia** en sync.

## Disponibilidad & Confiabilidad
- Sincronización automática cuando hay red; reintentos exponenciales.
- Logs de errores locales + envío en sync.

## Tecnología sugerida
- **Frontend móvil**: SvelteKit/Capacitor o PWA robusta.
- **Backend**: NestJS + PostgreSQL; **API REST**; opción Supabase/Firebase si conviene.
- **Auth**: email+clave o PIN local + token refrescable.
- **Infra**: contenedores; backups diarios.

## Localización
- Español neutro; términos del negocio (“fiado”, “seña”, “arqueo”).
