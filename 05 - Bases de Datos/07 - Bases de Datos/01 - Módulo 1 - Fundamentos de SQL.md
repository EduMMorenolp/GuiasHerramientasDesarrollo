# Módulo 1: Fundamentos de SQL

**Objetivo**: Dominar las operaciones fundamentales de SQL y conocer los tipos de datos de los principales motores.

---

## Consultas Básicas

### SELECT y WHERE
```sql
SELECT col1, col2 FROM tabla WHERE condicion;

-- Filtros comunes
WHERE id = 1
WHERE nombre LIKE '%patron%'
WHERE precio BETWEEN 10 AND 20
WHERE col IN ('a', 'b', 'c')
WHERE col IS NULL
```

### Ordenamiento y Límite
```sql
SELECT * FROM productos ORDER BY precio DESC LIMIT 10;
SELECT * FROM clientes ORDER BY apellido ASC, nombre ASC;
```

---

## Joins

| Join | Descripción |
|------|-------------|
| `INNER JOIN` | Solo registros coincidentes en ambas tablas |
| `LEFT JOIN` | Todos los de izquierda + coincidentes de derecha |
| `RIGHT JOIN` | Todos los de derecha + coincidentes de izquierda |
| `FULL JOIN` | Todos los registros de ambas tablas |
| `CROSS JOIN` | Producto cartesiano |

```sql
SELECT o.id, c.nombre
FROM ordenes o
INNER JOIN clientes c ON o.cliente_id = c.id;

SELECT * FROM empleados e
LEFT JOIN departamentos d ON e.depto_id = d.id;
```

---

## Agregación

```sql
SELECT COUNT(*) as total,
       AVG(precio) as promedio,
       SUM(stock) as inventario,
       MIN(precio) as mas_barato,
       MAX(precio) as mas_caro
FROM productos;

-- GROUP BY
SELECT categoria, COUNT(*) as cantidad
FROM productos
GROUP BY categoria;

-- HAVING (filtro sobre agregados)
SELECT categoria, AVG(precio) as promedio
FROM productos
GROUP BY categoria
HAVING AVG(precio) > 50;
```

---

## Modificación de Datos

```sql
-- Insertar
INSERT INTO usuarios (nombre, email) VALUES ('Ana', 'ana@mail.com');

-- Actualizar
UPDATE productos SET precio = precio * 1.1 WHERE categoria = 'electronica';

-- Eliminar
DELETE FROM logs WHERE fecha < '2024-01-01';
```

---

## DDL (Data Definition Language)

```sql
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE usuarios ADD COLUMN telefono VARCHAR(20);
DROP TABLE usuarios;
```

---

## Tipos de Datos por Motor

| Tipo | SQLite | MySQL | PostgreSQL |
|------|--------|-------|------------|
| Entero | INTEGER | INT, BIGINT | INTEGER, BIGINT, SERIAL |
| Decimal | REAL | DECIMAL, FLOAT | NUMERIC, REAL |
| Texto | TEXT | VARCHAR, TEXT | VARCHAR, TEXT |
| Fecha | TEXT | DATETIME, TIMESTAMP | TIMESTAMP, DATE |
| Binario | BLOB | BLOB | BYTEA |
| JSON | TEXT (funciones) | JSON, JSONB | JSON, JSONB |
| UUID | TEXT | BINARY(16) | UUID |
| Array | No | No | Sí |
| Booleano | INTEGER 0/1 | BOOLEAN, TINYINT | BOOLEAN |

---

## Resumen

| Cláusula | Propósito |
|----------|-----------|
| `SELECT` | Proyectar columnas |
| `WHERE` | Filtrar filas |
| `JOIN` | Combinar tablas |
| `GROUP BY` | Agrupar para agregación |
| `HAVING` | Filtrar grupos |
| `ORDER BY` | Ordenar resultados |
| `LIMIT` | Restringir cantidad |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[02 - Módulo 2 - SQLite\|Módulo 2: SQLite]] |
| **Inicio herramienta** | [[bd\|Bases de Datos]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Bases de Datos Docs](https://www.w3schools.com/sql/) |

---
