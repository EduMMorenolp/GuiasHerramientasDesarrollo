# Módulo 9: Drizzle ORM

**Objetivo**: Usar Drizzle ORM para TypeScript con tipado fuerte y migraciones.

---

## Instalación

```powershell
# Para PostgreSQL
npm install drizzle-orm pg
npm install -D drizzle-kit @types/pg

# Para MySQL
npm install drizzle-orm mysql2
npm install -D drizzle-kit

# Para SQLite
npm install drizzle-orm better-sqlite3
npm install -D drizzle-kit @types/better-sqlite3
```

---

## Schema (Definir tablas)

### PostgreSQL
```typescript
import { pgTable, serial, text, timestamp, integer, boolean } from 'drizzle-orm/pg-core';

export const usuarios = pgTable('usuarios', {
    id: serial('id').primaryKey(),
    nombre: text('nombre').notNull(),
    email: text('email').unique().notNull(),
    activo: boolean('activo').default(true),
    creado: timestamp('creado').defaultNow(),
});
```

### MySQL
```typescript
import { mysqlTable, int, varchar, timestamp, boolean } from 'drizzle-orm/mysql-core';

export const productos = mysqlTable('productos', {
    id: int('id').primaryKey().autoincrement(),
    nombre: varchar('nombre', { length: 255 }).notNull(),
    precio: int('precio').notNull(),
});
```

### SQLite
```typescript
import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core';

export const tareas = sqliteTable('tareas', {
    id: integer('id').primaryKey({ autoIncrement: true }),
    titulo: text('titulo').notNull(),
    completada: integer('completada', { mode: 'boolean' }).default(false),
});
```

---

## Consultas

### SELECT
```typescript
import { db } from './db';

// Todos
const todos = await db.select().from(usuarios);

// Filtros
const activos = await db.select()
    .from(usuarios)
    .where(eq(usuarios.activo, true));

// Columnas específicas
const emails = await db.select({ email: usuarios.email })
    .from(usuarios);
```

### INSERT, UPDATE, DELETE
```typescript
// Insertar
const [nuevo] = await db.insert(usuarios)
    .values({ nombre: 'Ana', email: 'ana@mail.com' })
    .returning();

// Actualizar
await db.update(usuarios)
    .set({ activo: false })
    .where(eq(usuarios.email, 'old@mail.com'));

// Eliminar
await db.delete(usuarios)
    .where(eq(usuarios.activo, false));
```

---

## Filtros

```typescript
import { eq, ne, gt, lt, gte, lte, inArray, like, isNull, and, or, not } from 'drizzle-orm';

// Comparación
where(eq(usuarios.id, 1))
where(ne(usuarios.estado, 'inactivo'))
where(gt(usuarios.edad, 18))
where(inArray(usuarios.id, [1, 2, 3]))

// Texto
where(like(usuarios.nombre, '%ana%'))

// Nulos
where(isNull(usuarios.telefono))

// Combinación
where(and(eq(usuarios.activo, true), gt(usuarios.edad, 18)))
where(or(eq(usuarios.rol, 'admin'), eq(usuarios.rol, 'mod')))
```

---

## Joins

```typescript
import { eq } from 'drizzle-orm';

const resultado = await db.select()
    .from(usuarios)
    .leftJoin(pedidos, eq(usuarios.id, pedidos.clienteId));

// innerJoin disponible igual
const resultado = await db.select()
    .from(pedidos)
    .innerJoin(usuarios, eq(pedidos.clienteId, usuarios.id));
```

---

## Migraciones

```powershell
# Configurar drizzle.config.ts
```

```typescript
// drizzle.config.ts
import type { Config } from 'drizzle-kit';
export default {
    schema: './src/schema.ts',
    out: './drizzle',
    dialect: 'postgresql',
    dbCredentials: { url: process.env.DATABASE_URL! },
} satisfies Config;
```

```powershell
# Generar migración
npx drizzle-kit generate

# Aplicar migración
npx drizzle-kit migrate

# Push (sincronizar schema directo, sin archivos)
npx drizzle-kit push
```

---

## Drizzle Studio

```powershell
npx drizzle-kit studio
```

Abre http://localhost:4983 con interfaz gráfica para:
- Navegar tablas y datos
- Ejecutar queries
- Editar registros
- Ver relaciones

---

## Resumen

| Operación | Código |
|-----------|--------|
| Schema | `pgTable`, `mysqlTable`, `sqliteTable` |
| Select | `db.select().from(tabla).where(...)` |
| Insert | `db.insert(tabla).values({...}).returning()` |
| Update | `db.update(tabla).set({...}).where(...)` |
| Delete | `db.delete(tabla).where(...)` |
| Join | `.leftJoin(tabla, eq(a.id, b.fk))` |
| Migrar | `drizzle-kit generate` / `push` / `migrate` |

---

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[10 - Módulo 10 - Replicación, Backup y Extensiones|Módulo 10: Replicación, Backup y Extensiones]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
