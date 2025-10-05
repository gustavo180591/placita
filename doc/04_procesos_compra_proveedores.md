# Compras & Proveedores

## Flujo
1) **Necesidad**: stock < mínimo / estacionalidad.
2) **Pedido/Compra**: local, Encarnación o viajante (contado o diferido).
3) **Recepción**: validar cantidades/estado; registrar **compra** → aumenta stock.
4) **Costos**: costo unitario, moneda, flete, aranceles, tipo de cambio → costo real.
5) **Documentos**: número de comprobante + **foto** adjunta (remito/factura).
6) **Devoluciones a proveedor**: ajuste de stock y **nota de crédito**.

## Proveedores (campos)
- nombre, contacto (WhatsApp/teléfono), condiciones de pago, notas, origen (local/Paraguay).

## Compras (campos)
- fecha, proveedor, ítems [{producto, cantidad, costo, moneda}], gastos, tipo_cambio, pago, comprobante, notas.

## Precios vs. dólar
- **Etiqueta** productos “sensibles a dólar” → herramientas de **actualización masiva** por %.
