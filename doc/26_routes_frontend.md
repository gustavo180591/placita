# placita — Frontend Routes (2025-10-05)

**Base URL:** `http://localhost:5174`

Este documento lista **solo rutas** (sin descripciones de vistas). Útil para implementación de enrutado, guards y tests.

## Tabla de rutas
| Path | URL | Params | Acceso | Roles | Layout |
|---|---|---|---|---|---|
| `/` | http://localhost:5174/ | — | Public/Priv | TODOS | public-or-private-layout |
| `/login` | http://localhost:5174/login | — | Public | — | public-layout |
| `/logout` | http://localhost:5174/logout | — | Priv | TODOS | private-layout |
| `/recuperar` | http://localhost:5174/recuperar | — | Public | — | public-layout |
| `/pos` | http://localhost:5174/pos | — | Priv | OPERADOR,ADMIN | private-layout |
| `/pos/mixto` | http://localhost:5174/pos/mixto | — | Priv | OPERADOR,ADMIN | private-layout |
| `/pos/conciliar` | http://localhost:5174/pos/conciliar | — | Priv | OPERADOR,ADMIN | private-layout |
| `/pos/recibo/:ventaId` | http://localhost:5174/pos/recibo/:ventaId | `:ventaId`<string> | Priv | OPERADOR,ADMIN | private-layout |
| `/ventas` | http://localhost:5174/ventas | — | Priv | OPERADOR,ADMIN | private-layout |
| `/ventas/:ventaId` | http://localhost:5174/ventas/:ventaId | `:ventaId`<string> | Priv | OPERADOR,ADMIN | private-layout |
| `/clientes` | http://localhost:5174/clientes | — | Priv | OPERADOR,ADMIN | private-layout |
| `/clientes/nuevo` | http://localhost:5174/clientes/nuevo | — | Priv | OPERADOR,ADMIN | private-layout |
| `/clientes/:clienteId` | http://localhost:5174/clientes/:clienteId | `:clienteId`<string> | Priv | OPERADOR,ADMIN | private-layout |
| `/clientes/:clienteId/pago` | http://localhost:5174/clientes/:clienteId/pago | `:clienteId`<string> | Priv | OPERADOR,ADMIN | private-layout |
| `/fiado` | http://localhost:5174/fiado | — | Priv | OPERADOR,ADMIN | private-layout |
| `/reservas` | http://localhost:5174/reservas | — | Priv | OPERADOR,ADMIN | private-layout |
| `/reservas/nueva` | http://localhost:5174/reservas/nueva | — | Priv | OPERADOR,ADMIN | private-layout |
| `/reservas/:reservaId` | http://localhost:5174/reservas/:reservaId | `:reservaId`<string> | Priv | OPERADOR,ADMIN | private-layout |
| `/productos` | http://localhost:5174/productos | — | Priv | ADMIN,OPERADOR | private-layout |
| `/productos/nuevo` | http://localhost:5174/productos/nuevo | — | Priv | ADMIN | private-layout |
| `/productos/:productoId` | http://localhost:5174/productos/:productoId | `:productoId`<string> | Priv | ADMIN | private-layout |
| `/productos/:productoId/precios` | http://localhost:5174/productos/:productoId/precios | `:productoId`<string> | Priv | ADMIN | private-layout |
| `/inventario/ajuste` | http://localhost:5174/inventario/ajuste | — | Priv | ADMIN,OPERADOR | private-layout |
| `/inventario/critico` | http://localhost:5174/inventario/critico | — | Priv | OPERADOR,ADMIN | private-layout |
| `/compras` | http://localhost:5174/compras | — | Priv | ADMIN | private-layout |
| `/compras/nueva` | http://localhost:5174/compras/nueva | — | Priv | ADMIN | private-layout |
| `/compras/:compraId` | http://localhost:5174/compras/:compraId | `:compraId`<string> | Priv | ADMIN | private-layout |
| `/proveedores` | http://localhost:5174/proveedores | — | Priv | ADMIN | private-layout |
| `/proveedores/nuevo` | http://localhost:5174/proveedores/nuevo | — | Priv | ADMIN | private-layout |
| `/proveedores/:proveedorId` | http://localhost:5174/proveedores/:proveedorId | `:proveedorId`<string> | Priv | ADMIN | private-layout |
| `/reportes` | http://localhost:5174/reportes | — | Priv | ADMIN | private-layout |
| `/reportes/ventas` | http://localhost:5174/reportes/ventas | — | Priv | ADMIN | private-layout |
| `/reportes/fiado` | http://localhost:5174/reportes/fiado | — | Priv | ADMIN | private-layout |
| `/reportes/inventario` | http://localhost:5174/reportes/inventario | — | Priv | ADMIN | private-layout |
| `/configuracion` | http://localhost:5174/configuracion | — | Priv | ADMIN | private-layout |
| `/configuracion/promos` | http://localhost:5174/configuracion/promos | — | Priv | ADMIN | private-layout |
| `/configuracion/precios` | http://localhost:5174/configuracion/precios | — | Priv | ADMIN | private-layout |
| `/configuracion/usuarios` | http://localhost:5174/configuracion/usuarios | — | Priv | ADMIN | private-layout |
| `/configuracion/impresion` | http://localhost:5174/configuracion/impresion | — | Priv | ADMIN | private-layout |
| `/configuracion/exportar` | http://localhost:5174/configuracion/exportar | — | Priv | ADMIN | private-layout |
| `/health` | http://localhost:5174/health | — | Priv | ADMIN,OPERADOR | private-layout |
| `/offline` | http://localhost:5174/offline | — | Priv | ADMIN,OPERADOR | private-layout |
| `/notificaciones` | http://localhost:5174/notificaciones | — | Priv | ADMIN,OPERADOR | private-layout |
| `/404` | http://localhost:5174/404 | — | Public | — | public-layout |

## Reglas de navegación (guards sugeridos)
- `Priv` ⇒ requiere sesión (`requiresAuth = true`).
- Rutas con `ADMIN` ⇒ `roleGuard('ADMIN')`.
- Param routes (`/ventas/:ventaId`, etc.) ⇒ validar existencia del recurso; si no, redirigir a `/404`.
- Layouts: `public-layout` para login/404; `private-layout` para el resto.