<script lang="ts">
	interface Producto {
		id: string;
		nombre: string;
	}

	interface Props {
		producto: Producto;
	}

	let { producto }: Props = $props();

	// Estado para reseñas (por ahora vacío, preparado para futura implementación)
	let reseñas: any[] = $state([]);
	let promedioReseñas = $state(0);
	let totalReseñas = $state(0);

	// Función para agregar reseña (por implementar)
	function agregarReseña() {
		alert('Sistema de reseñas próximamente!');
	}

	// Función para formatear estrellas
	function formatearEstrellas(calificacion: number): string {
		return '⭐'.repeat(calificacion);
	}
</script>

<div class="bg-white rounded-lg shadow-sm p-6">
	<!-- Header de reseñas -->
	<div class="flex items-center justify-between mb-6">
		<h3 class="text-lg font-semibold text-gray-900">
			Reseñas de clientes
		</h3>
		<button
			class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700 transition-colors text-sm font-medium"
			onclick={agregarReseña}
		>
			Escribir reseña
		</button>
	</div>

	<!-- Estadísticas de reseñas -->
	{#if totalReseñas > 0}
		<div class="flex items-center gap-4 mb-6 p-4 bg-gray-50 rounded-lg">
			<div class="text-center">
				<div class="text-2xl font-bold text-gray-900">{promedioReseñas.toFixed(1)}</div>
				<div class="text-sm text-gray-600">Promedio</div>
			</div>
			<div class="flex-1">
				<div class="text-sm text-gray-600 mb-1">{totalReseñas} reseñas</div>
				<div class="flex items-center gap-1">
					{#each Array(5) as _, i}
						<span class="text-yellow-400">⭐</span>
					{/each}
				</div>
			</div>
		</div>
	{:else}
		<div class="text-center py-8">
			<div class="text-4xl mb-3">💬</div>
			<h4 class="text-lg font-medium text-gray-900 mb-2">Sin reseñas aún</h4>
			<p class="text-gray-600 mb-4">
				Sé el primero en compartir tu experiencia con este producto.
			</p>
			<button
				class="bg-indigo-600 text-white px-6 py-2 rounded-lg hover:bg-indigo-700 transition-colors font-medium"
				onclick={agregarReseña}
			>
				Escribir primera reseña
			</button>
		</div>
	{/if}

	<!-- Lista de reseñas (vacía por ahora) -->
	{#if reseñas.length > 0}
		<div class="space-y-4">
			{#each reseñas as reseña}
				<div class="border-b border-gray-200 pb-4 last:border-b-0">
					<div class="flex items-start gap-3">
						<div class="flex-shrink-0">
							<div class="w-10 h-10 bg-indigo-100 rounded-full flex items-center justify-center">
								<span class="text-indigo-600 font-medium">
									{reseña.usuario.nombre.charAt(0).toUpperCase()}
								</span>
							</div>
						</div>
						<div class="flex-1">
							<div class="flex items-center gap-2 mb-1">
								<span class="font-medium text-gray-900">{reseña.usuario.nombre}</span>
								<span class="text-sm text-gray-600">
									{formatearEstrellas(reseña.calificacion)}
								</span>
								<span class="text-sm text-gray-500">
									{new Date(reseña.fecha).toLocaleDateString('es-AR')}
								</span>
							</div>
							<p class="text-gray-700">{reseña.comentario}</p>
						</div>
					</div>
				</div>
			{/each}
		</div>
	{/if}

	<!-- Próximas funcionalidades -->
	<div class="mt-6 p-4 bg-blue-50 rounded-lg">
		<h4 class="text-sm font-semibold text-blue-900 mb-2">🚀 Próximamente</h4>
		<ul class="text-sm text-blue-800 space-y-1">
			<li>• Sistema completo de reseñas con fotos</li>
			<li>• Preguntas y respuestas de clientes</li>
			<li>• Verificación de compras para reseñas</li>
			<li>• Filtros y ordenamiento de reseñas</li>
		</ul>
	</div>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
