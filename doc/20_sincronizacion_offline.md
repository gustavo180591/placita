# Sincronización Offline & Conflictos

## Estrategia
- **Cola local** de eventos (append-only): venta, compra, ajuste, pago.
- **Ids** UUID v4; **reintentos** exponenciales; marca de **versionado** por entidad (etag).

## Conflictos comunes
- Múltiples ventas del mismo SKU **offline** → permitir **stock negativo** local; reconciliar y alertar si <0.
- Edición concurrente de precio → **last-write-wins** con advertencia y log.

## Integridad
- Transacciones locales (venta: items + pagos); compensaciones para devoluciones.
