# Productos

## Nuevo Producto

### Descripción
Formulario completo para registrar un nuevo producto en el inventario del sistema.

### URL
`/productos/nuevo`

### Roles Requeridos
- ADMIN

### Secciones del Formulario

#### 1. Información Básica
- **Datos Principales**
  - Código de barras (opcional, autogenerable)
  - Nombre del producto
  - Descripción detallada
  - Categoría principal
  - Subcategoría (opcional)
  - Marca/Proveedor
  - Modelo/Referencia

- **Clasificación**
  - Tipo de producto (bien/servicio)
  - Unidad de medida (unidad, kg, litro, etc.)
  - Código interno
  - Código del proveedor
  - Palabras clave para búsqueda

#### 2. Precios y Costos
- **Precios de Venta**
  - Precio base
  - Precio de oferta (opcional)
  - Fechas de vigencia de oferta
  - Impuestos aplicables
  - Precio mínimo permitido

- **Costos**
  - Costo unitario
  - Costo promedio
  - Último costo
  - Proveedor principal
  - Tiempo de reposición

#### 3. Inventario
- **Existencias**
  - Stock actual
  - Stock mínimo
  - Stock máximo
  - Punto de reorden
  - Ubicación en almacén

- **Control**
  - ¿Permitir venta sin stock?
  - ¿Controlar por lotes/series?
  - ¿Producto perecedero?
  - Vida útil (días)
  - Alerta de vencimiento

#### 4. Características Adicionales
- **Atributos**
  - Tamaño/Dimensiones
  - Color
  - Material
  - Otras especificaciones

- **Digital**
  - Imágenes del producto
  - Documentos adjuntos
  - Enlace a ficha técnica
  - Video demostrativo (opcional)

### Validaciones
- Nombre y código únicos
- Precios mayores a costo
- Stock no negativo
- Formato de códigos
- Tamaño de archivos adjuntos

### Estados del Producto
- `activo`: Disponible para venta
- `inactivo`: No disponible
- `en_revision`: Pendiente de aprobación
- `agotado`: Sin stock
- `descontinuado`: Ya no se produce

### Reglas de Negocio
- Márgenes mínimos por categoría
- Redondeo de precios
- Cálculo automático de precios
- Políticas de descuento
- Control de versiones

### Seguridad
- Control de cambios
- Historial de modificaciones
- Niveles de aprobación
- Copias de seguridad

### Integraciones
- Sistema de inventario
- Plataforma de e-commerce
- Facturación electrónica
- Control de calidad

### Accesos Rápidos
- `Ctrl+S`: Guardar
- `F2`: Agregar imagen
- `F5`: Calcular precios
- `F9`: Guardar y nuevo
- `ESC`: Cancelar

### Códigos de Error
- `ERR_PROD_001`: Código duplicado
- `ERR_PROD_002`: Datos inválidos
- `ERR_PROD_003`: Error al guardar
- `ERR_PROD_004`: Sin permisos
- `ERR_PROD_005`: Validación fallida

### Notas
- Verificar duplicados antes de guardar
- Documentar cambios importantes
- Revisar precios de la competencia
- Actualizar información regularmente
- Capacitar al personal en el uso
