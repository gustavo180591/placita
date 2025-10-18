// -------------------------------------------------------
// Placita — schema.prisma (PostgreSQL + Prisma)
// Cobertura: POS, Inventario, Compras, Clientes (Fiado),
// Precios, Promos (estructura base), Reservas y Reportes.
// -------------------------------------------------------

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider     = "postgresql"
  url          = env("DATABASE_URL")
  relationMode = "foreignKeys" // Enable real foreign key constraints for onDelete/onUpdate
}

/// Utilidades: timestamps ISO, ids UUID v4, dinero Decimal(14,2)

enum RolUsuario {
  ADMIN
  OPERADOR
  AUDITOR
}

enum EstadoProducto {
  ACTIVO
  AGOTADO
  DESCONTINUADO
}

enum UnidadMedida {
  UNIDAD
  DOCENA
  PACK
}

enum EstadoVenta {
  ABIERTA // creada, editable mientras se arma el ticket
  CERRADA // guardada/finalizada
  ANULADA // revertida total (opcional)
}

enum EstadoPago {
  PENDIENTE
  PARCIAL
  PAGADO
}

enum MedioPago {
  EFECTIVO
  QR // QR / transferencia
  FIADO
}

enum CanalVenta {
  PRESENCIAL
  WHATSAPP
  INSTAGRAM
}

enum TipoAjusteStock {
  MERMA
  RECONTEO
  DEVOLUCION_PROVEEDOR
}

enum EstadoReserva {
  ABIERTA
  ENTREGADA
  CANCELADA
}

enum Moneda {
  ARS
  USD
  Gs
}

/// ----------------------
/// Seguridad / Usuarios
/// ----------------------
model Usuario {
  id       String     @id @default(uuid())
  nombre   String
  telefono String?    @db.VarChar(40)
  rol      RolUsuario @default(OPERADOR)

  // Auth mínima (si se usa):
  email String? @unique
  hash  String? // password hash (opcional si hay otro proveedor de auth)

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}

/// ----------------------
/// Catálogo & Inventario
/// ----------------------
model Producto {
  id          String         @id @default(uuid())
  categoria   String
  nombre      String
  descripcion String?
  variante    String? // talle/color u otro
  fotoUrl     String?
  estado      EstadoProducto @default(ACTIVO)

  // Stock en unidades individuales
  stockActual  Int          @default(0)
  stockMinimo  Int          @default(0)
  unidadMedida UnidadMedida @default(UNIDAD)
  ubicacion    String?

  // Costeo preferente (último costo conocido a ARS)
  costoUnitarioARS Decimal? @db.Decimal(14, 2)

  // Precios actuales de referencia (puede haber histórico en Precio)
  precioListaARS  Decimal?  @db.Decimal(14, 2)
  precioOfertaARS Decimal?  @db.Decimal(14, 2)
  ofertaDesde     DateTime?
  ofertaHasta     DateTime?
  // Ajuste por medio de pago (ej. recargo QR): porcentaje 0.00–1.00 (10% = 0.10)
  listaQrPct      Decimal?  @db.Decimal(6, 4)

  proveedorPrincipalId String?
  proveedorPrincipal   Proveedor? @relation(fields: [proveedorPrincipalId], references: [id], onDelete: SetNull)

  precios      Precio[]
  compraItems  CompraItem[]
  ventaItems   VentaItem[]
  ajustesStock AjusteStock[]
  reservaItems ReservaItem[]

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@index([categoria])
  @@index([nombre])
  @@index([estado])
}

/// Historial de precios (versionado opcional)
model Precio {
  id         String   @id @default(uuid())
  productoId String
  producto   Producto @relation(fields: [productoId], references: [id], onDelete: Cascade)

  listaARS      Decimal   @db.Decimal(14, 2)
  ofertaARS     Decimal?  @db.Decimal(14, 2)
  vigenciaDesde DateTime  @default(now())
  vigenciaHasta DateTime?
  listaQrPct    Decimal?  @db.Decimal(6, 4) // ej. 0.10 = +10% QR

  createdAt DateTime @default(now())

  @@index([productoId, vigenciaDesde])
}

/// ----------------------
/// Proveedores & Compras
/// ----------------------
model Proveedor {
  id              String  @id @default(uuid())
  nombre          String
  contacto        String? // WhatsApp/teléfono
  condicionesPago String?
  notas           String?
  origen          String? // local / Encarnación / viajante

  compras   Compra[]
  productos Producto[]

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@index([nombre])
}

model Compra {
  id          String    @id @default(uuid())
  fecha       DateTime  @default(now())
  proveedorId String
  proveedor   Proveedor @relation(fields: [proveedorId], references: [id], onDelete: Restrict)

  costoTotalARS  Decimal   @db.Decimal(14, 2)
  gastosARS      Decimal?  @db.Decimal(14, 2) // flete, aranceles prorrateables si se desea
  tipoCambio     Decimal?  @db.Decimal(14, 4) // cuando se compró en USD/Gs y se convierte a ARS
  metodoPago     MedioPago // generalmente EFECTIVO o QR
  comprobanteRef String?
  adjuntoUrl     String? // foto/scan de remito/factura
  notas          String?

  items CompraItem[]

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@index([fecha])
  @@index([proveedorId, fecha])
}

model CompraItem {
  id       String @id @default(uuid())
  compraId String
  compra   Compra @relation(fields: [compraId], references: [id], onDelete: Cascade)

  productoId String
  producto   Producto @relation(fields: [productoId], references: [id], onDelete: Restrict)

  cantidad      Int
  costoUnitario Decimal @db.Decimal(14, 2)
  moneda        Moneda // ARS, USD, Gs
  subtotal      Decimal @db.Decimal(14, 2)

  @@index([compraId])
  @@index([productoId])
}

/// ----------------------
/// Clientes & Fiado
/// ----------------------
model Cliente {
  id          String   @id @default(uuid())
  nombre      String
  telefono    String?  @db.VarChar(40)
  tipo        String? // minorista/mayorista (texto libre)
  notas       String?
  limiteFiado Decimal? @db.Decimal(14, 2)

  ventas Venta[]
  deudas DeudaCliente?

  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt
  Reserva   Reserva[]

  @@index([nombre])
  @@index([telefono])
}

model DeudaCliente {
  id        String  @id @default(uuid())
  clienteId String  @unique
  cliente   Cliente @relation(fields: [clienteId], references: [id], onDelete: Cascade)

  saldoPendiente  Decimal   @default(0.00) @db.Decimal(14, 2)
  fechaCompromiso DateTime?

  updatedAt DateTime @updatedAt
}

/// ----------------------
/// Ventas, Items y Pagos
/// ----------------------
model Venta {
  id    String     @id @default(uuid())
  fecha DateTime   @default(now())
  canal CanalVenta @default(PRESENCIAL)

  clienteId String?
  cliente   Cliente? @relation(fields: [clienteId], references: [id], onDelete: SetNull)

  estado        EstadoVenta @default(CERRADA)
  estadoPago    EstadoPago  @default(PENDIENTE)
  observaciones String?

  total Decimal @db.Decimal(14, 2) // total venta (bruto menos descuentos)

  items VentaItem[]
  pagos VentaPago[]

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@index([fecha])
  @@index([clienteId])
  @@index([estadoPago])
}

model VentaItem {
  id      String @id @default(uuid())
  ventaId String
  venta   Venta  @relation(fields: [ventaId], references: [id], onDelete: Cascade)

  productoId String
  producto   Producto @relation(fields: [productoId], references: [id], onDelete: Restrict)

  cantidad   Int
  precioUnit Decimal  @db.Decimal(14, 2) // ya con promo/redondeo aplicado
  descuento  Decimal? @db.Decimal(14, 2) // descuento puntual de línea
  subtotal   Decimal  @db.Decimal(14, 2)

  esCombo  Boolean @default(false)
  override Boolean @default(false) // si se editó manualmente el precio

  @@index([ventaId])
  @@index([productoId])
}

model VentaPago {
  id      String @id @default(uuid())
  ventaId String
  venta   Venta  @relation(fields: [ventaId], references: [id], onDelete: Cascade)

  tipo       MedioPago
  monto      Decimal   @db.Decimal(14, 2)
  referencia String? // ej. últimos 4 dígitos o id de transacción
  confirmado Boolean   @default(true) // QR puede quedar false hasta conciliar
  createdAt  DateTime  @default(now())

  @@index([ventaId])
  @@index([tipo, confirmado])
}

/// ----------------------
/// Reservas / Señas
/// ----------------------
model Reserva {
  id    String   @id @default(uuid())
  fecha DateTime @default(now())

  clienteId String?
  cliente   Cliente? @relation(fields: [clienteId], references: [id], onDelete: SetNull)

  estado        EstadoReserva @default(ABIERTA)
  observaciones String?

  // Seña/pago parcial (opcional) asociado a la reserva
  seniaARS Decimal? @db.Decimal(14, 2)

  items ReservaItem[]

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@index([clienteId])
  @@index([estado])
}

model ReservaItem {
  id        String  @id @default(uuid())
  reservaId String
  reserva   Reserva @relation(fields: [reservaId], references: [id], onDelete: Cascade)

  productoId String
  producto   Producto @relation(fields: [productoId], references: [id], onDelete: Restrict)

  cantidad Int @default(1)

  @@index([reservaId])
  @@index([productoId])
}

/// ----------------------
/// Ajustes de Stock
/// ----------------------
model AjusteStock {
  id         String   @id @default(uuid())
  productoId String
  producto   Producto @relation(fields: [productoId], references: [id], onDelete: Restrict)

  tipo     TipoAjusteStock
  cantidad Int // positivo/negativo según caso
  motivo   String?
  fecha    DateTime        @default(now())

  @@index([productoId, fecha])
}
