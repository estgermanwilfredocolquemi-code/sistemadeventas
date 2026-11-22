# Scripts de base de datos

La aplicación de consola todavía no usa persistencia SQL. El modelo final de base de datos descrito para el Hito 3 está documentado en [`docs/modelo-de-datos.md`](../docs/modelo-de-datos.md), pero el SQL incluido en el RAR corresponde a una versión anterior.

## Archivo recibido

[`legacy/sistemaventas.sql`](legacy/sistemaventas.sql) se conserva como referencia del SQL recibido. No es el script final: crea 18 tablas y conserva nombres y columnas que el documento del Hito dice haber cambiado. El archivo original contenía una operación que eliminaba y recreaba `SistemaVentas` y contraseñas de ejemplo en texto plano; esta copia evita borrar una base existente y reemplaza las contraseñas por marcadores. Aun así, no es el modelo final ni debe usarse para inicializar una base real.

El RAR no incluyó el script físico final de 17 tablas ni el diagrama draw.io que el documento del Hito enumera. Añade esos archivos cuando estén disponibles para verificar la coherencia antes de marcar SQL Server como integrado.
