# MÃ³dulo 5: Modelado y OptimizaciÃ³n

**Objetivo**: DiseÃ±ar esquemas normalizados y optimizar consultas.

---

## NormalizaciÃ³n

### 1NF (Primera Forma Normal)
- Cada celda contiene un solo valor atÃ³mico
- Cada fila es Ãºnica (PK)
- No grupos repetitivos

### 2NF (Segunda Forma Normal)
- EstÃ¡ en 1NF
- Cada atributo no clave depende de la clave completa (no parcial)

### 3NF (Tercera Forma Normal)
- EstÃ¡ en 2NF
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

-- DespuÃ©s (3NF)
CREATE TABLE clientes (id SERIAL PRIMARY KEY, nombre TEXT, email TEXT UNIQUE);
CREATE TABLE productos (id SERIAL PRIMARY KEY, nombre TEXT, precio DECIMAL);
CREATE TABLE pedidos (id SERIAL PRIMARY KEY, cliente_id INT REFERENCES clientes(id));
CREATE TABLE pedidos_items (pedido_id INT REFERENCES pedidos(id), producto_id INT REFERENCES productos(id), cantidad INT);
```

---

## Ãndices

```sql
-- Ãndice simple
CREATE INDEX idx_usuarios_email ON usuarios(email);

-- Ãndice compuesto (orden importa)
CREATE INDEX idx_ordenes_fecha_estado ON ordenes(fecha, estado);

-- Ãndice parcial (solo filas que cumplen condiciÃ³n)
CREATE INDEX idx_pedidos_activos ON pedidos(estado) WHERE estado = 'pendiente';

-- Ãndice Ãºnico
CREATE UNIQUE INDEX idx_email_unico ON usuarios(email);

-- Ver Ã­ndices
SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'usuarios';
```

### CuÃ¡ndo indexar
- Columnas usadas en `WHERE`, `JOIN`, `ORDER BY`
- Columnas con alta cardinalidad (muchos valores distintos)
- No indexar columnas con pocos valores (ej: booleano)
- Los Ã­ndices ralentizan `INSERT`/`UPDATE`/`DELETE`

---

## EXPLAIN ANALYZE

```sql
-- Ver plan de ejecuciÃ³n
EXPLAIN SELECT * FROM usuarios WHERE email = 'test@mail.com';

-- Con ejecuciÃ³n real
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

## Buenas PrÃ¡cticas

| PrÃ¡ctica | Detalle |
|----------|---------|
| **Siempre WHERE con Ã­ndice** | Evitar full scans en tablas grandes |
| **No SELECT *** | Seleccionar solo columnas necesarias |
| **Usar JOINs explÃ­citos** | Evitar joins implÃ­citos con WHERE |
| **Prefijo de Ã­ndices** | En MySQL, indexar solo N caracteres en TEXT |
| **VACUUM periÃ³dico** | PostgreSQL: recuperar espacio |
| **Analizar tablas** | `ANALYZE` para estadÃ­sticas actualizadas |
| **Evitar funciones en WHERE** | `WHERE YEAR(fecha) = 2024` â†’ ineficiente (usar rango) |

---

**DocumentaciÃ³n oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[06 - MÃ³dulo 6 - Subconsultas, CTEs y Vistas|MÃ³dulo 6: Subconsultas, CTEs y Vistas]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
