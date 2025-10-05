# Proceso de Venta (POS)

## Flujo base (3 pasos — meta ≤10s)
1) **Agregar productos** (búsqueda por nombre/código; cantidad por defecto **1**; soporte combos).
2) **Confirmar precios/desc.** (override rápido; promos automáticas; redondeo).
3) **Elegir pago** (Efectivo / Transferencia/QR / **Fiado**), **Guardar** → descuenta stock.

## Formas de pago
- **Efectivo**: registro y cálculo de vuelto opcional.
- **QR/Transferencia**: marcar como “pendiente de confirmación” y conciliar luego.
- **Fiado**: asignar cliente (nuevo o existente), saldo pendiente y fecha compromiso.

## Comprobante
- **Ticket** digital (PDF/WhatsApp) o impresión térmica 58mm (opcional). Factura C simple.

## Casos especiales
- **Reserva**: marcar ítems como “comprometidos” para retiro futuro.
- **Pago mixto**: dividir en múltiples pagos (efectivo + QR).
- **Devolución**: genera movimiento inverso; ajusta caja y stock (defectuoso → merma).
- **Cambio**: salida del nuevo ítem y entrada del ítem devuelto (si es vendible).

## Cierre diario
- Reporte: total vendido, por medio de pago, **pendientes de confirmar**, fiado del día.
- **Arqueo**: efectivo esperado vs contado manual → registrar diferencia.
