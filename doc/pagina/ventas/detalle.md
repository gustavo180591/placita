# Ventas

## Detalle de Venta

### Descripción
Vista detallada de una transacción de venta específica con capacidad de gestión completa.

### URL
`/ventas/:ventaId`

### Parámetros de URL
- `ventaId`: Identificador único de la venta (UUID)

### Roles Requeridos
- OPERADOR
- ADMIN

### Secciones Principales

#### 1. Encabezado de la Venta
- Número de ticket/factura
- Fecha y hora
- Estado actual
- Vendedor asignado
- Punto de venta
- Turno de trabajo

#### 2. Datos del Cliente
- Información básica
- Historial de compras
- Límite de crédito
- Estado de cuenta
- Datos de facturación

#### 3. Detalle de Productos
- Lista de ítems vendidos
  - Código y descripción
  - Cantidad y precio unitario
  - Descuentos aplicados
  - Impuestos
  - Total por ítem

#### 4. Resumen de Pagos
- Métodos de pago utilizados
- Montos por cada método
- Cambio entregado
- Estado de cada pago
- Comprobantes asociados

#### 5. Impuestos y Descuentos
- Base imponible
- IVA/Impuestos aplicados
- Descuentos globales
- Recargos
- Total general

### Estados de la Venta
- `en_proceso`: En edición
- `pendiente_pago`: Esperando pago
- `pagada`: Pago confirmado
- `en_preparacion`: En proceso de preparación
- `en_entrega`: En camino al cliente
- `entregada`: Completada
- `cancelada`: Anulada
- `devuelta`: Con devolución

### Acciones Disponibles

#### Operaciones Básicas
- Imprimir comprobante
- Enviar por email
- Duplicar venta
- Anular (con restricciones)
- Generar factura electrónica

#### Gestión de Pagos
- Agregar pago
- Registrar abono
- Aplicar descuento
- Generar recibo
- Revertir pago

#### Logística
- Marcar como preparado
- Registrar envío
- Actualizar estado de entrega
- Agregar seguimiento

### Validaciones
- Verificar stock al duplicar
- Validar montos de pago
- Comprobar autorizaciones
- Verificar límites de crédito
- Validar datos fiscales

### Reglas de Negocio
- Las anulaciones requieren motivo
- Las devoluciones generan nota de crédito
- Los descuentos superiores al 15% requieren autorización
- Las facturas se generan automáticamente al superar $10,000

### Seguridad
- Registro de cambios
- Control de accesos
- Firmado electrónico
- Bitácora de auditoría

### Integraciones
- Sistema de facturación
- Plataforma de pagos
- Sistema de inventario
- CRM de clientes
- Servicio de mensajería

### Accesos Rápidos
- `Ctrl+P`: Imprimir
- `Ctrl+E`: Enviar email
- `F2`: Agregar pago
- `F3`: Ver historial
- `F9`: Finalizar
- `ESC`: Volver atrás

### Códigos de Error
- `ERR_VTA_001`: Venta no encontrada
- `ERR_VTA_002`: Sin permisos
- `ERR_VTA_003`: Estado inválido
- `ERR_VTA_004`: Error al actualizar
- `ERR_VTA_005`: Validación fallida

### Notas
- Mantener registro de cambios
- Verificar datos fiscales
- Confirmar con el cliente
- Revisar inventario
- Registrar incidencias
