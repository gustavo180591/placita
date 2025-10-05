# Stock Crítico

**URL:** `/inventario/critico`  
**Acceso:** Privado  
**Roles:** OPERADOR, ADMIN  
**Método HTTP:** GET

## Descripción
Muestra los productos con stock por debajo del mínimo configurado, permitiendo una rápida identificación de ítems que necesitan reposición.

## Componentes
- `StockCriticoLista.svelte` - Tabla de productos con stock crítico
- `FiltrosStock.svelte` - Filtros por categoría/proveedor
- `AccionesRapidas.svelte` - Acciones rápidas (generar orden de compra, notificar proveedor)

## Columnas
1. **Producto** - Nombre y código
2. **Stock Actual** - Cantidad en inventario
3. **Mínimo** - Stock mínimo configurado
4. **Diferencia** - Cantidad faltante (en rojo)
5. **Última Compra** - Fecha y precio de la última compra
6. **Proveedor** - Contacto del proveedor principal

## Acciones
- **Ver Detalle** → Navega a la ficha del producto
- **Generar OC** → Crea orden de compra pre-llenada
- **Notificar** → Envía recordatorio al proveedor
- **Ajustar Mínimo** → Actualiza el stock mínimo (solo ADMIN)

## Reglas de Negocio
1. **Cálculo de Stock Crítico**
   - Stock actual ≤ Mínimo configurado
   - Excluir productos deshabilitados
   - Considerar stock comprometido en reservas

2. **Priorización**
   - Ordenar por porcentaje faltante
   - Resaltar productos con stock cero
   - Mostrar productos sin stock mínimo configurado

## Integraciones
- **Backend:** `GET /api/inventario/critico`
- **Proveedores:** Integración con lista de contactos
- **Compras:** Pre-llenado de órdenes de compra

## Mejoras Futuras
- Notificaciones push para stock crítico
- Histórico de reposiciones
- Predicción de faltantes basada en ventas históricas

## Seguridad
- Los precios de costo solo son visibles para ADMIN
- Las acciones de modificación requieren permisos específicos
- Auditoría de cambios en stock mínimo
