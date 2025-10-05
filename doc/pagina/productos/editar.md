# Productos

## Editar Producto

### Descripción
Interfaz para modificar la información de un producto existente en el inventario.

### URL
`/productos/:productoId`

### Parámetros de URL
- `productoId`: Identificador único del producto (UUID)

### Roles Requeridos
- ADMIN

### Secciones Editables

#### 1. Información General
- **Datos Básicos**
  - Nombre y descripción
  - Categoría/Subcategoría
  - Códigos (barras, interno, proveedor)
  - Estado del producto
  - Fecha de actualización

- **Características**
  - Marca/Modelo
  - Unidad de medida
  - Peso/Dimensiones
  - Características técnicas
  - Especificaciones adicionales

#### 2. Gestión de Inventario
- **Existencias**
  - Stock actual (solo lectura)
  - Stock mínimo/máximo
  - Punto de reorden
  - Ubicación en almacén
  - Código de ubicación

- **Movimientos**
  - Historial reciente
  - Ajustes de inventario
  - Transferencias
  - Fechas de ingreso/salida

#### 3. Precios y Costos
- **Estructura de Precios**
  - Precio de costo
  - Precio de venta
  - Margen actual
  - Precio de oferta
  - Fechas de vigencia

- **Listas de Precios**
  - Precio minorista
  - Precio mayorista
  - Precio especial
  - Descuentos por volumen
  - Promociones activas

#### 4. Multimedia y Documentos
- **Imágenes**
  - Galería de fotos
  - Imagen principal
  - Miniaturas
  - Ordenamiento
  - Etiquetas

- **Archivos**
  - Ficha técnica
  - Manuales
  - Certificados
  - Otros documentos

### Historial de Cambios
- **Registro de Modificaciones**
  - Fecha y hora
  - Usuario
  - Campo modificado
  - Valor anterior
  - Nuevo valor
  - Motivo del cambio

### Validaciones
- Integridad de datos
- Precios coherentes
- Unidades compatibles
- Formatos correctos
- Permisos de edición

### Estados del Producto
- `borrador`: En edición
- `activo`: Disponible
- `inactivo`: No disponible
- `en_revision`: Pendiente
- `descontinuado`: Sin stock

### Reglas de Negocio
- Historial de precios
- Control de versiones
- Aprobaciones requeridas
- Notificaciones de cambio
- Copias de seguridad

### Seguridad
- Control de acceso
- Registro de auditoría
- Confirmación de cambios
- Bloqueo de edición concurrente

### Integraciones
- Sistema de inventario
- Plataforma de ventas
- Control de calidad
- Gestión de proveedores

### Accesos Rápidos
- `Ctrl+S`: Guardar cambios
- `F2`: Ver historial
- `F5`: Actualizar datos
- `F9`: Duplicar producto
- `ESC`: Descartar cambios

### Códigos de Error
- `ERR_EPROD_001`: No encontrado
- `ERR_EPROD_002`: Sin permisos
- `ERR_EPROD_003`: Conflicto
- `ERR_EPROD_004`: Error al guardar
- `ERR_EPROD_005`: Datos inválidos

### Notas
- Verificar impacto en ventas
- Documentar cambios importantes
- Notificar a áreas relacionadas
- Realizar pruebas
- Capacitar usuarios
