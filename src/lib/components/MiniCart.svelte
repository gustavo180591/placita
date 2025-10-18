<script lang="ts">
	import { cartItems, cartItemCount, cartTotal, removeFromCart, updateCartItemQuantity, formatPrice } from '$lib/stores/cart';
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

	let isOpen = $state(false);
	let items: any[] = $state([]);

	// Suscribirse a cambios del carrito
	cartItems.subscribe(value => {
		items = value;
	});

	// Función para abrir/cerrar el mini-cart
	function toggleCart() {
		isOpen = !isOpen;
	}

	function closeCart() {
		isOpen = false;
	}

	// Función para ir al carrito completo
	function goToCart() {
		closeCart();
		dispatch('goToCart');
	}

	// Función para ir al checkout
	function goToCheckout() {
		closeCart();
		dispatch('goToCheckout');
	}

	// Función para formatear cantidad total
	function getTotalItems(): number {
		return items.reduce((total, item) => total + item.cantidad, 0);
	}
</script>

<!-- Botón flotante del carrito -->
<button
	class="fixed bottom-6 right-6 z-50 bg-indigo-600 text-white p-4 rounded-full shadow-lg hover:bg-indigo-700 transition-colors duration-200"
	onclick={toggleCart}
	aria-label="Abrir carrito de compras"
>
	<div class="relative">
		<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
			<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5 5h13M12 18a2 2 0 100 4 2 2 0 000-4zm6 0a2 2 0 100 4 2 2 0 000-4z"></path>
		</svg>
		{#if getTotalItems() > 0}
			<span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
				{getTotalItems()}
			</span>
		{/if}
	</div>
</button>

<!-- Panel flotante del mini-cart -->
{#if isOpen}
	<!-- Overlay -->
	<div
		class="fixed inset-0 bg-black bg-opacity-50 z-40"
		onclick={closeCart}
		role="button"
		tabindex="0"
		onkeydown={(e) => e.key === 'Escape' && closeCart()}
		aria-label="Cerrar carrito"
	></div>

	<!-- Panel del carrito -->
	<div class="fixed bottom-20 right-6 w-96 max-h-96 bg-white rounded-lg shadow-xl z-50 overflow-hidden">
		<!-- Header -->
		<div class="p-4 border-b bg-gray-50">
			<div class="flex items-center justify-between">
				<h3 class="text-lg font-semibold text-gray-900">
					Carrito de compras
					{#if getTotalItems() > 0}
						<span class="text-sm font-normal text-gray-600">({getTotalItems()} items)</span>
					{/if}
				</h3>
				<button
					class="text-gray-400 hover:text-gray-600 transition-colors"
					onclick={closeCart}
					aria-label="Cerrar carrito"
				>
					<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
					</svg>
				</button>
			</div>
		</div>

		<!-- Contenido -->
		<div class="p-4">
			{#if items.length === 0}
				<!-- Carrito vacío -->
				<div class="text-center py-8">
					<div class="text-4xl mb-3">🛒</div>
					<p class="text-gray-500 mb-4">Tu carrito está vacío</p>
					<button
						class="text-indigo-600 hover:text-indigo-700 font-medium"
						onclick={closeCart}
					>
						Continuar comprando
					</button>
				</div>
			{:else}
				<!-- Lista de items -->
				<div class="space-y-3 mb-4 max-h-48 overflow-y-auto">
					{#each items as item (item.id)}
						<div class="flex items-center gap-3 p-2 border rounded-lg">
							<!-- Imagen -->
							<div class="w-12 h-12 bg-gray-100 rounded-lg overflow-hidden flex-shrink-0">
								{#if item.imagen}
									<img src={item.imagen} alt={item.nombre} class="w-full h-full object-cover" />
								{:else}
									<div class="w-full h-full flex items-center justify-center text-gray-400 text-sm">
										📦
									</div>
								{/if}
							</div>

							<!-- Info del producto -->
							<div class="flex-1 min-w-0">
								<h4 class="text-sm font-medium text-gray-900 truncate">{item.nombre}</h4>
								<div class="flex items-center gap-2 mt-1">
									<span class="text-sm text-gray-600">
										{formatPrice(item.precio)} × {item.cantidad}
									</span>
									<span class="text-sm font-semibold text-gray-900">
										{formatPrice(item.precio * item.cantidad)}
									</span>
								</div>
							</div>

							<!-- Controles de cantidad -->
							<div class="flex items-center gap-1">
								<button
									class="w-6 h-6 rounded-full bg-gray-100 flex items-center justify-center text-xs font-medium hover:bg-gray-200 transition-colors"
									onclick={() => updateCartItemQuantity(item.id, item.cantidad - 1)}
									disabled={item.cantidad <= 1}
									aria-label="Disminuir cantidad"
								>
									−
								</button>
								<span class="text-sm font-medium w-8 text-center">{item.cantidad}</span>
								<button
									class="w-6 h-6 rounded-full bg-gray-100 flex items-center justify-center text-xs font-medium hover:bg-gray-200 transition-colors"
									onclick={() => updateCartItemQuantity(item.id, item.cantidad + 1)}
									aria-label="Aumentar cantidad"
								>
									+
								</button>
							</div>

							<!-- Botón eliminar -->
							<button
								class="text-red-500 hover:text-red-700 transition-colors p-1"
								onclick={() => removeFromCart(item.id)}
								aria-label="Eliminar producto"
							>
								<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
									<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
								</svg>
							</button>
						</div>
					{/each}
				</div>

				<!-- Total y acciones -->
				<div class="border-t pt-4 space-y-3">
					<div class="flex justify-between items-center text-lg font-semibold">
						<span>Total:</span>
						<span class="text-indigo-600">{formatPrice($cartTotal)}</span>
					</div>

					<div class="flex gap-2">
						<button
							class="flex-1 bg-gray-100 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-200 transition-colors font-medium"
							onclick={closeCart}
						>
							Continuar comprando
						</button>
						<button
							class="flex-1 bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700 transition-colors font-medium"
							onclick={goToCheckout}
						>
							Proceder al pago
						</button>
					</div>
				</div>
			{/if}
		</div>
	</div>
{/if}

<style>
	/* Estilos adicionales si son necesarios */
</style>
