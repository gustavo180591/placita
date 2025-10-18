<script lang="ts">
	import { formatPrice } from '$lib/stores/cart';

	interface Props {
		subtotal: number;
		envio: number;
		metodoPago: string;
	}

	let { subtotal, envio, metodoPago }: Props = $props();

	// Calcular comisión según método de pago
	function calcularComision(): number {
		const comisiones = {
			efectivo: 0,
			tarjeta: 0.029, // 2.9%
			transferencia: 0,
			mercado_pago: 0.039 // 3.9%
		};

		return subtotal * (comisiones[metodoPago as keyof typeof comisiones] || 0);
	}

	// Calcular total final
	function calcularTotal(): number {
		return subtotal + envio + calcularComision();
	}

	const comision = $derived(calcularComision());
	const total = $derived(calcularTotal());
</script>

<div class="bg-white rounded-lg shadow-sm p-6">
	<h3 class="text-lg font-semibold text-gray-900 mb-4">Resumen de pago</h3>

	<!-- Detalles del cálculo -->
	<div class="space-y-3 mb-4">
		<div class="flex justify-between text-sm">
			<span class="text-gray-600">Subtotal productos:</span>
			<span class="font-medium">{formatPrice(subtotal)}</span>
		</div>

		<div class="flex justify-between text-sm">
			<span class="text-gray-600">Costo de envío:</span>
			<span class="font-medium">
				{envio === 0 ? 'Gratis' : formatPrice(envio)}
			</span>
		</div>

		{#if comision > 0}
			<div class="flex justify-between text-sm">
				<span class="text-gray-600">Comisión ({metodoPago === 'mercado_pago' ? '3.9%' : '2.9%'}):</span>
				<span class="font-medium text-orange-600">+{formatPrice(comision)}</span>
			</div>
		{/if}

		<div class="border-t pt-3">
			<div class="flex justify-between text-lg font-semibold">
				<span>Total a pagar:</span>
				<span class="text-indigo-600">{formatPrice(total)}</span>
			</div>
		</div>
	</div>

	<!-- Información del método de pago seleccionado -->
	<div class="bg-gray-50 p-4 rounded-lg mb-4">
		<h4 class="font-medium text-gray-900 mb-2">
			Método seleccionado: {metodoPago === 'efectivo' ? 'Efectivo' : metodoPago === 'tarjeta' ? 'Tarjeta' : metodoPago === 'transferencia' ? 'Transferencia' : 'Mercado Pago'}
		</h4>

		{#if metodoPago === 'efectivo'}
			<p class="text-sm text-gray-600">
				Pagarás al recibir el pedido. Puedes abonar con efectivo o tarjeta.
			</p>
		{:else if metodoPago === 'tarjeta'}
			<p class="text-sm text-gray-600">
				El pago se procesará de forma segura. Comisión del 2.9% incluida.
			</p>
		{:else if metodoPago === 'transferencia'}
			<p class="text-sm text-gray-600">
				Realiza la transferencia y envía el comprobante. Sin comisión adicional.
			</p>
		{:else if metodoPago === 'mercado_pago'}
			<p class="text-sm text-gray-600">
				Pago inmediato con Mercado Pago. Comisión del 3.9% incluida en el total.
			</p>
		{/if}
	</div>

	<!-- Políticas de pago -->
	<div class="text-xs text-gray-500 space-y-1">
		<p>• Todos los precios incluyen IVA</p>
		<p>• Las comisiones están incluidas en el total mostrado</p>
		<p>• Procesamiento seguro según estándares PCI DSS</p>
		<p>• Confirmación inmediata de pagos electrónicos</p>
	</div>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
