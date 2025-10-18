<script lang="ts">
	import '../app.css';
	import favicon from '$lib/assets/favicon.svg';
	import MiniCart from '$lib/components/MiniCart.svelte';
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';

	let { children } = $props();

	function goToCart() {
		goto('/carrito');
	}

	function goToCheckout() {
		goto('/checkout');
	}
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<!-- Navegación -->
<nav class="bg-white shadow-sm border-b">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex justify-between items-center h-16">
			<!-- Logo y navegación izquierda -->
			<div class="flex items-center gap-8">
				<a href="/" class="text-xl font-bold text-indigo-600 hover:text-indigo-700 transition-colors">
					🛒 Placita
				</a>

				<div class="hidden md:flex items-center gap-6">
					<a
						href="/productos"
						class="text-gray-700 hover:text-indigo-600 transition-colors font-medium {$page.url.pathname === '/productos' ? 'text-indigo-600' : ''}"
					>
						Productos
					</a>
					<a
						href="/carrito"
						class="text-gray-700 hover:text-indigo-600 transition-colors font-medium {$page.url.pathname === '/carrito' ? 'text-indigo-600' : ''}"
					>
						Carrito
					</a>
				</div>
			</div>

			<!-- Navegación derecha (usuario, etc.) -->
			<div class="flex items-center gap-4">
				<button
					class="text-gray-700 hover:text-indigo-600 transition-colors"
					aria-label="Perfil de usuario"
				>
					👤
				</button>
			</div>
		</div>
	</div>
</nav>

<!-- Contenido principal -->
<main class="min-h-screen">
	{@render children?.()}
</main>

<!-- Mini-cart flotante -->
<MiniCart on:goToCart={goToCart} on:goToCheckout={goToCheckout} />

<style>
	/* Estilos adicionales si son necesarios */
</style>
