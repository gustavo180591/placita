# Rutas de la Aplicación - Placita

## Visión General
Este documento detalla todas las rutas del frontend de Placita, incluyendo sus propósitos, controles de acceso y detalles técnicos de implementación.

## Configuración Base
- **URL Base:** `http://localhost:5174`
- **Convenciones:**
  - Rutas `Priv` requieren autenticación
  - Roles disponibles: `ADMIN`, `OPERADOR`
  - Parámetros dinámicos en formato `:param`
  - Layouts: `public-layout`, `private-layout`, `public-or-private-layout`

## Tabla de Rutas

### Autenticación
| Ruta | URL | Acceso | Roles | Layout | Descripción |
|------|-----|--------|-------|--------|-------------|
| `/` | / | Público/Priv | TODOS | public-or-private | Página de inicio con acceso rápido al POS |
| `/login` | /login | Público | - | public | Inicio de sesión (PIN/email+clave) |
| `/logout` | /logout | Privado | TODOS | private | Cierre de sesión |
| `/recuperar` | /recuperar | Público | - | public | Recuperación de acceso |

### Punto de Venta (POS)
| Ruta | URL | Acceso | Roles | Layout | Descripción |
|------|-----|--------|-------|--------|-------------|
| `/pos` | /pos | Privado | OPERADOR,ADMIN | private | Nueva venta (búsqueda, cantidades, pago) |
| `/pos/mixto` | /pos/mixto | Privado | OPERADOR,ADMIN | private | Pago mixto (efectivo + QR) |
| `/pos/conciliar` | /pos/conciliar | Privado | OPERADOR,ADMIN | private | Conciliación de pagos QR |
| `/pos/recibo/:ventaId` | /pos/recibo/:ventaId | Privado | OPERADOR,ADMIN | private | Vista/impresión de comprobante |

### Ventas
| Ruta | URL | Acceso | Roles | Layout |
|------|-----|--------|-------|--------|
| `/ventas` | /ventas | Privado | OPERADOR,ADMIN | private |
| `/ventas/:ventaId` | /ventas/:ventaId | Privado | OPERADOR,ADMIN | private |

### Clientes y Fiados
| Ruta | URL | Acceso | Roles | Layout |
|------|-----|--------|-------|--------|
| `/clientes` | /clientes | Privado | OPERADOR,ADMIN | private |
| `/clientes/nuevo` | /clientes/nuevo | Privado | OPERADOR,ADMIN | private |
| `/clientes/:clienteId` | /clientes/:clienteId | Privado | OPERADOR,ADMIN | private |
| `/clientes/:clienteId/pago` | /clientes/:clienteId/pago | Privado | OPERADOR,ADMIN | private |
| `/fiado` | /fiado | Privado | OPERADOR,ADMIN | private |

### Productos e Inventario
| Ruta | URL | Acceso | Roles | Layout |
|------|-----|--------|-------|--------|
| `/productos` | /productos | Privado | ADMIN,OPERADOR | private |
| `/productos/nuevo` | /productos/nuevo | Privado | ADMIN | private |
| `/productos/:productoId` | /productos/:productoId | Privado | ADMIN | private |
| `/productos/:productoId/precios` | /productos/:productoId/precios | Privado | ADMIN | private |
| `/inventario/ajuste` | /inventario/ajuste | Privado | ADMIN,OPERADOR | private |
| `/inventario/critico` | /inventario/critico | Privado | OPERADOR,ADMIN | private |

### Compras y Proveedores
| Ruta | URL | Acceso | Roles | Layout |
|------|-----|--------|-------|--------|
| `/compras` | /compras | Privado | ADMIN | private |
| `/compras/nueva` | /compras/nueva | Privado | ADMIN | private |
| `/compras/:compraId` | /compras/:compraId | Privado | ADMIN | private |
| `/proveedores` | /proveedores | Privado | ADMIN | private |
| `/proveedores/nuevo` | /proveedores/nuevo | Privado | ADMIN | private |
| `/proveedores/:proveedorId` | /proveedores/:proveedorId | Privado | ADMIN | private |

### Reportes y Configuración
| Ruta | URL | Acceso | Roles | Layout |
|------|-----|--------|-------|--------|
| `/reportes` | /reportes | Privado | ADMIN | private |
| `/reportes/ventas` | /reportes/ventas | Privado | ADMIN | private |
| `/reportes/fiado` | /reportes/fiado | Privado | ADMIN | private |
| `/reportes/inventario` | /reportes/inventario | Privado | ADMIN | private |
| `/configuracion` | /configuracion | Privado | ADMIN | private |
| `/configuracion/promos` | /configuracion/promos | Privado | ADMIN | private |
| `/configuracion/precios` | /configuracion/precios | Privado | ADMIN | private |
| `/configuracion/usuarios` | /configuracion/usuarios | Privado | ADMIN | private |
| `/configuracion/impresion` | /configuracion/impresion | Privado | ADMIN | private |
| `/configuracion/exportar` | /configuracion/exportar | Privado | ADMIN | private |

### Utilidades
| Ruta | URL | Acceso | Roles | Layout |
|------|-----|--------|-------|--------|
| `/health` | /health | Privado | ADMIN,OPERADOR | private |
| `/notificaciones` | /notificaciones | Privado | ADMIN,OPERADOR | private |
| `/offline` | /offline | Público | - | public |
| `/404` | /404 | Público | - | public |

## Reglas de Navegación

### Guards de Autenticación
- **Rutas Públicas**: No requieren autenticación
- **Rutas Privadas**: Requieren autenticación (`requiresAuth = true`)

### Control de Acceso por Roles
```typescript
// Ejemplo de implementación de guard de roles
function roleGuard(allowedRoles: string[]) {
  return (userRole: string) => {
    return allowedRoles.includes(userRole);
  };
}
```

### Layouts
- **public-layout**: Diseño para páginas públicas (login, recuperación)
- **private-layout**: Diseño para el área privada de la aplicación
- **public-or-private-layout**: Diseño que se adapta según el estado de autenticación

## Convenciones de Nombrado
- Usar `kebab-case` para las rutas
- Nombres de rutas en español
- Rutas anidadas para recursos relacionados (ej: `/productos/:id/precios`)
- Prefijos consistentes para agrupar funcionalidades relacionadas

## Consideraciones Técnicas
- Todas las rutas están diseñadas para ser amigables con SEO
- Las rutas dinámicas usan el formato `:param`
- Las rutas están optimizadas para carga perezosa (lazy loading)
- Se recomienda implementar prefetching para rutas frecuentemente accedidas