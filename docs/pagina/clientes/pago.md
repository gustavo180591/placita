# Clientes

## Registro de Pago

### Descripción
Interfaz para registrar pagos de clientes, ya sea para saldar deudas pendientes o abonos a créditos.

### URL
`/clientes/:clienteId/pago`

### Parámetros de URL
- `clienteId`: Identificador único del cliente (UUID)

### Roles Requeridos
- OPERADOR
- ADMIN

### Componentes Principales

#### 1. Resumen del Cliente
- Nombre y datos de contacto
- Límite de crédito actual
- Saldo pendiente total
- Próximos vencimientos
- Historial de pagos recientes

#### 2. Detalle de Deudas
- Listado de facturas pendientes
  - Número y fecha
  - Monto original
  - Saldo pendiente
  - Días de atraso
  - Opción para seleccionar

#### 3. Formulario de Pago
- **Monto a pagar**
  - Monto total pendiente
  - Monto a abonar
  - Vuelto (si aplica)
  - Saldo pendiente después del pago

- **Método de Pago**
  - Efectivo
  - Transferencia bancaria
  - Tarjeta de débito/crédito
  - Cheque
  - Otros medios

- **Información Adicional**
  - Fecha del pago
  - Referencia/comprobante
  - Notas u observaciones
  - Adjuntar comprobante

### Validaciones
- El monto no puede ser mayor al saldo pendiente
- Fecha no puede ser futura (excepto para pagos anticipados)
- Referencia requerida para transferencias/cheques
- Comprobante obligatorio para montos altos

### Estados del Pago
- `pendiente`: Registrado pero no aplicado
- `aplicado`: Procesado correctamente
- `anulado`: Pago cancelado
- `revertido`: Reversión de pago

### Reglas de Negocio
- Los pagos se aplican al saldo más antiguo primero (FIFO)
- Se generan recibos automáticamente
- Notificación al cliente opcional
- Los descuentos requieren autorización

### Seguridad
- Registro de auditoría detallado
- Confirmación para montos altos
- Límite de monto por operación
- Validación de permisos

### Integraciones
- Sistema contable
- Plataforma de pagos
- Sistema de facturación
- Notificaciones por email/SMS

### Accesos Rápidos
- `F2`: Guardar pago
- `F5`: Actualizar saldos
- `F9`: Imprimir recibo
- `ESC`: Cancelar

### Códigos de Error
- `ERR_PAG_001`: Saldo insuficiente
- `ERR_PAG_002`: Método no válido
- `ERR_PAG_003`: Error al procesar
- `ERR_PAG_004`: Monto inválido
- `ERR_PAG_005`: Sin permisos

### Notas
- Verificar datos antes de confirmar
- Entregar comprobante al cliente
- Registrar cualquier observación
- Revisar conciliación diaria
- Capacitar en detección de billetes falsos
