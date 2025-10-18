<script lang="ts">
  import { page } from '$app/stores';
  import { goto } from '$app/navigation';
  import { onMount } from 'svelte';
  
  // Redirect to POS if already authenticated
  onMount(() => {
    // Check if user is authenticated (you'll need to implement this check)
    const isAuthenticated = false; // Replace with actual auth check
    if (isAuthenticated) {
      goto('/pos');
    }
  });

  // Quick action buttons
  const quickActions = [
    { label: 'Nueva Venta', icon: '💰', path: '/pos', auth: true },
    { label: 'Ver Productos', icon: '📦', path: '/productos', auth: true },
    { label: 'Clientes', icon: '👥', path: '/clientes', auth: true },
    { label: 'Catálogo Online', icon: '🛍️', path: '/productos', auth: false },
    { label: 'Mi Carrito', icon: '🛒', path: '/carrito', auth: false },
    { label: 'Iniciar Sesión', icon: '🔑', path: '/login', auth: false }
  ];
</script>

<main class="min-h-screen bg-gradient-to-b from-gray-50 to-gray-100">
  <!-- Hero Section -->
  <section class="py-16 px-4 sm:px-6 lg:px-8 text-center">
    <div class="max-w-4xl mx-auto">
      <h1 class="text-4xl md:text-6xl font-bold text-gray-900 mb-6">
        <span class="text-indigo-600">Placita</span> POS
      </h1>
      <p class="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
        La solución todo en uno para la gestión de tu negocio. Controla ventas, inventario y clientes de forma sencilla.
      </p>
      
      <!-- Quick Actions -->
      <div class="flex flex-wrap justify-center gap-4 mb-12">
        {#each quickActions as action}
          {#if !action.auth || $page.data.session?.user}
            <a 
              href={action.path}
              class="flex items-center gap-2 px-6 py-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200 text-gray-700 font-medium"
            >
              <span class="text-xl">{action.icon}</span>
              {action.label}
            </a>
          {/if}
        {/each}
      </div>

      <!-- Feature Highlights -->
      <div class="grid md:grid-cols-3 gap-8 mt-16">
        {#each [
          {
            icon: '⚡',
            title: 'Ventas Rápidas',
            description: 'Procesa transacciones en segundos con nuestro POS intuitivo.'
          },
          {
            icon: '🛒',
            title: 'Carrito Inteligente',
            description: 'Agrega productos fácilmente y gestiona tu carrito de compras online.'
          },
          {
            icon: '📱',
            title: 'Acceso Móvil',
            description: 'Administra tu negocio desde cualquier lugar, en cualquier momento.'
          }
        ] as feature}
          <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
            <div class="text-4xl mb-4">{feature.icon}</div>
            <h3 class="text-xl font-semibold mb-2 text-gray-800">{feature.title}</h3>
            <p class="text-gray-600">{feature.description}</p>
          </div>
        {/each}
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="bg-indigo-700 text-white py-16">
    <div class="max-w-4xl mx-auto text-center px-4">
      <h2 class="text-3xl font-bold mb-4">¿Listo para simplificar tu negocio?</h2>
      <p class="text-xl mb-8 text-indigo-100">Únete a cientos de negocios que ya están creciendo con Placita POS</p>
      <a 
        href="/login" 
        class="inline-block bg-white text-indigo-700 font-semibold px-8 py-3 rounded-lg hover:bg-indigo-50 transition-colors duration-200"
      >
        Comenzar Ahora
      </a>
    </div>
  </section>

  <!-- Footer -->
  <footer class="py-8 text-center text-gray-500 text-sm">
    <p>© {new Date().getFullYear()} Placita POS. Todos los derechos reservados.</p>
  </footer>
</main>

<style>
  /* Custom styles if needed */
</style>
