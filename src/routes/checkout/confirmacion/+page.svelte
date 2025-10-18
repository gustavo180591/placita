<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { cartItems, clearCart, formatPrice } from '$lib/stores/cart';

	let orderData = $state({
		numero: '',
		total: 0,
		fecha: '',
		items: []
	});

	// Simular datos del pedido (en producción vendría de la API)
	onMount(() => {
		// Generar número de orden único
		orderData.numero = `ORD-${Date.now()}`;
		orderData.fecha = new Date().toLocaleString('es-AR');
		orderData.total = 0; // Se calcularía del carrito
		orderData.items = [];

		// Limpiar carrito después de confirmar el pedido
		setTimeout(() => {
			clearCart();
		}, 3000);
	});

	function nuevaCompra() {
		goto('/productos');
	}
</script>

<svelte:head>
	<title>Compra Confirmada - Placita</title>
	<meta name="description" content="Tu compra ha sido confirmada exitosamente" />
</svelte:head>

<div class="min-h-screen bg-gray-50">
	<div class="max-w-2xl mx-auto px-4 py-8">
		<!-- Header de confirmación -->
		<div class="text-center mb-8">
			<div class="text-6xl mb-4">✅</div>
			<h1 class="text-3xl font-bold text-gray-900 mb-2">¡Compra confirmada!</h1>
			<p class="text-gray-600">
				Tu pedido ha sido procesado exitosamente
			</p>
		</div>

		<!-- Detalles del pedido -->
		<div class="bg-white rounded-lg shadow-sm p-8">
			<!-- Información del pedido -->
			<div class="text-center mb-8 pb-8 border-b">
				<h2 class="text-xl font-semibold text-gray-900 mb-4">Detalles de tu pedido</h2>

				<div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-left">
					<div>
						<p class="text-sm text-gray-600 mb-1">Número de orden:</p>
						<p class="font-semibold text-gray-900 text-lg">{orderData.numero}</p>
					</div>

					<div>
						<p class="text-sm text-gray-600 mb-1">Fecha:</p>
						<p class="font-semibold text-gray-900">{orderData.fecha}</p>
					</div>

					<div class="md:col-span-2">
						<p class="text-sm text-gray-600 mb-1">Total pagado:</p>
						<p class="font-bold text-2xl text-indigo-600">{formatPrice(orderData.total)}</p>
					</div>
				</div>
			</div>

			<!-- Próximos pasos -->
			<div class="mb-8">
				<h3 class="text-lg font-semibold text-gray-900 mb-4">¿Qué sigue?</h3>

				<div class="space-y-4">
					<div class="flex items-start gap-3">
						<div class="w-8 h-8 bg-indigo-100 text-indigo-600 rounded-full flex items-center justify-center font-bold text-sm flex-shrink-0">
							1
						</div>
						<div>
							<p class="font-medium text-gray-900">Procesamiento del pedido</p>
							<p class="text-sm text-gray-600">Estamos preparando tu orden para envío</p>
						</div>
					</div>

					<div class="flex items-start gap-3">
						<div class="w-8 h-8 bg-indigo-100 text-indigo-600 rounded-full flex items-center justify-center font-bold text-sm flex-shrink-0">
							2
						</div>
						<div>
							<p class="font-medium text-gray-900">Confirmación de pago</p>
							<p class="text-sm text-gray-600">Verificaremos el pago y te enviaremos confirmación</p>
						</div>
					</div>

					<div class="flex items-start gap-3">
						<div class="w-8 h-8 bg-indigo-100 text-indigo-600 rounded-full flex items-center justify-center font-bold text-sm flex-shrink-0">
							3
						</div>
						<div>
							<p class="font-medium text-gray-900">Envío</p>
							<p class="text-sm text-gray-600">Tu pedido será enviado en 24-48 horas</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Información de contacto -->
			<div class="bg-gray-50 p-6 rounded-lg mb-8">
				<h3 class="text-lg font-semibold text-gray-900 mb-3">¿Necesitas ayuda?</h3>

				<div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
					<div>
						<p class="font-medium text-gray-900 mb-1">WhatsApp</p>
						<p class="text-gray-600">+54 11 1234-5678</p>
					</div>

					<div>
						<p class="font-medium text-gray-900 mb-1">Email</p>
						<p class="text-gray-600">soporte@placita.com</p>
					</div>
				</div>

				<div class="mt-4 pt-4 border-t">
					<p class="text-sm text-gray-600">
						Recibirás actualizaciones del estado de tu pedido por email y WhatsApp
					</p>
				</div>
			</div>

			<!-- Acciones -->
			<div class="flex flex-col sm:flex-row gap-4">
				<button
					class="flex-1 bg-indigo-600 text-white py-3 px-6 rounded-lg hover:bg-indigo-700 transition-colors font-medium"
					onclick={nuevaCompra}
				>
					Seguir comprando
				</button>

				<button
					class="flex-1 bg-gray-100 text-gray-700 py-3 px-6 rounded-lg hover:bg-gray-200 transition-colors font-medium"
					onclick={() => goto('/')}
				>
					Volver al inicio
				</button>
			</div>

			<!-- Información adicional -->
			<div class="mt-8 pt-6 border-t text-center">
				<p class="text-sm text-gray-500 mb-2">
					¿Tienes preguntas sobre tu pedido?
				</p>
				<p class="text-sm text-indigo-600 font-medium">
					Consulta nuestro centro de ayuda o contáctanos
				</p>
			</div>
		</div>
	</div>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
