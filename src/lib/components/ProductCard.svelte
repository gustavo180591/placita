<script lang="ts">
	import { createEventDispatcher } from 'svelte';
	import { addToCart } from '$lib/stores/cart';

	interface Producto {
		id: string;
		nombre: string;
		descripcion?: string;
		categoria: string;
		precioListaARS?: number;
		precioOfertaARS?: number;
		fotoUrl?: string;
		estado: string;
		stockActual: number;
		stockMinimo: number;
		unidadMedida: string;
	}

	interface Props {
		producto: Producto;
	}

	let { producto }: Props = $props();

	const dispatch = createEventDispatcher();

	// Función para formatear precio
	function formatearPrecio(precio: number | undefined): string {
		if (!precio) return 'Consultar';
		return new Intl.NumberFormat('es-AR', {
			style: 'currency',
			currency: 'ARS'
		}).format(precio);
	}

	// Función para obtener estado del stock
	function obtenerEstadoStock(): { texto: string; clase: string } {
		if (producto.stockActual <= 0) {
			return { texto: 'Agotado', clase: 'bg-red-100 text-red-800' };
		}
		if (producto.stockActual <= producto.stockMinimo) {
			return { texto: 'Stock Bajo', clase: 'bg-yellow-100 text-yellow-800' };
		}
		return { texto: 'Disponible', clase: 'bg-green-100 text-green-800' };
	}

	// Función para ver detalles del producto
	function verDetalles() {
		dispatch('verDetalles', { productoId: producto.id });
	}

	// Función para agregar al carrito
	function agregarAlCarrito() {
		addToCart(producto, 1);
		dispatch('agregarAlCarrito', { producto });
	}

	const estadoStock = $derived(obtenerEstadoStock());
</script>

<!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
<div
	class="bg-white rounded-lg shadow-md hover:shadow-lg transition-all duration-200 overflow-hidden cursor-pointer"
	onclick={verDetalles}
	role="button"
	tabindex="0"
	onkeydown={(e) => e.key === 'Enter' && verDetalles()}
>
	<!-- Imagen del producto -->
	<div class="aspect-square bg-gray-100 relative">
		{#if producto.fotoUrl}
			<img
				src={producto.fotoUrl}
				alt={producto.nombre}
				class="w-full h-full object-cover"
			/>
		{:else}
			<div class="w-full h-full flex items-center justify-center text-gray-400 text-4xl">
				📦
			</div>
		{/if}

		<!-- Badge de estado -->
		<div class="absolute top-2 right-2">
			<span class="px-2 py-1 text-xs font-semibold rounded-full {estadoStock.clase}">
				{estadoStock.texto}
			</span>
		</div>

		<!-- Badge de oferta si existe -->
		{#if producto.precioOfertaARS && producto.precioListaARS}
			<div class="absolute top-2 left-2">
				<span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-500 text-white">
					-{Math.round((1 - producto.precioOfertaARS / producto.precioListaARS) * 100)}%
				</span>
			</div>
		{/if}
	</div>

	<!-- Información del producto -->
	<div class="p-4">
		<!-- Categoría -->
		<div class="text-xs text-gray-500 uppercase tracking-wide mb-1">
			{producto.categoria}
		</div>

		<!-- Nombre (ahora clickeable) -->
		<h3 class="font-semibold text-gray-900 mb-2 line-clamp-2 hover:text-indigo-600 transition-colors">
			{producto.nombre}
		</h3>

		<!-- Descripción corta -->
		{#if producto.descripcion}
			<p class="text-sm text-gray-600 mb-3 line-clamp-2">
				{producto.descripcion}
			</p>
		{/if}

		<!-- Precios -->
		<div class="mb-3">
			{#if producto.precioOfertaARS}
				<div class="flex items-center gap-2">
					<span class="text-lg font-bold text-red-600">
						{formatearPrecio(producto.precioOfertaARS)}
					</span>
					<span class="text-sm text-gray-500 line-through">
						{formatearPrecio(producto.precioListaARS)}
					</span>
				</div>
			{:else if producto.precioListaARS}
				<span class="text-lg font-bold text-gray-900">
					{formatearPrecio(producto.precioListaARS)}
				</span>
			{:else}
				<span class="text-lg font-bold text-gray-500">
					Precio a consultar
				</span>
			{/if}
		</div>

		<!-- Stock info -->
		<div class="text-xs text-gray-500 mb-3">
			Stock: {producto.stockActual} {producto.unidadMedida}
		</div>

		<!-- Botones de acción -->
		<div class="flex gap-2">
			<button
				class="flex-1 bg-indigo-600 text-white py-2 px-3 rounded-md hover:bg-indigo-700 transition-colors text-sm font-medium"
				onclick={(e) => { e.stopPropagation(); verDetalles(); }}
			>
				Ver Detalles
			</button>
			<button
				class="flex-1 bg-gray-100 text-gray-700 py-2 px-3 rounded-md hover:bg-gray-200 transition-colors text-sm font-medium"
				onclick={(e) => { e.stopPropagation(); agregarAlCarrito(); }}
			>
				Agregar al Carrito
			</button>
		</div>
	</div>
</div>

<style>
	.line-clamp-2 {
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		overflow: hidden;
		line-clamp: 2;
	}
</style>
