# MÃ³dulo 10: ReplicaciÃ³n, Backup y Extensiones

**Objetivo**: Asegurar datos con backups, escalar con replicaciÃ³n y extender con herramientas especializadas.

---

## PostgreSQL: Backup y Restore

### pg_dump
```powershell
# Base completa (formato custom, comprimido)
pg_dump -Fc mi_base > mi_base.dump

# Solo datos
pg_dump -a mi_base > datos.sql

# Solo schema
pg_dump -s mi_base > schema.sql

# Comprimir
pg_dump -Z9 mi_base > mi_base.sql.gz
```

### pg_restore
```powershell
# Restaurar desde dump custom
pg_restore -d mi_base mi_base.dump

# Crear base primero
createdb nueva_base
pg_restore -d nueva_base mi_base.dump
```

### pg_basebackup (fÃ­sico)
```powershell
# Backup fÃ­sico del servidor
pg_basebackup -D D:\backups\pg -X stream -P -U replicador
```

### PITR (Point In Time Recovery)
```conf
# postgresql.conf
wal_level = replica
archive_mode = on
archive_command = 'copy %p D:\archives\%f'
```
```powershell
# Restaurar a un punto especÃ­fico
pg_restore --target-time "2026-06-27 12:00:00" -d mi_base mi_base.dump
```

---

## PostgreSQL: ReplicaciÃ³n

### Streaming Replication
```conf
# Primario - postgresql.conf
wal_level = replica
max_wal_senders = 5
wal_keep_size = 1024
```

```conf
# RÃ©plica - postgresql.conf
primary_conninfo = 'host=192.168.1.10 port=5432 user=replicador'
hot_standby = on
```

### Logical Replication
```sql
-- Publicador (primario)
CREATE PUBLICATION mi_publicacion FOR TABLE usuarios, pedidos;

-- Suscriptor (rÃ©plica)
CREATE SUBSCRIPTION mi_suscripcion
CONNECTION 'host=primario dbname=mi_base'
PUBLICATION mi_publicacion;
```

---

## MySQL: Backup y ReplicaciÃ³n

### mysqldump
```powershell
# Backup completo
mysqldump -u root -p --all-databases > full_backup.sql

# Con procedimientos y eventos
mysqldump -u root -p --routines --events mi_base > mi_base.sql

# Backup de una tabla
mysqldump -u root -p mi_base usuarios > usuarios.sql
```

### Binary Log
```sql
-- Ver logs binarios
SHOW BINARY LOGS;

-- Leer binlog
mysqlbinlog mysql-bin.000001 > cambios.sql;
```

### Group Replication
```sql
-- Configurar nodo
INSTALL PLUGIN group_replication SONAME 'group_replication.so';
SET GLOBAL group_replication_group_name = 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee';
START GROUP_REPLICATION;
```

---

## Extensiones de PostgreSQL

### pg_stat_statements
```sql
CREATE EXTENSION pg_stat_statements;

-- Top 10 queries mÃ¡s lentas
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;
```

### PostGIS
```sql
CREATE EXTENSION postgis;

-- Calcular distancia entre puntos
SELECT ST_Distance(
    ST_GeomFromText('POINT(-99.13 19.43)', 4326),
    ST_GeomFromText('POINT(-99.17 19.40)', 4326)
);

-- Encontrar puntos cercanos
SELECT nombre FROM lugares
WHERE ST_DWithin(geom, ST_MakePoint(-99.13, 19.43), 1000);
```

### TimescaleDB (time-series)
```sql
CREATE EXTENSION timescaledb;

-- Convertir tabla a hypertable
SELECT create_hypertable('sensores', 'timestamp');

-- CompresiÃ³n automÃ¡tica
ALTER TABLE sensores SET (
    timescaledb.compress,
    timescaledb.compress_segmentby = 'sensor_id'
);
```

---

## Performance Tuning

| ParÃ¡metro | DescripciÃ³n | RecomendaciÃ³n |
|-----------|-------------|---------------|
| `shared_buffers` | Memoria para cachÃ© de datos | 25% de RAM |
| `work_mem` | Memoria para operaciones de sorting | 4-16 MB por operaciÃ³n |
| `maintenance_work_mem` | Memoria para VACUUM, Ã­ndices | 10% de RAM |
| `effective_cache_size` | EstimaciÃ³n de cachÃ© del SO | 50-75% de RAM |
| `max_connections` | Conexiones simultÃ¡neas | 100-500 segÃºn RAM |

### Table Partitioning
```sql
-- PostgreSQL partitioning
CREATE TABLE ventas (
    id SERIAL,
    fecha DATE NOT NULL,
    monto DECIMAL
) PARTITION BY RANGE (fecha);

CREATE TABLE ventas_2025 PARTITION OF ventas
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
```

---

## Resumen

| Herramienta | PropÃ³sito |
|-------------|-----------|
| `pg_dump` / `pg_restore` | Backup lÃ³gico PostgreSQL |
| `pg_basebackup` | Backup fÃ­sico PostgreSQL |
| `Streaming Replication` | RÃ©plica en tiempo real |
| `mysqldump` | Backup MySQL |
| `Group Replication` | Alta disponibilidad MySQL |
| `pg_stat_statements` | Monitoreo de queries |
| `PostGIS` | Datos geoespaciales |
| `TimescaleDB` | Series temporales |
| `Partitioning` | Tablas por rangos |

---
**Documentación oficial**: https://www.postgresql.org/docs/

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



