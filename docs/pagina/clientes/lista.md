# Clientes

## Listado de Clientes

### Descripción
Vista principal para gestionar el registro de clientes del sistema.

### URL
`/clientes`

### Roles Requeridos
- OPERADOR
- ADMIN

### Funcionalidades Principales

#### 1. Búsqueda y Filtrado
- Búsqueda por nombre, documento o teléfono
- Filtros avanzados:
  - Estado (activo/inactivo)
  - Tipo de cliente
  - Rango de compras
  - Saldo pendiente
  - Última compra

#### 2. Listado de Clientes
- Vista de tabla ordenable
- Tarjetas de resumen
- Paginación (20 clientes por página)
- Exportación a Excel/PDF

#### 3. Acciones Rápidas
- Ver detalle
- Editar información
- Nuevo cliente
- Historial de compras
- Enviar mensaje

### Columnas de la Tabla
1. **Nombre**
   - Nombre completo
   - Tipo de cliente (icono)
   - Estado (activo/inactivo)

2. **Contacto**
   - Teléfono principal
   - Email
   - Dirección (ciudad)

3. **Compras**
   - Total comprado
   - Última compra
   - Frecuencia

4. **Crédito**
   - Límite
   - Saldo actual
   - Estado de crédito

5. **Acciones**
   - Ver/Editar
   - Historial
   - Mensajes

### Estados de Cliente
- `activo`: Cliente con actividad reciente
- `inactivo`: Sin actividad por más de 6 meses
- `moroso`: Con pagos pendientes
- `premium`: Cliente frecuente con beneficios

### Reglas de Negocio
- Los clientes nuevos requieren al menos nombre y teléfono
- Se valida formato de email si se proporciona
- Los clientes inactivos se marcan automáticamente
- Se registra fecha de creación y última actualización

### Seguridad
- Los datos sensibles se muestran parcialmente
- Registro de accesos y modificaciones
- Exportación restringida a administradores

### Integraciones
- Mapa de ubicación (Google Maps)
- Envío de mensajes (SMS/Email)
- Sincronización con CRM (futuro)

### Accesos Rápidos
- `N`: Nuevo cliente
- `F`: Filtrar resultados
- `E`: Exportar lista
- `R`: Refrescar datos

### Notas
- Se recomienda mantener actualizada la información de contacto
- Los clientes pueden ser dados de baja pero no eliminados
- El historial de compras se conserva incluso si el cliente se marca como inactivo
