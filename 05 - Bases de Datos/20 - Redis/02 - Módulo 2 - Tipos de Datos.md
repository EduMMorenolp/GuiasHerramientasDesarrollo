# Módulo 2: Tipos de Datos

**Objetivo**: Aprender y dominar: Tipos de Datos.

## Strings

```redis
SET key "valor"       -- OK
GET key               -- "valor"
MSET a 1 b 2 c 3      -- OK
MGET a b c            -- 1) "1" 2) "2" 3) "3"
INCR contador         -- 1
DECR contador         -- 0
APPEND key " extra"   -- 10 (longitud final)
```

## Hashes

```redis
HSET user:1 name "alice" edad 30    -- (integer) 2
HGET user:1 name                     -- "alice"
HGETALL user:1                       -- 1) "name" 2) "alice" 3) "edad" 4) "30"
HINCRBY user:1 edad 1                -- 31
```

## Lists

```redis
LPUSH cola "c"    -- 1
RPUSH cola "d"    -- 2
LPOP cola         -- "c"
RPOP cola         -- "d"
LLEN cola         -- 0
LRANGE cola 0 -1  -- (empty list)
```

## Sets

```redis
SADD frutas "manzana" "pera"    -- (integer) 2
SREM frutas "pera"               -- (integer) 1
SMEMBERS frutas                  -- 1) "manzana"
SINTER set1 set2                 -- interseccion
SUNION set1 set2                 -- union
```

## Sorted Sets

```redis
ZADD ranking 100 "alice" 200 "bob"    -- (integer) 2
ZRANGE ranking 0 -1                    -- 1) "alice" 2) "bob"
ZRANK ranking "bob"                    -- 1
ZSCORE ranking "bob"                   -- "200"
```

## Streams

```redis
XADD pedidos * cliente "alice" total 99.9    -- "1700000000000-0"
XREAD COUNT 1 STREAMS pedidos 0               -- datos del stream
XRANGE pedidos - +                            -- todos los mensajes
XGROUP CREATE pedidos grupo1 $                -- crear grupo de consumidores
```

## Tabla de comandos por tipo

| Tipo   | Comandos clave                                        |
|--------|-------------------------------------------------------|
| String | SET, GET, MSET, MGET, INCR, DECR, APPEND             |
| Hash   | HSET, HGET, HGETALL, HINCRBY, HDEL, HEXISTS          |
| List   | LPUSH, RPUSH, LPOP, RPOP, LLEN, LRANGE, LINDEX       |
| Set    | SADD, SREM, SMEMBERS, SINTER, SUNION, SCARD          |
| ZSet   | ZADD, ZRANGE, ZRANK, ZSCORE, ZREM, ZREVRANGE         |
| Stream | XADD, XREAD, XRANGE, XGROUP, XREADGROUP, XLEN        |

---

**Documentación oficial**: https://redis.io/docs/latest/
**Siguiente**: [[Módulo 3]]
**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
