# Autenticación

## Inicio de Sesión

### Descripción
Página de inicio de sesión para acceder al sistema Placita POS.

### URL
`/login`

### Acceso
- Público (sin autenticación requerida)

### Campos del Formulario
1. **Email/Usuario**
   - Requerido
   - Formato de email válido
   - Máximo 100 caracteres

2. **Contraseña**
   - Requerido
   - Mínimo 6 caracteres
   - Máximo 50 caracteres
   - Se muestra oculto por defecto

### Características
- Recordar sesión (opcional)
- Enlace a recuperación de contraseña
- Validación en tiempo real
- Soporte para autocompletado
- Manejo de errores amigable

### Estados
- `cargando`: Durante la autenticación
- `error`: Credenciales inválidas o error de red
- `exitoso`: Redirección al dashboard

### Reglas de Negocio
- Después de 3 intentos fallidos, se muestra CAPTCHA
- Bloqueo temporal tras 5 intentos fallidos (30 min)
- Registro de intentos de inicio de sesión
- No se muestra información específica sobre cuál campo es incorrecto

### Seguridad
- Las contraseñas se transmiten de forma segura (HTTPS)
- No se almacena la contraseña en texto plano
- Se utiliza protección CSRF
- Se establece una cookie de sesión segura

### Integración con SSO (Futuro)
- Inicio de sesión con Google
- Inicio de sesión con Facebook
- Autenticación de dos factores (2FA)

### Accesibilidad
- Compatible con lectores de pantalla
- Navegación por teclado
- Alto contraste opcional
- Soporte para zoom del navegador

### Errores Comunes
- `ERR_AUTH_001`: Credenciales inválidas
- `ERR_AUTH_002`: Cuenta deshabilitada
- `ERR_AUTH_003`: Demasiados intentos
- `ERR_NETWORK`: Error de conexión
