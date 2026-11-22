# Requisitos y estado

Los requisitos describen el programa recibido. El estado distingue el comportamiento observable de las funciones que todavía son ideas.

## Funcionales

| ID | Requisito verificable | Estado |
| --- | --- | --- |
| RF-01 | Al iniciar, el programa muestra un menú con opciones de administrador, vendedor, cliente, productos, inventario, ventas, reportes y salida. | Implementado |
| RF-02 | La vista de productos muestra identificador, nombre, categoría, precio y existencias. | Implementado |
| RF-03 | El menú de productos permite agregar un producto con sus datos básicos. | Implementado; validación de entrada limitada |
| RF-04 | La vista de inventario etiqueta existencias agotadas, bajas y disponibles. | Implementado; el límite de stock bajo es cinco unidades |
| RF-05 | El flujo de venta acepta un producto existente y una cantidad positiva que no supera las existencias. | Implementado para un producto por venta |
| RF-06 | Una venta aceptada reduce las existencias y actualiza el total de la sesión. | Implementado en memoria |
| RF-07 | El reporte muestra el acumulado de ventas y el número de productos, clientes y usuarios cargados. | Implementado en memoria |
| RF-08 | Los cambios permanecen disponibles tras cerrar y volver a abrir la aplicación. | Pendiente |
| RF-09 | Un usuario inicia sesión y solo accede a las operaciones de su rol. | Pendiente |
| RF-10 | El vendedor registra una venta con varios productos y consulta su detalle. | Pendiente |
| RF-11 | El administrador crea, actualiza y desactiva usuarios y catálogos desde el programa. | Pendiente |
| RF-12 | La aplicación persiste productos, inventario, preventas y ventas en el modelo relacional de SQL Server. | Pendiente; el Hito 3 documenta el modelo, pero la aplicación no tiene conexión a base de datos. |

## Calidad y operación

| ID | Criterio verificable | Estado |
| --- | --- | --- |
| RNF-01 | El proyecto compila con SDK .NET 10 usando la solución incluida. | Verificado localmente |
| RNF-02 | Una persona puede iniciar el programa desde la raíz con el comando del manual. | Documentado |
| RNF-03 | Los artefactos de compilación y la configuración local no se publican en Git. | Configurado en `.gitignore` |
| RNF-04 | Los cambios de código se compilan antes de revisión. | Documentado y automatizado con GitHub Actions |
| RNF-05 | La entrada inválida muestra un mensaje entendible sin cerrar inesperadamente la aplicación. | Pendiente de endurecer |
| RNF-06 | El equipo acuerda criterios medibles de accesibilidad, rendimiento y seguridad antes de una entrega de producción. | Pendiente |

## Aceptación de cambios

- Mantén el estado como pendiente hasta que exista un comportamiento visible.
- Añade pasos manuales de comprobación mientras no haya pruebas automatizadas.
- Actualiza este documento cuando un requisito cambie de estado.

