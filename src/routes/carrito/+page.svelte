<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { cartItems, cartItemCount, cartTotal, removeFromCart, updateCartItemQuantity, clearCart, formatPrice } from '$lib/stores/cart';

	let items: any[] = $state([]);
	let mounted = $state(false);

	// Suscribirse a cambios del carrito
	cartItems.subscribe(value => {
		items = value;
	});

	onMount(() => {
		mounted = true;
	});

	// Función para proceder al checkout
	function proceedToCheckout() {
		goto('/checkout');
	}

	// Función para continuar comprando
	function continueShopping() {
		goto('/productos');
	}

	// Función para formatear cantidad total
	function getTotalItems(): number {
		return items.reduce((total, item) => total + item.cantidad, 0);
	}
</script>

<svelte:head>
	<title>Carrito de Compras - Placita</title>
	<meta name="description" content="Revisa tu carrito de compras en Placita" />
</svelte:head>

<div class="min-h-screen bg-gray-50">
	<div class="max-w-4xl mx-auto px-4 py-8">
		<!-- Header -->
		<div class="mb-8">
			<h1 class="text-3xl font-bold text-gray-900 mb-2">Carrito de Compras</h1>
			<p class="text-gray-600">
				{#if getTotalItems() > 0}
					Revisa y modifica los productos en tu carrito ({getTotalItems()} items)
				{:else}
					Tu carrito está vacío
				{/if}
			</p>
		</div>

		{#if items.length === 0}
			<!-- Carrito vacío -->
			<div class="bg-white rounded-lg shadow-sm p-12 text-center">
				<div class="text-6xl mb-4">🛒</div>
				<h2 class="text-2xl font-semibold text-gray-900 mb-4">Tu carrito está vacío</h2>
				<p class="text-gray-600 mb-8 max-w-md mx-auto">
					Agrega algunos productos para comenzar tu compra. Explora nuestro catálogo y encuentra lo que necesitas.
				</p>
				<button
					class="bg-indigo-600 text-white px-8 py-3 rounded-lg hover:bg-indigo-700 transition-colors font-medium"
					onclick={continueShopping}
				>
					Explorar productos
				</button>
			</div>
		{:else}
			<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
				<!-- Lista de productos -->
				<div class="lg:col-span-2">
					<div class="bg-white rounded-lg shadow-sm">
						<!-- Header de productos -->
						<div class="p-6 border-b">
							<div class="flex items-center justify-between">
								<h2 class="text-lg font-semibold text-gray-900">Productos en tu carrito</h2>
								<button
									class="text-sm text-red-600 hover:text-red-700 transition-colors font-medium"
									onclick={clearCart}
								>
									Vaciar carrito
								</button>
							</div>
						</div>

						<!-- Lista de items -->
						<div class="divide-y divide-gray-200">
							{#each items as item (item.id)}
								<div class="p-6">
									<div class="flex items-center gap-4">
										<!-- Imagen -->
										<div class="w-20 h-20 bg-gray-100 rounded-lg overflow-hidden flex-shrink-0">
											{#if item.imagen}
												<img src={item.imagen} alt={item.nombre} class="w-full h-full object-cover" />
											{:else}
												<div class="w-full h-full flex items-center justify-center text-gray-400 text-xl">
													📦
												</div>
											{/if}
										</div>

										<!-- Información del producto -->
										<div class="flex-1">
											<h3 class="text-lg font-medium text-gray-900 mb-1">{item.nombre}</h3>
											<p class="text-sm text-gray-600 mb-2">
												Precio unitario: {formatPrice(item.precio)}
											</p>
											<p class="text-sm text-gray-600">
												Unidad: {item.unidadMedida}
											</p>
										</div>

										<!-- Controles de cantidad -->
										<div class="flex items-center gap-3">
											<div class="flex items-center gap-2">
												<button
													class="w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center text-sm font-medium hover:bg-gray-200 transition-colors"
													onclick={() => updateCartItemQuantity(item.id, item.cantidad - 1)}
													disabled={item.cantidad <= 1}
													aria-label="Disminuir cantidad"
												>
													−
												</button>
												<span class="text-lg font-medium w-12 text-center">{item.cantidad}</span>
												<button
													class="w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center text-sm font-medium hover:bg-gray-200 transition-colors"
													onclick={() => updateCartItemQuantity(item.id, item.cantidad + 1)}
													aria-label="Aumentar cantidad"
												>
													+
												</button>
											</div>
										</div>

										<!-- Subtotal -->
										<div class="text-right min-w-0">
											<div class="text-lg font-semibold text-gray-900">
												{formatPrice(item.precio * item.cantidad)}
											</div>
										</div>

										<!-- Botón eliminar -->
										<button
											class="text-red-500 hover:text-red-700 transition-colors p-2"
											onclick={() => removeFromCart(item.id)}
											aria-label="Eliminar producto"
										>
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
												<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
											</svg>
										</button>
									</div>
								</div>
							{/each}
						</div>
					</div>
				</div>

				<!-- Resumen del pedido -->
				<div class="lg:col-span-1">
					<div class="bg-white rounded-lg shadow-sm p-6 sticky top-6">
						<h3 class="text-lg font-semibold text-gray-900 mb-4">Resumen del pedido</h3>

						<!-- Detalles del total -->
						<div class="space-y-3 mb-6">
							<div class="flex justify-between text-sm">
								<span class="text-gray-600">Subtotal ({getTotalItems()} items):</span>
								<span class="font-medium">{formatPrice($cartTotal)}</span>
							</div>

							<!-- Envío (por ahora gratuito) -->
							<div class="flex justify-between text-sm">
								<span class="text-gray-600">Envío:</span>
								<span class="font-medium text-green-600">Gratis</span>
							</div>

							<!-- Impuestos (por implementar) -->
							<div class="flex justify-between text-sm">
								<span class="text-gray-600">Impuestos:</span>
								<span class="font-medium">Calculado en checkout</span>
							</div>

							<div class="border-t pt-3">
								<div class="flex justify-between text-lg font-semibold">
									<span>Total:</span>
									<span class="text-indigo-600">{formatPrice($cartTotal)}</span>
								</div>
							</div>
						</div>

						<!-- Políticas -->
						<div class="text-xs text-gray-500 mb-6 space-y-1">
							<p>• Envío gratis en compras mayores a $50.000</p>
							<p>• Precios incluyen IVA</p>
							<p>• Entrega en 24-48 horas</p>
						</div>

						<!-- Botones de acción -->
						<div class="space-y-3">
							<button
								class="w-full bg-indigo-600 text-white py-3 px-4 rounded-lg hover:bg-indigo-700 transition-colors font-medium"
								onclick={proceedToCheckout}
							>
								Proceder al pago
							</button>

							<button
								class="w-full bg-gray-100 text-gray-700 py-3 px-4 rounded-lg hover:bg-gray-200 transition-colors font-medium"
								onclick={continueShopping}
							>
								Continuar comprando
							</button>
						</div>

						<!-- Información de seguridad -->
						<div class="mt-6 pt-4 border-t text-center">
							<div class="flex items-center justify-center gap-2 text-sm text-gray-600">
								<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
									<path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path>
								</svg>
								<span>Pago seguro</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}
	</div>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
