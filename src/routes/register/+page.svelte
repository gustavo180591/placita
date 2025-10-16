<script lang="ts">
  import { goto } from '$app/navigation';
  import { PUBLIC_API_URL } from '$env/static/public';
  import { onMount } from 'svelte';
  
  // Connection status state
  let connectionStatus: 'checking' | 'online' | 'error' = 'checking';
  
  // Form state
  let nombre = '';
  let email = '';
  let telefono = '';
  let password = '';
  let confirmPassword = '';
  let isLoading = false;
  let error = '';
  let successMessage = '';
  
  // Handle form submission
  async function handleRegister(event: Event) {
    event.preventDefault();
    
    // Basic validation
    if (!nombre || !email || !telefono || !password || !confirmPassword) {
      error = 'Por favor completa todos los campos';
      return;
    }
    
    if (password !== confirmPassword) {
      error = 'Las contraseñas no coinciden';
      return;
    }
    
    if (password.length < 8) {
      error = 'La contraseña debe tener al menos 8 caracteres';
      return;
    }
    
    isLoading = true;
    error = '';
    successMessage = '';
    
    try {
      const response = await fetch(`${PUBLIC_API_URL}/auth/register`, {
        method: 'POST',
        headers: { 
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        credentials: 'include', // Important for CORS with credentials
        body: JSON.stringify({
          nombre,
          email,
          telefono,
          password,
          rol: 'OPERADOR' // Default role for new registrations
        })
      });
      
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Error al registrar el usuario');
      }
      
      // Registration successful
      successMessage = '¡Registro exitoso! Redirigiendo al inicio de sesión...';
      
      // Redirect to login after a short delay
      setTimeout(() => {
        goto('/login');
      }, 2000);
      
    } catch (err: unknown) {
      console.error('Registration error:', err);
      error = err instanceof Error ? err.message : 'Error al registrar el usuario. Por favor intenta nuevamente.';
    } finally {
      isLoading = false;
    }
  }
  
  // Handle login link click
  function handleLoginClick() {
    goto('/login');
  }
  
  // Check API connection on component mount
  onMount(async () => {
    try {
      const response = await fetch(`${PUBLIC_API_URL}/health`, {
        method: 'GET',
        credentials: 'include'
      });
      
      if (response.ok) {
        connectionStatus = 'online';
      } else {
        console.error('Health check failed with status:', response.status);
        connectionStatus = 'error';
      }
    } catch (err) {
      console.error('Connection check failed:', err);
      connectionStatus = 'error';
    }
  });
</script>

<style>
  .status-dot {
    display: inline-block;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    margin-left: 8px;
    vertical-align: middle;
  }
  
  .status-checking {
    background-color: #f59e0b; /* Yellow for checking */
    animation: pulse 2s infinite;
  }
  
  .status-online {
    background-color: #10b981; /* Green for online */
  }
  
  .status-error {
    background-color: #ef4444; /* Red for error */
    animation: pulse 2s infinite;
  }
  
  @keyframes pulse {
    0% { opacity: 0.6; }
    50% { opacity: 1; }
    100% { opacity: 0.6; }
  }
</style>

<div class="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
  <div class="max-w-md w-full space-y-8">
    <div class="text-center">
      <h1 class="text-4xl font-bold text-indigo-600 mb-2">
        Placita
        <span 
          class="status-dot status-{connectionStatus}"
          title={
            connectionStatus === 'checking' ? 'Verificando conexión...' :
            connectionStatus === 'online' ? 'Conectado al servidor' :
            'Error de conexión con el servidor'
          }
        ></span>
      </h1>
      <h2 class="mt-6 text-3xl font-extrabold text-gray-900">
        Crear una cuenta
      </h2>
      <p class="mt-2 text-sm text-gray-600">
        O{' '}
        <button 
          on:click={handleLoginClick}
          class="font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:underline transition duration-150 ease-in-out"
        >
          inicia sesión con tu cuenta
        </button>
      </p>
    </div>

    {#if error}
      <div class="rounded-md bg-red-50 p-4">
        <div class="flex">
          <div class="flex-shrink-0">
            <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
            </svg>
          </div>
          <div class="ml-3">
            <p class="text-sm font-medium text-red-800">{error}</p>
          </div>
        </div>
      </div>
    {/if}
    
    {#if successMessage}
      <div class="rounded-md bg-green-50 p-4">
        <div class="flex">
          <div class="flex-shrink-0">
            <svg class="h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
            </svg>
          </div>
          <div class="ml-3">
            <p class="text-sm font-medium text-green-800">{successMessage}</p>
          </div>
        </div>
      </div>
    {/if}

    <div class="mt-8 bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
      <form class="space-y-6" on:submit|preventDefault={handleRegister}>
        <div>
          <label for="nombre" class="block text-sm font-medium text-gray-700">
            Nombre completo
          </label>
          <div class="mt-1">
            <input
              id="nombre"
              name="nombre"
              type="text"
              required
              bind:value={nombre}
              class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              placeholder="Juan Pérez"
              disabled={isLoading}
            />
          </div>
        </div>

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
          <label for="telefono" class="block text-sm font-medium text-gray-700">
            Teléfono
          </label>
          <div class="mt-1">
            <input
              id="telefono"
              name="telefono"
              type="tel"
              required
              bind:value={telefono}
              class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              placeholder="+54 9 11 1234-5678"
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
              autocomplete="new-password"
              required
              bind:value={password}
              class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              placeholder="••••••••"
              disabled={isLoading}
            />
          </div>
          <p class="mt-1 text-xs text-gray-500">Mínimo 8 caracteres</p>
        </div>

        <div>
          <label for="confirmPassword" class="block text-sm font-medium text-gray-700">
            Confirmar contraseña
          </label>
          <div class="mt-1">
            <input
              id="confirmPassword"
              name="confirmPassword"
              type="password"
              autocomplete="new-password"
              required
              bind:value={confirmPassword}
              class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              placeholder="••••••••"
              disabled={isLoading}
            />
          </div>
        </div>

        <div>
          <button
            type="submit"
            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
            disabled={isLoading}
          >
            {#if isLoading}
              <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
            {/if}
            {isLoading ? 'Registrando...' : 'Registrarse'}
          </button>
        </div>
      </form>

      <div class="mt-6">
        <div class="relative">
          <div class="absolute inset-0 flex items-center">
            <div class="w-full border-t border-gray-300"></div>
          </div>
          <div class="relative flex justify-center text-sm">
            <span class="px-2 bg-white text-gray-500">
              ¿Ya tienes una cuenta?
            </span>
          </div>
        </div>

        <div class="mt-6">
          <button
            type="button"
            on:click={handleLoginClick}
            class="w-full flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            disabled={isLoading}
          >
            Iniciar sesión
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
