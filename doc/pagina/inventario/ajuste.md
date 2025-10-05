# Ajuste de Inventario

**URL:** `/inventario/ajuste`  
**Acceso:** Privado  
**Roles:** ADMIN, OPERADOR  
**Métodos HTTP:** GET, POST

## Descripción
Permite realizar ajustes de inventario como mermas, reconteos o entradas manuales de productos.

## Componentes
- `InventarioAjusteForm.svelte` - Formulario para registrar ajustes
- `ProductoSelector.svelte` - Búsqueda y selección de productos
- `MotivoSelector.svelte` - Selección del tipo de ajuste (merma, reconteo, entrada manual)
- `AjusteHistorial.svelte` - Historial de ajustes recientes

## Estados
- `initial` - Formulario vacío
- `selecting` - Seleccionando productos
- `confirming` - Confirmando ajuste
- `success` - Ajuste registrado exitosamente
- `error` - Error en el proceso

## Reglas de Negocio
1. **Mínimos de Stock**
   - Advertencia si el stock resultante está por debajo del mínimo configurado
   - Bloqueo si el ajuste deja stock negativo (excepto para ADMIN)

2. **Validaciones**
   - Cantidad requerida y mayor a cero
   - Motivo obligatorio
   - Fecha de vencimiento para productos perecederos

3. **Auditoría**
   - Registrar usuario que realizó el ajuste
   - Timestamp automático
   - Comentario obligatorio para mermas

## Códigos de Error
- `INSUFFICIENT_STOCK`: Stock insuficiente para el ajuste
- `INVALID_PRODUCT`: Producto no encontrado
- `MISSING_FIELDS`: Campos requeridos faltantes
- `UNAUTHORIZED`: Sin permisos para realizar el ajuste

## Integraciones
- **Backend:** `POST /api/inventario/ajustes`
- **Notificaciones:** Envía alerta a ADMIN si hay merma significativa
- **Sincronización:** Se sincroniza inmediatamente si hay conexión

## Mejoras Futuras
- Escaneo por código de barras
- Fotos del producto para documentar mermas
- Aprobación requerida para ajustes grandes
