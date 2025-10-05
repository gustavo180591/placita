# Nueva Compra

**URL:** `/compras/nueva`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET, POST

## Descripción
Interfaz para crear una nueva orden de compra a proveedores, con soporte para múltiples productos, descuentos y documentos adjuntos.

## Flujo de Trabajo
1. **Selección de Proveedor**
   - Búsqueda por nombre/RUC
   - Datos de contacto automáticos
   - Condiciones de pago predefinidas

2. **Agregar Productos**
   - Búsqueda por código/descripción
   - Escaneo de códigos de barras
   - Sugerencias basadas en historial

3. **Detalles de la Orden**
   - Fecha esperada de entrega
   - Condiciones de pago
   - Observaciones

4. **Revisión y Envío**
   - Resumen de la orden
   - Validación de datos
   - Opción de guardar borrador

## Campos del Formulario
### Encabezado
- **Proveedor** (requerido)
- **Sucursal de entrega**
- **Fecha de entrega esperada**
- **Condición de pago** (contado/7d/15d/30d)
- **Moneda** (USD/PYG)

### Líneas de Producto
- **Producto** (código/descripción)
- **Cantidad**
- **Precio Unitario**
- **Descuento** (% o monto)
- **Impuestos**
- **Subtotal**

### Totales
- **Subtotal**
- **Descuento General**
- **Impuestos**
- **Total**

## Validaciones
1. **Productos**
   - Stock mínimo/máximo
   - Precios fuera de rango
   - Productos descontinuados

2. **Proveedor**
   - Límite de crédito
   - Documentación al día
   - Historial de atrasos

3. **Documentos**
   - Formatos permitidos (PDF, JPG, PNG)
   - Tamaño máximo 5MB
   - Nombres descriptivos

## Estados del Formulario
- `draft` - Borrador guardado
- `sending` - Enviando al servidor
- `success` - Orden creada
- `error` - Error en el proceso

## Acciones
- **Guardar Borrador**
  - Almacena localmente
  - Sincroniza en segundo plano
  - Recuperable por 30 días

- **Enviar a Proveedor**
  - Valida el formulario
  - Genera PDF
  - Envía notificación

- **Cancelar**
  - Pregunta por confirmación
  - Descarta cambios
  - Vuelve al listado

## Integraciones
- **Catálogo de Productos**
  - Búsqueda en tiempo real
  - Precios de referencia
  - Conversión de unidades

- **Proveedores**
  - Contactos y teléfonos
  - Condiciones predefinidas
  - Historial de compras

- **Documentos**
  - Subida a almacenamiento
  - OCR para facturas
  - Envío por email

## Mejoras Futuras
- Plantillas de órdenes frecuentes
- Comparativa de precios entre proveedores
- Integración con cotizaciones
- Aprobaciones para montos altos

## Códigos de Error
- `PROVIDER_REQUIRED`
- `INVALID_PRODUCT`
- `INSUFFICIENT_PERMISSIONS`
- `UPLOAD_FAILED`

## Seguridad
- Validación de datos del lado del cliente y servidor
- Sanitización de entradas
- Registro de IP y usuario
- Límite de intentos de envío
