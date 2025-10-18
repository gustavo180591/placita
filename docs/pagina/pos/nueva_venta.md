# Punto de Venta (POS)

## Nueva Venta

### Descripción
Interfaz principal para el proceso de venta en mostrador con soporte para múltiples métodos de pago.

### URL
`/pos`

### Roles Requeridos
- OPERADOR
- ADMIN

### Componentes Principales

#### 1. Barra de Búsqueda
- Búsqueda por código de barras o nombre
- Autocompletado con sugerencias
- Escáner de códigos de barras

#### 2. Lista de Productos
- Grid de productos con imágenes
- Filtrado por categorías
- Indicador de stock disponible
- Precios visibles

#### 3. Carrito de Compra
- Lista de productos seleccionados
- Cantidad modificable
- Aplicación de descuentos
- Opciones de eliminación

#### 4. Panel de Pago
- Subtotal, impuestos y total
- Selección de método de pago
- Cálculo de vuelto
- Botón de pago

### Flujo de Trabajo
1. Agregar productos al carrito
2. Verificar cantidades y precios
3. Seleccionar método de pago
4. Confirmar la venta
5. Imprimir o enviar comprobante

### Estados
- `inactivo`: Sesión inactiva
- `seleccion`: Seleccionando productos
- `pago`: En proceso de pago
- `confirmacion`: Confirmando venta
- `completado`: Venta finalizada
- `error`: Error en el proceso

### Reglas de Negocio
- Validación de stock en tiempo real
- Cálculo automático de impuestos
- Redondeo a 2 decimales
- Mínimo de compra: $100
- Máximo de productos: 50 por venta

### Validaciones
- Stock suficiente
- Precios positivos
- Cliente válido (si aplica)
- Método de pago seleccionado

### Accesos Rápidos
- `F1`: Buscar producto
- `F2`: Pago en efectivo
- `F3`: Pago con tarjeta
- `F4`: Pago mixto
- `F9`: Finalizar venta
- `ESC`: Cancelar

### Notas
- Se mantiene el historial de los últimos 10 productos
- Los precios se actualizan según promociones vigentes
- Se muestran alertas de stock crítico
- Se registra el vendedor y la hora de la venta
