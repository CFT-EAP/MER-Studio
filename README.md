# MER Studio — Visualizador, Validador y Editor de Modelo Entidad-Relación (Prisma, Mermaid & SQL)

Aplicación interactiva para visualizar, diseñar, validar y convertir esquemas de base de datos entre **Prisma (`schema.prisma`)**, **Mermaid (`erDiagram`)** y **SQL DDL (`PostgreSQL` y `MySQL`)** en tiempo real.

## Características principales

- **Sincronización Multidireccional (`Prisma ↔ Mermaid ↔ SQL DDL ↔ Modelo Visual`)**:
  - Edita código en sintaxis `schema.prisma`, `erDiagram` de Mermaid o sentencias `CREATE TABLE` / `ALTER TABLE` de SQL y observa el diagrama actualizarse en tiempo real.
  - Cambia entre las pestañas **Prisma**, **Mermaid** y **SQL DDL** (con selector entre **PostgreSQL** y **MySQL / MariaDB**) para traducir automáticamente modelos, claves primarias (`PK`), claves foráneas (`FK`), restricciones únicas (`UK`), tipos de datos, cardinalidades y `enums`.
- **Motor de Validación y Auto-Corrección (`✅ Validar`)**:
  - Detecta en tiempo real entidades sin clave primaria (`@id` / `PK`), campos duplicados, tipos incompatibles entre `PK` y `FK`, conflictos entre `onDelete: SetNull` y campos `NOT NULL`, convenciones `PascalCase` y entidades aisladas.
  - Incluye botones de **Auto-Corregir** individual o global (**🪄 Auto-Corregir Todo**).
- **Lienzo Interactivo con Notación Crow's Foot**:
  - Arrastra entidades con ajuste a cuadrícula, haz *pan & zoom* con el ratón y usa algoritmos de auto-ordenamiento (**Auto-Ordenar en Capas** o **Cuadrícula**).
  - Líneas de relación conectadas directamente a los campos origen y destino con marcadores **Crow's Foot** (`||`, `|o`, `|{`, `o{`).
- **Importación y Exportación**:
  - Importa archivos `.prisma`, `.mmd`, `.mermaid`, `.sql` o `.json`.
  - Exporta a `schema.prisma`, `diagram.mmd`, `schema-postgres.sql`, `schema-mysql.sql`, `erd-diagram.svg` o `erd-model.json`.

## Estructura del Proyecto

- `index.html`: Aplicación web autocontenida lista para abrir en cualquier navegador.
- `examples/ecommerce.prisma`: Ejemplo de esquema Prisma de comercio electrónico.
- `examples/hospital.mmd`: Ejemplo de diagrama Mermaid `erDiagram` para un sistema clínico.
- `examples/ecommerce.sql`: Ejemplo de esquema SQL DDL para PostgreSQL.
