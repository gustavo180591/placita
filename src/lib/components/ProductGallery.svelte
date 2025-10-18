<script lang="ts">
	interface Producto {
		id: string;
		nombre: string;
		fotoUrl?: string;
		// Para futuras imágenes múltiples
		imagenes?: string[];
	}

	interface Props {
		producto: Producto;
	}

	let { producto }: Props = $props();

	// Estado para la imagen seleccionada
	let imagenSeleccionada = $state(0);

	// Función para cambiar imagen seleccionada
	function seleccionarImagen(indice: number) {
		imagenSeleccionada = indice;
	}

	// Función para siguiente/anterior imagen
	function imagenAnterior() {
		imagenSeleccionada = imagenSeleccionada > 0 ? imagenSeleccionada - 1 : imagenes.length - 1;
	}

	function imagenSiguiente() {
		imagenSeleccionada = imagenSeleccionada < imagenes.length - 1 ? imagenSeleccionada + 1 : 0;
	}

	// Obtener array de imágenes (por ahora solo la imagen principal)
	let imagenes = $derived(producto.fotoUrl ? [producto.fotoUrl] : []);
</script>

<div class="bg-white rounded-lg shadow-sm overflow-hidden">
	<!-- Imagen principal -->
	<div class="relative aspect-square bg-gray-100">
		{#if imagenes.length > 0}
			<img
				src={imagenes[imagenSeleccionada]}
				alt={producto.nombre}
				class="w-full h-full object-cover"
			/>
		{:else}
			<div class="w-full h-full flex items-center justify-center text-gray-400 text-6xl">
				📷
			</div>
		{/if}

		<!-- Controles de navegación si hay múltiples imágenes -->
		{#if imagenes.length > 1}
			<button
				class="absolute left-4 top-1/2 transform -translate-y-1/2 bg-black bg-opacity-50 text-white p-2 rounded-full hover:bg-opacity-70 transition-opacity"
				onclick={imagenAnterior}
				aria-label="Imagen anterior"
			>
				‹
			</button>
			<button
				class="absolute right-4 top-1/2 transform -translate-y-1/2 bg-black bg-opacity-50 text-white p-2 rounded-full hover:bg-opacity-70 transition-opacity"
				onclick={imagenSiguiente}
				aria-label="Imagen siguiente"
			>
				›
			</button>
		{/if}

		<!-- Indicadores de imagen -->
		{#if imagenes.length > 1}
			<div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
				{#each imagenes as _, indice}
					<button
						class="w-3 h-3 rounded-full transition-colors {imagenSeleccionada === indice ? 'bg-white' : 'bg-white bg-opacity-50'}"
						onclick={() => seleccionarImagen(indice)}
						aria-label={`Imagen ${indice + 1}`}
					></button>
				{/each}
			</div>
		{/if}
	</div>

	<!-- Miniaturas (si hay múltiples imágenes) -->
	{#if imagenes.length > 1}
		<div class="p-4 border-t">
			<div class="flex space-x-2 overflow-x-auto">
				{#each imagenes as imagen, indice}
					<button
						class="flex-shrink-0 w-20 h-20 rounded-lg overflow-hidden border-2 transition-colors {imagenSeleccionada === indice ? 'border-indigo-500' : 'border-gray-200'}"
						onclick={() => seleccionarImagen(indice)}
					>
						<img
							src={imagen}
							alt={`${producto.nombre} - vista ${indice + 1}`}
							class="w-full h-full object-cover"
						/>
					</button>
				{/each}
			</div>
		</div>
	{/if}
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
