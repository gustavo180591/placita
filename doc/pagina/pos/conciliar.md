# Punto de Venta (POS)

## Conciliación de Pagos QR

### Descripción
Interfaz para verificar y conciliar pagos realizados mediante códigos QR que se encuentran en estado pendiente de confirmación.

### URL
`/pos/conciliar`

### Roles Requeridos
- OPERADOR
- ADMIN

### Flujo de Conciliación
1. **Listado de Transacciones Pendientes**
   - Filtrado por rango de fechas
   - Búsqueda por monto o referencia
   - Ordenamiento por antigüedad

2. **Verificación de Estado**
   - Consulta en tiempo real al proveedor de pagos
   - Actualización de estados
   - Notificación de cambios

3. **Conciliación Manual**
   - Registro de confirmación
   - Observaciones
   - Adjuntar comprobante

### Componentes Principales

#### 1. Filtros de Búsqueda
- Rango de fechas
- Estado de la transacción
- Monto mínimo/máximo
- Referencia/TID
- Procesador de pago

#### 2. Listado de Transacciones
- Hora de la transacción
- Monto
- Referencia
- Estado actual
- Tiempo en espera
- Acciones disponibles

#### 3. Detalle de Transacción
- Información del pago
- Datos del cliente
- Productos/servicios
- Historial de estados
- Comprobante adjunto

### Estados de Transacción
- `pendiente`: Esperando confirmación
- `confirmado`: Pago exitoso
- `rechazado`: Pago fallido
- `revertido`: Reembolsado
- `en_verificacion`: En proceso de validación

### Validaciones
- No duplicar conciliaciones
- Verificar montos coincidentes
- Validar referencias únicas
- Comprobar límites de tiempo

### Acciones Disponibles
- Actualizar estado
- Forzar conciliación
- Reintentar verificación
- Generar reporte
- Exportar a Excel

### Reglas de Negocio
- Tiempo máximo de espera: 24 horas
- Notificar al cliente en caso de discrepancia
- Generar alertas para transacciones sospechosas
- Mantener registro de auditoría

### Seguridad
- Validación de permisos
- Registro de acciones realizadas
- Confirmación para operaciones críticas
- Bloqueo por múltiples intentos fallidos

### Integraciones
- Pasarelas de pago
- Sistema de notificaciones
- Registro contable
- Sistema de reportes

### Accesos Rápidos
- `F5`: Actualizar lista
- `F`: Filtrar resultados
- `E`: Exportar reporte
- `ESC`: Salir

### Códigos de Error
- `ERR_CONC_001`: Error de conexión
- `ERR_CONC_002`: Transacción no encontrada
- `ERR_CONC_003`: Monto no coincide
- `ERR_CONC_004`: Tiempo de espera agotado
- `ERR_CONC_005`: Sin permisos

### Notas
- Verificar regularmente las transacciones pendientes
- Mantener registros por 5 años
- Capacitar al personal en detección de fraudes
- Realizar conciliación diaria
