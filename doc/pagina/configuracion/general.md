# Configuración General

**URL:** `/configuracion`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET, POST

## Descripción
Configuración principal del negocio que afecta el comportamiento global del sistema, incluyendo información fiscal, preferencias de facturación y parámetros de negocio.

## Secciones

### 1. Información del Negocio
- **Nombre Comercial**
- **Razón Social**
- **RUC/DNI**
- **Dirección Fiscal**
- **Teléfono de Contacto**
- **Correo Electrónico**
- **Logo** (Máx. 2MB, formato PNG/JPG)

### 2. Configuración de Facturación
- **Timbrado**
- **Número de Factura Inicial**
- **Resolución de Habilitación**
- **Fechas de Vencimiento**
- **Leyenda de Factura**

### 3. Preferencias Generales
- **Moneda Principal** (GS/USD)
- **Formato de Fecha**
- **Zona Horaria**
- **Idioma**
- **Tema de Color**

### 4. Redondeo y Decimales
- **Método de Redondeo** (Arriba/Abajo/Cercano)
- **Decimales para Precios**
- **Decimales para Cantidades**
- **Aplicar redondeo a** (Solo totales/Todas las operaciones)

### 5. Integraciones
- **API Key** (Solo lectura, con opción de regenerar)
- **Webhook URL**
- **Notificaciones por Email**

## Validaciones
- Formato de RUC/DNI válido
- Números de teléfono válidos
- Fechas de vencimiento futuras
- Tamaño y formato de archivos adjuntos

## Estados del Formulario
- `loading` - Cargando configuración actual
- `editing` - Modo edición activo
- `saving` - Guardando cambios
- `success` - Cambios guardados exitosamente
- `error` - Error al guardar

## Acciones
- **Guardar Cambios** - Actualiza la configuración
- **Restaurar Valores por Defecto**
- **Cancelar Edición** - Descarta cambios no guardados
- **Exportar Configuración** - Genera un archivo de respaldo

## Seguridad
- Se requiere reconfirmación de contraseña para cambios sensibles
- Registro de auditoría para cambios de configuración
- Validación de permisos del lado del servidor

## Códigos de Error
- `INVALID_CREDENTIALS` - Credenciales inválidas
- `VALIDATION_ERROR` - Error en los datos del formulario
- `PERMISSION_DENIED` - Sin permisos suficientes
- `SERVER_ERROR` - Error del servidor

## Notas
- Los cambios pueden tardar hasta 5 minutos en aplicarse en todo el sistema
- Se recomienda hacer copias de seguridad periódicas
- Contactar a soporte para cambios en configuraciones avanzadas
