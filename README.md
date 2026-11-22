# Sistema de Ventas NexCode Sales

NexCode Sales es una aplicación de consola en C# para explorar las operaciones básicas de una tienda: consultar productos y existencias, agregar productos y registrar ventas.

## Estado actual

El código fuente proviene del proyecto incluido en `sistema de ventas.rar`. Se organizó bajo `src/NexCodeSales` y se conservó su comportamiento principal. La aplicación es un prototipo académico: mantiene sus datos en memoria mientras está abierta.

## Quiénes lo usan

- **Administrador:** consulta usuarios de ejemplo y ve las funciones previstas para su rol.
- **Vendedor:** consulta productos y clientes, y registra ventas.
- **Cliente:** consulta la lista de clientes de ejemplo.
- **Desarrollador:** compila y continúa el prototipo.

## Funciones implementadas

- Menú de consola con opciones para administrador, vendedor, cliente, productos, inventario, ventas, reportes y salida.
- Lista inicial de tres productos, un cliente y dos usuarios de muestra.
- Consulta de productos, clientes e inventario.
- Alta de productos durante la sesión.
- Registro de una venta de un producto, validación de cantidad y descuento del stock disponible.
- Reporte del total acumulado de ventas y conteos de productos, clientes y usuarios.
- Clasificación de inventario: sin stock, stock bajo (cinco unidades o menos) y disponible.

## Límites conocidos

- Productos, clientes, usuarios, existencias y ventas se reinician al cerrar la aplicación.
- Cada venta contiene un solo producto.
- Los datos de ejemplo y las operaciones son demostrativos.
- El menú presenta opciones por rol, pero no hay inicio de sesión ni verificación de permisos.
- La administración completa de usuarios, clientes, proveedores, promociones y reportes detallados sigue pendiente.
- La lógica y los menús están concentrados en `Program.cs`; separar responsabilidades es una mejora futura.

## Equipo

Las responsabilidades son una propuesta tomada del material de planificación del equipo y deben ratificarse antes de asignarlas como cargos permanentes.

| Integrante | Responsabilidad propuesta |
| --- | --- |
| Colque Mita German Wilfredo | Coordinación y análisis |
| Pozo Teran Axel Erwin | Diseño técnico |
| García Limachi Paola Andrea | Reglas de negocio y validación |
| Fernanda Jarjury Andreia | Documentación y pruebas |

## Requisitos

- SDK de .NET 10.
- Git para clonar y contribuir.
- Windows, macOS o Linux con soporte para aplicaciones de consola .NET.

## Instalar, compilar y ejecutar

Desde la raíz del repositorio:

```bash
dotnet --version
dotnet restore NexCodeSales.slnx
dotnet run --project src/NexCodeSales/NexCodeSales.csproj
```

Para compilar en modo de publicación:

```bash
dotnet build NexCodeSales.slnx --configuration Release
```

Al iniciar, el programa muestra el menú principal. Los cambios permanecen solo durante la sesión.

## Documentación

- [Visión y alcance](docs/vision-y-alcance.md)
- [Requisitos y su estado](docs/requisitos.md)
- [Arquitectura del programa](docs/arquitectura.md)
- [Modelo de datos del Hito 3 y estado de su SQL](docs/modelo-de-datos.md)
- [Plan de trabajo propuesto](docs/planificacion/planificacion.md)
- [Seguimiento](docs/planificacion/seguimiento.md)
- [Diagrama de arquitectura](docs/diagramas/arquitectura.mmd)
- [Manual de ejecución](docs/manuales/ejecucion-local.md)
- [Equipo](docs/equipo/integrantes-y-roles.md) y [acuerdos de trabajo](docs/equipo/acuerdos-de-trabajo.md)

## Base de datos

El modelo relacional propuesto para SQL Server y sus diferencias con el SQL recibido se describen en [modelo de datos](docs/modelo-de-datos.md). La aplicación actual todavía no se conecta a la base. El SQL recibido se conserva como referencia histórica en [database/](database/README.md).

## Calidad

GitHub Actions compila el proyecto en cada cambio a la rama principal y en cada pull request. No se incluye aún un proyecto de pruebas automatizadas; la compilación no sustituye las pruebas funcionales.

Consulta [cómo contribuir](CONTRIBUTING.md), el [registro de cambios](CHANGELOG.md), la [política de seguridad](SECURITY.md) y el aviso de [licencia](LICENSE).



