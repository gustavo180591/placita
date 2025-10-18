<script lang="ts">
	interface Props {
		categorias: string[];
		filtros: {
			categoria: string;
			busqueda: string;
			orden: string;
			estado: string;
		};
		onFiltrosChange: (nuevosFiltros: any) => void;
	}

	let { categorias, filtros, onFiltrosChange }: Props = $props();

	// Función para limpiar filtros
	function limpiarFiltros() {
		onFiltrosChange({
			categoria: '',
			busqueda: '',
			orden: 'nombre',
			estado: 'ACTIVO'
		});
	}

	// Función para manejar cambios en filtros
	function handleFiltroChange(tipo: string, valor: string) {
		onFiltrosChange({ [tipo]: valor });
	}
</script>

<div class="bg-white rounded-lg shadow-sm p-6 sticky top-6">
	<h3 class="text-lg font-semibold text-gray-900 mb-4">Filtros</h3>

	<!-- Búsqueda -->
	<div class="mb-6">
		<label for="busqueda" class="block text-sm font-medium text-gray-700 mb-2">
			Buscar productos
		</label>
		<input
			type="text"
			id="busqueda"
			placeholder="Nombre, descripción..."
			class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
			value={filtros.busqueda}
			oninput={(e) => {
				const target = e.target as HTMLInputElement;
				handleFiltroChange('busqueda', target.value);
			}}
		/>
	</div>

	<!-- Categoría -->
	<div class="mb-6">
		<label for="categoria" class="block text-sm font-medium text-gray-700 mb-2">
			Categoría
		</label>
		<select
			id="categoria"
			class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
			value={filtros.categoria}
			onchange={(e) => {
				const target = e.target as HTMLSelectElement;
				handleFiltroChange('categoria', target.value);
			}}
		>
			<option value="">Todas las categorías</option>
			{#each categorias as categoria}
				<option value={categoria}>{categoria}</option>
			{/each}
		</select>
	</div>

	<!-- Estado -->
	<div class="mb-6">
		<label for="estado" class="block text-sm font-medium text-gray-700 mb-2">
			Estado
		</label>
		<select
			id="estado"
			class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
			value={filtros.estado}
			onchange={(e) => {
				const target = e.target as HTMLSelectElement;
				handleFiltroChange('estado', target.value);
			}}
		>
			<option value="ACTIVO">Activo</option>
			<option value="AGOTADO">Agotado</option>
			<option value="DESCONTINUADO">Descontinuado</option>
		</select>
	</div>

	<!-- Orden -->
	<div class="mb-6">
		<label for="orden" class="block text-sm font-medium text-gray-700 mb-2">
			Ordenar por
		</label>
		<select
			id="orden"
			class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
			value={filtros.orden}
			onchange={(e) => {
				const target = e.target as HTMLSelectElement;
				handleFiltroChange('orden', target.value);
			}}
		>
			<option value="nombre">Nombre A-Z</option>
			<option value="precio">Precio: Menor a Mayor</option>
			<option value="categoria">Categoría</option>
		</select>
	</div>

	<!-- Botón limpiar filtros -->
	<button
		class="w-full bg-gray-100 text-gray-700 py-2 px-4 rounded-md hover:bg-gray-200 transition-colors text-sm font-medium"
		onclick={limpiarFiltros}
	>
		Limpiar Filtros
	</button>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
