# Reservas

## Nueva Reserva

### Descripción
Formulario completo para crear una nueva reserva en el sistema, con validaciones en tiempo real y gestión de disponibilidad.

### URL
`/reservas/nueva`

### Roles Requeridos
- OPERADOR
- ADMIN

### Secciones del Formulario

#### 1. Datos del Cliente
- **Búsqueda/Selección**
  - Búsqueda por nombre/teléfono
  - Datos de contacto
  - Historial de reservas
  - Preferencias guardadas

- **Nuevo Cliente**
  - Nombre completo
  - Teléfono/Email
  - Notas importantes
  - Acepta términos y condiciones

#### 2. Detalles de la Reserva
- **Tipo de Reserva**
  - Producto/Servicio
  - Duración estimada
  - Recurso/Ubicación
  - Personal asignado

- **Fecha y Hora**
  - Selector de calendario
  - Horarios disponibles
  - Zona horaria
  - Recordatorios

- **Detalles Adicionales**
  - Número de personas
  - Requerimientos especiales
  - Notas internas
  - Documentos adjuntos

#### 3. Confirmación y Pago
- **Resumen**
  - Detalles de la reserva
  - Políticas aplicables
  - Términos y condiciones

- **Pago de Señal**
  - Monto requerido
  - Métodos de pago
  - Comprobante
  - Facturación

### Validaciones en Tiempo Real
- Disponibilidad de horario
- Capacidad del local
- Anticipación requerida
- Requisitos especiales
- Documentación necesaria

### Estados del Proceso
- `en_edicion`: Formulario en progreso
- `validando`: Verificando disponibilidad
- `confirmando`: Esperando pago
- `completado`: Reserva confirmada
- `error`: Problema detectado

### Reglas de Negocio
- Señal mínima: 20% del total
- Cancelación gratuita hasta 24h antes
- Tolerancia de 15 minutos
- Máximo de personas según aforo
- Política de no presentación

### Seguridad
- Validación de datos de pago
- Protección contra doble envío
- Registro de auditoría
- Encriptación de datos sensibles

### Integraciones
- Calendario del personal
- Sistema de pagos
- Notificaciones
- Control de acceso

### Accesos Rápidos
- `Ctrl+S`: Guardar borrador
- `F2`: Buscar cliente
- `F5`: Actualizar disponibilidad
- `F9`: Confirmar reserva
- `ESC`: Cancelar

### Códigos de Error
- `ERR_NRES_001`: Horario no disponible
- `ERR_NRES_002`: Cliente bloqueado
- `ERR_NRES_003`: Pago rechazado
- `ERR_NRES_004`: Datos incompletos
- `ERR_NRES_005`: Error del sistema

### Notas
- Verificar disponibilidad antes de confirmar
- Documentar requerimientos especiales
- Enviar confirmación inmediata
- Registrar incidencias
- Capacitar en atención al cliente
