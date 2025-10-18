# Reservas

## Detalle de Reserva

### Descripción
Vista detallada de una reserva específica con herramientas para su gestión y seguimiento.

### URL
`/reservas/:reservaId`

### Parámetros de URL
- `reservaId`: Identificador único de la reserva (UUID)

### Roles Requeridos
- OPERADOR
- ADMIN

### Secciones Principales

#### 1. Encabezado
- **Estado Actual**
  - Badge de estado (confirmada, pendiente, etc.)
  - Código de reserva
  - Fecha de creación
  - Última actualización

- **Acciones Rápidas**
  - Confirmar/Modificar/Cancelar
  - Reenviar confirmación
  - Generar comprobante
  - Duplicar reserva

#### 2. Información General
- **Datos del Cliente**
  - Nombre y datos de contacto
  - Historial de reservas
  - Preferencias guardadas
  - Notas importantes

- **Detalles de la Reserva**
  - Fecha y hora programada
  - Duración estimada
  - Producto/Servicio
  - Ubicación/Recurso asignado
  - Personal designado

#### 3. Seguimiento
- **Historial de Estados**
  - Cambios de estado
  - Horarios modificados
  - Notas del personal
  - Archivos adjuntos

- **Comunicaciones**
  - Recordatorios enviados
  - Confirmaciones
  - Notificaciones
  - Plantillas utilizadas

#### 4. Gestión de Pagos
- **Resumen Financiero**
  - Costo total
  - Señal recibida
  - Saldo pendiente
  - Métodos de pago

- **Transacciones**
  - Historial de pagos
  - Reembolsos
  - Notas de crédito
  - Comprobantes

### Estados de la Reserva
- `borrador`: En edición
- `pendiente`: Esperando confirmación
- `confirmada`: Cliente confirmó
- `en_curso`: En proceso
- `completada`: Finalizada con éxito
- `cancelada`: Cancelada por alguna parte
- `no_show`: Cliente no se presentó

### Validaciones
- Verificación de identidad
- Disponibilidad de recursos
- Cumplimiento de políticas
- Documentación requerida
- Restricciones horarias

### Reglas de Negocio
- Tolerancia de 15 minutos
- Política de cancelación
- Cargos por no presentación
- Límite de modificaciones
- Prioridad en reservas recurrentes

### Seguridad
- Control de acceso por roles
- Registro de auditoría
- Protección de datos
- Firmas digitales

### Integraciones
- Sistema de facturación
- Plataforma de pagos
- Herramientas de comunicación
- Control de accesos

### Accesos Rápidos
- `E`: Editar
- `P`: Imprimir
- `R`: Reenviar
- `D`: Duplicar
- `ESC`: Volver

### Códigos de Error
- `ERR_DRES_001`: No encontrada
- `ERR_DRES_002`: Sin permisos
- `ERR_DRES_003`: Conflicto
- `ERR_DRES_004`: Error al guardar
- `ERR_DRES_005`: Datos inválidos

### Notas
- Documentar incidencias
- Registrar feedback del cliente
- Mantener historial completo
- Respetar políticas de privacidad
- Realizar copias de seguridad
