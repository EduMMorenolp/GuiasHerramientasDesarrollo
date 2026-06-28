# Módulo 7: Window Functions y Análisis

**Objetivo**: Realizar análisis avanzados con funciones de ventana.

---

## OVER: La Cláusula Fundamental

```sql
SELECT nombre,
       salario,
       AVG(salario) OVER () as promedio_global,
       AVG(salario) OVER (PARTITION BY departamento) as promedio_depto
FROM empleados;
```

### Componentes
```sql
OVER (
    PARTITION BY columna   -- Divide en grupos (like GROUP BY sin agrupar)
    ORDER BY columna       -- Orden dentro del grupo
    ROWS BETWEEN ...       -- Frame (ventana deslizante)
)
```

---

## Funciones de Numeración

```sql
SELECT nombre, salario,
       ROW_NUMBER() OVER (ORDER BY salario DESC) as fila,
       RANK()       OVER (ORDER BY salario DESC) as ranking,
       DENSE_RANK() OVER (ORDER BY salario DESC) as ranking_denso,
       NTILE(4)     OVER (ORDER BY salario DESC) as cuartil
FROM empleados;
```

| Función | Empates | Huecos |
|---------|---------|--------|
| `ROW_NUMBER` | No (desempata arbitrariamente) | No |
| `RANK` | Sí (mismo valor, mismo rango) | Sí |
| `DENSE_RANK` | Sí (mismo valor, mismo rango) | No |
| `NTILE(n)` | Divide en n grupos | No |

---

## Funciones de Desplazamiento

```sql
SELECT fecha, monto,
       LAG(monto)  OVER (ORDER BY fecha) as mes_anterior,
       LEAD(monto) OVER (ORDER BY fecha) as mes_siguiente,
       monto - LAG(monto) OVER (ORDER BY fecha) as variacion
FROM ventas;

-- Con offset por defecto
LAG(monto, 2)            -- Dos filas atrás
LEAD(monto, 1, 0)        -- Una adelante, default 0 si no hay
```

### FIRST_VALUE y LAST_VALUE
```sql
SELECT fecha, monto,
       FIRST_VALUE(monto) OVER (ORDER BY fecha) as primer_valor,
       LAST_VALUE(monto)  OVER (ORDER BY fecha
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as ultimo
FROM ventas;
```

---

## Funciones de Agregación como Ventana

```sql
SELECT fecha, monto,
       SUM(monto)   OVER (ORDER BY fecha) as running_total,
       AVG(monto)   OVER (ORDER BY fecha ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as media_movil_3m,
       MAX(monto)   OVER (PARTITION BY YEAR(fecha)) as max_anual
FROM ventas;
```

---

## Casos de Uso

### Top-N por grupo
```sql
WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY departamento ORDER BY salario DESC) as rn
    FROM empleados
)
SELECT * FROM ranked WHERE rn <= 3;
```

### Running total
```sql
SELECT fecha, monto,
       SUM(monto) OVER (ORDER BY fecha) as acumulado
FROM transacciones;
```

### Detectar duplicados
```sql
SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as rn
FROM usuarios;
-- rn > 1 son duplicados
```

### Comparación año contra año (YoY)
```sql
SELECT EXTRACT(YEAR FROM fecha) as año,
       SUM(monto) as total,
       LAG(SUM(monto)) OVER (ORDER BY EXTRACT(YEAR FROM fecha)) as año_anterior,
       (SUM(monto) - LAG(SUM(monto)) OVER (ORDER BY EXTRACT(YEAR FROM fecha))) / LAG(SUM(monto)) OVER (ORDER BY EXTRACT(YEAR FROM fecha)) * 100 as crecimiento
FROM ventas
GROUP BY EXTRACT(YEAR FROM fecha);
```

---

## Resumen

| Función | Propósito |
|---------|-----------|
| `ROW_NUMBER` | Numerar filas |
| `RANK` / `DENSE_RANK` | Ranking con/sin huecos |
| `NTILE` | Dividir en percentiles |
| `LAG` / `LEAD` | Acceder a filas anterior/siguiente |
| `FIRST_VALUE` / `LAST_VALUE` | Primero/último del grupo |
| Agregados + OVER | Running total, media móvil |

---

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[08 - Módulo 8 - PL_pgSQL, Transacciones y MVCC|Módulo 8: PL/pgSQL, Transacciones y MVCC]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
