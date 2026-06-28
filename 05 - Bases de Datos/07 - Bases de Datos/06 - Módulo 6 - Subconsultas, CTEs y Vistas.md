# MÃ³dulo 6: Subconsultas, CTEs y Vistas

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

### CTE recursiva (jerarquÃ­as)
```sql
WITH RECURSIVE organigrama AS (
    -- Base: empleado raÃ­z
    SELECT id, nombre, jefe_id, 1 as nivel
    FROM empleados WHERE jefe_id IS NULL

    UNION ALL

    -- RecursiÃ³n: subordinados
    SELECT e.id, e.nombre, e.jefe_id, o.nivel + 1
    FROM empleados e
    JOIN organigrama o ON e.jefe_id = o.id
)
SELECT * FROM organigrama ORDER BY nivel, nombre;
```

Ãštil para: Ã¡rboles (categorÃ­as, organigramas), grafos, secuencias.

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

-- Ãndice sobre vista materializada
CREATE INDEX ON resumen_ventas(cliente_id);
```

---

## ComparaciÃ³n

| Elemento | EvaluaciÃ³n | Almacena datos | Actualizable |
|----------|------------|----------------|--------------|
| Subconsulta | Cada ejecuciÃ³n | No | N/A |
| CTE | Una vez por consulta | No (volÃ¡til) | N/A |
| Vista normal | Cada SELECT | No | SÃ­ (simple) |
| Vista materializada | Al refrescar | SÃ­ | Solo vÃ­a REFRESH |

---
**DocumentaciÃ³n oficial**: https://www.postgresql.org/docs/

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[07 - MÃ³dulo 7 - Window Functions y AnÃ¡lisis|MÃ³dulo 7: Window Functions y AnÃ¡lisis]]
**Documentación oficial**: https://www.w3schools.com/sql/

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




