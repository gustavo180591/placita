# API REST (Referencia)

## Autenticación
- `POST /auth/login` → token
- `POST /auth/refresh`

## Productos & Stock
- `GET /productos?query=`
- `POST /productos` | `PUT /productos/:id`
- `GET /stock/critico`
- `POST /stock/ajustes`

## Ventas
- `POST /ventas` (items[], pagos[]) — atómico
- `GET /ventas/:id`
- `POST /ventas/:id/confirmar-pago` (QR)
- `POST /ventas/:id/devolucion`
- `POST /ventas/:id/cambio`

## Clientes & Fiado
- `GET /clientes?saldo=pendiente`
- `POST /clientes`
- `POST /clientes/:id/pagos`

## Compras
- `POST /compras` + items
- `GET /compras/:id`

## Reportes
- `GET /reportes/ventas?desde=&hasta=`
- `GET /reportes/fiado`
- `GET /reportes/stock-inmovil`
