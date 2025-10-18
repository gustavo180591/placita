# Configuración de Impresión

**URL:** `/configuracion/impresion`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET, POST

## Descripción
Configuración de plantillas y preferencias para la impresión de tickets, facturas y reportes en diferentes tipos de impresoras.

## Configuraciones Disponibles

### 1. Impresora Térmica (Tickets)
- **Modelo**
  - Selección de driver
  - Configuración de puerto
  - Velocidad de impresión

- **Formato del Ticket**
  - Encabezado personalizado
  - Logo (máx. 200x200px)
  - Texto promocional
  - Pie de página

- **Opciones de Impresión**
  - Tamaño de fuente
  - Ancho de papel (58mm/80mm)
  - Corte automático
  - Apertura de cajón

### 2. Factura Electrónica
- **Datos Fiscales**
  - Encabezado legal
  - Resolución de facturación
  - Textos legales

- **Diseño**
  - Plantilla HTML/CSS
  - Variables disponibles
  - Vista previa en tiempo real

### 3. Impresora de Etiquetas
- **Tamaño de Etiqueta**
- **Densidad**
- **Orientación**
- **Fuentes personalizadas**

## Plantillas Predefinidas
1. **Ticket de Venta Rápida**
   - Mínimo de información
   - Códigos de barras
   - Total destacado

2. **Factura Detallada**
   - Datos fiscales completos
   - Desglose de impuestos
   - Código QR

3. **Etiqueta de Producto**
   - Código de barras
   - Precio
   - Fecha de vencimiento

## Pruebas de Impresión
- **Vista Previa**
- **Página de Prueba**
- **Impresión de Muestra**
- **Diagnóstico**

## Validaciones
- Tamaño máximo de logo
- Caracteres especiales
- Campos obligatorios
- Compatibilidad de formatos

## Códigos de Error
- `PRINTER_OFFLINE`
- `INVALID_TEMPLATE`
- `PRINT_ERROR`
- `PAPER_OUT`

## Mejoras Futuras
- Plantillas personalizables por tipo de documento
- Historial de impresiones
- Sincronización de configuraciones entre terminales
- Soporte para impresoras de red

## Notas
- Se recomienda probar la configuración antes de usarla en producción
- Los cambios se aplican inmediatamente
- Mantener respaldo de las configuraciones personalizadas
