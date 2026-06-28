# Módulo 8: PL/pgSQL, Transacciones y MVCC

**Objetivo**: Programar con PL/pgSQL, manejar transacciones avanzadas y entender MVCC.

---

## PL/pgSQL

### Bloques
```sql
DO $$
DECLARE
    total_vendido DECIMAL;
BEGIN
    SELECT SUM(monto) INTO total_vendido FROM pedidos;
    RAISE NOTICE 'Total vendido: %', total_vendido;
END $$;
```

### Funciones
```sql
CREATE FUNCTION calcular_iva(precio DECIMAL)
RETURNS DECIMAL AS $$
BEGIN
    RETURN precio * 0.21;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_iva(100);
```

### Funciones con tabla
```sql
CREATE FUNCTION obtener_pedidos_cliente(cliente_id INT)
RETURNS TABLE(id INT, fecha DATE, total DECIMAL) AS $$
BEGIN
    RETURN QUERY SELECT p.id, p.fecha, p.total
    FROM pedidos p WHERE p.cliente_id = cliente_id;
END;
$$ LANGUAGE plpgsql;
```

### Triggers
```sql
CREATE FUNCTION auditar_cambios()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria(tabla, accion, usuario)
    VALUES (TG_TABLE_NAME, TG_OP, current_user);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_auditar
AFTER INSERT OR UPDATE OR DELETE ON usuarios
FOR EACH ROW EXECUTE FUNCTION auditar_cambios();
```

---

## Transacciones Avanzadas

```sql
-- Savepoints
BEGIN;
    UPDATE inventario SET stock = stock - 1 WHERE id = 10;
    SAVEPOINT sp_venta;
    INSERT INTO pedidos (cliente_id, total) VALUES (1, 500);
    ROLLBACK TO sp_venta;  -- Deshace solo el INSERT
COMMIT;

-- Rollback total
BEGIN;
    DELETE FROM datos_temporales;
ROLLBACK;
```

---

## MVCC (Multiversion Concurrency Control)

### Conceptos clave
- **xmin/xmax**: IDs de transacción que crean/eliminan una versión de fila
- **Dead tuples**: Versiones antiguas que ya no son visibles
- **VACUUM**: Limpia dead tuples y recupera espacio
- **Isolation levels**: Controlan qué datos son visibles

### Niveles de aislamiento
| Nivel | Dirty Read | Non-repeatable Read | Phantom Read |
|-------|-----------|-------------------|--------------|
| Read Uncommitted | Posible | Posible | Posible |
| Read Committed | No | Posible | Posible |
| Repeatable Read | No | No | Posible (PG: No) |
| Serializable | No | No | No |

```sql
-- Ver nivel actual
SHOW transaction_isolation;

-- Cambiar nivel
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
```

### VACUUM
```sql
-- Ver dead tuples
SELECT relname, n_dead_tup FROM pg_stat_user_tables;

-- Vacuum simple
VACUUM mi_tabla;

-- Vacuum completo (bloquea escrituras)
VACUUM FULL mi_tabla;

-- Auto-vacuum (habilitado por defecto)
SHOW autovacuum;
```

---

## Índices Avanzados

### Índice parcial
```sql
CREATE INDEX idx_pedidos_pendientes ON pedidos(fecha) WHERE estado = 'pendiente';
```

### Índice por expresión
```sql
CREATE INDEX idx_lower_email ON usuarios(LOWER(email));
SELECT * FROM usuarios WHERE LOWER(email) = 'ana@mail.com';
```

### GiST (búsqueda geométrica, texto)
```sql
CREATE EXTENSION pg_trgm;
CREATE INDEX idx_busqueda ON productos USING GIST (nombre gist_trgm_ops);
SELECT * FROM productos WHERE nombre % 'telefono';  -- Búsqueda fuzzy
```

### GIN (búsqueda en arrays, JSONB)
```sql
CREATE INDEX idx_json ON eventos USING GIN (datos jsonb_path_ops);
```

---

## MySQL Stored Procedures

```sql
DELIMITER //

CREATE PROCEDURE ObtenerClientes(IN ciudad VARCHAR(100))
BEGIN
    SELECT * FROM clientes WHERE ciudad = ciudad;
END //

DELIMITER ;

CALL ObtenerClientes('Madrid');
```

---

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[09 - Módulo 9 - Drizzle ORM|Módulo 9: Drizzle ORM]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
