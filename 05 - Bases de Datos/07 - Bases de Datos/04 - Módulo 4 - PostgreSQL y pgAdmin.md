# MÃ³dulo 4: PostgreSQL y pgAdmin

**Objetivo**: Instalar y operar PostgreSQL con psql y pgAdmin.

---

## InstalaciÃ³n

### EDB Installer
Descargar desde: https://www.postgresql.org/download/windows/

Incluye:
- PostgreSQL Server
- pgAdmin 4 (GUI)
- Stack Builder (extensiones)
- psql (CLI)
- pg_dump, pg_restore

```powershell
# Verificar
psql --version
pg_config --version
```

---

## psql (CLI)

### ConexiÃ³n y navegaciÃ³n
```powershell
# Conectar
psql -U postgres -h localhost -d mi_base

# O conectarse al abrir
psql -U postgres
```

### Comandos internos (backslash)
```sql
-- Listar bases de datos
\l

-- Listar tablas
\dt

-- Ver estructura de tabla
\d usuarios
\d+ usuarios  -- MÃ¡s detalle

-- Ver usuarios/roles
\du

-- Ver funciones
\df

-- Historial de comandos
\s

-- Ejecutar desde archivo
\i script.sql
```

---

## pgAdmin 4

### Interfaz
- **Object Browser**: Ãrbol de servidores, bases, schemas, tablas
- **Query Tool**: Editor SQL con resaltado, autocompletado, EXPLAIN visual
- **Dashboard**: GrÃ¡ficas de actividad, conexiones, bloqueos
- **Properties**: ConfiguraciÃ³n de objetos (tablas, Ã­ndices, constraints)

### Operaciones comunes
- **Backup**: BotÃ³n derecho > Backup (usa pg_dump internamente)
- **Restore**: BotÃ³n derecho > Restore
- **Import/Export**: Datos desde CSV
- **Grant Wizard**: Asignar permisos visualmente

---

## Tipos de Dato Especiales de PostgreSQL

```sql
-- SERIAL (auto-incremento)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

-- UUID (identificador Ãºnico)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE pedidos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY
);

-- JSONB (binario, indexable con GIN)
CREATE TABLE eventos (
    datos JSONB
);
CREATE INDEX idx_eventos ON eventos USING GIN (datos);

-- ARRAY
CREATE TABLE producto (
    etiquetas TEXT[]
);
SELECT * FROM producto WHERE 'urgente' = ANY(etiquetas);

-- INTERVAL
SELECT NOW() + INTERVAL '3 days';
SELECT * FROM tareas WHERE duracion > INTERVAL '2 hours';
```

---

## Extensiones

```sql
-- Ver extensiones instaladas
\dx

-- Activar estadÃ­sticas
CREATE EXTENSION pg_stat_statements;
SELECT * FROM pg_stat_statements ORDER BY total_time DESC;

-- PostGIS (geogrÃ¡fico)
CREATE EXTENSION postgis;
SELECT ST_DistanceSphere(geom1, geom2);

-- UUID
CREATE EXTENSION "uuid-ossp";
SELECT uuid_generate_v4();

-- pgcrypto (hash, cifrado)
CREATE EXTENSION pgcrypto;
SELECT crypt('password', gen_salt('bf'));
```

---

## Resumen

| Comando | PropÃ³sito |
|---------|-----------|
| `psql -U postgres` | Conectar a PostgreSQL |
| `\l` | Listar bases |
| `\dt` | Listar tablas |
| `\d tabla` | Ver estructura |
| `\du` | Ver usuarios |
| `\dx` | Ver extensiones |
| `CREATE EXTENSION` | Activar extensiÃ³n |

---
**DocumentaciÃ³n oficial**: https://www.postgresql.org/docs/

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[05 - MÃ³dulo 5 - Modelado y OptimizaciÃ³n|MÃ³dulo 5: Modelado y OptimizaciÃ³n]]
**Documentación oficial**: https://www.w3schools.com/sql/

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




