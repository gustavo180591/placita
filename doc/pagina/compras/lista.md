# Historial de Compras

**URL:** `/compras`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET

## Descripción
Muestra el historial de compras realizadas a proveedores, permitiendo filtrar y buscar compras por diferentes criterios.

## Componentes
- `ComprasLista.svelte` - Tabla de compras
- `FiltrosCompras.svelte` - Filtros avanzados
- `ResumenCompras.svelte` - Resumen de totales

## Filtros
- **Rango de fechas**
- **Proveedor**
- **Estado** (Pendiente, Recibida, Parcial, Cancelada)
- **Monto** (mínimo/máximo)
- **Productos incluidos**

## Columnas
1. **N° Compra** - ID único con link al detalle
2. **Fecha** - Fecha de la compra
3. **Proveedor** - Nombre del proveedor
4. **Productos** - Cantidad de ítems
5. **Total** - Monto total
6. **Estado** - Badge de estado
7. **Acciones** - Ver/Editar/Imprimir

## Acciones
- **Nueva Compra** → `/compras/nueva`
- **Ver Detalle** → `/compras/:compraId`
- **Editar** → `/compras/:compraId/editar`
- **Imprimir** → Genera PDF de la orden
- **Exportar** → CSV/Excel del listado

## Estados de Compra
- `BORRADOR` - En edición
- `PENDIENTE` - Enviada al proveedor
- `RECIBIDA_PARCIAL` - Recepción parcial
- `RECIBIDA` - Completa
- `CANCELADA` - Anulada

## Reglas de Negocio
1. **Edición**
   - Solo compras en estado BORRADOR pueden editarse
   - Historial de cambios auditado
   - Notificación al guardar cambios

2. **Paginación**
   - 20 compras por página
   - Orden descendente por fecha
   - Búsqueda en tiempo real

## Integraciones
- **Backend:** `GET /api/compras`
- **Proveedores:** Datos del proveedor
- **Inventario:** Actualización de stocks

## Seguridad
- Solo usuarios con rol ADMIN
- Validación de permisos por endpoint
- Registro de IP y usuario en auditoría
