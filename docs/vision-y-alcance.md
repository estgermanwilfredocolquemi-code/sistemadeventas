# Visión y alcance

## Visión

NexCode Sales es un prototipo de consola para apoyar las tareas diarias de una tienda: revisar el catálogo, conocer las existencias y registrar ventas sencillas.

## Problema que aborda

El programa reúne en un solo flujo de consola la consulta de productos y existencias y una operación de venta. Permite mostrar cómo cambia el stock después de vender un producto.

## Usuarios objetivo

- **Administrador:** consulta usuarios de ejemplo y revisa las funciones previstas para su rol.
- **Vendedor:** consulta productos y clientes y registra una venta.
- **Cliente:** consulta una lista demostrativa de clientes.
- **Estudiante o desarrollador:** ejecuta el prototipo y lo amplía para el curso.

## Alcance implementado

La aplicación carga productos, clientes y usuarios demostrativos. Permite listar esos elementos, agregar productos durante la sesión, consultar el estado del inventario, registrar la venta de un producto y mostrar un total acumulado de la sesión.

## Modelo de datos del Hito 3

El equipo documentó un diseño relacional final para SQL Server. Ese diseño es una entrega académica independiente: no está conectado a la aplicación y no cambia el alcance implementado descrito arriba. Su estado y las diferencias del SQL recibido se detallan en [modelo-de-datos.md](modelo-de-datos.md).

## Fuera del alcance actual

La aplicación no conserva cambios al cerrar, no incluye interfaz gráfica o web, no implementa inicio de sesión, no permite una venta con varios productos y no ofrece mantenimiento completo de todos los catálogos. Estas funciones deben priorizarse en el equipo antes de planificar su desarrollo.

## Criterios para continuar

- Una persona puede compilar y ejecutar el programa siguiendo el manual.
- Cada requisito indica si está implementado o propuesto.
- Cada cambio de comportamiento describe cómo se comprueba.
- Las responsabilidades y fechas propuestas se ratifican por el equipo antes de tratarlas como compromisos.

