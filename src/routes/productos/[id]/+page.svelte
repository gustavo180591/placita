<script lang="ts">
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import { addToCart } from '$lib/stores/cart';
	import ProductGallery from '$lib/components/ProductGallery.svelte';
	import ProductInfo from '$lib/components/ProductInfo.svelte';
	import ProductReviews from '$lib/components/ProductReviews.svelte';

	// Estado de la aplicación
	let producto: any = $state(null);
	let cargando = $state(true);
	let error = $state('');

	// Obtener producto desde la API
	async function cargarProducto() {
		try {
			cargando = true;
			error = '';

			const productoId = $page.params.id;
			const response = await fetch(`/api/productos/${productoId}`);

			if (response.ok) {
				producto = await response.json();
			} else if (response.status === 404) {
				error = 'Producto no encontrado';
			} else {
				error = 'Error al cargar el producto';
			}
		} catch (error) {
			console.error('Error de red:', error);
			error = 'Error de conexión';
		} finally {
			cargando = false;
		}
	}

	// Función para agregar al carrito
	function agregarAlCarrito() {
		if (producto) {
			addToCart(producto, 1);
			// Mostrar feedback visual (opcional)
			alert('Producto agregado al carrito!');
		}
	}

	// Función para navegar de vuelta al catálogo
	function volverAlCatalogo() {
		window.history.back();
	}

	// Cargar producto al montar el componente
	onMount(() => {
		cargarProducto();
	});
</script>

<svelte:head>
	{#if producto}
		<title>{producto.nombre} - Placita</title>
		<meta name="description" content={producto.descripcion || `Compra ${producto.nombre} en Placita`} />
		<meta property="og:title" content={producto.nombre} />
		<meta property="og:description" content={producto.descripcion || `Compra ${producto.nombre}`} />
		{#if producto.fotoUrl}
			<meta property="og:image" content={producto.fotoUrl} />
		{/if}
	{:else}
		<title>Producto - Placita</title>
	{/if}
</svelte:head>

<div class="min-h-screen bg-gray-50">
	<!-- Estado de carga -->
	{#if cargando}
		<div class="flex justify-center items-center min-h-screen">
			<div class="animate-spin rounded-full h-16 w-16 border-b-2 border-indigo-600"></div>
			<span class="ml-4 text-xl text-gray-600">Cargando producto...</span>
		</div>
	{:else if error}
		<!-- Estado de error -->
		<div class="min-h-screen flex items-center justify-center">
			<div class="text-center">
				<div class="text-6xl mb-4">❌</div>
				<h1 class="text-2xl font-bold text-gray-900 mb-2">Error</h1>
				<p class="text-gray-600 mb-6">{error}</p>
				<button
					class="bg-indigo-600 text-white px-6 py-3 rounded-lg hover:bg-indigo-700 transition-colors"
					onclick={volverAlCatalogo}
				>
					Volver al catálogo
				</button>
			</div>
		</div>
	{:else if producto}
		<!-- Producto encontrado -->
		<div class="max-w-7xl mx-auto px-4 py-8">
			<!-- Breadcrumb -->
			<nav class="flex mb-8 text-sm text-gray-600">
				<button onclick={volverAlCatalogo} class="hover:text-indigo-600 transition-colors">
					Catálogo
				</button>
				<span class="mx-2">/</span>
				<span class="text-gray-900 font-medium">{producto.categoria}</span>
				<span class="mx-2">/</span>
				<span class="text-gray-900 font-medium">{producto.nombre}</span>
			</nav>

			<div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
				<!-- Galería de imágenes -->
				<div class="lg:sticky lg:top-8 lg:self-start">
					<ProductGallery {producto} />
				</div>

				<!-- Información del producto -->
				<div class="space-y-8">
					<ProductInfo {producto} />

					<!-- Acciones del producto -->
					<div class="bg-white p-6 rounded-lg shadow-sm">
						<div class="flex flex-col sm:flex-row gap-4">
							<button
								class="flex-1 bg-indigo-600 text-white py-3 px-6 rounded-lg hover:bg-indigo-700 transition-colors font-medium"
								onclick={agregarAlCarrito}
							>
								Agregar al carrito
							</button>
							<button
								class="flex-1 bg-gray-100 text-gray-700 py-3 px-6 rounded-lg hover:bg-gray-200 transition-colors font-medium"
								onclick={volverAlCatalogo}
							>
								Seguir comprando
							</button>
						</div>
					</div>

					<!-- Reseñas -->
					<ProductReviews {producto} />
				</div>
			</div>
		</div>
	{/if}
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
