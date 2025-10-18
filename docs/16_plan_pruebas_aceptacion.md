# Plan de Pruebas (QA, E2E, UAT)

## E2E críticos
- Venta efectiva, venta QR pendiente→confirmada, venta fiado→pago parcial.
- Devolución y cambio; combo descuenta SKUs correctos.
- Compra actualiza stock y costo promedio.

## UAT (con Juan)
- Registrar 20 ventas reales en sábado (pico) sin ralentizar atención.
- Arqueo ±1% y conciliación QR cero pendientes.

## Automatización mínima
- Tests API (ventas, stock, fiado), pruebas offline (modo avión), conflictos de sync.
