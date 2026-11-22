# Modelo de datos

## Estado

El Hito 3 define un **modelo relacional diseñado**, separado de la aplicación actual. El documento del Hito describe 17 tablas en SQL Server y afirma que el diagrama, el documento y un script físico final comparten nombres y columnas. El archivo SQL que se recibió en `sistemaventas (1).rar`, sin embargo, contiene una versión anterior de 18 tablas. Por eso se conserva en `database/legacy/` como referencia histórica y no se presenta como implementación vigente.

La aplicación C# sigue siendo un prototipo de consola con datos en memoria. No se conecta a SQL Server. Las tablas descritas aquí son el diseño objetivo del Hito 3, no componentes ya integrados en el programa.

## Alcance del modelo lógico final descrito

El modelo representa roles y usuarios, clientes y vendedores, catálogo e inventario, descuentos y promociones, preventas y ventas, proveedores y reportes semanales. Usa SQL Server y la convención de nombres en minúsculas, `snake_case`, sin tildes, con tablas plurales y restricciones con prefijos `pk_`, `fk_`, `uq_`, `ck_` y `df_`.

| Tabla | Propósito | Clave primaria |
| --- | --- | --- |
| `roles` | Catálogo de roles | `id_rol` |
| `proveedores` | Empresas proveedoras | `id_proveedor` |
| `categorias` | Clasificación de productos | `id_categoria` |
| `descuentos` | Descuentos y vigencia | `id_descuento` |
| `usuarios` | Cuentas y rol asignado | `id_usuario` |
| `vendedores` | Perfil de vendedor asociado a usuario | `id_vendedor` |
| `clientes` | Perfil de cliente asociado a usuario | `id_cliente` |
| `productos` | Catálogo comercial | `id_producto` |
| `inventarios` | Existencias por producto | `id_inventario` |
| `promociones` | Promociones comerciales | `id_promocion` |
| `preventas` | Cabecera de reserva | `id_preventa` |
| `ventas` | Cabecera de venta | `id_venta` |
| `detalles_ventas` | Productos y cantidades de una venta | `id_detalle_venta` |
| `proveedores_productos` | Relación proveedor–producto y precio de compra | `id_proveedor` + `id_producto` |
| `ventas_promociones` | Relación venta–promoción | `id_venta` + `id_promocion` |
| `preventas_productos` | Productos reservados y precio | `id_preventa` + `id_producto` |
| `reportes_semanales` | Resumen histórico por semana | `id_reporte_semanal` |

## Relaciones principales

- `roles` 1:N `usuarios`; `usuarios` 1:0..1 `vendedores` y 1:0..1 `clientes`.
- `categorias` 1:N `productos`; `descuentos` 0..1:N `productos`.
- `productos` 1:1 `inventarios`.
- `clientes` y `vendedores` se relacionan 1:N con `preventas` y con `ventas`.
- `ventas` 1:N `detalles_ventas`; `productos` 1:N `detalles_ventas`.
- `proveedores` y `productos` se relacionan N:M mediante `proveedores_productos`.
- `ventas` y `promociones` se relacionan N:M mediante `ventas_promociones`.
- `preventas` y `productos` se relacionan N:M mediante `preventas_productos`.
- `reportes_semanales` guarda agregados históricos por período.

El Hito indica que `productos.stock` se elimina porque las existencias viven en `inventarios.stock_actual`, y que no se almacena `subtotal` en `detalles_ventas` porque se calcula con cantidad y precio unitario. También especifica `contrasena_hash` para usuarios, no contraseñas en texto plano.

## Diferencias con el SQL recibido

El SQL adjunto contiene `administradores_generales`, `proveedor_producto`, `venta_promocion` y `preventa_producto`, mientras que el diseño final los elimina o pluraliza; además mantiene `productos.stock`, `detalles_venta.subtotal` y `usuarios.contrasena` en texto plano. El script también insertaba contraseñas de ejemplo y borraba la base de datos existente. La copia histórica del repositorio elimina esa instrucción destructiva y reemplaza esos valores de contraseña por marcadores, pero sigue siendo un esquema anterior y no debe tratarse como el modelo final.

El RAR recibido solo contiene ese SQL. Aunque el documento del Hito menciona un XML de draw.io y un script físico final coherente con el modelo de 17 tablas, esos archivos no venían en el RAR. Cuando se entreguen, se podrá comparar el modelo lógico, el diagrama y el DDL antes de declarar una versión canónica.

## Normalización declarada

El documento del Hito declara que las 17 tablas cumplen 1FN, 2FN y 3FN. Entre las decisiones registradas están separar nombres y apellidos, resolver relaciones N:M con tablas asociativas, quitar el stock duplicado y calcular subtotales en consultas. Esta descripción resume lo declarado por el equipo; la verificación definitiva depende de recibir el DDL final y contrastar sus columnas y restricciones.
