# Punto de Venta (POS)

## Comprobante de Venta

### Descripción
Vista e impresión del comprobante de venta generado en el punto de venta.

### URL
`/pos/recibo/:ventaId`

### Parámetros de URL
- `ventaId`: Identificador único de la venta (UUID)

### Roles Requeridos
- OPERADOR
- ADMIN

### Componentes del Comprobante

#### 1. Encabezado
- Logo del negocio
- Nombre comercial
- Dirección y contacto
- RUC/CUIT/CUIL
- N° de comprobante
- Fecha y hora
- N° de CAE (si aplica)
- Vencimiento CAE (si aplica)

#### 2. Detalle de la Venta
- Lista de productos/servicios
  - Cantidad
  - Descripción
  - Precio unitario
  - Descuento (si aplica)
  - Subtotal por ítem
- Subtotal general
- Descuentos globales
- Impuestos desglosados
- Total general

#### 3. Formas de Pago
- Método(s) de pago utilizados
- Monto por cada método
- Vuelto (si aplica)
- Detalles de la transacción

#### 4. Pie de Página
- Mensaje legal
- N° de autorización
- Código QR con datos fiscales
- Número de control interno
- Nombre del cajero
- Hora de impresión

### Opciones de Impresión
- Tamaño de papel (80mm, A4)
- Incluir/ocultar precios
- Copia para el cliente
- Copia para el negocio
- Envío por email

### Tipos de Comprobantes
- **Ticket**: Venta minorista
- **Factura A**: Consumidor final
- **Factura B**: Responsable inscripto
- **Nota de Crédito**: Devoluciones
- **Nota de Débito**: Ajustes

### Validaciones
- Comprobante no anulado
- Datos fiscales completos
- Secuencia numérica correcta
- Fechas válidas
- Totales calculados

### Estados del Comprobante
- `pendiente`: Generado pero no impreso
- `impreso`: Impreso correctamente
- `enviado`: Enviado por email
- `anulado`: Cancelado/Anulado
- `error`: Problema al generar

### Reglas de Negocio
- Numeración correlativa
- No se puede modificar después de impreso
- Se debe conservar copia digital
- Cumplimiento normativo AFIP/IRS
- Retención de impuestos si aplica

### Seguridad
- Firma digital del comprobante
- Código de barras de verificación
- Hash de validación
- Registro de reimpresiones

### Integraciones
- Impresora fiscal
- Sistema contable
- Facturación electrónica
- Sistema de inventario

### Acciones Disponibles
- Reimprimir
- Enviar por email
- Exportar a PDF
- Anular (con restricciones)
- Ver historial de cambios

### Notas
- Conservar copia física por 5 años
- Verificar stock después de la impresión
- Notificar al sistema contable
- Registrar en libro de ventas
- Realizar cierre diario de caja

### Códigos de Error Comunes
- `ERR_REC_001`: Comprobante no encontrado
- `ERR_REC_002`: Error de impresión
- `ERR_REC_003`: Sin conexión a impresora
- `ERR_REC_004`: Error de validación fiscal
- `ERR_REC_005`: Comprobante ya anulado
