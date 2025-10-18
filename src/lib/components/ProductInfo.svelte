<script lang="ts">
	interface Producto {
		id: string;
		nombre: string;
		descripcion?: string;
		categoria: string;
		precioListaARS?: number;
		precioOfertaARS?: number;
		costoUnitarioARS?: number;
		estado: string;
		stockActual: number;
		stockMinimo: number;
		unidadMedida: string;
		variante?: string;
		ubicacion?: string;
		ofertaDesde?: string;
		ofertaHasta?: string;
		listaQrPct?: number;
		createdAt: string;
		updatedAt: string;
	}

	interface Props {
		producto: Producto;
	}

	let { producto }: Props = $props();

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

	// Función para formatear fecha
	function formatearFecha(fecha: string): string {
		return new Date(fecha).toLocaleDateString('es-AR', {
			year: 'numeric',
			month: 'long',
			day: 'numeric'
		});
	}

	const estadoStock = $derived(obtenerEstadoStock());
</script>

<div class="space-y-6">
	<!-- Título y categoría -->
	<div>
		<div class="text-sm text-indigo-600 font-medium mb-1 uppercase tracking-wide">
			{producto.categoria}
		</div>
		<h1 class="text-3xl font-bold text-gray-900 mb-2">
			{producto.nombre}
		</h1>
		{#if producto.variante}
			<p class="text-lg text-gray-600">Variante: {producto.variante}</p>
		{/if}
	</div>

	<!-- Estado y stock -->
	<div class="flex items-center gap-4">
		<span class="px-3 py-1 text-sm font-semibold rounded-full {estadoStock.clase}">
			{estadoStock.texto}
		</span>
		<span class="text-sm text-gray-600">
			Stock: {producto.stockActual} {producto.unidadMedida}
		</span>
	</div>

	<!-- Precios -->
	<div class="bg-gray-50 p-4 rounded-lg">
		<div class="flex items-center gap-4">
			{#if producto.precioOfertaARS}
				<div class="flex items-center gap-2">
					<span class="text-3xl font-bold text-red-600">
						{formatearPrecio(producto.precioOfertaARS)}
					</span>
					<span class="text-lg text-gray-500 line-through">
						{formatearPrecio(producto.precioListaARS)}
					</span>
					{#if producto.precioListaARS}
						<span class="px-2 py-1 bg-red-100 text-red-800 text-xs font-semibold rounded">
							-{Math.round((1 - producto.precioOfertaARS / producto.precioListaARS) * 100)}%
						</span>
					{/if}
				</div>
			{:else if producto.precioListaARS}
				<span class="text-3xl font-bold text-gray-900">
					{formatearPrecio(producto.precioListaARS)}
				</span>
			{:else}
				<span class="text-3xl font-bold text-gray-500">
					Precio a consultar
				</span>
			{/if}
		</div>

		{#if producto.costoUnitarioARS}
			<p class="text-sm text-gray-600 mt-1">
				Costo unitario: {formatearPrecio(producto.costoUnitarioARS)}
			</p>
		{/if}
	</div>

	<!-- Descripción -->
	{#if producto.descripcion}
		<div>
			<h3 class="text-lg font-semibold text-gray-900 mb-2">Descripción</h3>
			<p class="text-gray-700 leading-relaxed">
				{producto.descripcion}
			</p>
		</div>
	{/if}

	<!-- Características técnicas -->
	<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
		<!-- Información básica -->
		<div>
			<h3 class="text-lg font-semibold text-gray-900 mb-3">Información del producto</h3>
			<dl class="space-y-2">
				<div class="flex justify-between">
					<dt class="text-gray-600">Estado:</dt>
					<dd class="font-medium">{producto.estado}</dd>
				</div>
				<div class="flex justify-between">
					<dt class="text-gray-600">Unidad de medida:</dt>
					<dd class="font-medium">{producto.unidadMedida}</dd>
				</div>
				{#if producto.ubicacion}
					<div class="flex justify-between">
						<dt class="text-gray-600">Ubicación:</dt>
						<dd class="font-medium">{producto.ubicacion}</dd>
					</div>
				{/if}
				<div class="flex justify-between">
					<dt class="text-gray-600">Stock mínimo:</dt>
					<dd class="font-medium">{producto.stockMinimo} {producto.unidadMedida}</dd>
				</div>
			</dl>
		</div>

		<!-- Fechas -->
		<div>
			<h3 class="text-lg font-semibold text-gray-900 mb-3">Información del sistema</h3>
			<dl class="space-y-2">
				<div class="flex justify-between">
					<dt class="text-gray-600">Creado:</dt>
					<dd class="font-medium">{formatearFecha(producto.createdAt)}</dd>
				</div>
				<div class="flex justify-between">
					<dt class="text-gray-600">Última actualización:</dt>
					<dd class="font-medium">{formatearFecha(producto.updatedAt)}</dd>
				</div>
				{#if producto.ofertaDesde}
					<div class="flex justify-between">
						<dt class="text-gray-600">Oferta desde:</dt>
						<dd class="font-medium">{formatearFecha(producto.ofertaDesde)}</dd>
					</div>
				{/if}
				{#if producto.ofertaHasta}
					<div class="flex justify-between">
						<dt class="text-gray-600">Oferta hasta:</dt>
						<dd class="font-medium">{formatearFecha(producto.ofertaHasta)}</dd>
					</div>
				{/if}
			</dl>
		</div>
	</div>

	<!-- Información adicional -->
	{#if producto.listaQrPct}
		<div class="bg-blue-50 p-4 rounded-lg">
			<h3 class="text-lg font-semibold text-blue-900 mb-2">Información adicional</h3>
			<p class="text-blue-800">
				Este producto tiene un porcentaje de lista QR del {producto.listaQrPct * 100}%.
			</p>
		</div>
	{/if}
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
