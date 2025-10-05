# Promociones y Combos

**URL:** `/configuracion/promos`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET, POST

## Descripción
Configuración de promociones, descuentos y paquetes promocionales que se aplican automáticamente en el punto de venta según reglas predefinidas.

## Tipos de Promociones

### 1. Descuento por Cantidad
- **Configuración**
  - Producto o categoría objetivo
  - Cantidad mínima
  - Porcentaje o monto fijo de descuento
  - Límite de usos por cliente/día

### 2. Combos
- **Configuración**
  - Nombre del combo
  - Productos incluidos
  - Precio especial del paquete
  - Imagen promocional
  - Fechas de vigencia

### 3. Descuentos por Volumen
- **Rangos de Compra**
  - Monto mínimo
  - Porcentaje de descuento
  - Productos/categorías aplicables
  - Exclusivo para clientes registrados

### 4. Promociones por Tiempo Limitado
- **Configuración**
  - Fecha y hora de inicio/fin
  - Productos participantes
  - Descuento especial
  - Límite de unidades

## Reglas de Aplicación
- **Prioridad** de promociones cuando hay superposición
- **Acumulación** con otros descuentos
- **Restricciones** por:
  - Horario
  - Día de la semana
  - Canal de venta
  - Tipo de cliente

## Vista Previa
- Simulador de compra para probar promociones
- Historial de aplicación
- Reporte de efectividad

## Estados
- `BORRADOR` - En edición
- `PROGRAMADA` - Pendiente de activación
- `ACTIVA` - En ejecución
- `PAUSADA` - Temporalmente inactiva
- `FINALIZADA` - Completada

## Validaciones
- Sin superposición de promociones (a menos que se permita)
- Fechas válidas
- Límites de descuento
- Disponibilidad de inventario para combos

## Integraciones
- **POS:** Aplicación automática
- **Inventario:** Reserva para combos
- **Reportes:** Seguimiento de efectividad

## Seguridad
- Confirmación para activar/desactivar
- Historial de cambios
- Límite de descuentos máximos

## Códigos de Error
- `INVALID_DATE_RANGE`
- `MAX_DISCOUNT_EXCEEDED`
- `INVENTORY_CONFLICT`
- `OVERLAPPING_PROMO`

## Mejoras Futuras
- Plantillas de promociones estacionales
- Importación/exportación de configuraciones
- A/B testing de promociones
