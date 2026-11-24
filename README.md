# NexCode Sales

Prototipo académico de un sistema de ventas desarrollado en C# con .NET 10. Es una aplicación de consola para consultar productos y existencias, agregar productos y registrar ventas durante la sesión.

## Contenido

- [Estado del proyecto](#estado-del-proyecto)
- [Funciones disponibles](#funciones-disponibles)
- [Requisitos](#requisitos)
- [Instalación y ejecución](#instalación-y-ejecución)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Base de datos](#base-de-datos)
- [Calidad y pruebas](#calidad-y-pruebas)
- [Documentación](#documentación)
- [Contribuir](#contribuir)

## Estado del proyecto

El sistema es un prototipo funcional para demostración. Los datos de productos, clientes, usuarios, existencias y ventas se guardan en memoria y se pierden al cerrar la aplicación. No hay inicio de sesión, control real de permisos ni conexión a una base de datos.

## Funciones disponibles

- Consultar productos, clientes e inventario.
- Agregar productos durante la sesión.
- Registrar una venta de un producto, validar la cantidad y descontar existencias.
- Consultar un resumen de ventas y cantidades de registros.
- Identificar productos sin stock, con stock bajo (cinco unidades o menos) y disponibles.
- Explorar menús demostrativos para administrador, vendedor y cliente.

Los menús por rol son informativos: no restringen el acceso a las operaciones. Cada venta contempla un solo producto.

## Requisitos

- SDK de .NET 10.
- Git.
- Windows, macOS o Linux.

Comprueba la versión del SDK:

```bash
dotnet --version
```

## Instalación y ejecución

Clona el repositorio y entra en su carpeta:

```bash
git clone https://github.com/estgermanwilfredocolquemi-code/sistemadeventas.git
cd sistemadeventas
```

Restaura dependencias y ejecuta la aplicación:

```bash
dotnet restore NexCodeSales.slnx
dotnet run --project src/NexCodeSales/NexCodeSales.csproj
```

Para compilar en modo Release:

```bash
dotnet build NexCodeSales.slnx --configuration Release
```

Al iniciar, sigue las opciones del menú en la consola. Los cambios realizados durante la ejecución no se conservan al cerrar.

## Estructura del repositorio

```text
.
├── .github/                 # Plantillas y flujo de compilación de GitHub Actions
├── database/
│   └── legacy/              # SQL histórico, conservado solo como referencia
├── docs/                    # Arquitectura, requisitos, modelo de datos y guías
├── scripts/                 # Utilidades para compilación
├── src/
│   └── NexCodeSales/        # Aplicación de consola .NET
├── tests/                   # Notas sobre pruebas; aún no hay suite automatizada
├── NexCodeSales.slnx        # Solución .NET
└── README.md
```

Actualmente, la lógica y los menús de la aplicación están concentrados en `src/NexCodeSales/Program.cs`. Separarlos en componentes y crear un proyecto de pruebas son mejoras futuras.

## Base de datos

La aplicación todavía no utiliza SQL Server ni otra persistencia. El modelo de datos propuesto y el estado del SQL recibido están descritos en [docs/modelo-de-datos.md](docs/modelo-de-datos.md). El script bajo [database/legacy](database/legacy/) es histórico y no debe usarse para inicializar una base de datos real.

## Calidad y pruebas

GitHub Actions restaura y compila la solución en los cambios y pull requests. Aún no existe un proyecto de pruebas automatizadas; compilar confirma que el código se construye, pero no valida el comportamiento de las ventas.

## Documentación

- [Visión y alcance](docs/vision-y-alcance.md)
- [Requisitos](docs/requisitos.md)
- [Arquitectura](docs/arquitectura.md)
- [Modelo de datos](docs/modelo-de-datos.md)
- [Planificación](docs/planificacion/planificacion.md) y [seguimiento](docs/planificacion/seguimiento.md)
- [Diagrama de arquitectura](docs/diagramas/arquitectura.mmd)
- [Ejecución local](docs/manuales/ejecucion-local.md)
- [Equipo](docs/equipo/integrantes-y-roles.md) y [acuerdos de trabajo](docs/equipo/acuerdos-de-trabajo.md)
- [Base de datos](database/README.md)

## Contribuir

Consulta [CONTRIBUTING.md](CONTRIBUTING.md) antes de proponer cambios. Para reportar un problema, utiliza las plantillas de [issues](https://github.com/estgermanwilfredocolquemi-code/sistemadeventas/issues/new/choose).

También puedes revisar el [registro de cambios](CHANGELOG.md), la [política de seguridad](SECURITY.md) y la [licencia](LICENSE).
