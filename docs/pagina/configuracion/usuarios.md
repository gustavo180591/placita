# Gestión de Usuarios

**URL:** `/configuracion/usuarios`  
**Acceso:** Privado  
**Roles:** ADMIN  
**Método HTTP:** GET, POST, PUT, DELETE

## Descripción
Interfaz para administrar los usuarios del sistema, sus roles, permisos y configuraciones de acceso.

## Funcionalidades Principales

### 1. Listado de Usuarios
- Búsqueda y filtrado
- Estado de conexión
- Último acceso
- Rol asignado

### 2. Creación de Usuarios
- Datos personales
- Credenciales de acceso
- Asignación de rol
- Configuración de PIN
- Límites de acceso

### 3. Perfiles de Usuario
- **ADMIN**
  - Acceso completo al sistema
  - Gestión de otros usuarios
  - Configuraciones avanzadas

- **OPERADOR**
  - Acceso limitado al POS y ventas
  - Sin acceso a configuraciones
  - Límites de descuento

### 4. Controles de Seguridad
- Bloqueo temporal por intentos fallidos
- Historial de accesos
- Forzar cambio de contraseña
- Autenticación de dos factores

## Estados de Usuario
- `ACTIVO` - Acceso permitido
- `INACTIVO` - Cuenta deshabilitada
- `BLOQUEADO` - Por intentos fallidos
- `PENDIENTE` - Esperando activación

## Validaciones
- Formato de email válido
- Complejidad de contraseña
- Unicidad de nombre de usuario/email
- Restricciones de horario

## Integraciones
- Sistema de autenticación
- Registro de auditoría
- Notificaciones por email

## Códigos de Error
- `USER_EXISTS` - Usuario ya registrado
- `INVALID_ROLE` - Rol no válido
- `WEAK_PASSWORD` - Contraseña no cumple requisitos
- `MAX_USERS_REACHED` - Límite de usuarios alcanzado

## Mejoras Futuras
- Grupos de usuarios personalizables
- Asignación de sucursales
- Plantillas de permisos
- Integración con directorio activo
