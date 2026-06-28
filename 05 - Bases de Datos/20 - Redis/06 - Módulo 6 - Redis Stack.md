# Módulo 6: Redis Stack

**Objetivo**: Aprender y dominar: Redis Stack.

## Que es Redis Stack

Redis Stack extiende Redis con modulos de alto valor:
- **RediSearch**: busqueda full-text y secundaria
- **RedisJSON**: manejo nativo de JSON
- **RedisTimeSeries**: series temporales
- **RedisBloom**: Bloom filters y probabilisticos
- **RedisGraph** (deprecado en favor de Cypher)

**Instalacion (Docker)**
```bash
docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
```

## RediSearch (busqueda full-text)

```redis
FT.CREATE idx:productos ON HASH PREFIX 1 "prod:" SCHEMA nombre TEXT WEIGHT 5.0 precio NUMERIC

FT.SEARCH idx:productos "laptop" LIMIT 0 10
FT.SEARCH idx:productos "@precio:[500 1500]" SORTBY precio ASC
FT.AGGREGATE idx:productos "*" GROUPBY 1 @categoria REDUCE COUNT 0 AS total
```

## RedisJSON (datos jerarquicos)

```redis
JSON.SET user:1 $ '{"name":"alice","address":{"city":"madrid","zip":28001}}'
JSON.GET user:1 $.address.city           -- "madrid"
JSON.GET user:1 $                        -- documento completo
JSON.SET user:1 $.age 30
JSON.ARRAPPEND user:1 $.tags '"vip"'
```

## RedisTimeSeries (series temporales)

```redis
TS.CREATE temperatura:madrid RETENTION 86400000 LABELS sensor "temp" ciudad "madrid"
TS.ADD temperatura:madrid 1700000000000 22.5
TS.ADD temperatura:madrid 1700003600000 23.1
TS.RANGE temperatura:madrid 1700000000000 1700004000000 AGGREGATION avg 60000
TS.GET temperatura:madrid               -- ultimo valor
```

## RedisBloom (Bloom filters)

```redis
BF.RESERVE filtro:usuarios 0.01 1000000    -- error rate 1%, 1M elementos
BF.ADD filtro:usuarios "alice"             -- 1 (nuevo)
BF.ADD filtro:usuarios "alice"             -- 0 (ya existe)
BF.EXISTS filtro:usuarios "bob"            -- 0 (no existe)
BF.EXISTS filtro:usuarios "alice"          -- 1 (probablemente existe)
```

## Tabla de modulos Redis Stack

| Módulo          | Comandos clave                       | Caso de uso                       |
|-----------------|--------------------------------------|-----------------------------------|
| RediSearch      | FT.CREATE, FT.SEARCH, FT.AGGREGATE   | Busqueda full-text, filtros       |
| RedisJSON       | JSON.SET, JSON.GET, JSON.ARRAPPEND   | Documentos JSON anidados          |
| RedisTimeSeries | TS.CREATE, TS.ADD, TS.RANGE, TS.GET  | Metricas, IoT, monitoreo          |
| RedisBloom      | BF.ADD, BF.EXISTS, CMS.INCRBY        | Filtros probabilisticos           |

---

**Documentación oficial**: https://redis.io/docs/latest/
**Siguiente**: [[Módulo 7]]
**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
