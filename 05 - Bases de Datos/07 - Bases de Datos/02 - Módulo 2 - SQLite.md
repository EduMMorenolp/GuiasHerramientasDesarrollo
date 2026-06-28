# MÃ³dulo 2: SQLite

**Objetivo**: Conocer SQLite como base de datos embebida, serverless y zero-config.

---

## Â¿QuÃ© es SQLite?

- **Base de datos embebida**: No es cliente-servidor, se integra en la aplicaciÃ³n
- **Serverless**: No requiere proceso separado
- **Zero-configuration**: Sin configuraciÃ³n inicial
- **Dominio pÃºblico**: CÃ³digo fuente libre
- **Almacenamiento**: Un solo archivo `.db` o `.sqlite`
- **Portable**: Ideal para apps mÃ³viles, prototipos, pruebas

---

## InstalaciÃ³n

```powershell
# Windows (Scoop)
scoop install sqlite

# Verificar
sqlite3 --version
```

---

## CLI de SQLite

### Comandos bÃ¡sicos (puntos)
```sql
-- Listar tablas
.tables

-- Ver esquema de tabla
.schema usuarios

-- Ver esquema completo
.schema

-- Modo de salida
.mode column    -- Columnas alineadas
.mode markdown  -- Formato tabla Markdown
.mode json      -- JSON
.mode csv       -- CSV

-- Cambiar archivo de salida
.output resultados.txt
SELECT * FROM usuarios;
.output stdout
```

### Importar/Exportar
```sql
-- Importar CSV
.mode csv
.import datos.csv mi_tabla

-- Exportar a CSV
.headers on
.mode csv
.output export.csv
SELECT * FROM tabla;
.output stdout
```

---

## PRAGMAs

```sql
-- Modo WAL (Write-Ahead Logging) - mejor concurrencia
PRAGMA journal_mode=WAL;

-- Habilitar foreign keys
PRAGMA foreign_keys=ON;

-- Ver configuraciÃ³n
PRAGMA journal_mode;
PRAGMA synchronous;
PRAGMA cache_size;
```

---

## Funciones JSON

```sql
-- Extraer valor
SELECT json_extract('{"nombre": "Ana"}', '$.nombre');

-- Crear JSON
SELECT json_object('nombre', 'Ana', 'edad', 30);

-- Array JSON
SELECT json_array(1, 2, 3);

-- Validar
SELECT json_valid('{"ok": true}');
```

---

## Funciones de Fecha y Hora

```sql
SELECT date('now');             -- 2026-06-27
SELECT time('now');             -- 14:30:00
SELECT datetime('now');         -- 2026-06-27 14:30:00
SELECT strftime('%Y-%m', 'now'); -- 2026-06
SELECT julianday('now');        -- dÃ­as julianos

-- Modificadores
SELECT date('now', '+7 days');
SELECT date('now', '-1 month', 'start of month');
```

---

## DB Browser for SQLite

Herramienta grÃ¡fica oficial: https://sqlitebrowser.org

- **Hoja de datos**: Navegar y editar registros
- **SQL Editor**: Ejecutar consultas
- **DB Schema**: Ver y modificar estructura
- **Importar/Exportar**: CSV, JSON
- **Visualizar**: Diagrama de tablas

---

## Buenas PrÃ¡cticas

| PrÃ¡ctica | RecomendaciÃ³n |
|----------|---------------|
| Concurrencia | Usar `PRAGMA journal_mode=WAL` |
| Integridad | Habilitar `foreign_keys=ON` |
| Rendimiento | Crear Ã­ndices en columnas de bÃºsqueda |
| Backup | Copiar archivo `.db` (seguro con WAL) |
| TamaÃ±o | Ejecutar `VACUUM` periÃ³dicamente |

---

## Resumen

| Comando | PropÃ³sito |
|---------|-----------|
| `sqlite3 db.sqlite` | Abrir base de datos |
| `.tables` | Listar tablas |
| `.schema` | Ver esquema |
| `.mode` | Cambiar formato salida |
| `.import` | Importar CSV |
| `.output` | Redirigir salida |
| `PRAGMA` | Configurar motor |

---

**DocumentaciÃ³n oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[03 - MÃ³dulo 3 - MySQL y Workbench|MÃ³dulo 3: MySQL y Workbench]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
