# MER Studio — Visualizador, Validador y Editor de Modelo Entidad-Relación (Prisma, Mermaid & SQL)

Aplicación interactiva para visualizar, diseñar, validar y convertir esquemas de base de datos entre **Prisma (`schema.prisma`)**, **Mermaid (`erDiagram`)** y **SQL DDL (`PostgreSQL` y `MySQL`)** en tiempo real.

## Características principales

- **Sincronización Multidireccional (`Prisma ↔ Mermaid ↔ SQL DDL ↔ Modelo Visual`)**:
  - Edita código en sintaxis `schema.prisma`, `erDiagram` de Mermaid o sentencias `CREATE TABLE` / `ALTER TABLE` de SQL y observa el diagrama actualizarse en tiempo real.
  - Cambia entre las pestañas **Prisma**, **Mermaid** y **SQL DDL** (con selector entre **PostgreSQL** y **MySQL / MariaDB**) para traducir automáticamente modelos, claves primarias (`PK`), claves foráneas (`FK`), restricciones únicas (`UK`), tipos de datos, cardinalidades y `enums`.
- **Algoritmos Avanzados de Auto-Ordenamiento para Esquemas Grandes**:
  - **✨ Jerárquico (Sugiyama + Barycenter)**: Ordena de Padres a Hijos, minimiza cruces de líneas, divide capas extensas en sub-columnas balanceadas y agrupa tablas aisladas sin solapamientos.
  - **🗂️ Módulos (Clústeres)**: Detecta las tablas centrales (*hubs*) y agrupa sus tablas satélite por dominio.
  - **⊞ Masonry**: Empaqueta las tablas en la columna más corta disponible considerando la altura real de cada tarjeta.
  - **👁️ Modo Compacto (`Solo Claves / Todos`)**: Permite contraer campos no clave (`PK`, `FK`, `UK`) globalmente o por entidad individual (`▾ / ▸`).
  - **📐 Enrutamiento Ortogonal y Curvo**: Líneas escalonadas con canales separados y resaltado inteligente al seleccionar o pasar el cursor sobre cualquier entidad.
- **Motor de Validación y Auto-Corrección (`✅ Validar`)**:
  - Detecta en tiempo real entidades sin clave primaria (`@id` / `PK`), campos duplicados, tipos incompatibles entre `PK` y `FK`, conflictos entre `onDelete: SetNull` y campos `NOT NULL`, convenciones `PascalCase` y entidades aisladas.
  - Incluye botones de **Auto-Corregir** individual o global (**🪄 Auto-Corregir Todo**).
- **Importación y Exportación**:
  - Importa archivos `.prisma`, `.mmd`, `.mermaid`, `.sql` o `.json`.
  - Exporta a `schema.prisma`, `diagram.mmd`, `schema-postgres.sql`, `schema-mysql.sql`, `erd-diagram.svg` o `erd-model.json`.

## Estructura del Proyecto

- `index.html`: Aplicación web autocontenida lista para abrir en cualquier navegador.
- `examples/ecommerce.prisma`: Ejemplo de esquema Prisma de comercio electrónico.
- `examples/hospital.mmd`: Ejemplo de diagrama Mermaid `erDiagram` para un sistema clínico.
- `examples/ecommerce.sql`: Ejemplo de esquema SQL DDL para PostgreSQL.
