# Modelo de Datos (Lógico)

## Entidades principales
- **Producto**(id, categoria, nombre, descripcion, variante, foto, estado)
- **Precio**(id, producto_id, lista, oferta, vigencia_desde, vigencia_hasta, lista_qr_pct)
- **Stock**(producto_id, stock_actual, stock_minimo, unidad, ubicacion)
- **Proveedor**(id, nombre, contacto, condiciones_pago, notas, origen)
- **Compra**(id, fecha, proveedor_id, costo_total, gastos, tipo_cambio, metodo_pago, comprobante_ref, adjunto_url, notas)
- **CompraItem**(compra_id, producto_id, cantidad, costo_unitario, moneda, subtotal)
- **Venta**(id, fecha, cliente_id?, total, estado_pago, observaciones, canal := {presencial, whatsapp})
- **VentaPago**(venta_id, tipo := {efectivo, qr, fiado}, monto, referencia?, confirmado)
- **VentaItem**(venta_id, producto_id, cantidad, precio_unit, descuento, subtotal, es_combo?, override?)
- **Cliente**(id, nombre, telefono, tipo, notas, limite_fiado)
- **DeudaCliente**(cliente_id, saldo_pendiente, fecha_compromiso)
- **AjusteStock**(id, producto_id, tipo := {merma, reconteo, devolucion_proveedor}, cantidad, motivo, fecha)
- **Reserva**(id, cliente_id, fecha, estado, observaciones); **ReservaItem**(reserva_id, producto_id, cantidad)
- **Usuario**(id, nombre, rol, telefono)

## Reglas
- `VentaItem` descuenta stock; `CompraItem` aumenta stock.
- `VentaPago(tipo=fiado)` aumenta `DeudaCliente`; pagos reducen saldo.
- `Precio` puede derivar en cálculo por medio de pago (QR %).
