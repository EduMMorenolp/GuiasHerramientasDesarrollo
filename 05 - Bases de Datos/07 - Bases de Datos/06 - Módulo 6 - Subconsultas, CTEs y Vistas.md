# Módulo 6: Subconsultas, CTEs y Vistas

**Objetivo**: Escribir consultas anidadas, CTEs recursivas y crear vistas.

---

## Subconsultas

### En WHERE
```sql
SELECT nombre FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos);

SELECT * FROM clientes
WHERE id IN (SELECT cliente_id FROM pedidos WHERE total > 100);
```

### En FROM (tabla derivada)
```sql
SELECT categoria, promedio
FROM (
    SELECT categoria, AVG(precio) as promedio
    FROM productos
    GROUP BY categoria
) res
WHERE promedio > 50;
```

### En SELECT
```sql
SELECT nombre,
       (SELECT COUNT(*) FROM pedidos WHERE cliente_id = c.id) as total_pedidos
FROM clientes c;
```

---

## LATERAL (PostgreSQL)

Permite referenciar columnas de la tabla anterior en la subconsulta:

```sql
SELECT c.nombre, top_p.monto
FROM clientes c
LEFT JOIN LATERAL (
    SELECT monto FROM pedidos
    WHERE cliente_id = c.id
    ORDER BY monto DESC
    LIMIT 3
) top_p ON true;
```

---

## CTEs (Common Table Expressions)

### CTE simple
```sql
WITH ventas_2024 AS (
    SELECT cliente_id, SUM(total) as total
    FROM pedidos WHERE YEAR(fecha) = 2024
    GROUP BY cliente_id
)
SELECT c.nombre, v.total
FROM clientes c
JOIN ventas_2024 v ON c.id = v.cliente_id
ORDER BY v.total DESC;
```

### CTE recursiva (jerarquías)
```sql
WITH RECURSIVE organigrama AS (
    -- Base: empleado raíz
    SELECT id, nombre, jefe_id, 1 as nivel
    FROM empleados WHERE jefe_id IS NULL

    UNION ALL

    -- Recursión: subordinados
    SELECT e.id, e.nombre, e.jefe_id, o.nivel + 1
    FROM empleados e
    JOIN organigrama o ON e.jefe_id = o.id
)
SELECT * FROM organigrama ORDER BY nivel, nombre;
```

Ãštil para: árboles (categorías, organigramas), grafos, secuencias.

---

## Vistas

### Vista simple
```sql
CREATE VIEW clientes_vip AS
SELECT * FROM clientes WHERE total_compras > 10000;

SELECT * FROM clientes_vip;
```

### Vista con JOINs
```sql
CREATE VIEW pedidos_detalle AS
SELECT p.id, c.nombre, pr.descripcion, pi.cantidad
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
JOIN pedidos_items pi ON pi.pedido_id = p.id
JOIN productos pr ON pr.id = pi.producto_id;
```

### Vistas materializadas (PostgreSQL)
```sql
CREATE MATERIALIZED VIEW resumen_ventas AS
SELECT cliente_id, SUM(total) as total
FROM pedidos GROUP BY cliente_id;

-- Refrescar datos
REFRESH MATERIALIZED VIEW resumen_ventas;

-- Índice sobre vista materializada
CREATE INDEX ON resumen_ventas(cliente_id);
```

---

## Comparación

| Elemento | Evaluación | Almacena datos | Actualizable |
|----------|------------|----------------|--------------|
| Subconsulta | Cada ejecución | No | N/A |
| CTE | Una vez por consulta | No (volátil) | N/A |
| Vista normal | Cada SELECT | No | Sí (simple) |
| Vista materializada | Al refrescar | Sí | Solo vía REFRESH |

---

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[07 - Módulo 7 - Window Functions y Análisis|Módulo 7: Window Functions y Análisis]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
