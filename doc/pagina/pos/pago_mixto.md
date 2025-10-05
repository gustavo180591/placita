# Punto de Venta (POS)

## Pago Mixto

### Descripción
Interfaz para procesar pagos que combinan múltiples métodos de pago en una sola transacción.

### URL
`/pos/mixto`

### Roles Requeridos
- OPERADOR
- ADMIN

### Flujo de Pago Mixto
1. **Selección de Métodos**
   - Efectivo
   - Tarjeta de débito/crédito
   - Transferencia bancaria
   - Billetera digital
   - Vales/Descuentos

2. **Distribución de Montos**
   - Asignación por monto fijo
   - Asignación por porcentaje
   - Cálculo automático de cambio
   - Validación de montos

3. **Confirmación**
   - Resumen de pagos
   - Detalle de comisiones
   - Impresión de comprobante
   - Envío por email

### Componentes Principales

#### 1. Resumen de la Venta
- Subtotal
- Descuentos
- Impuestos
- Total a pagar
- Saldo pendiente

#### 2. Métodos de Pago
- **Efectivo**
  - Monto entregado
  - Vuelto calculado
  - Desglose de billetes

- **Tarjeta**
  - Tipo (Débito/Crédito)
  - Últimos 4 dígitos
  - Cuotas (si aplica)
  - Aprobación

- **Transferencia**
  - Banco emisor
  - N° de operación
  - Fecha y hora
  - Comprobante

- **Billetera Digital**
  - Proveedor (MercadoPago, etc.)
  - N° de teléfono/email
  - Código de autorización

### Validaciones
- Suma de pagos = Total a pagar
- Montos positivos
- Métodos válidos
- Autorizaciones requeridas

### Estados de la Transacción
- `en_proceso`: Seleccionando métodos
- `validando`: Verificando pagos
- `confirmando`: Esperando confirmación
- `completado`: Pago exitoso
- `error`: Fallo en el proceso

### Reglas de Negocio
- Mínimo 1 método de pago
- Máximo 3 métodos por transacción
- Comisiones según método
- Redondeo a favor del cliente

### Seguridad
- Validación de montos en tiempo real
- Registro detallado de operaciones
- Confirmación para montos altos
- Límite de tiempo por transacción

### Accesos Rápidos
- `F1`: Efectivo
- `F2`: Tarjeta
- `F3`: Transferencia
- `F4`: Billetera
- `F9`: Finalizar
- `ESC`: Cancelar

### Notas
- Se genera un solo comprobante por transacción
- Los cambios se redondean al múltiplo de $0.50 más cercano
- Se pueden aplicar descuentos antes de dividir el pago
- Cada método de pago genera su propio registro contable
- Se mantiene el historial de transacciones mixtas
