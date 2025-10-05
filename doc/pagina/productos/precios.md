# Productos

## Gestión de Precios

### Descripción
Panel completo para administrar precios, ofertas y descuentos de productos.

### URL
`/productos/:productoId/precios`

### Parámetros de URL
- `productoId`: Identificador único del producto (UUID)

### Roles Requeridos
- ADMIN

### Secciones Principales

#### 1. Precios Actuales
- **Estructura de Precios**
  - Precio de costo
  - Precio de venta actual
  - Margen bruto
  - Precio de oferta
  - Fechas de vigencia

- **Historial de Cambios**
  - Gráfico de variación
  - Últimas actualizaciones
  - Usuarios que modificaron
  - Motivos de cambio

#### 2. Listas de Precios
- **Listas Activas**
  - Minorista
  - Mayorista
  - Especial
  - Temporal
  - Por volumen

- **Configuración**
  - Porcentajes de margen
  - Reglas automáticas
  - Aplicación por canal
  - Restricciones

#### 3. Ofertas y Descuentos
- **Promociones**
  - Descuentos por cantidad
  - Ofertas por tiempo
  - Paquetes
  - Combos

- **Restricciones**
  - Límites por cliente
  - Fechas de vigencia
  - Stock mínimo
  - Acumulación

#### 4. Análisis de Precios
- **Comparativa**
  - Precio vs. Competencia
  - Márgenes por categoría
  - Rentabilidad
  - Elasticidad

- **Recomendaciones**
  - Ajustes sugeridos
  - Impacto estimado
  - Histórico de ventas
  - Tendencias

### Herramientas

#### 1. Calculadora de Precios
- Cálculo de costos
- Fórmulas personalizadas
- Simulador de márgenes
- Análisis de rentabilidad

#### 2. Importar/Exportar
- Plantillas Excel
- Actualización masiva
- Sincronización
- Respaldo

#### 3. Reportes
- Histórico de precios
- Cambios recientes
- Impacto en ventas
- Análisis de competencia

### Validaciones
- Precios positivos
- Jerarquía de descuentos
- Solapamiento de ofertas
- Límites de variación
- Aprobaciones requeridas

### Reglas de Negocio
- Redondeo de precios
- Márgenes mínimos
- Políticas de descuento
- Estrategias de precios
- Estacionalidad

### Seguridad
- Control de cambios
- Historial de modificaciones
- Niveles de aprobación
- Auditoría de precios

### Integraciones
- Sistema de inventario
- Plataforma de ventas
- Análisis de mercado
- Herramientas de BI

### Accesos Rápidos
- `Ctrl+S`: Guardar cambios
- `F2`: Nueva lista
- `F5`: Actualizar datos
- `F9`: Generar reporte
- `ESC`: Cancelar

### Códigos de Error
- `ERR_PREC_001`: Precio inválido
- `ERR_PREC_002`: Conflicto de fechas
- `ERR_PREC_003`: Sin permisos
- `ERR_PREC_004`: Error al guardar
- `ERR_PREC_005`: Validación fallida

### Notas
- Revisar impacto en ventas
- Documentar cambios importantes
- Monitorear competencia
- Capacitar al equipo
- Realizar pruebas
