# Actualización Masiva de Precios

**URL:** `/configuracion/precios`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET, POST

## Descripción
Herramienta para actualizar precios de múltiples productos de manera masiva basada en diferentes criterios como categorías, proveedores o márgenes de ganancia.

## Flujo de Trabajo

### 1. Selección de Productos
- **Filtros Avanzados**
  - Por categoría
  - Por proveedor
  - Por margen actual
  - Por fecha de última actualización
  - Por estado de stock

### 2. Método de Actualización
- **Porcentaje** (aumento/disminución)
- **Monto Fijo** (suma/resta)
- **Precio de Venta Directo**
- **Margen Objetivo** (sobre costo)

### 3. Ajustes de Redondeo
- **Múltiplo de** (ej: 500 para redondear a 500)
- **Dirección** (Arriba/Abajo/Cercano)
- **Aplicar a** (Precio final/Precio base)

### 4. Vista Previa
- Resumen de cambios
- Comparación antes/después
- Impacto en el inventario
- Productos que no cumplen con validaciones

## Reglas de Negocio

### Validaciones
- Precios mínimos/máximos
- Márgenes aceptables
- Precios históricos
- Límites de variación

### Restricciones
- Máximo 1000 productos por lote
- Confirmación para cambios > 20%
- Bloqueo para productos con promociones activas
- Registro de usuario que realiza el cambio

## Estados del Proceso
1. `PREVIEW` - Vista previa de cambios
2. `VALIDATING` - Validando reglas de negocio
3. `PROCESSING` - Aplicando cambios
4. `COMPLETED` - Cambios aplicados
5. `FAILED` - Error en el proceso

## Reporte de Ejecución
- Productos actualizados
- Productos omitidos (con razón)
- Resumen de cambios
- Enlace a descargar reporte completo

## Seguridad
- Doble autenticación para cambios masivos
- Historial de cambios con marca de tiempo
- Reversión de lotes completos

## Códigos de Error
- `INVALID_RANGE` - Rango de precios inválido
- `MAX_ITEMS_EXCEEDED` - Demasiados productos
- `VALIDATION_FAILED` - No cumple reglas de negocio
- `AUTH_REQUIRED` - Se requiere autenticación adicional

## Mejoras Futuras
- Programación de actualizaciones
- Plantillas de ajustes frecuentes
- Integración con costos de proveedores
- Análisis de impacto en ventas

## Notas
- Se recomienda realizar cambios fuera del horario pico
- Hacer copia de seguridad antes de cambios masivos
- Los cambios pueden tardar varios minutos en reflejarse en todos los dispositivos
