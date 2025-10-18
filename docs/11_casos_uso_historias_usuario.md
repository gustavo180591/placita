# Historias de Usuario & Criterios de Aceptación

## Venta rápida (POS)
**Como** Juan **quiero** registrar una venta en ≤10s **para** no perder ritmo.
- **Dado** catálogo cargado, **cuando** busco "linterna" y toco 1 ítem, **entonces** se agrega con cantidad=1.
- **Cuando** elijo **Efectivo** y guardo, **entonces** descuenta stock y muestra total.
- **Métricas:** tiempo medio <10s; error rate <1% en arqueo.

## Venta con fiado
- **Dado** cliente “Ana” existe, **cuando** pago=**fiado**, **entonces** crea saldo pendiente.
- **Y** puedo registrar pago parcial luego y ver deuda actualizada.

## QR pendiente
- **Cuando** marco pago=QR y referencia, **entonces** queda “pendiente de confirmación”.
- **Luego** desde “Conciliar” puedo marcar **confirmado**. Reporte refleja cambios.

## Promoción por cantidad
- **Dado** regla 3+ medias a $170 c/u, **cuando** agrego 3 unidades, **entonces** el sistema aplica el precio promo.

## Reserva/seña
- **Cuando** registro seña $1000, **entonces** stock queda “comprometido” y la venta como “pendiente”.

## Devolución por defecto
- **Cuando** proceso devolución, **entonces** reingresa stock como “defectuoso/merma” y ajusta caja si corresponde.
