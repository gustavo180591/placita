# Autenticación

## Recuperación de Acceso

### Descripción
Flujo para recuperar el acceso a la cuenta cuando se olvida la contraseña.

### URL
`/recuperar`

### Acceso
- Público (sin autenticación requerida)

### Flujo de Recuperación
1. **Ingreso de Email**
   - Validación de formato
   - Verificación de existencia
   - Mensaje de confirmación

2. **Código de Verificación**
   - Envío por email
   - Tiempo de expiración: 15 minutos
   - Reenvío disponible después de 2 minutos

3. **Nueva Contraseña**
   - Requisitos de complejidad
   - Confirmación de contraseña
   - Validación en tiempo real

### Campos del Formulario
1. **Email**
   - Requerido
   - Formato de email válido
   - Debe existir en el sistema

2. **Código de Verificación**
   - 6 dígitos numéricos
   - Sensible a mayúsculas/minúsculas
   - Un solo uso

3. **Nueva Contraseña**
   - Mínimo 8 caracteres
   - Al menos un número
   - Al menos un carácter especial
   - No puede ser igual a las 5 últimas contraseñas

### Estados del Proceso
- `ingreso_email`: Ingreso de correo electrónico
- `enviando`: Enviando código
- `ingreso_codigo`: Validación de código
- `nueva_contrasena`: Configuración de nueva contraseña
- `completado`: Contraseña actualizada
- `error`: Error en el proceso

### Reglas de Negocio
- Límite de 3 intentos de código
- Bloqueo temporal tras múltiples intentos fallidos
- Registro de solicitudes de recuperación
- Notificación al email registrado

### Seguridad
- No se revela si el email existe
- El enlace de recuperación es de un solo uso
- Se invalida después de 15 minutos
- Se registra la IP del solicitante

### Mensajes al Usuario
- Código enviado correctamente
- Código incorrecto (intentos restantes)
- Cuenta bloqueada temporalmente
- Contraseña actualizada exitosamente

### Preguntas Frecuentes
- ¿No recibí el código? (Reenviar)
- ¿El código no funciona? (Generar nuevo)
- ¿Problemas con el email? (Contactar soporte)

### Notas
- Se recomienda cambiar la contraseña periódicamente
- No compartir el código con nadie
- Verificar la carpeta de spam/correo no deseado
- Contactar al administrador si persisten los problemas
