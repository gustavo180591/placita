import { writable, derived } from 'svelte/store';
import { browser } from '$app/environment';

// Interface para items del carrito
export interface CartItem {
	id: string;
	productoId: string;
	nombre: string;
	precio: number;
	cantidad: number;
	imagen?: string;
	unidadMedida: string;
}

// Store principal del carrito
export const cartItems = writable<CartItem[]>([]);

// Función para agregar producto al carrito
export function addToCart(producto: any, cantidad: number = 1) {
	cartItems.update(items => {
		const existingItem = items.find(item => item.productoId === producto.id);

		if (existingItem) {
			// Si el producto ya está, aumentar cantidad
			return items.map(item =>
				item.productoId === producto.id
					? { ...item, cantidad: item.cantidad + cantidad }
					: item
			);
		} else {
			// Si es nuevo, agregarlo
			const newItem: CartItem = {
				id: crypto.randomUUID(),
				productoId: producto.id,
				nombre: producto.nombre,
				precio: producto.precioListaARS || producto.precioOfertaARS || 0,
				cantidad,
				imagen: producto.fotoUrl,
				unidadMedida: producto.unidadMedida
			};
			return [...items, newItem];
		}
	});

	// Guardar en localStorage si estamos en el navegador
	if (browser) {
		cartItems.subscribe(items => {
			localStorage.setItem('placita-cart', JSON.stringify(items));
		});
	}
}

// Función para remover producto del carrito
export function removeFromCart(itemId: string) {
	cartItems.update(items => items.filter(item => item.id !== itemId));
}

// Función para actualizar cantidad de un item
export function updateCartItemQuantity(itemId: string, cantidad: number) {
	if (cantidad <= 0) {
		removeFromCart(itemId);
		return;
	}

	cartItems.update(items =>
		items.map(item =>
			item.id === itemId
				? { ...item, cantidad }
				: item
		)
	);
}

// Función para limpiar carrito completo
export function clearCart() {
	cartItems.set([]);
}

// Función para obtener cantidad total de items
export const cartItemCount = derived(cartItems, $items =>
	$items.reduce((total, item) => total + item.cantidad, 0)
);

// Función para calcular total del carrito
export const cartTotal = derived(cartItems, $items =>
	$items.reduce((total, item) => total + (item.precio * item.cantidad), 0)
);

// Función para formatear precio
export function formatPrice(price: number): string {
	return new Intl.NumberFormat('es-AR', {
		style: 'currency',
		currency: 'ARS'
	}).format(price);
}

// Cargar carrito desde localStorage al inicializar
if (browser) {
	const savedCart = localStorage.getItem('placita-cart');
	if (savedCart) {
		try {
			const parsedCart = JSON.parse(savedCart);
			cartItems.set(parsedCart);
		} catch (error) {
			console.error('Error al cargar carrito desde localStorage:', error);
		}
	}
}
