<script lang="ts">
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

	let metodoSeleccionado = $state('efectivo');
	let metodosPago = $state([
		{
			id: 'efectivo',
			nombre: 'Efectivo',
			descripcion: 'Pago en efectivo al recibir el pedido',
			icono: '💵',
			comision: 0,
			disponible: true
		},
		{
			id: 'tarjeta',
			nombre: 'Tarjeta de crédito/débito',
			descripcion: 'Visa, Mastercard, American Express',
			icono: '💳',
			comision: 0.029, // 2.9% típico
			disponible: true
		},
		{
			id: 'transferencia',
			nombre: 'Transferencia bancaria',
			descripcion: 'Transferencia desde tu banco',
			icono: '🏦',
			comision: 0,
			disponible: true
		},
		{
			id: 'mercado_pago',
			nombre: 'Mercado Pago',
			descripcion: 'Pago con QR, tarjeta o dinero en cuenta',
			icono: '📱',
			comision: 0.039, // 3.9% típico de MP
			disponible: true
		}
	]);

	function seleccionarMetodo(id: string) {
		metodoSeleccionado = id;
		dispatch('metodoChange', { metodo: id });
	}

	function calcularComision(monto: number, metodo: string): number {
		const metodoPago = metodosPago.find(m => m.id === metodo);
		return metodoPago ? monto * metodoPago.comision : 0;
	}
</script>

<div class="space-y-4">
	<h3 class="text-lg font-semibold text-gray-900 mb-4">Método de pago</h3>

	<div class="space-y-3">
		{#each metodosPago as metodo}
			{#if metodo.disponible}
				<label class="flex items-center p-4 border-2 rounded-lg cursor-pointer transition-all {metodoSeleccionado === metodo.id ? 'border-indigo-500 bg-indigo-50' : 'border-gray-200 hover:border-gray-300'}">
					<input
						type="radio"
						name="metodoPago"
						value={metodo.id}
						bind:group={metodoSeleccionado}
						onchange={() => seleccionarMetodo(metodo.id)}
						class="sr-only"
					/>

					<div class="flex items-center justify-between w-full">
						<div class="flex items-center gap-3">
							<div class="text-2xl">{metodo.icono}</div>
							<div>
								<h4 class="font-medium text-gray-900">{metodo.nombre}</h4>
								<p class="text-sm text-gray-600">{metodo.descripcion}</p>
							</div>
						</div>

						<div class="text-right">
							{#if metodo.comision > 0}
								<p class="text-sm text-gray-600">
									Comisión: {(metodo.comision * 100).toFixed(1)}%
								</p>
							{:else}
								<p class="text-sm text-green-600 font-medium">Sin comisión</p>
							{/if}
						</div>
					</div>
				</label>
			{/if}
		{/each}
	</div>

	<!-- Información adicional según método seleccionado -->
	{#if metodoSeleccionado === 'efectivo'}
		<div class="bg-blue-50 p-4 rounded-lg">
			<h4 class="font-medium text-blue-900 mb-2">💡 Información importante</h4>
			<ul class="text-sm text-blue-800 space-y-1">
				<li>• El pago se realiza al momento de la entrega</li>
				<li>• Puedes pagar con efectivo o con tarjeta</li>
				<li>• Nuestro repartidor lleva vuelto</li>
			</ul>
		</div>
	{:else if metodoSeleccionado === 'tarjeta'}
		<div class="bg-blue-50 p-4 rounded-lg">
			<h4 class="font-medium text-blue-900 mb-2">💳 Procesamiento seguro</h4>
			<ul class="text-sm text-blue-800 space-y-1">
				<li>• Aceptamos Visa, Mastercard y American Express</li>
				<li>• El pago se procesa de forma segura</li>
				<li>• Recibirás confirmación inmediata</li>
			</ul>
		</div>
	{:else if metodoSeleccionado === 'transferencia'}
		<div class="bg-blue-50 p-4 rounded-lg">
			<h4 class="font-medium text-blue-900 mb-2">🏦 Transferencia bancaria</h4>
			<ul class="text-sm text-blue-800 space-y-1">
				<li>• Realiza la transferencia desde tu banco</li>
				<li>• Envía el comprobante por WhatsApp</li>
				<li>• Procesamos el pedido una vez confirmado el pago</li>
			</ul>
		</div>
	{:else if metodoSeleccionado === 'mercado_pago'}
		<div class="bg-blue-50 p-4 rounded-lg">
			<h4 class="font-medium text-blue-900 mb-2">📱 Mercado Pago</h4>
			<ul class="text-sm text-blue-800 space-y-1">
				<li>• Paga con QR, tarjeta o dinero en cuenta</li>
				<li>• Comisión del 3.9% incluida en el total</li>
				<li>• Pago inmediato y seguro</li>
			</ul>
		</div>
	{/if}
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
