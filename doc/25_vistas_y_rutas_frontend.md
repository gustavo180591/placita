# placita — Vistas & Rutas Frontend (2025-10-05)

**Base URL:** `http://localhost:5174`

## Convenciones
- `Priv` = requiere sesión.
- Roles: `ADMIN`, `OPERADOR`.
- Los IDs con `:param` son dinámicos.

## Tabla de rutas
| Ruta | URL completa | Vista/Título | Propósito | Acceso | Roles |
|---|---|---|---|---|---|
| `/` | http://localhost:5174/ | Inicio / Landing mínima | Bienvenida, acceso rápido a POS si autenticado. | Public/Priv | TODOS |
| `/login` | http://localhost:5174/login | Login | Ingreso a la app (PIN/email+clave). | Public | — |
| `/logout` | http://localhost:5174/logout | Logout | Cierre de sesión. | Priv | TODOS |
| `/recuperar` | http://localhost:5174/recuperar | Recuperar acceso | Flujo de recuperación (si aplica). | Public | — |
| `/pos` | http://localhost:5174/pos | POS — Nueva venta | Ticket rápido (≤10s): buscar producto, cantidades, pago. | Priv | OPERADOR,ADMIN |
| `/pos/mixto` | http://localhost:5174/pos/mixto | Pago mixto | Dividir pagos (efectivo+QR). | Priv | OPERADOR,ADMIN |
| `/pos/conciliar` | http://localhost:5174/pos/conciliar | Conciliar QR | Confirmación de pagos QR pendientes. | Priv | OPERADOR,ADMIN |
| `/pos/recibo/:ventaId` | http://localhost:5174/pos/recibo/:ventaId | Comprobante | Vista/impresión del ticket/factura. | Priv | OPERADOR,ADMIN |
| `/ventas` | http://localhost:5174/ventas | Ventas — Listado | Búsqueda/filtrado de ventas por fecha/cliente. | Priv | OPERADOR,ADMIN |
| `/ventas/:ventaId` | http://localhost:5174/ventas/:ventaId | Venta — Detalle | Detalle de items, pagos y acciones (devolución/cambio). | Priv | OPERADOR,ADMIN |
| `/clientes` | http://localhost:5174/clientes | Clientes | Listado (saldo fiado, contacto). | Priv | OPERADOR,ADMIN |
| `/clientes/nuevo` | http://localhost:5174/clientes/nuevo | Cliente — Nuevo | Alta rápida (nombre+tel). | Priv | OPERADOR,ADMIN |
| `/clientes/:clienteId` | http://localhost:5174/clientes/:clienteId | Cliente — Detalle | Historial, pagos, recordatorio WhatsApp. | Priv | OPERADOR,ADMIN |
| `/clientes/:clienteId/pago` | http://localhost:5174/clientes/:clienteId/pago | Cliente — Registrar pago | Abonar saldo fiado total/parcial. | Priv | OPERADOR,ADMIN |
| `/fiado` | http://localhost:5174/fiado | Fiado — Deudas | Listado de deudores por antigüedad/monto. | Priv | OPERADOR,ADMIN |
| `/reservas` | http://localhost:5174/reservas | Reservas | Reservas activas y vencidas. | Priv | OPERADOR,ADMIN |
| `/reservas/nueva` | http://localhost:5174/reservas/nueva | Reserva — Nueva | Crear reserva con seña y stock comprometido. | Priv | OPERADOR,ADMIN |
| `/reservas/:reservaId` | http://localhost:5174/reservas/:reservaId | Reserva — Detalle | Detalle, entregar o cancelar. | Priv | OPERADOR,ADMIN |
| `/productos` | http://localhost:5174/productos | Productos | Listado con stock, filtros y acciones rápidas. | Priv | ADMIN,OPERADOR |
| `/productos/nuevo` | http://localhost:5174/productos/nuevo | Producto — Nuevo | Alta rápida (campos mínimos). | Priv | ADMIN |
| `/productos/:productoId` | http://localhost:5174/productos/:productoId | Producto — Editar | Edición, foto, mínimos, proveedor. | Priv | ADMIN |
| `/productos/:productoId/precios` | http://localhost:5174/productos/:productoId/precios | Producto — Precios | Editar lista/oferta/QR% y ver histórico. | Priv | ADMIN |
| `/inventario/ajuste` | http://localhost:5174/inventario/ajuste | Inventario — Ajuste | Merma/reconteo/entrada manual. | Priv | ADMIN,OPERADOR |
| `/inventario/critico` | http://localhost:5174/inventario/critico | Inventario — Stock crítico | Productos bajo mínimo. | Priv | OPERADOR,ADMIN |
| `/compras` | http://localhost:5174/compras | Compras | Historial de compras. | Priv | ADMIN |
| `/compras/nueva` | http://localhost:5174/compras/nueva | Compra — Nueva | Registrar compra con ítems y foto del remito. | Priv | ADMIN |
| `/compras/:compraId` | http://localhost:5174/compras/:compraId | Compra — Detalle | Items, costos, comprobante. | Priv | ADMIN |
| `/proveedores` | http://localhost:5174/proveedores | Proveedores | Listado/contactos y notas. | Priv | ADMIN |
| `/proveedores/nuevo` | http://localhost:5174/proveedores/nuevo | Proveedor — Nuevo | Alta de proveedor. | Priv | ADMIN |
| `/proveedores/:proveedorId` | http://localhost:5174/proveedores/:proveedorId | Proveedor — Detalle | Datos, compras asociadas. | Priv | ADMIN |
| `/reportes` | http://localhost:5174/reportes | Reportes — Home | Panel de KPIs: ventas hoy, fiado, stock crítico. | Priv | ADMIN |
| `/reportes/ventas` | http://localhost:5174/reportes/ventas | Reporte de ventas | Por rangos, por medio de pago, MoM. | Priv | ADMIN |
| `/reportes/fiado` | http://localhost:5174/reportes/fiado | Reporte de fiado | Deuda por cliente/antigüedad, pagos. | Priv | ADMIN |
| `/reportes/inventario` | http://localhost:5174/reportes/inventario | Reporte de inventario | Top vendidos, stock inmóvil, valor stock. | Priv | ADMIN |
| `/configuracion` | http://localhost:5174/configuracion | Configuración — General | Perfil del negocio, cotización, redondeos. | Priv | ADMIN |
| `/configuracion/promos` | http://localhost:5174/configuracion/promos | Promos y combos | Reglas por cantidad y bundles. | Priv | ADMIN |
| `/configuracion/precios` | http://localhost:5174/configuracion/precios | Actualización masiva | Incrementos por % categoría/proveedor. | Priv | ADMIN |
| `/configuracion/usuarios` | http://localhost:5174/configuracion/usuarios | Usuarios | Altas, roles y bloqueo por PIN. | Priv | ADMIN |
| `/configuracion/impresion` | http://localhost:5174/configuracion/impresion | Impresión | Plantillas ticket/factura y pruebas BT. | Priv | ADMIN |
| `/configuracion/exportar` | http://localhost:5174/configuracion/exportar | Exportar/Respaldo | CSV/PDF y respaldo manual. | Priv | ADMIN |
| `/health` | http://localhost:5174/health | Estado | Ping local, versión, estado de sync. | Priv | ADMIN,OPERADOR |
| `/offline` | http://localhost:5174/offline | Modo offline | Diagnóstico y cola de sincronización. | Priv | ADMIN,OPERADOR |
| `/notificaciones` | http://localhost:5174/notificaciones | Notificaciones | Historial de alertas. | Priv | ADMIN,OPERADOR |
| `/404` | http://localhost:5174/404 | No encontrado | Página de error. | Public | — |

## Mapa de navegación (sitemap)
- **Inicio / Landing mínima** → `/` — http://localhost:5174/
- **Login** → `/login` — http://localhost:5174/login
- **Logout** → `/logout` — http://localhost:5174/logout
- **Recuperar acceso** → `/recuperar` — http://localhost:5174/recuperar
- **POS — Nueva venta** → `/pos` — http://localhost:5174/pos
- **Pago mixto** → `/pos/mixto` — http://localhost:5174/pos/mixto
- **Conciliar QR** → `/pos/conciliar` — http://localhost:5174/pos/conciliar
- **Comprobante** → `/pos/recibo/:ventaId` — http://localhost:5174/pos/recibo/:ventaId
- **Ventas — Listado** → `/ventas` — http://localhost:5174/ventas
- **Venta — Detalle** → `/ventas/:ventaId` — http://localhost:5174/ventas/:ventaId
- **Clientes** → `/clientes` — http://localhost:5174/clientes
- **Cliente — Nuevo** → `/clientes/nuevo` — http://localhost:5174/clientes/nuevo
- **Cliente — Detalle** → `/clientes/:clienteId` — http://localhost:5174/clientes/:clienteId
- **Cliente — Registrar pago** → `/clientes/:clienteId/pago` — http://localhost:5174/clientes/:clienteId/pago
- **Fiado — Deudas** → `/fiado` — http://localhost:5174/fiado
- **Reservas** → `/reservas` — http://localhost:5174/reservas
- **Reserva — Nueva** → `/reservas/nueva` — http://localhost:5174/reservas/nueva
- **Reserva — Detalle** → `/reservas/:reservaId` — http://localhost:5174/reservas/:reservaId
- **Productos** → `/productos` — http://localhost:5174/productos
- **Producto — Nuevo** → `/productos/nuevo` — http://localhost:5174/productos/nuevo
- **Producto — Editar** → `/productos/:productoId` — http://localhost:5174/productos/:productoId
- **Producto — Precios** → `/productos/:productoId/precios` — http://localhost:5174/productos/:productoId/precios
- **Inventario — Ajuste** → `/inventario/ajuste` — http://localhost:5174/inventario/ajuste
- **Inventario — Stock crítico** → `/inventario/critico` — http://localhost:5174/inventario/critico
- **Compras** → `/compras` — http://localhost:5174/compras
- **Compra — Nueva** → `/compras/nueva` — http://localhost:5174/compras/nueva
- **Compra — Detalle** → `/compras/:compraId` — http://localhost:5174/compras/:compraId
- **Proveedores** → `/proveedores` — http://localhost:5174/proveedores
- **Proveedor — Nuevo** → `/proveedores/nuevo` — http://localhost:5174/proveedores/nuevo
- **Proveedor — Detalle** → `/proveedores/:proveedorId` — http://localhost:5174/proveedores/:proveedorId
- **Reportes — Home** → `/reportes` — http://localhost:5174/reportes
- **Reporte de ventas** → `/reportes/ventas` — http://localhost:5174/reportes/ventas
- **Reporte de fiado** → `/reportes/fiado` — http://localhost:5174/reportes/fiado
- **Reporte de inventario** → `/reportes/inventario` — http://localhost:5174/reportes/inventario
- **Configuración — General** → `/configuracion` — http://localhost:5174/configuracion
- **Promos y combos** → `/configuracion/promos` — http://localhost:5174/configuracion/promos
- **Actualización masiva** → `/configuracion/precios` — http://localhost:5174/configuracion/precios
- **Usuarios** → `/configuracion/usuarios` — http://localhost:5174/configuracion/usuarios
- **Impresión** → `/configuracion/impresion` — http://localhost:5174/configuracion/impresion
- **Exportar/Respaldo** → `/configuracion/exportar` — http://localhost:5174/configuracion/exportar
- **Estado** → `/health` — http://localhost:5174/health
- **Modo offline** → `/offline` — http://localhost:5174/offline
- **Notificaciones** → `/notificaciones` — http://localhost:5174/notificaciones
- **No encontrado** → `/404` — http://localhost:5174/404