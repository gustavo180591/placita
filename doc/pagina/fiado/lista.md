# Fiado

## Gestión de Deudas

### Descripción
Vista completa de los saldos pendientes de pago por parte de los clientes, con herramientas para seguimiento y cobranza.

### URL
`/fiado`

### Roles Requeridos
- OPERADOR
- ADMIN

### Filtros Principales
- Rango de fechas de vencimiento
- Monto mínimo/máximo
- Días de atraso
- Estado de la deuda
- Vendedor asignado
- Zona/Barrio

### Vistas Disponibles

#### 1. Vista de Tabla
- **Columnas**
  - Cliente (con datos de contacto)
  - Total adeudado
  - Días de atraso
  - Próximo vencimiento
  - Historial de pagos
  - Acciones rápidas

#### 2. Vista de Tarjetas
- Tarjeta por cliente con:
  - Foto y nombre destacado
  - Barra de progreso de deuda
  - Próximos vencimientos
  - Botones de acción

#### 3. Mapa de Calor
- Visualización geográfica
  - Concentración de deudores
  - Montos por zona
  - Niveles de riesgo

### Funcionalidades Clave

#### Gestión de Deudas
- Registro de pagos
- Reestructuración de deuda
- Generación de recordatorios
- Notificaciones automáticas

#### Análisis
- Proyección de ingresos
- Tasa de morosidad
- Efectividad de cobranza
- Histórico de recuperación

#### Reportes
- Estado de cartera
- Clientes morosos
- Pagos recibidos
- Comisiones por cobranza

### Estados de la Deuda
- `al_día`: Sin atrasos
- `por_vencer`: Próximos a vencer (≤7 días)
- `en_mora`: Vencidos sin pago (8-30 días)
- `vencido`: Más de 30 días de atraso
- `incobrable`: Sin cobro probable
- `judicial`: En proceso legal

### Acciones Disponibles
- Registrar pago
- Enviar recordatorio
- Generar acuerdo de pago
- Marcar como incobrable
- Exportar a Excel/PDF

### Reglas de Negocio
- Cálculo automático de intereses
- Límite de crédito por cliente
- Priorización por antigüedad
- Políticas de descuento

### Seguridad
- Control de acceso por roles
- Registro de auditoría
- Firmado digital de acuerdos
- Encriptación de datos sensibles

### Integraciones
- Sistema de mensajería (SMS/Email)
- Plataforma de pagos
- Sistema de facturación
- Mapa de ubicación

### Accesos Rápidos
- `N`: Nuevo registro
- `F`: Filtrar resultados
- `E`: Exportar reporte
- `R`: Enviar recordatorio
- `P`: Imprimir lista

### Códigos de Error
- `ERR_FIA_001`: Cliente no encontrado
- `ERR_FIA_002`: Error en cálculo
- `ERR_FIA_003`: Sin permisos
- `ERR_FIA_004`: Datos inválidos
- `ERR_FIA_005`: Error al guardar

### Notas
- Revisar diariamente actualizaciones
- Documentar intentos de contacto
- Seguir protocolos de cobranza
- Mantener confidencialidad
- Actualizar estados regularmente
