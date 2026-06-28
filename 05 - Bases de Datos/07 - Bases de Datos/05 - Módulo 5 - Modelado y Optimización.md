# Módulo 5: Modelado y Optimización

**Objetivo**: Diseñar esquemas normalizados y optimizar consultas.

---

## Normalización

### 1NF (Primera Forma Normal)
- Cada celda contiene un solo valor atómico
- Cada fila es única (PK)
- No grupos repetitivos

### 2NF (Segunda Forma Normal)
- Está en 1NF
- Cada atributo no clave depende de la clave completa (no parcial)

### 3NF (Tercera Forma Normal)
- Está en 2NF
- Cada atributo no clave depende solo de la clave primaria (no transitivamente)

```sql
-- Antes (no normalizado)
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_nombre TEXT,
    cliente_email TEXT,
    producto1 TEXT, producto_precio1 DECIMAL,
    producto2 TEXT, producto_precio2 DECIMAL
);

-- Después (3NF)
CREATE TABLE clientes (id SERIAL PRIMARY KEY, nombre TEXT, email TEXT UNIQUE);
CREATE TABLE productos (id SERIAL PRIMARY KEY, nombre TEXT, precio DECIMAL);
CREATE TABLE pedidos (id SERIAL PRIMARY KEY, cliente_id INT REFERENCES clientes(id));
CREATE TABLE pedidos_items (pedido_id INT REFERENCES pedidos(id), producto_id INT REFERENCES productos(id), cantidad INT);
```

---

## Índices

```sql
-- Índice simple
CREATE INDEX idx_usuarios_email ON usuarios(email);

-- Índice compuesto (orden importa)
CREATE INDEX idx_ordenes_fecha_estado ON ordenes(fecha, estado);

-- Índice parcial (solo filas que cumplen condición)
CREATE INDEX idx_pedidos_activos ON pedidos(estado) WHERE estado = 'pendiente';

-- Índice único
CREATE UNIQUE INDEX idx_email_unico ON usuarios(email);

-- Ver índices
SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'usuarios';
```

### Cuándo indexar
- Columnas usadas en `WHERE`, `JOIN`, `ORDER BY`
- Columnas con alta cardinalidad (muchos valores distintos)
- No indexar columnas con pocos valores (ej: booleano)
- Los índices ralentizan `INSERT`/`UPDATE`/`DELETE`

---

## EXPLAIN ANALYZE

```sql
-- Ver plan de ejecución
EXPLAIN SELECT * FROM usuarios WHERE email = 'test@mail.com';

-- Con ejecución real
EXPLAIN ANALYZE SELECT * FROM usuarios WHERE email = 'test@mail.com';

-- En MySQL
EXPLAIN FORMAT=JSON SELECT * FROM usuarios;
```
Leer: buscar `Seq Scan` (malo) vs `Index Scan` (bueno).

---

## Transacciones

```sql
BEGIN;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- Rollback
BEGIN;
DELETE FROM logs;
ROLLBACK;

-- Savepoints
BEGIN;
INSERT INTO tabla VALUES (1);
SAVEPOINT sp1;
INSERT INTO tabla VALUES (2);
ROLLBACK TO sp1;  -- Deshace solo el segundo INSERT
COMMIT;
```

---

## Connection Pooling

### Node.js
```javascript
// pg (PostgreSQL)
const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

// mysql2
const mysql = require('mysql2/promise');
const pool = mysql.createPool({ host: 'localhost', user: 'root', database: 'test' });
```

---

## Buenas Prácticas

| Práctica | Detalle |
|----------|---------|
| **Siempre WHERE con índice** | Evitar full scans en tablas grandes |
| **No SELECT *** | Seleccionar solo columnas necesarias |
| **Usar JOINs explícitos** | Evitar joins implícitos con WHERE |
| **Prefijo de índices** | En MySQL, indexar solo N caracteres en TEXT |
| **VACUUM periódico** | PostgreSQL: recuperar espacio |
| **Analizar tablas** | `ANALYZE` para estadísticas actualizadas |
| **Evitar funciones en WHERE** | `WHERE YEAR(fecha) = 2024` â†’ ineficiente (usar rango) |

---

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[06 - Módulo 6 - Subconsultas, CTEs y Vistas|Módulo 6: Subconsultas, CTEs y Vistas]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
