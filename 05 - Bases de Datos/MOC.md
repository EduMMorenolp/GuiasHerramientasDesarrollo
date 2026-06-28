# MOC - Bases de Datos

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### SQLite ↔ PostgreSQL ↔ MySQL
- Todos son sistemas de bases de datos relacionales con SQL como lenguaje común
- SQLite es embebida y serverless; PostgreSQL y MySQL son cliente-servidor
- Drizzle ORM abstrae diferencias entre ellos

### Redis ↔ Bases de Datos Relacionales
- Redis como caché frente a PostgreSQL/MySQL (patrón cache-aside)
- Redis como message broker (pub/sub, streams) para cambios en BD
- Sesiones de usuario en Redis, datos persistentes en BD relacional

### Drizzle ORM ↔ SQL
- Drizzle genera SQL tipado a partir de schemas en TypeScript
- Compatible con PostgreSQL, MySQL, SQLite
- Migraciones, queries, relaciones sin necesidad de SQL raw

## Elección de Motor

| Necesidad | Recomendación |
|-----------|---------------|
| Embeber en app, prototipos | SQLite |
| Producción, datos relacionales | PostgreSQL |
| Ecosistema PHP, alta disponibilidad | MySQL |
| Caché, sesiones, pub/sub, colas | Redis |

---
**Inicio herramienta**: [[Índice General]]
