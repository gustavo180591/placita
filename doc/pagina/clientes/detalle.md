# Clientes

## Detalle del Cliente

### Descripción
Vista detallada de la información de un cliente específico con historial completo y herramientas de gestión.

### URL
`/clientes/:clienteId`

### Parámetros de URL
- `clienteId`: Identificador único del cliente (UUID)

### Roles Requeridos
- OPERADOR
- ADMIN

### Pestañas Principales

#### 1. Información General
- **Datos Personales**
  - Nombre completo
  - Tipo y número de documento
  - Fecha de nacimiento
  - Género
  - Estado civil

- **Contacto**
  - Teléfonos (móvil, fijo, trabajo)
  - Correos electrónicos
  - Redes sociales
  - Preferencias de contacto

- **Direcciones**
  - Domicilio principal
  - Dirección de facturación
  - Dirección de envío
  - Ubicación en mapa

- **Datos Fiscales**
  - Condición ante el IVA
  - Tipo de responsabilidad
  - Datos de facturación
  - Comprobantes asociados

#### 2. Historial de Compras
- **Resumen**
  - Total gastado
  - Promedio por compra
  - Frecuencia
  - Última compra
  - Próximo vencimiento

- **Listado de Compras**
  - Fecha y número de ticket
  - Monto total
  - Estado
  - Productos adquiridos
  - Acciones rápidas

- **Estadísticas**
  - Gráfico de compras por mes
  - Productos más comprados
  - Días y horarios frecuentes
  - Tendencias de compra

#### 3. Crédito y Pagos
- **Línea de Crédito**
  - Límite asignado
  - Saldo disponible
  - Tasa de interés
  - Días de gracia

- **Pagos Pendientes**
  - Facturas vencidas
  - Próximos vencimientos
  - Monto total adeudado
  - Historial de mora

- **Historial de Pagos**
  - Fecha y monto
  - Método de pago
  - Referencia
  - Comprobante

#### 4. Notas y Seguimiento
- **Notas Internas**
  - Observaciones generales
  - Preferencias
  - Restricciones
  - Historial médico (si aplica)

- **Seguimiento**
  - Último contacto
  - Próximo seguimiento
  - Canal preferido
  - Etapa en el embudo de ventas

- **Documentos**
  - Contratos firmados
  - Autorizaciones
  - Documentos legales
  - Archivos adjuntos

### Estados del Cliente
- `prospecto`: Cliente potencial
- `activo`: Cliente regular
- `inactivo`: Sin actividad reciente
- `moroso`: Con pagos atrasados
- `bloqueado`: Restringido
- `premium`: Cliente preferencial

### Acciones Disponibles

#### Operaciones Básicas
- Editar información
- Agregar contacto
- Generar contrato
- Exportar datos
- Cambiar estado

#### Gestión Comercial
- Crear presupuesto
- Generar orden de compra
- Programar recordatorio
- Agregar a campaña
- Asignar vendedor

#### Comunicación
- Enviar mensaje
- Programar llamada
- Agendar cita
- Enviar oferta
- Generar certificado

### Validaciones
- Documento único
- Email válido
- Teléfono válido
- Fechas coherentes
- Límites de crédito

### Reglas de Negocio
- Los clientes nuevos requieren al menos nombre y teléfono
- La información fiscal es obligatoria para factura A
- Se requiere autorización para créditos altos
- Los datos sensibles están protegidos

### Seguridad
- Control de acceso por roles
- Registro de auditoría
- Encriptación de datos
- Confirmación para operaciones críticas

### Integraciones
- Sistema de facturación
- Plataforma de pagos
- Servicio de mensajería
- CRM empresarial
- Redes sociales

### Accesos Rápidos
- `Ctrl+E`: Editar
- `Ctrl+N`: Nueva nota
- `Ctrl+P`: Imprimir
- `F2`: Nueva venta
- `F5`: Actualizar
- `ESC`: Volver

### Códigos de Error
- `ERR_CLI_001`: Cliente no encontrado
- `ERR_CLI_002`: Sin permisos
- `ERR_CLI_003`: Datos inválidos
- `ERR_CLI_004`: Error al guardar
- `ERR_CLI_005`: Conflicto de datos

### Notas
- Verificar actualizaciones periódicamente
- Mantener historial de cambios
- Respetar políticas de privacidad
- Realizar copias de seguridad
- Capacitar al personal
