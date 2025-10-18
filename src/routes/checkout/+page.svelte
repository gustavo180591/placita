<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { cartItems, cartTotal, formatPrice } from '$lib/stores/cart';
	import PaymentMethodSelector from '$lib/components/PaymentMethodSelector.svelte';
	import PaymentSummary from '$lib/components/PaymentSummary.svelte';

	let currentStep = $state(1);
	let items: any[] = $state([]);
	let clienteData = $state({
		nombre: '',
		email: '',
		telefono: '',
		dni: '',
		direccion: '',
		ciudad: '',
		codigoPostal: '',
		provincia: ''
	});
	let envioData = $state({
		metodo: 'domicilio',
		costo: 0,
		tiempoEstimado: '',
		direccionEntrega: ''
	});
	let pagoData = $state({
		metodo: 'efectivo',
		estado: 'pendiente'
	});
	let errors = $state<Record<string, string>>({});

	// Suscribirse a cambios del carrito
	cartItems.subscribe(value => {
		items = value;
	});

	onMount(() => {
		// Si el carrito está vacío, redirigir al catálogo
		if (items.length === 0) {
			goto('/productos');
		}
	});

	// Función para formatear cantidad total
	function getTotalItems(): number {
		return items.reduce((total, item) => total + item.cantidad, 0);
	}

	// Función para validar formulario de cliente
	function validarCliente(): boolean {
		errors = {};

		if (!clienteData.nombre.trim()) {
			errors.nombre = 'El nombre es requerido';
		}
		if (!clienteData.email.trim()) {
			errors.email = 'El email es requerido';
		} else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(clienteData.email)) {
			errors.email = 'Email inválido';
		}
		if (!clienteData.telefono.trim()) {
			errors.telefono = 'El teléfono es requerido';
		}
		if (!clienteData.dni.trim()) {
			errors.dni = 'El DNI es requerido';
		}

		if (envioData.metodo === 'domicilio') {
			if (!clienteData.direccion.trim()) {
				errors.direccion = 'La dirección es requerida';
			}
			if (!clienteData.ciudad.trim()) {
				errors.ciudad = 'La ciudad es requerida';
			}
			if (!clienteData.codigoPostal.trim()) {
				errors.codigoPostal = 'El código postal es requerido';
			}
		}

		return Object.keys(errors).length === 0;
	}

	// Función para procesar checkout
	async function procesarCheckout() {
		if (!validarCliente()) {
			currentStep = 1;
			return;
		}

		// Aquí iría la lógica para crear el pedido en la base de datos
		// y procesar el pago según el método seleccionado

		// Por ahora, simular procesamiento exitoso
		setTimeout(() => {
			goto('/checkout/confirmacion');
		}, 2000);
	}

	// Función para cambiar método de envío
	function cambiarMetodoEnvio(metodo: string) {
		envioData.metodo = metodo;
		if (metodo === 'domicilio') {
			envioData.costo = 1500;
			envioData.tiempoEstimado = '24-48 horas';
		} else {
			envioData.costo = 0;
			envioData.tiempoEstimado = 'Inmediato';
		}
	}

	// Función para manejar cambios en método de pago
	function handleMetodoPagoChange(event: CustomEvent) {
		pagoData.metodo = event.detail.metodo;
	}

	// Inicializar método de envío
	onMount(() => {
		cambiarMetodoEnvio('domicilio');
	});
</script>

			errors.nombre = 'El nombre es requerido';
		}
		if (!clienteData.email.trim()) {
			errors.email = 'El email es requerido';
		} else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(clienteData.email)) {
			errors.email = 'Email inválido';
		}
		if (!clienteData.telefono.trim()) {
			errors.telefono = 'El teléfono es requerido';
		}
		if (!clienteData.dni.trim()) {
			errors.dni = 'El DNI es requerido';
		}

		if (envioData.metodo === 'domicilio') {
			if (!clienteData.direccion.trim()) {
				errors.direccion = 'La dirección es requerida';
			}
			if (!clienteData.ciudad.trim()) {
				errors.ciudad = 'La ciudad es requerida';
			}
			if (!clienteData.codigoPostal.trim()) {
				errors.codigoPostal = 'El código postal es requerido';
			}
		}

		return Object.keys(errors).length === 0;
	}

	// Función para validar método de envío
	function validarEnvio(): boolean {
		errors = {};

		if (envioData.metodo === 'domicilio' && !envioData.direccionEntrega.trim()) {
			errors.direccionEntrega = 'La dirección de entrega es requerida';
		}

		return Object.keys(errors).length === 0;
	}

	// Función para procesar checkout
	async function procesarCheckout() {
		if (!validarCliente()) {
			currentStep = 1;
			return;
		}

		// Aquí iría la lógica para crear el pedido en la base de datos
		// y procesar el pago según el método seleccionado

		// Por ahora, simular procesamiento exitoso
		setTimeout(() => {
			goto('/checkout/confirmacion');
		}, 2000);
	}

	// Función para cambiar método de envío
	function cambiarMetodoEnvio(metodo: string) {
		envioData.metodo = metodo;
		if (metodo === 'domicilio') {
			envioData.costo = 1500; // Ejemplo de costo de envío
			envioData.tiempoEstimado = '24-48 horas';
		} else {
			envioData.costo = 0;
			envioData.tiempoEstimado = 'Inmediato';
		}
	}

	// Inicializar método de envío
	onMount(() => {
		cambiarMetodoEnvio('domicilio');
	});
</script>

<svelte:head>
	<title>Checkout - Placita</title>
	<meta name="description" content="Completa tu compra en Placita" />
</svelte:head>

<div class="min-h-screen bg-gray-50">
	<div class="max-w-4xl mx-auto px-4 py-8">
		<!-- Header -->
		<div class="mb-8">
			<h1 class="text-3xl font-bold text-gray-900 mb-2">Checkout</h1>
			<p class="text-gray-600">
				Completa tu compra de {getTotalItems()} productos
			</p>
		</div>

		{#if items.length === 0}
			<!-- Carrito vacío -->
			<div class="bg-white rounded-lg shadow-sm p-12 text-center">
				<div class="text-6xl mb-4">🛒</div>
				<h2 class="text-2xl font-semibold text-gray-900 mb-4">Tu carrito está vacío</h2>
				<p class="text-gray-600 mb-8">
					Agrega productos para continuar con tu compra.
				</p>
				<button
					class="bg-indigo-600 text-white px-8 py-3 rounded-lg hover:bg-indigo-700 transition-colors"
					onclick={() => goto('/productos')}
				>
					Explorar productos
				</button>
			</div>
		{:else}
			<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
				<!-- Progreso del checkout -->
				<div class="lg:col-span-2">
					<!-- Información del cliente (Paso 1) -->
					<div class="bg-white rounded-lg shadow-sm mb-6">
						<div class="p-6 border-b">
							<div class="flex items-center justify-between">
								<h2 class="text-lg font-semibold text-gray-900">
									1. Información del cliente
								</h2>
								<button
									class="text-sm text-indigo-600 hover:text-indigo-700"
									onclick={() => currentStep = 1}
								>
									{currentStep === 1 ? 'Editando' : 'Editar'}
								</button>
							</div>
						</div>

						{#if currentStep === 1}
							<div class="p-6">
								<form class="space-y-4">
									<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
										<div>
											<label for="nombre" class="block text-sm font-medium text-gray-700 mb-1">
												Nombre completo *
											</label>
											<input
												type="text"
												id="nombre"
												bind:value={clienteData.nombre}
												class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.nombre ? 'border-red-500' : 'border-gray-300'}"
												placeholder="Tu nombre completo"
											/>
											{#if errors.nombre}
												<p class="text-red-500 text-sm mt-1">{errors.nombre}</p>
											{/if}
										</div>

										<div>
											<label for="email" class="block text-sm font-medium text-gray-700 mb-1">
												Email *
											</label>
											<input
												type="email"
												id="email"
												bind:value={clienteData.email}
												class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.email ? 'border-red-500' : 'border-gray-300'}"
												placeholder="tu@email.com"
											/>
											{#if errors.email}
												<p class="text-red-500 text-sm mt-1">{errors.email}</p>
											{/if}
										</div>

										<div>
											<label for="telefono" class="block text-sm font-medium text-gray-700 mb-1">
												Teléfono *
											</label>
											<input
												type="tel"
												id="telefono"
												bind:value={clienteData.telefono}
												class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.telefono ? 'border-red-500' : 'border-gray-300'}"
												placeholder="+54 11 1234-5678"
											/>
											{#if errors.telefono}
												<p class="text-red-500 text-sm mt-1">{errors.telefono}</p>
											{/if}
										</div>

										<div>
											<label for="dni" class="block text-sm font-medium text-gray-700 mb-1">
												DNI *
											</label>
											<input
												type="text"
												id="dni"
												bind:value={clienteData.dni}
												class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.dni ? 'border-red-500' : 'border-gray-300'}"
												placeholder="12345678"
											/>
											{#if errors.dni}
												<p class="text-red-500 text-sm mt-1">{errors.dni}</p>
											{/if}
										</div>
									</div>

									{#if envioData.metodo === 'domicilio'}
										<div class="border-t pt-4">
											<h3 class="text-md font-medium text-gray-900 mb-4">Dirección de entrega</h3>
											<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
												<div class="md:col-span-2">
													<label for="direccion" class="block text-sm font-medium text-gray-700 mb-1">
														Dirección *
													</label>
													<input
														type="text"
														id="direccion"
														bind:value={clienteData.direccion}
														class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.direccion ? 'border-red-500' : 'border-gray-300'}"
														placeholder="Calle 123, Piso 4, Depto A"
													/>
													{#if errors.direccion}
														<p class="text-red-500 text-sm mt-1">{errors.direccion}</p>
													{/if}
												</div>

												<div>
													<label for="ciudad" class="block text-sm font-medium text-gray-700 mb-1">
														Ciudad *
													</label>
													<input
														type="text"
														id="ciudad"
														bind:value={clienteData.ciudad}
														class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.ciudad ? 'border-red-500' : 'border-gray-300'}"
														placeholder="Buenos Aires"
													/>
													{#if errors.ciudad}
														<p class="text-red-500 text-sm mt-1">{errors.ciudad}</p>
													{/if}
												</div>

												<div>
													<label for="codigoPostal" class="block text-sm font-medium text-gray-700 mb-1">
														Código Postal *
													</label>
													<input
														type="text"
														id="codigoPostal"
														bind:value={clienteData.codigoPostal}
														class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 {errors.codigoPostal ? 'border-red-500' : 'border-gray-300'}"
														placeholder="1000"
													/>
													{#if errors.codigoPostal}
														<p class="text-red-500 text-sm mt-1">{errors.codigoPostal}</p>
													{/if}
												</div>
											</div>
										</div>
									{/if}

									<div class="flex justify-end pt-4">
										<button
											type="button"
											class="bg-indigo-600 text-white px-6 py-2 rounded-lg hover:bg-indigo-700 transition-colors"
											onclick={() => { if (validarCliente()) currentStep = 2; }}
										>
											Continuar al envío
										</button>
									</div>
								</form>
							</div>
						{:else}
							<div class="p-6">
								<div class="flex items-center justify-between">
									<div>
										<p class="font-medium text-gray-900">{clienteData.nombre}</p>
										<p class="text-sm text-gray-600">{clienteData.email}</p>
										<p class="text-sm text-gray-600">{clienteData.telefono}</p>
									</div>
									<div class="text-right">
										<p class="text-sm text-gray-600">DNI: {clienteData.dni}</p>
										{#if envioData.metodo === 'domicilio'}
											<p class="text-sm text-gray-600">
												{clienteData.direccion}, {clienteData.ciudad}
											</p>
										{/if}
									</div>
								</div>
							</div>
						{/if}
					</div>

					<!-- Método de envío (Paso 2) -->
					<div class="bg-white rounded-lg shadow-sm mb-6">
						<div class="p-6 border-b">
							<div class="flex items-center justify-between">
								<h2 class="text-lg font-semibold text-gray-900">
									2. Método de envío
								</h2>
								<button
									class="text-sm text-indigo-600 hover:text-indigo-700"
									onclick={() => currentStep = 2}
								>
									{currentStep === 2 ? 'Editando' : 'Editar'}
								</button>
							</div>
						</div>

						{#if currentStep === 2}
							<div class="p-6">
								<div class="space-y-4">
									<!-- Envío a domicilio -->
									<label class="flex items-center p-4 border-2 rounded-lg cursor-pointer {envioData.metodo === 'domicilio' ? 'border-indigo-500 bg-indigo-50' : 'border-gray-200 hover:border-gray-300'}">
										<input
											type="radio"
											name="envio"
											value="domicilio"
											bind:group={envioData.metodo}
											onchange={() => cambiarMetodoEnvio('domicilio')}
											class="sr-only"
										/>
										<div class="flex-1">
											<div class="flex items-center justify-between">
												<div>
													<h3 class="font-medium text-gray-900">Envío a domicilio</h3>
													<p class="text-sm text-gray-600">Recibe en tu casa o trabajo</p>
												</div>
												<div class="text-right">
													<p class="font-semibold text-gray-900">{formatPrice(envioData.costo)}</p>
													<p class="text-sm text-gray-600">{envioData.tiempoEstimado}</p>
												</div>
											</div>
										</div>
									</label>

									<!-- Retiro en tienda -->
									<label class="flex items-center p-4 border-2 rounded-lg cursor-pointer {envioData.metodo === 'retiro' ? 'border-indigo-500 bg-indigo-50' : 'border-gray-200 hover:border-gray-300'}">
										<input
											type="radio"
											name="envio"
											value="retiro"
											bind:group={envioData.metodo}
											onchange={() => cambiarMetodoEnvio('retiro')}
											class="sr-only"
										/>
										<div class="flex-1">
											<div class="flex items-center justify-between">
												<div>
													<h3 class="font-medium text-gray-900">Retiro en tienda</h3>
													<p class="text-sm text-gray-600">Retira gratis en nuestro local</p>
												</div>
												<div class="text-right">
													<p class="font-semibold text-green-600">Gratis</p>
													<p class="text-sm text-gray-600">Inmediato</p>
												</div>
											</div>
										</div>
									</label>

									{#if envioData.metodo === 'domicilio'}
										<div class="mt-4">
											<label for="direccionEntrega" class="block text-sm font-medium text-gray-700 mb-1">
												Dirección alternativa de entrega (opcional)
											</label>
											<input
												type="text"
												id="direccionEntrega"
												bind:value={envioData.direccionEntrega}
												class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
												placeholder="Otra dirección si es diferente a la registrada"
											/>
										</div>
									{/if}
								</div>

								<div class="flex justify-end pt-4 mt-6 border-t">
									<button
										type="button"
										class="bg-indigo-600 text-white px-6 py-2 rounded-lg hover:bg-indigo-700 transition-colors"
										onclick={() => { if (validarEnvio()) currentStep = 3; }}
									>
										Continuar al pago
									</button>
								</div>
							</div>
						{:else}
							<div class="p-6">
								<div class="flex items-center justify-between">
									<div>
										<p class="font-medium text-gray-900">
											{envioData.metodo === 'domicilio' ? 'Envío a domicilio' : 'Retiro en tienda'}
										</p>
										<p class="text-sm text-gray-600">{envioData.tiempoEstimado}</p>
									</div>
									<p class="font-semibold text-gray-900">
										{envioData.costo === 0 ? 'Gratis' : formatPrice(envioData.costo)}
									</p>
								</div>
							</div>
						{/if}
					<!-- Método de pago (Paso 3) -->
					{#if currentStep >= 3}
						<div class="bg-white rounded-lg shadow-sm mb-6">
							<div class="p-6 border-b">
								<div class="flex items-center justify-between">
									<h2 class="text-lg font-semibold text-gray-900">
										3. Método de pago
									</h2>
									<button
										class="text-sm text-indigo-600 hover:text-indigo-700"
										onclick={() => currentStep = 3}
									>
										{currentStep === 3 ? 'Editando' : 'Editar'}
									</button>
								</div>
							</div>

							{#if currentStep === 3}
								<div class="p-6">
									<PaymentMethodSelector on:metodoChange={handleMetodoPagoChange} />

									<div class="flex justify-end pt-4 mt-6 border-t">
										<button
											type="button"
											class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 transition-colors font-medium"
											onclick={procesarCheckout}
										>
											Finalizar compra
										</button>
									</div>
								</div>
							{:else}
								<div class="p-6">
									<div class="flex items-center justify-between">
										<div>
											<p class="font-medium text-gray-900">
												{pagoData.metodo === 'efectivo' ? 'Efectivo' : pagoData.metodo === 'tarjeta' ? 'Tarjeta' : pagoData.metodo === 'transferencia' ? 'Transferencia' : 'Mercado Pago'}
											</p>
											<p class="text-sm text-gray-600">Pago al recibir o transferencia</p>
										</div>
									</div>
								</div>
							{/if}
						</div>
					{/if}
				</div>

				<!-- Resumen del pedido (siempre visible) -->
				<div class="lg:col-span-1">
					<PaymentSummary
						subtotal={$cartTotal}
						envio={envioData.costo}
						metodoPago={pagoData.metodo}
					/>
				</div>
			</div>
		{/if}
	</div>
</div>

<style>
	/* Estilos adicionales si son necesarios */
</style>
