# Ventas

## Historial de Ventas

### Descripción
Vista completa del registro histórico de transacciones de venta del sistema.

### URL
`/ventas`

### Roles Requeridos
- OPERADOR
- ADMIN

### Funcionalidades Principales

#### 1. Búsqueda y Filtrado
- Por rango de fechas
- Número de ticket/factura
- Cliente
- Vendedor
- Estado de pago
- Monto (mín/máx)
- Tipo de comprobante

#### 2. Vista de Ventas
- Tabla detallada
- Resumen por día/semana/mes
- Gráficos de tendencias
- Exportación a múltiples formatos

#### 3. Acciones por Venta
- Ver detalle
- Reimprimir
- Enviar por email
- Generar factura
- Anular/Devolver

### Columnas Principales
1. **Transacción**
   - N° Ticket/Factura
   - Fecha y hora
   - Estado
   - Tipo de comprobante

2. **Cliente**
   - Nombre/Razón Social
   - Documento
   - Tipo de cliente

3. **Monto**
   - Subtotal
   - Descuentos
   - Impuestos
   - Total

4. **Pago**
   - Método
   - Estado
   - Fecha de pago
   - Comprobante

5. **Vendedor**
   - Nombre
   - Sucursal
   - Turno

### Estados de Venta
- `completada`: Pago confirmado
- `pendiente`: Pendiente de pago
- `anulada`: Cancelada/Anulada
- `devuelta`: Con devolución parcial/total
- `en_proceso`: En proceso de pago

### Reglas de Negocio
- Las ventas solo pueden ser anuladas por administradores
- Las devoluciones generan nota de crédito
- Se requiere motivo para anulaciones
- Las facturas electrónicas siguen normativa AFIP

### Reportes Disponibles
- Ventas por período
- Productos más vendidos
- Métodos de pago
- Desempeño de vendedores
- Comparativo con períodos anteriores

### Seguridad
- Registro detallado de operaciones
- Control de acceso por roles
- Firmado electrónico de documentos
- Respaldo automático

### Integraciones
- Impresora fiscal
- Sistema contable
- Plataforma de pagos
- Sistema de facturación electrónica

### Accesos Rápidos
- `N`: Nueva venta
- `F`: Filtrar resultados
- `E`: Exportar reporte
- `R`: Refrescar datos
- `P`: Imprimir selección

### Notas
- El historial se conserva por 10 años según normativa
- Las anulaciones generan asientos contables
- Se pueden generar reportes personalizados
- Los datos se pueden exportar a Excel/PDF
- Se soporta firma digital en comprobantes
