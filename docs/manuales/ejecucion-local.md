# Manual de instalación y ejecución local

## Requisitos

- SDK de .NET 10 instalado y disponible en `PATH`.
- Git si clonaste el repositorio.

## Ejecutar

Desde la raíz:

```bash
dotnet --version
dotnet restore NexCodeSales.slnx
dotnet run --project src/NexCodeSales/NexCodeSales.csproj
```

El programa muestra el menú principal. Escribe el número de una opción y presiona Enter. La venta de ejemplo permite elegir un producto y una cantidad; el programa valida el stock antes de registrar la operación.

## Compilar

```bash
dotnet build NexCodeSales.slnx --configuration Release
```

## Notas sobre la sesión

Los datos cargados son demostrativos y viven en memoria. Al cerrar el programa, los productos agregados, existencias modificadas y totales de ventas vuelven a su estado inicial al abrirlo de nuevo.

## Problemas comunes

- `dotnet` no reconocido: instala el SDK de .NET 10 y abre una terminal nueva.
- SDK no compatible: confirma la versión con `dotnet --list-sdks`.
- Entrada inválida cierra una opción: vuelve a iniciar y reporta los pasos en un Issue; el manejo de entrada se irá endureciendo.
