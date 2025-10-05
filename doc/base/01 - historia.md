Resumen de Entrevista y Requisitos del Sistema de Gestión

El Mercado Modelo "La Placita" en Posadas es un histórico paseo de compras donde pequeños comerciantes venden una gran variedad de productos. La siguiente es una recopilación estructurada de la información obtenida al entrevistar a un vendedor polirrubro de “La Placita” que vende de todo (textiles, bazar, electrónica menor, golosinas, etc.). El objetivo de la entrevista fue entender detalladamente sus operaciones diarias para diseñar un sistema de gestión que abarque ventas, stock, compras, caja, clientes y reportes. A continuación se presentan los hallazgos organizados por tema, seguidos de una lista de requisitos priorizados para el sistema propuesto.

Personas y Roles en el Negocio

Vendedor principal (entrevistado): Emprendedor autónomo que atiende un puesto fijo dentro del mercado. En este caso es un hombre apodado "Juan", quien maneja todas las tareas: atención al cliente, cobro, control de stock y reposición de mercadería. Trabaja normalmente solo, aunque en días de mucho movimiento (por ejemplo, fines de semana o fechas especiales) recibe ayuda de su esposa para atender a los clientes y cobrar.

Ayudante ocasional: Colaborador (familiar) que asiste en horas pico. Suele encargarse de cobrar o embolsar productos mientras Juan atiende a otro cliente, o bien de vigilar el puesto si Juan debe ausentarse brevemente (por ejemplo, para buscar cambio o mercadería guardada). No hay empleados formales contratados; es un microemprendimiento familiar.

Roles y responsabilidades: Juan se ocupa de abrir y cerrar el puesto cada día, manejar la caja (dinero), mantener visible la lista de precios, y realizar las compras de reposición de stock. También realiza el seguimiento de deudores (clientes “fiados”) anotando quién le debe dinero y gestionando los cobros posteriormente. Cuando su esposa u otro familiar ayuda, suelen dividirse las tareas: uno atiende ventas y el otro controla el cobro y embolsado, pero ambos pueden realizar cualquier tarea según la necesidad.

Horarios: El puesto abre de lunes a sábado, aproximadamente de 8:00 a 18:00, con cierta flexibilidad. Juan comenta que los picos de venta se dan los sábados por la mañana y vísperas de fechas especiales (Navidad, inicio de clases, vacaciones de invierno), cuando hay más afluencia de clientes. Entre semana, el flujo es más tranquilo, con algunas horas muertas al mediodía. Los domingos generalmente el mercado cierra, o Juan descansa salvo ocasiones excepcionales (ej. fechas navideñas donde podría abrir medio día).

Flujo de Venta (Proceso de Venta Diario)

1. Preparación al inicio del día: Juan llega al puesto y realiza una apertura de caja, es decir, verifica que tiene cambio suficiente (billetes y monedas) para dar vuelto. Coloca en su mesa o vitrina los productos más atractivos y asegura que los precios estén visibles (usa pequeñas etiquetas de papel o carteles para promociones). Si utiliza un código QR para cobros digitales, lo deja impreso y a la vista en el mostrador. Comprobaciones iniciales incluyen también chequear que su teléfono celular (que usaría para la app de gestión o para confirmar transferencias) tenga batería y datos móviles funcionando.

2. Atención al cliente y selección de productos: Cuando llega un cliente, Juan lo saluda amablemente y consulta qué busca. Dado que vende artículos variados, suele ayudar haciendo preguntas ("¿Buscás ropa de algún talle en especial o algo para la cocina?"). Si el cliente busca ropa, Juan le mostrará talles y colores disponibles; si son golosinas, le deja elegir; si es electrónica (p. ej. auriculares, linternas) posiblemente hace una prueba del producto para mostrar que funciona. En este paso el vendedor identifica los productos que el cliente desea comprar. (Ejemplo real: una cliente pidió un mantel plástico y dos remeras talla M; Juan localizó los items en su puesto y verificó colores con la cliente.)*

3. Cálculo de precio y promociones: Una vez seleccionados los productos, Juan calcula el precio total. Actualmente suele hacerlo mentalmente o con una calculadora de mano. Aplica promociones o descuentos según el caso: por ejemplo, si el cliente lleva varias unidades de un mismo producto, puede otorgar un precio especial (“lleva 3 pares de medias por $1500 en lugar de $1800”). Estas promociones las define él mismo en el momento, basadas en reglas informales (por cantidad o porque es un cliente frecuente). También distingue entre precio de lista y precio final según el medio de pago (ver Reglas de Precio más abajo): por pago en efectivo suele mantener el precio de lista, mientras que por transferencia/QR a veces cobra un pequeño recargo o no aplica el descuento de contado. El sistema ideal debería permitirle seleccionar productos, calcular totales automáticamente, aplicar descuentos/promos predefinidas o manuales y diferenciar precios por forma de pago de manera rápida para no retrasar la atención.

4. Cobro y emisión de comprobante: El cliente procede a pagar con el medio acordado. Las formas de pago típicas:

Efectivo: Juan recibe el dinero en pesos, entrega el vuelto si corresponde, y guarda el efectivo en su caja/riñonera.

Transferencia bancaria o QR: Muchos clientes prefieren escanear un código QR (por ejemplo de Mercado Pago) o hacer una transferencia bancaria directa. Juan tiene impreso su código QR y su alias/CBU bancario en un cartel. Cuando un cliente paga así, Juan verifica en su aplicación móvil de banco o de pagos que la acreditación entró (o pide al cliente mostrarle la pantalla de “transferencia realizada”). Si la conexión a internet falla en ese momento, a veces confía y entrega la mercadería, anotando provisionalmente la venta hasta confirmar más tarde la recepción del pago (riesgo: podría ocurrir que la transferencia no se complete; él mitiga esto apuntando el nombre/telefono del cliente en caso de no ver el pago enseguida).

Fiado: Ocasionalmente, para clientes muy conocidos del barrio, Juan acepta “fiado” (pago postergado). En tal caso anota en un cuaderno la venta con el nombre del cliente, fecha, productos y monto adeudado. No hay ticket en ese momento, solo la promesa de pago. El sistema debería contemplar registrar ventas a crédito vinculadas a un cliente, generando un saldo pendiente.

Si el cliente solicita un comprobante/ticket, Juan extiende un recibo simple. Como monotributista (pequeño contribuyente), tiene un talonario de facturas tipo C: llena a mano la fecha, el importe total, una descripción genérica (“venta de varios artículos”), y entrega el original al cliente quedándose con la copia. Muchos clientes no piden comprobante, pero Juan igual registra las ventas en su cuaderno para control propio. Un sistema podría generar tickets o facturas digitales rápidamente, incluyendo los datos mínimos (fecha, importe, lista de ítems) para imprimir en una mini-impresora Bluetooth o enviar por WhatsApp al cliente.

5. Entrega y finalización: Tras el pago, Juan entrega la mercadería en una bolsa. Si el cliente compró algún artículo con empaque o garantía (p.ej. auriculares), agrega la tarjetita de garantía del proveedor si la tiene, o le recuerda verbalmente la política de cambio (“cualquier problema, podés venir en la semana”). Si la venta fue presencial, el stock se reduce en ese momento (actualmente Juan lo descuenta mentalmente o en sus notas al final del día; con un sistema, idealmente se descontaría automáticamente con cada venta registrada). En caso de ventas por WhatsApp/Instagram: a veces clientes le escriben reservando un producto. Juan entonces separa el artículo (lo aparta en una caja “reservas” detrás del mostrador) y acuerda un día de retiro. Marca el stock como comprometido para no venderlo por error a otro. Actualmente lleva ese control mentalmente o con notas en WhatsApp, pero un sistema podría tener una función de “reserva de stock” vinculada al cliente hasta concretar la venta.

6. Cierre del día: Al terminar la jornada, Juan realiza un arqueo de caja: cuenta el efectivo en mano y lo compara contra sus apuntes de ventas del día (efectivo + lo que fue por transferencia). Suma las ventas a crédito (fiado) para tener un total de mercadería salida. Hace un repaso rápido de qué productos se vendieron mucho para anotar si necesita reponer. Si hubo ventas por medios electrónicos, verifica nuevamente en la app bancaria que todas las transferencias/QR del día estén acreditadas; en caso de alguna pendiente, la destaca para seguirla al día siguiente. Con un sistema, este cierre sería facilitado por un reporte diario: total vendido, desglose por medio de pago, ganancias aproximadas y alertas de stock bajo. Juan podría así conciliar el efectivo real con el esperado según el sistema y detectar diferencias (por ejemplo, errores de registro o algún faltante de dinero).

Posibles problemas en ventas y soluciones actuales: Durante el proceso de venta pueden surgir contratiempos. Si algo sale mal, Juan tiene métodos informales para resolverlo:

Error de cálculo de precio: si advierte un error después de cobrar (por ejemplo cobró de menos), suele asumir la pérdida pequeña o informarlo al cliente si es de confianza. Si cobró de más accidentalmente y el cliente vuelve, le devuelve la diferencia sin problema. Un sistema calculando automáticamente minimiza estos errores.

Producto sin stock inesperadamente: a veces cree tener un producto pero no lo encuentra (descuadre de stock). En el momento ofrece un sustituto similar o le toma el contacto al cliente para avisarle cuando reponga. Esto refuerza la necesidad de alertas de stock bajo o agotado en el sistema.

Pago no realizado efectivamente: (ej. cliente muestra comprobante falso o transferencia no llega). Juan, por precaución, anota el nombre/teléfono si no ve clara la acreditación y le entrega igual la mercadería solo a clientes conocidos; a desconocidos les pide esperar unos minutos o que le muestren el movimiento desde su app bancaria real. Un sistema podría marcar la venta como “pendiente de confirmación” hasta verificar el pago.

Cliente disconforme o cambio de opinión: si justo después de pagar el cliente se arrepiente o nota un defecto, Juan suele aceptar devolver el dinero o cambiar el producto, para mantener la buena relación. Actualmente lo maneja en el momento; el sistema debería permitir registrar devoluciones vinculadas a la venta original, ajustando stock y caja.

Al finalizar esta sección de la entrevista, se resumió el flujo de ventas confirmando con Juan que incluye: atención al cliente, registro de los ítems vendidos, cálculo y cobro con distintos medios, emisión de comprobante si aplica, actualización de stock y un cierre diario conciliando ventas y dinero. Juan estuvo de acuerdo con este resumen de su proceso de venta cotidiano.

Flujo de Compra y Manejo de Proveedores

1. Planificación de compras (detección de necesidad): Juan lleva en la cabeza y en un cuaderno un inventario informal. Revisa constantemente qué productos se están acabando. Por ejemplo, nota visualmente que le quedan pocos pares de medias o pocas unidades de linternas. Además, ciertas mercaderías tienen demanda estacional: antes de las fiestas patrias trae banderitas, antes de Navidad juguetes económicos, en marzo útiles escolares, etc. Actualmente no usa un método automatizado de alerta, sino su propia observación y experiencia (“si me quedan 2 o 3 unidades de algo que se vende rápido, ya es hora de reponer”). También anota en un papel o en el celular los pedidos específicos de clientes (por ejemplo, alguien pidió un color o tamaño que no tenía, y se compromete a conseguirlo). Un sistema de gestión podría mejorar esto mediante stocks mínimos configurables por producto y alertas cuando el nivel baja del umbral, facilitando saber qué y cuánto comprar a tiempo.

2. Búsqueda y contacto de proveedores: Sus proveedores son variados:

Mayoristas locales en Posadas: para golosinas, bazar y textiles básicos tiene distribuidores en la ciudad. Él los contacta por WhatsApp o teléfono para consultar precios actuales y disponibilidad. A veces simplemente se acerca a los depósitos mayoristas temprano en la mañana (antes de abrir su puesto) para surtirse.

Viajes a Encarnación (Paraguay): Cada mes o cuando le conviene por precio, cruza a la ciudad de Encarnación para comprar ciertos productos más baratos (electrónica pequeña, juguetes, textiles populares). Allí paga en pesos argentinos si aceptan, o lleva pesos que cambia a guaraníes/dólares en el momento. El tipo de cambio juega un papel: si el peso argentino se devalúa mucho, esas compras pueden volverse caras; Juan debe evaluar si ajustar sus precios de venta en Posadas después de reponer mercadería comprada afuera.

Otros vendedores y viajantes: En ocasiones algún viajante (proveedor itinerante) viene al mercado ofreciendo mercadería en consignación o con promociones. Por ejemplo, un viajante podría traer un lote de sábanas o herramientas baratas. Juan a veces aprovecha para comprarles en el acto si ve buena oportunidad. La consignación no es habitual, pero sí ocurre que algún proveedor le deje mercadería a pagar después de venderla cuando hay confianza y se trata de productos caros (muy raramente, dado que Juan prefiere pagar todo al contado para no endeudarse).

3. Realización del pedido/compra: No existe un sistema formal de órdenes de compra. Juan normalmente compra en persona: va al mayorista con su lista mental o escrita de necesitades y adquiere según disponibilidad y precio del día. Si es un pedido por WhatsApp, a veces el proveedor le arma la mercadería y se la envía en moto o flete (especialmente con golosinas o bebidas, ya que son voluminosas). En esos casos, la compra llega con un remito o factura simple que firma al recibir. Él guarda esas facturas en una carpeta o les saca foto con el celular (almacenándolas en un chat de WhatsApp consigo mismo) para no perder la información de costos. Un campo “comprobante” en el sistema (con número o foto adjunta) sería útil para tener respaldo digital de cada compra.

Al concretar la compra, Juan registra mentalmente los costos unitarios de los productos. Por ejemplo, si compró linternas a $500 cada una, sabe que deberá venderlas quizás a $800 c/u para mantener su margen. Actualmente, estos costos los anota a lápiz en su cuaderno al lado de la descripción del producto o directamente confía en recordarlos al fijar precios. Un sistema debería permitir registrar por ítem: costo unitario, moneda (pesos o guaraníes) si fue importado, costos adicionales (flete, aduana) prorrateados, etc., para luego calcular margen y valorizar el stock.

4. Recepción de la mercadería: Juan transporta la mercadería al puesto (si es local, él mismo en bolso o en su vehículo; si viene de Encarnación, cruza la frontera en transporte público con bolsas, declarando algo en aduana si corresponde a pequeña escala). Al llegar, verifica que las cantidades estén completas y los productos en buen estado. Si algo falta o llega defectuoso, él:

Notifica al proveedor (por ejemplo, envía mensaje y normalmente el proveedor le descuenta ese ítem en la próxima compra o se lo cambia).

Si es algo comprado afuera (Paraguay), a veces no puede reclamar fácilmente pequeñas fallas por la distancia; asume la pérdida o intenta arreglar el producto si es posible. Un sistema podría registrar estas incidencias como ajustes de stock o notas de crédito con proveedores para llevar un control de pérdidas por producto defectuoso.

Luego ubica la nueva mercadería en su puesto o almacén. Actualización de inventario: Actualmente Juan no lleva un conteo electrónico, pero sí al recibir escribe en su cuaderno los nuevos artículos con alguna identificación (ejemplo: “Linterna recargable x 10 unid.”). Un sistema de gestión debería permitir una entrada de stock por compra: ingresando cada producto y cantidad que se suma al inventario, preferentemente seleccionando el producto de un catálogo o creándolo si es nuevo. También debería actualizar el stock actual y recalcular el valor promedio de costo si se mezcla con stock anterior.

5. Pagos a proveedores: Por lo general son al contado. Juan paga en efectivo o mediante transferencia bancaria en el momento de la compra. Algunos mayoristas locales le permiten pago diferido a pocos días si es cliente conocido, pero Juan trata de no endeudarse. No maneja créditos formales. En el sistema, cada registro de compra debería guardar la condición de pago (contado, transferencia, crédito) y el estado (pagado o pendiente). En caso de haber pagos pendientes a proveedores, sería útil que el sistema los recuerde con una alerta de cuentas por pagar, aunque en este negocio la mayoría de las veces las deudas son solo de clientes hacia él (fiado), no tanto de él hacia proveedores.

6. Política de precios y cambios con proveedores: Juan no tiene contratos formales, pero sí relaciones de confianza. Si un producto no rota (no se vende) y ocupa espacio, a veces coordina con el proveedor para cambiarlo por otro en la siguiente compra (por ejemplo, le devolvió unos adornos navideños que quedaron en febrero, y a cambio llevó otros productos de temporada). Esto depende del proveedor; no siempre aceptan devoluciones, pero con algunos mayoristas locales tiene ese arreglo informal “de buena fe”. Con el sistema se podría marcar ciertos items como en devolución o generar notas de devolución a proveedor.

Resumiendo el flujo de compras: se identifican necesidades de stock, se adquieren productos de diversos proveedores (locales o via viaje), se registran costos, se ingresa la mercadería a inventario, y se manejan eventuales devoluciones o ajustes. Juan confirmó que este resumen refleja sus pasos principales, haciendo énfasis en que la simplicidad es clave: cualquier sistema debe ser más fácil que sus métodos actuales (cuaderno y memoria) para que él lo adopte.

Catálogo de Productos e Inventario Actual

En la entrevista se profundizó sobre cómo Juan organiza su catálogo e inventario de mercadería:

Categorías de productos: Maneja diferentes rubros juntos, por lo que mentalmente agrupa su mercadería en categorías generales: ropa (remeras, pantalones, medias), bazar (platos, manteles, vasos), electrónica chica (auriculares, linternas, radios pequeñas), golosinas y bebidas, y varios (cualquier otro artículo misceláneo como juguetes o herramientas pequeñas). Estas categorías le ayudan a ordenar físicamente el puesto y a pensar en márgenes de precio distintos. Un sistema debería permitir clasificar cada producto por categoría para luego poder filtrar en listados y analizar ventas por rubro.

Identificación de productos: Actualmente no usa códigos de barra universales; muchos productos ni siquiera los traen. Él identifica cada artículo por una descripción corta y a veces un código interno. Por ejemplo: “Remera deportiva Nike azul, talle L” o “Linterna recargable chica”. Para prendas, incluye talle y color en la descripción; para otros, algún detalle o marca si tiene. No tiene un catálogo escrito formal, pero sí utiliza apodos o referencias en su cuaderno que actúan como código informal. Un sistema debería ofrecer campos como nombre, descripción, variante (ej. talla/color) y quizás la posibilidad de asignar un código SKU manualmente. Fotos de los productos serían útiles sobre todo para aquellos que tiene guardados o para identificar variantes, aunque hoy Juan simplemente reconoce los productos visualmente en su puesto. Incluir una foto por producto en el sistema podría ayudarle a buscar rápidamente entre su inventario, especialmente si se amplía.

Registro y control del stock: Juan admite que su control es bastante “a ojo”. Lleva un cuaderno donde anota ingresos de mercadería (cada compra) y a veces anota ventas grandes o por mayor, pero no descuenta cada venta minorista en el momento en ninguna parte. Esto significa que confía en su memoria y en revisar físicamente. Por ejemplo, sabe que compró 20 linternas; pasan unos días y ve que le quedan ~5, entonces infiere que vendió 15 (aunque no anota cada una). Este método informal funciona cuando se tiene poca variedad, pero con cientos de ítems es propenso a errores. Por eso, un requerimiento clave es un módulo de inventario donde:

Cada producto tenga su stock_actual actualizado con cada venta y compra.

Se puedan definir stock_mínimo o punto de pedido para recibir alertas de reposición.

Se soporte diferentes unidades de medida: en su caso la mayoría se vende por unidad, pero algunos proveedores venden por docena o pack (ej. golosinas en paquetes). El sistema debería convertir si hace falta (ej: compra 1 pack de 12 unidades, incrementa 12 al stock de unidades individuales).

Manejar ubicaciones: su mercadería puede estar expuesta en el puesto o guardada en cajas debajo/atrás. Un campo de ubicación (p.ej. “mostrador”, “depósito”, “bolso itinerante”) le ayudaría a recordar dónde está cada cosa, especialmente para ítems pequeños guardados por falta de espacio en exhibición.

Variantes y excepciones: Algunos productos tienen variantes (talle/color) y se venden individualmente. Juan prefiere listarlos como productos separados por simplicidad en su cuaderno, pero un sistema podría manejarlos como un mismo producto con atributos variantes. También hay productos sin código ni descripción clara (ej. artículos artesanales o usados) que son únicos; esos quizás se registren con descripciones libres y sin stock repetible. Además, arma ocasionalmente combos o kits (p.ej. “Kit escolar: mochila + cartuchera + lapices” a precio paquete). Para el sistema, sería ideal soportar ventas de combos que descuenten múltiple stock (restar 1 mochila, 1 cartuchera, etc. al vender el kit), o permitir crear productos tipo “bundle”. Finalmente, si un producto sale defectuoso o vence (en caso de golosinas), Juan lo retira de la venta y lo anota como baja de stock; el sistema debería tener una función de ajuste por “merma” o productos fallados.

Campos clave para productos (a validar con el entrevistado): Basado en lo conversado, estos son los campos de datos que el sistema manejaría para cada producto:

categoria – Categoría o rubro (texto o selección predefinida, ej. “Ropa”, “Bazar”).

nombre – Nombre corto identificativo (ej. “Remera deportiva hombre”).

descripcion_detallada – Descripción con detalles, incluyendo marca, color, talla u otro atributo relevante.

variante – Atributos variables como talla, color u otra característica distintiva (podría guardarse separado o dentro de la descripción).

foto – Foto del producto para fácil reconocimiento (opcional pero deseable).

costo_unitario – Costo de adquisición por unidad en moneda local (ARS) u otra moneda si aplica.

moneda_costo – Moneda del costo si fue distinto de pesos (ej. “USD” o “Gs” – guaraníes). El sistema podría convertir a pesos según tipo de cambio registrado en la compra.

precio_lista – Precio de venta unitario estándar (precio de lista, en ARS).

precio_oferta – Precio promocional (si actualmente está en oferta o descuento por temporada). Podría ser nulo o distinto de precio_lista temporalmente.

stock_actual – Cantidad disponible actualmente en unidades individuales.

stock_minimo – Cantidad mínima deseada antes de gatillar alerta de reposición.

unidad_medida – Unidad de stock (ej. “unidad”, “docena”, “pack”). Podría usarse para convertir en las compras.

ubicacion – Ubicación física (ej. “Puesto vitrina”, “Depósito casa”, “Mochila ambulante”).

proveedor_principal – Referencia al proveedor habitual de este producto (nombre o ID en lista de proveedores).

codigo_interno – Algún código o SKU que Juan quiera asignar (opcional, dado que actualmente no usa códigos formales).

estado – Activo, agotado, descontinuado, etc., para cuando deja de vender cierto artículo.

Juan revisó estos campos sugeridos y estuvo de acuerdo en general, recalcando que no siempre tendrá todo ese detalle (por ejemplo, muchos productos pequeños no llevan foto ni código), pero comprender qué campos puede manejar el sistema le ayuda a pensar cómo cargaría su catálogo en la herramienta.

Gestión de Compras y Proveedores

Durante la entrevista se identificaron también datos que el sistema debería guardar sobre proveedores y compras, así como reglas relacionadas a costos:

Proveedores: Juan trata con varios proveedores, por lo que se definirían entidades de proveedor con campos como:

proveedor_nombre – Nombre o alias de la empresa/persona proveedora (ej. “Mayorista Don Pepe”, “Importadora Encarnación S.A.”).

contacto – Información de contacto, típicamente número de WhatsApp/teléfono, y quizá dirección o persona de referencia. Juan indicó que casi todo lo maneja vía teléfono y WhatsApp, tener esos datos a mano en el sistema sería útil.

condiciones_pago – Texto breve sobre cómo le vende el proveedor: contado efectivo, transferencia anticipada, días de crédito si se da el caso. La mayoría es pago contado; en algunos casos podría anotar “pago a 7 días” si acuerda algo especial.

dias_entrega – (Si correspondiera) Días u horario típico de entrega o atención del proveedor. Por ejemplo, “atiende lunes a viernes mañana”, por si necesita planificar el contacto.

notas – Cualquier observación: ej. “Trae mercadería de Brasil, precios dependen del dólar blue”; “hace descuento por compras por bulto cerrado”.

Registro de Compras: Cada vez que se repone stock, debería crearse un registro de la compra. Campos propuestos:

fecha_compra – Fecha (y hora si relevante) en que se realizó la compra.

proveedor – Referencia al proveedor (seleccionar de la lista).

items_comprados – Lista de ítems en la compra, con detalle de cada uno: {producto, cantidad, costo_unitario, moneda, subtotal}. Aquí el sistema podría actualizar automáticamente el costo promedio del producto en el inventario.

costo_total – Total pagado por la compra (suma de subtotales + gastos).

gastos_adicionales – Otros costos asociados: flete (ej. $500 del envío en moto), impuestos_aranceles si aplica (ej. un 10% extra por traer de Paraguay), etc. Estos datos ayudan a Juan a saber el costo real.

tipo_cambio – Si se usó moneda extranjera, registrar qué tipo de cambio se aplicó para convertir a pesos, para transparencia.

metodo_pago – Efectivo, transferencia, etc., y si quedó pendiente de pago.

comprobante_ref – Número de factura o remito, y posibilidad de adjuntar foto o escaneo del comprobante. Juan fotografía muchos comprobantes, integrar eso sería ideal.

notas – Campo libre para observaciones, por ejemplo “compra de liquidación, 20% más barato por fin de temporada” o “incluyó 2 unidades de cortesía”.

Con estos datos, el sistema podría luego generar reportes de cuánto gasta Juan en reponer mercadería, cuáles son sus proveedores principales, y cómo evolucionan los costos (importante en la economía inflacionaria local).

Costo y dólar: Dado que algunos proveedores ajustan precios según el dólar, Juan mencionó que sería útil poder actualizar rápidamente los precios de costo de ciertos productos ante variaciones bruscas. Por ejemplo, si el dólar sube un 10% en una semana, su proveedor de electrónicos podría remarcar precios; el sistema debería facilitar quizás un ajuste masivo de costos (y posiblemente de precios de venta) para esos productos importados. Una idea es manejar un parámetro global de “cotización” para referencias, o marcar algunos proveedores/productos como ligados a dólar. Este detalle es un área a explorar más (quizás con opciones de reglas de actualización de precios, ver sección de Reglas de Precio).

Consignación vs stock propio: Actualmente casi todo el stock es propiedad de Juan (lo pagó al comprar). Si en algún caso excepcional recibe mercadería en consignación (pagar solo lo vendido), el sistema tendría que permitir registrar esos ítems de forma diferenciada, tal vez con un indicador de “stock en consignación” ligado a ese proveedor y sin afectar su flujo de caja hasta la venta. Sin embargo, por simplicidad, esto se marcó como poco frecuente y podría manejarse manualmente (por ejemplo, ingresando la compra normalmente pero sabiendo que el pago queda pendiente hasta vender, o registrando un pago diferido).

Devoluciones a proveedor: En contadas ocasiones, Juan devuelve productos al proveedor (defectuosos o no vendidos de temporada). El sistema debería soportar transacciones de devolución que reduzcan el stock y quizás creen un crédito con el proveedor (o reembolso). Por ejemplo, devolver 5 unidades de un artículo porque venían falladas y conseguir reemplazo o nota de crédito.

Al cierre de esta sección, se verificó con Juan que los campos y procesos de compras cubren sus necesidades. Él destacó que quiere poder consultar fácil cuánto le costó cada cosa y cuándo la compró, porque a veces olvida si un precio de costo es actualizado o de un lote viejo, lo cual es crucial para fijar precios correctamente.

Reglas de Precio y Promociones

La formación de precios es un aspecto crucial donde Juan aplica su experiencia y ciertas reglas informales. El sistema deberá adaptarse a estas prácticas:

Cálculo de precio de venta: En general Juan establece el precio de lista haciendo un markup sobre el costo. Su regla aproximada: para productos económicos (ej. accesorios, golosinas), suele duplicar el costo (margen ~100%). En productos más caros o con competencia fuerte (ej. electrónica donde el cliente compara precios), tal vez aplica un margen menor, entre 30% y 50%. También tiene en cuenta el precio de mercado local: antes de fijar precio mira cuánto venden artículos similares en otros puestos de La Placita o tiendas cercanas. No usa una fórmula fija universal, pero un sistema podría ayudarlo proponiendo un precio basado en porcentaje de margen por categoría configurable (ej. ropa +120%, electrónica +50%, alimentos +80%), ajustable luego manualmente. Además, por el contexto inflacionario, Juan a menudo redondea precios hacia arriba a números “lindos” (por ejemplo, prefiere $1.000 en lugar de $947) y evita precios que requieran monedas de poco valor ya que casi no circulan.

Precio contado vs. electrónico: Existe una diferenciación sutil en algunos casos. Oficialmente en Argentina no se debería cobrar de más por pagos electrónicos, pero muchos pequeños comerciantes ofrecen un descuento por pago en efectivo (lo presentan así para no decir recargo por tarjeta). Juan maneja un precio único para la mayoría de las cosas; sin embargo, en promociones o descuentos los suele aplicar solo para pagos en efectivo. Por ejemplo: una remera la publicita “$5.000 (efectivo)” pero si pagan con QR quizás les cobre $5.500 (aproximadamente un 10% más) debido a las comisiones de las plataformas o la demora en disponibilizar el dinero. El sistema debería contemplar listas de precios múltiples o un ajuste según medio de pago. Esto puede ser tan sencillo como permitir seleccionar “pago con QR” y que automáticamente recalcule un recargo (configurable, ej. 5% o 10%) o que permita asociar cada medio de pago a una lista de precios (Juan podría cargar precio contado y precio QR si difieren). En la práctica actual, él simplemente avisa al cliente del valor diferente antes de cobrar; con la app querría que eso ya salga calculado para evitar discusiones.

Promociones por cantidad y combos: Juan utiliza estrategias de venta para incentivar mayor volumen:

Descuentos por cantidad: Sí, suele decir “lleva 2 y te hago $100 menos” o armar paquetes tipo 3x2 en ciertos productos (muy común con medias, pañuelos, golosinas: “lleva 3 alfajores por $500”). No tiene carteles para todo, lo ofrece espontáneamente. Sería útil que el sistema permitiera definir reglas de promoción sencillas: por ejemplo, “Compra mínima 3 unidades del producto X -> precio unitario pasa de $200 a $170” (o un porcentaje de descuento). De esa forma, al facturar 3 o más unidades, se aplique automáticamente el precio promocional. También combos tipo “Combo Mate: termo + mate + bombilla a $X”, que implican varios productos distintos a un precio especial conjunto.

Ofertas temporales: En ocasiones de baja de ventas o fechas especiales, pone algunos artículos en oferta por tiempo limitado (ej. la semana previa al Día del Niño, peluches con 20% off). Para estos casos, un campo precio_oferta con fecha de vigencia sería apropiado para no tener que editar permanentemente el precio de lista. El sistema debería quizás resaltar qué productos están en promoción activa.

Precio mayorista/revendedor: Si viene un cliente que le compra en cantidad para revender (por ejemplo, 20 docenas de medias), Juan le aplica un precio por mayor. Esto no está publicado, es negociado caso a caso. Un sistema podría manejar una lista de precios por cliente o por rango de cantidades, pero dado que es infrecuente y muy flexible, tal vez con poder aplicar descuentos manuales por línea en la venta ya es suficiente. Juan mencionó que no tiene muchos clientes revendedores fijos, pero le gustaría poder identificarlos (marcar un cliente como “mayorista”) para aplicarles condiciones especiales cuando corresponda.

Actualización de precios y dólar: Como se señaló antes, los precios pueden cambiar seguido. Juan a veces debe remarcar precios cuando recibe mercadería nueva más cara (por inflación o dólar). Lo hace manualmente, cambiando las etiquetas en los productos y anotando el nuevo precio en su cuaderno. Un sistema de gestión debería facilitar la actualización masiva de precios: por ejemplo, incrementar un X% todos los productos de cierta categoría o de cierto proveedor. También sería útil poder simular cómo quedan los márgenes con un nuevo costo antes de decidir el precio final. Dado que Juan no tiene PC en el puesto, idealmente estas funciones estarían en la app móvil o al menos en una interfaz web simple que pueda usar en su casa.

En resumen, las reglas de precio que el sistema debe soportar incluyen: margen configurable por categoría (como referencia), redondeos automáticos, diferentes precios según medio de pago, promociones por cantidad (descuentos escalonados), combos de productos, precios mayoristas para ciertos clientes, y mecanismos para actualizar precios fácilmente ante cambios económicos. Estas reglas deben ser fáciles de encender/apagar o modificar por Juan mismo, ya que la dinámica de ventas cambia con frecuencia. Confirmamos con Juan este resumen y estuvo de acuerdo, agregando que lo más importante es “que no sea un lío cambiar un precio cuando necesite, ni hacer un descuento en el momento”.

Políticas de Cambios, Devoluciones y Fiado (Crédito a Clientes)

La entrevista exploró las políticas informales que Juan maneja respecto a clientes que devuelven productos, cambios por garantía y la concesión de crédito o fiado:

Devoluciones y cambios a clientes: En un mercado popular como La Placita, no es común la devolución de dinero salvo casos puntuales, pero Juan prioriza mantener buena fama y clientes contentos, así que ofrece soluciones:

Por producto defectuoso: Si un artículo electrónico o un juguete sale fallado de fábrica y el cliente regresa dentro de unos días, Juan suele ofrecer cambio por otro igual (si tiene stock) o por otro producto similar. Si no hay reemplazo posible, puede devolver el dinero, aunque trata de evitarlo ofreciéndole crédito en la tienda (“lleva otra cosa por el valor”). No lleva un registro formal de estas devoluciones, simplemente entrega el nuevo producto y anota mentalmente la pérdida o gestiona luego con el proveedor si puede. En el sistema sería importante poder registrar una devolución con motivo (defecto, fallo) que haga entrada de ese ítem devuelto (si es que vuelve al stock o se marca como defectuoso no vendible) y ajuste la caja si hubo reembolso.

Por cambio de talla/color: Para ropa, si el cliente quiere cambiar porque le quedó mal el talle o no le gustó el color, Juan acepta el cambio durante la semana siguiente a la compra, siempre que el producto esté sin usar y con empaque/etiqueta. Él lo permite como cortesía; registra en su cuaderno qué pieza entró devuelta y cuál salió en su lugar (para controlar stock). El sistema podría manejar un cambio directo: salida de un ítem y entrada de otro, posiblemente dentro del mismo ticket de venta original, de modo que quede constancia.

Sin comprobante: Dado que muchos clientes no piden ticket, los cambios se hacen sin un documento formal. Juan confía en la palabra del cliente si recuerda haberle vendido el producto. Un sistema ayudaría a buscar la venta por fecha o por cliente si estuviera registrado, pero en este entorno es flexible. Se acordó que no es prioritario tener gestión complejísima de devoluciones, pero sí la capacidad de hacer ajustes de stock y notas de crédito sencillas.

Garantías: Productos electrónicos de bajo costo normalmente no tienen garantía del fabricante más allá de probarlos al momento. Juan a veces da de palabra unos días de prueba (ej. 3 o 7 días) en los cuales si falla, lo cambia o devuelve el dinero. No entrega papeles de garantía; quizá anota en el ticket “cambio dentro de 7 días por fallas”. El sistema podría permitir imprimir en el comprobante una nota de garantía de cortesía. No registra números de serie de productos (la mayoría no tiene, al ser genéricos). Para artículos de mayor valor con serie (ej. un teléfono básico), podría anotar el serial en la factura, pero es raro que venda cosas tan costosas. Se concluye que el seguimiento de número de serie no es imprescindible en este caso, pero el sistema podría tener un campo opcional por si en el futuro incorpora productos con serie para control de garantía.

Fiado (venta a crédito informal): Es una práctica común con algunos clientes de confianza:

Juan tiene aproximadamente 10 clientes “fijos” del barrio que le compran a crédito regularmente. Les fía montos pequeños (típicamente entre $2.000 y $10.000 ARS, dependiendo de la persona). Lleva un registro manual en un cuaderno donde cada cliente tiene una página o una línea por compra fiada: anota fecha, lo llevado y el importe. También anota pagos parciales cuando vienen a saldar. No hay intereses ni documentos legales, es todo basado en confianza.

Límite y plazos: No hay un contrato, pero Juan establece de palabra ciertos límites: por ejemplo, a un cliente nuevo quizá solo le fía hasta $5.000 y espera que le pague al próximo cobro (a fin de mes, si sabe que esa persona cobra un sueldo o ayuda social). A clientes de mucha confianza les puede fiar más mercadería, pero igual trata de que no pasen más de 30 días sin pagar. El sistema podría ayudarlo fijando un límite de crédito por cliente y un vencimiento estimado (fecha compromiso de pago). Campos sugeridos:

cliente_nombre (o ID del cliente fiado, que debería estar registrado en contactos).

saldo_pendiente – Monto que debe actualmente.

limite_fiado – Máximo acordado para fiar (informativo, no bloquea pero alerta).

fecha_vencimiento – Fecha en que se espera el pago o en la que la deuda se considera vencida.

historial_pagos – Lista de transacciones de pago que reducen la deuda.

Seguimiento de deuda: Actualmente, Juan revisa su cuaderno semanalmente y manda mensajes por WhatsApp amigables a quienes deben, recordando (“Hola, te recuerdo que tenés un saldo de $X en mi puesto, ¿podrás pasar esta semana?”). Un sistema podría generar un reporte o alerta de cuentas por cobrar, mostrando quién debe dinero y desde cuándo, e incluso (en una versión ideal) enviar un recordatorio automático al WhatsApp del cliente si se integra esa funcionalidad. Sin embargo, Juan se conforma con ver fácilmente la lista de deudores y montos, para no olvidarse de ninguno.

Señas y reservados: A veces un cliente le deja una seña (pago parcial) para reservar un producto caro. Ejemplo: abonan $1.000 de $4.000 y prometen pagar el resto en la quincena, dejando el producto apartado. Juan guarda el producto y anota la seña. El sistema debería permitir ventas con pago parcial: registrar que se recibió $1.000 hoy, y quedar $3.000 pendientes, vinculados al cliente. Luego cuando el cliente completa el pago, se liquida la venta. Esto es similar al fiado, con la diferencia de que el producto no se lleva del todo hasta completar el pago (aunque en su caso igual suele entregarlo con la seña, nuevamente es confianza).

Listas para revendedores: No es exactamente fiado, pero cabe mencionar que Juan tiene algunos compradores mayoristas como mencionamos. A ellos no les fía, pero les vende a precio menor. El sistema podría simplemente marcarlos como cliente tipo “Mayorista” con una lista de precios especial en vez de fiado. Por ahora no implementa un registro especial para revendedores más allá de reconocerlos cuando vienen.

En síntesis, políticas con clientes: Juan ofrece buena voluntad en cambios y solucionando problemas, y extiende crédito limitado a conocidos. Para soportar esto, el sistema debe tener flexibilidad en las ventas (permitir pagos pendientes, cambios, devoluciones) y un módulo de cliente con información de saldo y contacto. Durante la entrevista finalizamos este punto confirmando que el manejo de fiado es crítico: “necesito que el sistema me ayude a recordar quién me debe plata y desde cuándo, eso me simplificaría muchísimo la cabeza” afirmó Juan, validando la importancia de ese requisito.

Reportes e Indicadores Clave

Cuando se le preguntó qué información le gustaría obtener del sistema para controlar su negocio, Juan mencionó varias necesidades de reportes y alertas:

Ventas diarias y semanales: Actualmente lleva la cuenta en su cabeza o cuaderno de cuánto vendió cada día. Le interesa un reporte diario que muestre: total de ventas del día, desglosado por método de pago (efectivo vs transferencia/QR vs fiado). También el margen estimado del día (ventas menos costo de lo vendido) si es posible, aunque esto último sería un plus. Un reporte semanal y mensual acumulado también le serviría para ver tendencias y comparar con semanas/meses previos (indicadores de crecimiento o estancamiento).

Productos más vendidos: Quiere saber qué artículos son sus “caballitos de batalla”. Un reporte de top 10 productos por unidades vendidas en el mes, y por ganancia generada sería ideal para enfocar esfuerzos en esos. Asimismo, ver productos no vendidos en mucho tiempo: por ejemplo, si un ítem no tuvo salida en 3 meses, quizá deba rematarlo o no volver a comprarlo. Un indicador de “stock inmóvil” o rotación lenta ayudaría a identificar mercadería muerta.

Control de stock y alertas: Juan desea ser alertado cuando un producto esté bajo stock mínimo. Un reporte o lista de “productos a reponer” con cantidades actuales por debajo del mínimo configurado le permitiría armar sus pedidos a proveedores rápidamente. Idealmente, el sistema al iniciar el día o al cerrar podría avisarle: “5 productos con stock crítico: Ej. Linterna (2 ud, mín 5), Yerba 1kg (0 ud, mín 10)…”. También le sería útil saber el valor total del stock (a costo y a precio venta) para tener idea de cuánto tiene invertido en mercadería, aunque esto es más para curiosidad y control patrimonial.

Cuentas por cobrar (fiado) y por pagar: Un reporte de clientes deudores con montos y días de antigüedad de la deuda es fundamental para que no se le pase cobrar a nadie. Podría ser tan simple como una lista ordenada por fecha de venta o por monto. De igual modo, si algún día tiene proveedores a los que quedó debiendo (no es usual, pero por si maneja algún pago diferido), un reporte de cuentas por pagar evitaría olvidos. Juan indica que hoy por hoy no tiene deudas con proveedores, pero es bueno tener la función por si la necesita en el futuro al crecer.

Pagos electrónicos a conciliar: Dado que a veces no puede verificar instantáneamente las transferencias o pagos QR, quiere una forma de marcar esas ventas y luego confirmar el pago. Un pequeño informe de “pagos pendientes de confirmación” (por ejemplo, 2 ventas de hoy aún no acreditadas en la cuenta bancaria) le recordaría hacer seguimiento. Sin un sistema, podría olvidarse de revisar alguna transacción al otro día. Con la app, incluso podría marcarla como confirmada cuando vea el ingreso, manteniendo todo cuadrado.

Resumen de caja / Arqueo: Al cierre del día, un módulo de arqueo de caja le indicaría cuánto debería tener en efectivo basado en las ventas registradas en efectivo menos gastos/pagos realizados. Juan quiere detectar si hay desvíos o errores. Por ejemplo, si el sistema dice que debería haber $50.000 pero él cuenta $49.500, puede investigar la diferencia (tal vez un pago electrónico registrado como efectivo por error, o se le perdió un billete). Estas discrepancias hoy son difíciles de cazar manualmente.

Indicadores de rendimiento: Preguntado sobre cómo define “éxito” del negocio, Juan dijo que se fija en ganancia neta mensual y si puede comprar más mercadería (reinvertir). Un indicador útil sería la rentabilidad (porcentaje de ganancia sobre ventas) mensual. Otro es el crecimiento de ventas mes a mes. A escala diaria, simplemente cumplir con una meta de ventas diarias (por ejemplo, vender al menos $X por día). El sistema podría permitirle fijar una meta y mostrar un porcentaje de logro. Si bien no es algo que pedía explícitamente, cuando se le sugirió esto, a Juan le pareció interesante visualizarlo.

Alertas personalizables: Además de stock bajo y deudas ya mencionadas, otras alertas que se discutieron:

Producto próximo a vencer (si tuviera alimentos perecederos, ej. chocolates venciendo pronto).

Recordatorio de eventos estacionales (ej. “En 1 mes es inicio de clases, ¿ya tienes mochilas?”) – esto sería un plus quizás integrando calendario de marketing.

Alerta si las ventas de un día son inusualmente bajas (por debajo del promedio), como para llamar la atención y revisar qué pasó (clima, feriado, etc.). Juan maneja esto mentalmente, pero verlo cuantitativo podría ayudarlo a tomar acciones (ofertar algo para atraer clientes al día siguiente).

Si se acerca al límite anual de monotributo en ventas, aunque es poco probable en su caso actual, un aviso sería importante para planificar su situación fiscal.

En resumen, el sistema de gestión debe proporcionar a Juan visibilidad de su negocio en números claros: cuánto vende, qué productos se mueven, quién le debe plata, qué stock reponer, y cuánto gana. Al confirmar esta sección, Juan enfatizó que nunca tuvo ese tipo de reportes más que su intuición, y que contar con ellos le daría más control y le permitiría tomar decisiones (qué más comprar, qué dejar de vender, a quién cobrar, etc.) con respaldo de datos.

Operación Diaria y Consideraciones Tecnológicas

Se conversó también sobre cómo la solución tecnológica debe integrarse en la operativa diaria de Juan y las limitaciones tecnológicas que enfrenta:

Dispositivos disponibles: Juan posee un teléfono celular Android de gama media (unos 3 años de antigüedad). No tiene computadora en el puesto, aunque en su casa podría acceder a una PC básica si fuera necesario. Prefiere usar el celular para todo, ya que lo tiene siempre a mano. Es fundamental que la aplicación de gestión sea móvil (responsive) y funcione bien en pantallas pequeñas. También mencionó que a veces su esposa podría querer ver los datos desde su propio teléfono, así que una sincronización multi-dispositivo (o cuentas de usuario múltiples) sería deseable si ambos quieren usar la app a la vez.

Conectividad e Internet: Dentro del mercado La Placita, la señal de datos móviles puede ser inestable (estructuras de concreto, interferencias). Además, hay días en que por cuestiones de costos Juan se queda sin saldo de datos. Por ello, funcionalidad offline es crucial: la app debe trabajar sin conexión y luego sincronizar cuando pueda reconectarse, para no interrumpir el registro de ventas. También debe ser rápida y ligera, para no consumir muchos datos ni batería. Si hubiera una versión web, sería útil pero no indispensable; Juan prioriza la app móvil offline.

Impresión de tickets/etiquetas: Actualmente, Juan no cuenta con impresora en el puesto. Sus comprobantes son manuales (talonario papel). Estaría dispuesto a usar una mini impresora Bluetooth portátil si el sistema la soporta, ya que algunos colegas lo hacen con aplicaciones de cobro (imprimir tickets pequeños de 58mm). Sin embargo, esto sería un "should have" más que un "must", dado que puede seguir con sus talonarios si es muy complejo. Para etiquetas de precios, él se apaña con papel y lapicera; si tuviera una impresora, podría imprimir etiquetas con código QR o barras internos para identificar productos, pero eso lo ve aún lejano. En suma, compatibilidad con impresoras Bluetooth (tickets y eventualmente etiquetas) sería valiosa, pero opcional inicialmente.

Facilidad de uso (UX): Juan no es experto en tecnología; usa WhatsApp, Facebook y algunas apps sencillas de pago. Cualquier sistema nuevo debe tener una interfaz muy intuitiva y en español claro. Se prefiere grandes botones, texto legible, y evitar jerga técnica. Por ejemplo, en lugar de "Ingresar nueva transacción", poner "Nueva Venta". También apreciaría tutoriales o ayuda visual las primeras veces (tooltips, etc.). Mencionó “si tengo que hacer muchos pasos, no lo voy a usar en el día a día”. Esto implica que para registrar una venta, idealmente no más de 3 toques: (1) seleccionar productos (quizás escaneando un código QR/barra si existiera en el producto o el sistema genera códigos internos imprimibles), (2) confirmar cantidad/precio, (3) elegir medio de pago y guardar.

Seguridad de datos: Juan mostró preocupación por perder los datos si se le rompe o pierde el celular. Actualmente, si pierde el cuaderno, sería grave. Por eso le gusta la idea de que el sistema almacene las cosas en la nube con respaldo, siempre y cuando sea privado. Le aclaramos que sus datos estarían seguros y sólo accesibles a él (con usuario/contraseña). También querría poder exportar a Excel o PDF los registros clave como respaldo local. Estas opciones (cuenta en la nube con sincronización y exportaciones) le dan tranquilidad.

Integraciones con otras apps: Se exploró qué tanto necesitaría interop. Un par de ideas surgieron:

Integrar con WhatsApp: por ejemplo, que desde la ficha de un cliente pueda hacer clic para enviarle por WhatsApp un recordatorio de pago o un catálogo de productos. O tras una venta, mandar el comprobante digital. Esto sería un plus interesante para él.

Integración con cuentas bancarias: difícil técnicamente, pero se planteó la posibilidad de que la app detecte automáticamente acreditaciones de transferencias (quizá vía notificaciones de banco o conciliación manual mediante importación de extracto). Juan dijo que sería genial pero no lo espera, está acostumbrado a verificar a mano.

Sincronización con AFIP (organismo fiscal): si llega a formalizar más su negocio, emitir facturas electrónicas desde la app podría ser útil. Por ahora, como monotributista social pequeño, no está obligado a facturación electrónica, así que no es prioridad inmediata.

En general, la solución tecnológica debe adaptarse al contexto de La Placita: uso principalmente móvil, poco hardware adicional, resiliencia a caídas de conexión, y simplicidad para alguien que es comerciante más que administrador de sistemas. Con estas consideraciones, Juan se mostró entusiasmado porque un sistema así le ahorraría tiempo y “dolores de cabeza” diarios, siempre que esté bien implementado.

Principales Dolencias (Pain Points) y Riesgos

Finalmente, se identificaron los puntos donde Juan siente que “pierde” más tiempo o dinero actualmente, así como posibles riesgos al implementar el sistema, para tenerlos en cuenta:

Control de stock inexacto: Admitió que su método manual provoca a veces faltantes inesperados (cree tener un producto pero no). Esto genera ventas perdidas y clientes decepcionados. Un sistema que lleve conteo preciso eliminará ese problema, pero solo si Juan logra registrar todas las ventas y compras correctamente. Riesgo: la disciplina inicial de cargar datos; si no registra alguna venta, el stock del sistema será incorrecto. Deberemos acompañarlo en la adopción para minimizar omisiones.

Gestión de precios y márgenes en inflación: Juan teme vender productos a precio desactualizado y perder dinero porque el costo subió. Hoy, si olvida remarcar algo, puede incluso vender con pérdida respecto al costo nuevo. El sistema debería ayudarlo a mantener precios actualizados, pero riesgo: con inflación alta, tendría que actualizar docenas de precios muy seguido, lo que puede ser engorroso. Habrá que facilitar la actualización masiva y posiblemente conectarse a una referencia de dólar para sugerir ajustes. Es un área a validar: qué mecanismo le sería más cómodo sin generar errores (por ejemplo, aplicar un % a todos los precios, etc., y luego revisar item por item quizá).

Registro de ventas en tiempo real: Actualmente, en horas pico Juan no anota nada porque prima la rapidez. Pasar a registrar cada venta en la app podría ralentizar la atención si la interfaz no es ágil. Riesgo: que en la práctica, por no retrasar a los clientes, deje de usar el sistema en momentos de mucho trabajo y luego tenga que cargar ventas de memoria al final del día (posibles errores u omisiones). Esto se mitigará con una UX muy rápida (por ejemplo, búsqueda rápida de producto por nombre o código, y entradas predeterminadas de cantidades 1 por defecto, etc.). También se podría implementar un modo offline ultra rápido o incluso utilizar reconocimiento de voz para dictar la venta (aunque es experimental).

Resistencia al cambio y curva de aprendizaje: Juan ha llevado su negocio años con métodos propios. Existe el riesgo de abandono de la app si siente que es complicada o le quita más tiempo del que le ahorra. Por eso, durante la implementación, habría que acompañarlo con capacitación breve, adaptando el sistema a sus palabras (ej: usar “fiado” en la interfaz, no un término técnico). También es importante que vea beneficios rápidos (como las alertas de deudores o stock bajo) para motivarlo.

Datos incompletos o incorrectos iniciales: Para empezar a usar la app, habría que cargar un inventario inicial. Juan no tiene inventario exacto contado. Se podría hacer un conteo físico al final de un día e ingresar todo. Riesgo: que ese proceso sea tedioso y se arranquen con datos mal, generando desconfianza en el sistema desde el inicio. Proponemos quizás empezar gestionando categorías clave y luego ir sumando productos gradualmente, para no abrumarlo.

Seguridad y privacidad: Si bien Juan quiere respaldo en la nube, le preocupa quién más ve sus datos (no quiere que la competencia o entes gubernamentales los obtengan fácilmente). Habrá que asegurarle la confidencialidad. Un riesgo externo es que pierda el teléfono o se lo roben (en la feria puede pasar); por eso es esencial que ponga contraseña a su cuenta en la app y que los datos sin conexión estén cifrados o con PIN. También que pueda recuperar todo en un nuevo dispositivo iniciando sesión.

Soporte técnico: Juan no sabrá resolver fallos técnicos. Si la app se cierra, se traba o se pierde información alguna vez, podría frustrarse mucho. Necesitaremos brindar un soporte post-implementación ágil (quizá un chat de ayuda o soporte vía WhatsApp) y garantizar que el sistema sea lo más robusto posible. Realizar pruebas en dispositivos de gama baja para asegurar compatibilidad también es clave (evitar que la app sea muy pesada para su teléfono).

Validación con ejemplos reales: Por último, hay áreas que requieren validación con casos reales durante un pilotaje:

¿Cómo prefiere exactamente registrar un producto con variantes múltiples? ¿Le resultará más fácil tener cada variante como item separado o aprender a usar variantes en la app?

¿Realmente usará un campo de ubicación o le basta con saberlo de memoria? (Si es mucha carga llenar todo, podríamos hacer que sea opcional).

Casos de uso límite: venta mixta (parte en efectivo, parte en tarjeta, ocurre? no suele pasar pero podría si el cliente no tiene suficiente efectivo). Si pasa, ¿lo registrará como dos pagos? Debemos contemplar pagos divididos.

Otro caso: ventas con cambio de precio manual (regateo). Si llega un cliente y negocia un precio distinto, Juan necesita editar el precio en la línea de venta fácilmente. Esto fue mencionado: debe poder override del precio sugerido sin complicación.

Uso multiusuario: si su esposa vende algo mientras Juan no está, ¿cómo registrar? Probablemente en el mismo dispositivo o en uno secundario. Validar si se requiere login separado o todos usan la misma cuenta.

Estas dudas y riesgos se documentaron para discutirse en la próxima charla con Juan, donde posiblemente se le muestren pantallas de prototipo para validar que la solución propuesta realmente se ajusta a su forma de trabajo.

Lista de Requisitos Priorizados del Sistema

A partir de todo lo relevado, se ha elaborado una lista de requisitos para el sistema de gestión, categorizados en Must (imprescindibles), Should (deseables de alta prioridad) y Could (opcionales / futuros), según la prioridad acordada con el entrevistado:

Must Have (Obligatorios sí o sí):

Inventario básico: Registro de productos con sus datos principales (categoría, nombre, variantes, stock, costo, precio) y actualización automática de stock al registrar compras/ventas.

Registro de ventas: Posibilidad de cargar cada venta con fecha/hora, productos (múltiples items por venta), cantidad, precio (soportando modificaciones/manual override), descuentos aplicados y medio de pago. Debe restar del stock correspondiente.

Múltiples medios de pago: Soportar al menos efectivo, transferencia/QR y fiado. Permitir marcar ventas como pagadas o pendientes (fiado) y almacenar referencia de pago (ej. últimos 4 dígitos transacción o nota “pagado por MercPago”).

Clientes y fiado: Módulo de clientes para guardar nombre y contacto. Poder registrar ventas a crédito vinculadas a un cliente, llevar saldo deudor y fecha de compromiso de pago. Debe ser muy sencillo asignar una venta a fiado de un cliente existente o nuevo en el momento.

Compras y proveedores: Registro de compras de stock con fecha, proveedor, items y costos, que incremente el inventario. Al menos ingresar totales y actualizar costos promedio por producto.

Reportes esenciales: Totales de venta diarios (con desglose por medio de pago), listado de deudas de clientes, alerta/listado de productos debajo de stock mínimo.

Operación offline: La app debe funcionar sin conexión a internet, permitiendo registrar ventas y consultas de stock offline, con sincronización posterior. Esto es crítico dada la conectividad variable.

Usabilidad móvil: Interfaz en español, optimizada para un uso rápido en smartphone, con flujos de venta y registro simples (mínimos taps). Incluir búsqueda ágil de productos (por nombre o código) en el catálogo para agregarlos a la venta.

Seguridad básica: Autenticación de usuario (para que solo Juan y su gente accedan a sus datos), y respaldo en la nube de la información para no perderla si cambia de dispositivo.

Should Have (Muy recomendables, siguiente prioridad):

Promociones y descuentos: Capacidad de configurar promociones comunes: descuentos por cantidad (precios mayoristas escalonados) y combos de productos. Automatizar la aplicación de estas promociones en el ticket de venta si se cumple la condición.

Múltiples precios según pago: Opción de definir recargos o descuentos según medio de pago (por ejemplo, perfil “Contado” vs “QR” con x% diferencia) para que el sistema calcule automáticamente el importe correcto según cómo paga el cliente.

Emisión de comprobantes: Generación de un ticket o factura simple desde la app, con posibilidad de imprimir en impresora térmica portátil o enviar por PDF/WhatsApp. Configurable con los datos fiscales de Juan (monotributista) para facturar formalmente si lo requiere.

Gestión de usuarios: Soportar al menos 2 usuarios (ej. Juan y su esposa) con permisos básicos, o una misma cuenta en dos dispositivos sincronizados. Esto evitaría problemas si están atendiendo en paralelo.

Consulta de historiales: Poder buscar ventas pasadas (por fecha, por cliente, por producto) para responder consultas como “¿cuándo te compré X cosa?” o hacer seguimiento de garantía.

Reportes adicionales: Top productos vendidos, productos sin venta en X tiempo, ganancias estimadas (si se cargan costos), comparativa de ventas mensuales. También un resumen de caja para arqueo (efectivo esperado vs real ingresado manualmente).

Módulo de pagos de deudas: Registrar cuando un cliente paga su fiado (total o parcial), ajustando su saldo. Y análogamente, un registro para pagos a proveedores si llegara a tener cuentas abiertas.

Personalización básica: Permitir a Juan configurar ciertos parámetros: categorías de producto (añadir/editar), valor de stock mínimo por producto, porcentajes de margen o promos, etc., sin necesidad de soporte técnico.

Exportar/ respaldar datos: Función para exportar los datos clave (ventas, inventario, clientes) a Excel o PDF, para respaldo contable o revisión externa.

Notificaciones/Alertas activas: Por ejemplo, notificación push diaria a cierta hora con “Total vendido hoy $X” o “Tienes 3 clientes con deuda vencida”. También alerta al abrir la app sobre stock bajo o pagos pendientes.

Could Have (Funcionalidades deseables a futuro o de menor prioridad):

Integración con WhatsApp: Botón para enviar mensaje al cliente directamente (usando WhatsApp API o deeplink) recordándole su saldo, o compartir catálogo de ciertos productos.

Integración bancaria/pagos: Importar un extracto de cuenta o recibir notificaciones de pagos para conciliar automáticamente con ventas marcadas como transferencia (sería ideal, pero complejo sin acuerdos con fintechs).

Inteligencia de reabastecimiento: Sugerencias automáticas de cuánto comprar de cada producto en base a ventas históricas y stock mínimo. Esto puede ser útil en el futuro para optimizar compras, aunque inicialmente Juan puede decidir por sí mismo.

Programa de fidelización: Registrar puntos o historial de compras de clientes frecuentes para eventualmente aplicarles descuentos personalizados. Hoy Juan lo hace intuitivamente, mañana podría querer formalizarlo.

Dashboard web completo: Aunque la prioridad es móvil, una interfaz web para gestión más avanzada (cargar masivamente productos, ver informes gráficos en pantalla grande) sería un plus para uso desde la casa u oficina.

Módulo de gastos generales: Registrar otros gastos del puesto (alquiler, insumos, etc.) para calcular una rentabilidad neta real. Juan no lo pidió explícitamente, pero lo consideramos como mejora a futuro si desea llevar contabilidad completa.

Soporte multi-sucursal: No aplica ahora, pero si Juan llegara a tener otro puesto o sucursal, la app debería escalar para manejar más de un punto de venta. Se menciona como previsión a muy largo plazo.

La lista anterior fue revisada con Juan destacando los Must que forman el núcleo mínimo viable. Él acordó que sin esos, no vale la pena la herramienta. Los Should le parecieron muy útiles, especialmente promociones automáticas y el ticket impreso, ya que mejorarían su operación sustancialmente. Los Could los vio como ideas interesantes pero no imprescindibles en lo inmediato (muchos requieren más tecnología o una operación más grande). En todo caso, sirven como visión de futuro.

Conclusiones y Próximos Pasos

En esta entrevista detallada se logró construir una radiografía completa del negocio diario de un vendedor polirrubro en La Placita y extraer requisitos claros para un sistema de gestión adaptado a su realidad. En resumen, el sistema debe ser flexible, móvil, fácil de usar offline y cubrir inventario, ventas (con fiado), compras, y reportes, integrando las particularidades de precios y métodos de pago de este contexto.

Resumen de 7 puntos clave mencionados por el entrevistado:

Control de stock en tiempo real con alertas de faltantes, para no perder ventas por olvido de reponer.

Registro de ventas fácil y rápido, incluyendo distintos medios de cobro y posibilidad de fiar a clientes, con seguimiento de deudas.

Manejo de precios dinámico, con márgenes por categoría, opción de promociones por cantidad y diferenciación efectivo/QR, asegurando mantener rentabilidad pese a la inflación.

Reportes diarios y mensuales de ventas y ganancias, y listado de productos más vendidos vs. inmovilizados, para tomar mejores decisiones de negocio.

Información centralizada de proveedores y costos, para saber a quién comprar y a cuánto, facilitando ajustar precios de venta cuando suben los costos (ej. por dólar).

Soporte para comprobantes (tickets/facturas) y eventualmente impresión, para formalizar ventas cuando se requiera y dar confianza al cliente.

Funcionalidad offline y multi-dispositivo con respaldo en la nube, para que la herramienta sea confiable en un ambiente de conectividad variable y permita a su esposa ayudar en la gestión.

Al preguntarle si faltaba algo importante o alguna “regla no escrita” que no hubiéramos cubierto, Juan reflexionó y añadió que la rapidez y confianza que él tiene con sus clientes es vital: “El sistema no tiene que interponerse cuando trato con la gente. Si me pongo a tipear mucho y no miro al cliente, ya no le gusta. Tiene que ser rapidito.” Esto reforzó el enfoque en la experiencia de usuario ágil.

Con el material recopilado, el siguiente paso acordado es preparar un prototipo de la aplicación (pantallas principales de venta, inventario y reportes) y realizar una segunda entrevista breve con Juan. En esa sesión se le mostrará el prototipo para obtener su feedback inmediato, validar que entiende cada función y ajustar detalles antes de entrar en desarrollo completo. Se cuenta con el visto bueno y entusiasmo del entrevistado para continuar con esta co-creación de la herramienta que, en palabras de Juan, “me vendría como anillo al dedo si me hace más fácil el laburo de todos los días”. ¡Continuaremos iterando con él para asegurarnos de lograrlo!