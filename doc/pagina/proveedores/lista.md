# Listado de Proveedores

**URL:** `/proveedores`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET

## Descripción
Interfaz para gestionar el catálogo de proveedores, con búsqueda avanzada y acciones rápidas.

## Componentes
- `ProveedoresLista.svelte` - Tabla principal
- `FiltrosProveedores.svelte` - Filtros avanzados
- `AccionesRapidas.svelte` - Acciones masivas

## Columnas
1. **Nombre** - Con link al detalle
2. **RUC/ID** - Identificación fiscal
3. **Contacto** - Teléfono/email principal
4. **Categoría** - Tipo de proveedor
5. **Estado** - Activo/Inactivo
6. **Última Compra** - Fecha y monto
7. **Acciones** - Menú contextual

## Filtros
- **Estado** (Activo/Inactivo/Todos)
- **Categoría**
- **Rango de Compras**
- **Ubicación**
- **Término de Búsqueda**

## Acciones por Lote
- Exportar a Excel
- Enviar recordatorio
- Cambiar categoría
- Desactivar/Activar

## Vistas
1. **Tarjeta** - Para revisión rápida
2. **Tabla** - Para comparación
3. **Mapa** - Ubicación de sucursales

## Integraciones
- **Compras:** Historial de transacciones
- **Documentos:** Contratos vigentes
- **Calendario:** Próximos vencimientos

## Seguridad
- Exportaciones con marca de agua
- Registro de accesos
- Validación de datos sensibles

## Mejoras Futuras
- Evaluación de proveedores
- Alertas de vencimientos
- Integración con facturación electrónica
