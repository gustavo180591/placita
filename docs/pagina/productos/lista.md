# Productos

## Gestión de Inventario

### Descripción
Vista principal para administrar el catálogo de productos del sistema.

### URL
`/productos`

### Roles Requeridos
- OPERADOR
- ADMIN

### Funcionalidades Principales

#### 1. Búsqueda y Filtrado
- Búsqueda por:
  - Código de barras
  - Nombre/Descripción
  - Categoría
  - Proveedor
  - Estado de stock

#### 2. Vista de Productos
- Múltiples vistas:
  - Tabla detallada
  - Cuadrícula con imágenes
  - Tarjetas de inventario
  - Lista compacta

#### 3. Filtros Avanzados
- Por categoría/subcategoría
- Rango de precios
- Nivel de stock
- Fechas de actualización
- Estado (activo/inactivo)

### Columnas Principales
1. **Producto**
   - Imagen
   - Código/Nombre
   - Categoría
   - Proveedor

2. **Inventario**
   - Stock actual
   - Stock mínimo
   - Estado de stock
   - Ubicación

3. **Precios**
   - Costo
   - Precio de venta
   - Margen
   - Promoción vigente

4. **Estadísticas**
   - Ventas (7/30 días)
   - Rotación
   - Última actualización

5. **Acciones**
   - Ver/Editar
   - Ajustar inventario
   - Historial
   - Desactivar

### Estados de Producto
- `activo`: Disponible para venta
- `inactivo`: No disponible
- `agotado`: Stock = 0
- `bajo_stock`: Stock < mínimo
- `sin_stock`: Sin inventario registrado

### Reglas de Negocio
- Los productos nuevos requieren código y nombre
- El código de barras debe ser único
- Los precios no pueden ser negativos
- El stock mínimo no puede ser mayor al máximo

### Acciones Masivas
- Actualización de precios
- Ajuste de inventario
- Cambio de categoría
- Exportación/Importación

### Seguridad
- Los cambios de precios requieren confirmación
- Registro de modificaciones
- Historial de movimientos

### Integraciones
- Escáner de códigos de barras
- Cámara para fotos de productos
- Sincronización con proveedores

### Accesos Rápidos
- `N`: Nuevo producto
- `I`: Importar desde Excel
- `E`: Exportar lista
- `F`: Filtrar resultados
- `R`: Refrescar datos

### Notas
- Se recomienda mantener actualizadas las imágenes de productos
- Los productos inactivos no aparecen en el POS
- El historial de movimientos se conserva por 2 años
- Los cambios de precios generan notificaciones
