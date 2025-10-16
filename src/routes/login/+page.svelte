<script lang="ts">
  import { invalidate } from '$app/navigation';
  import { goto } from '$app/navigation';
  import { PUBLIC_API_URL } from '$env/static/public';
  
  // Form state
  let email = '';
  let password = '';
  let pin = '';
  let rememberMe = false;
  let isLoading = false;
  let error = '';
  let showPinField = false;
  
  // Toggle between email/password and PIN login
  function toggleLoginMethod() {
    showPinField = !showPinField;
    error = ''; // Clear any previous errors
    if (showPinField) {
      // Focus PIN input when showing PIN field
      setTimeout(() => {
        const pinInput = document.getElementById('pin');
        if (pinInput) pinInput.focus();
      }, 100);
    }
  }
  
  // Handle form submission
  async function handleLogin(event: Event) {
    event.preventDefault();
    
    if (showPinField && pin.length < 4) {
      error = 'El PIN debe tener al menos 4 dígitos';
      return;
    }
    
    if (!showPinField && (!email || !password)) {
      error = 'Por favor ingresa tu correo y contraseña';
      return;
    }
    
    isLoading = true;
    error = '';
    
    try {
      const response = await fetch(`${PUBLIC_API_URL}/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({
          ...(showPinField ? { pin } : { email, password }),
          rememberMe
        })
      });
      
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Error al iniciar sesión');
      }
      
      // Invalidate all load functions to refresh page data
      await invalidate('app:auth');
      
      // Redirect to POS or intended URL
      const data = await response.json();
      const redirectTo = data.redirectTo || '/pos';
      goto(redirectTo);
      
    } catch (err: unknown) {
      console.error('Login error:', err);
      error = err instanceof Error ? err.message : 'Error al iniciar sesión. Por favor intenta nuevamente.';
    } finally {
      isLoading = false;
    }
  }
  
  // Handle forgot password
  function handleForgotPassword() {
    // TODO: Implement forgot password flow
    alert('Funcionalidad de recuperación de contraseña en desarrollo');
  }
</script>

<div class="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
  <div class="max-w-md w-full space-y-8">
    <div class="text-center">
      <h1 class="text-4xl font-bold text-indigo-600 mb-2">Placita</h1>
      <h2 class="mt-6 text-3xl font-extrabold text-gray-900">
        {showPinField ? 'Ingresa tu PIN' : 'Inicia sesión'}
      </h2>
      <p class="mt-2 text-sm text-gray-600">
        {showPinField 
          ? 'Ingresa tu PIN de acceso rápido' 
          : 'O inicia sesión con tu correo y contraseña'}
      </p>
    </div>

    {#if error}
      <div class="rounded-md bg-red-50 p-4">
        <div class="flex">
          <div class="flex-shrink-0">
            <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z" clip-rule="evenodd" />
            </svg>
          </div>
          <div class="ml-3">
            <p class="text-sm font-medium text-red-800">{error}</p>
          </div>
        </div>
      </div>
    {/if}

    <div class="mt-8 bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
      <form class="space-y-6" on:submit|preventDefault={handleLogin}>
        {#if !showPinField}
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">
              Correo electrónico
            </label>
            <div class="mt-1">
              <input
                id="email"
                name="email"
                type="email"
                autocomplete="email"
                required
                bind:value={email}
                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                placeholder="tucorreo@ejemplo.com"
                disabled={isLoading}
              />
            </div>
          </div>

          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">
              Contraseña
            </label>
            <div class="mt-1">
              <input
                id="password"
                name="password"
                type="password"
                autocomplete="current-password"
                required
                bind:value={password}
                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                placeholder="••••••••"
                disabled={isLoading}
              />
            </div>
          </div>
        {:else}
          <div>
            <label for="pin" class="block text-sm font-medium text-gray-700">
              PIN de acceso
            </label>
            <div class="mt-1">
              <input
                id="pin"
                name="pin"
                type="password"
                inputmode="numeric"
                pattern="[0-9]*"
                maxlength="6"
                bind:value={pin}
                class="text-center text-2xl tracking-widest appearance-none block w-full px-3 py-4 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                placeholder="••••"
                disabled={isLoading}
              />
            </div>
          </div>
        {/if}

        <div class="flex items-center justify-between">
          <div class="flex items-center">
            <input
              id="remember-me"
              name="remember-me"
              type="checkbox"
              bind:checked={rememberMe}
              class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
              disabled={isLoading}
            />
            <label for="remember-me" class="ml-2 block text-sm text-gray-900">
              Recordar mi sesión
            </label>
          </div>

          {#if !showPinField}
            <div class="text-sm">
              <button 
                type="button" 
                on:click|preventDefault={handleForgotPassword}
                class="font-medium text-indigo-600 hover:text-indigo-500"
                disabled={isLoading}
              >
                ¿Olvidaste tu contraseña?
              </button>
            </div>
          {/if}
        </div>

        <div>
          <button
            type="submit"
            class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
            disabled={isLoading}
          >
            {#if isLoading}
              <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
            {/if}
            {isLoading ? 'Iniciando sesión...' : 'Iniciar sesión'}
          </button>
        </div>
      </form>

      <!-- Registration Link -->
      <div class="mt-4 text-center">
        <p class="text-sm text-gray-600">
          ¿No tienes una cuenta?{' '}
          <a href="/register" class="font-medium text-indigo-600 hover:text-indigo-500">
            Regístrate aquí
          </a>
        </p>
      </div>

      <div class="mt-6">
        <div class="relative">
          <div class="absolute inset-0 flex items-center">
            <div class="w-full border-t border-gray-300"></div>
          </div>
          <div class="relative flex justify-center text-sm">
            <span class="px-2 bg-white text-gray-500">
              O continúa con
            </span>
          </div>
        </div>

        <div class="mt-6">
          <button
            type="button"
            on:click|preventDefault={toggleLoginMethod}
            class="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            disabled={isLoading}
          >
            {showPinField ? 'Usar correo y contraseña' : 'Usar PIN de acceso rápido'}
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
