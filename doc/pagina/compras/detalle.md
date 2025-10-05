# Detalle de Compra

**URL:** `/compras/:compraId`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET

## Descripción
Muestra el detalle completo de una orden de compra, incluyendo productos, cantidades, precios y estado de recepción.

## Componentes
- `CompraHeader.svelte` - Encabezado con datos generales
- `ItemsCompra.svelte` - Tabla de productos
- `DocumentosAdjuntos.svelte` - Facturas/remitos escaneados
- `AccionesCompra.svelte` - Botones de acción según estado

## Secciones
1. **Información General**
   - N° de compra y fecha
   - Proveedor y contacto
   - Estado actual
   - Fechas importantes

2. **Productos**
   - Código y descripción
   - Cantidad pedida/recibida
   - Precio unitario y total
   - Lote y vencimiento (si aplica)

3. **Totales**
   - Subtotal
   - Descuentos
   - Impuestos
   - Total general

4. **Documentación**
   - Factura adjunta
   - Remito
   - Notas internas

## Estados
- **Borrador**
  - Permite editar todos los campos
  - No afecta inventario

- **Enviada**
  - Solo lectura básica
  - Permite registrar recepción

- **Recibida**
  - Muestra diferencias
  - Permite ajustar cantidades

## Acciones por Estado
- **Borrador**
  - Guardar cambios
  - Enviar a proveedor
  - Cancelar

- **Enviada**
  - Registrar recepción
  - Adjuntar factura
  - Notificar atraso

- **Recibida**
  - Generar ajuste de inventario
  - Reabrir edición (soporte)
  - Exportar a contabilidad

## Reglas de Negocio
1. **Recepción**
   - Validar cantidades contra lo pedido
   - Registrar lote y vencimiento
   - Calcular diferencias

2. **Precios**
   - Mostrar variación vs. precio anterior
   - Actualizar costo promedio
   - Ajustar precios sugeridos

3. **Inventario**
   - Opción de no afectar stock
   - Ubicaciones específicas
   - Control por lotes

## Códigos de Error
- `COMPRA_NOT_FOUND`
- `UNAUTHORIZED_ACCESS`
- `INVALID_TRANSITION`
- `MISSING_REQUIRED_FIELDS`

## Integraciones
- **Inventario:** Actualización de existencias
- **Proveedores:** Historial de compras
- **Contabilidad:** Exportación de asientos

## Seguridad
- Validación de UUID
- Control de acceso por organización
- Log de visualizaciones

## Mejoras Futuras
- Escaneo de códigos de barras
- Aprobación de diferencias
- Integración con facturación electrónica
