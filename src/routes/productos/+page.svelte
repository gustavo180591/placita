<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import ProductCard from '$lib/components/ProductCard.svelte';
	import ProductFilters from '$lib/components/ProductFilters.svelte';

	// Estado de la aplicación
	let productos: any[] = $state([]);
	let categorias: string[] = $state([]);
	let filtros = $state({
		categoria: '',
		busqueda: '',
		orden: 'nombre',
		estado: 'ACTIVO'
	});
	let cargando = $state(true);

	// Obtener productos desde la API
	async function cargarProductos() {
		try {
			cargando = true;
			const response = await fetch('/api/productos');
			if (response.ok) {
				productos = await response.json();
				// Extraer categorías únicas
				const categoriasSet = new Set(productos.map(p => p.categoria).filter(Boolean));
				categorias = Array.from(categoriasSet).sort();
			} else {
				console.error('Error al cargar productos');
			}
		} catch (error) {
			console.error('Error de red:', error);
		} finally {
			cargando = false;
		}
	}

	// Filtrar productos basado en los filtros actuales
	let productosFiltrados = $derived(productos.filter(producto => {
		const coincideCategoria = !filtros.categoria || producto.categoria === filtros.categoria;
		const coincideBusqueda = !filtros.busqueda ||
			producto.nombre.toLowerCase().includes(filtros.busqueda.toLowerCase()) ||
			producto.descripcion?.toLowerCase().includes(filtros.busqueda.toLowerCase());
		const coincideEstado = producto.estado === filtros.estado;

		return coincideCategoria && coincideBusqueda && coincideEstado;
	}).sort((a, b) => {
		switch (filtros.orden) {
			case 'nombre':
				return a.nombre.localeCompare(b.nombre);
			case 'precio':
				return (a.precioListaARS || 0) - (b.precioListaARS || 0);
			case 'categoria':
				return a.categoria.localeCompare(b.categoria);
			default:
				return 0;
		}
	}));

	// Función para manejar navegación a detalles
	function verDetalles(event: CustomEvent) {
		const productoId = event.detail.productoId;
		goto(`/productos/${productoId}`);
	}

	// Cargar productos al montar el componente
	onMount(() => {
		cargarProductos();
	});

	// Función para manejar cambios en filtros
	function actualizarFiltros(nuevosFiltros: Partial<typeof filtros>) {
		filtros = { ...filtros, ...nuevosFiltros };
	}
</script>

<svelte:head>
	<title>Catálogo de Productos - Placita</title>
	<meta name="description" content="Explora nuestro catálogo completo de productos" />
</svelte:head>

<div class="container mx-auto px-4 py-8">
	<!-- Header -->
	<div class="mb-8">
		<h1 class="text-3xl font-bold text-gray-900 mb-2">Catálogo de Productos</h1>
		<p class="text-gray-600">Descubre todos nuestros productos disponibles</p>
	</div>

	<div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
		<!-- Panel de filtros -->
		<aside class="lg:col-span-1">
			<ProductFilters
				{categorias}
				{filtros}
				onFiltrosChange={actualizarFiltros}
			/>
		</aside>

		<!-- Grid de productos -->
		<main class="lg:col-span-3">
			<!-- Resultados y controles -->
			<div class="flex justify-between items-center mb-6">
				<p class="text-gray-600">
					Mostrando {productosFiltrados.length} de {productos.length} productos
				</p>

				{#if productosFiltrados.length > 0}
					<button
						class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700 transition-colors"
						onclick={() => cargarProductos()}
					>
						Actualizar
					</button>
				{/if}
			</div>

			<!-- Estado de carga -->
			{#if cargando}
				<div class="flex justify-center items-center py-12">
					<div class="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
					<span class="ml-3 text-gray-600">Cargando productos...</span>
				</div>
			{:else if productosFiltrados.length === 0}
				<div class="text-center py-12">
					<div class="text-6xl mb-4">🔍</div>
					<h3 class="text-xl font-semibold text-gray-900 mb-2">No se encontraron productos</h3>
					<p class="text-gray-600">Intenta ajustar los filtros o agregar nuevos productos</p>
				</div>
			{:else}
				<!-- Grid de productos -->
				<div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
					{#each productosFiltrados as producto (producto.id)}
						<a href={`/productos/${producto.id}`} class="block">
							<ProductCard {producto} />
						</a>
					{/each}
				</div>
			{/if}
		</main>
	</div>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
