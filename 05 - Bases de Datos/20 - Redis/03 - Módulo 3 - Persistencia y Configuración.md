# Módulo 3: Persistencia y Configuracion

**Objetivo**: Aprender y dominar: Persistencia y Configuracion.

## RDB (Redis Database)

Los snapshots RDB son volcados binarios del dataset en disco.

**Configuracion en redis.conf**
```conf
save 900 1        -- un cambio cada 15 min
save 300 10       -- diez cambios cada 5 min
save 60 10000     -- diez mil cambios cada 1 min
dbfilename dump.rdb
dir /var/lib/redis
```

**Manual**
```bash
redis-cli SAVE             # bloqueante
redis-cli BGSAVE           # asincrono (recomendado)
```

**Ventajas** | **Desventajas**
- Tamanio compacto
- Ideal para backups
- Arranque rapido
- Puede perder datos (ultimo snapshot)
- Bloquea el proceso padre en SAVE

## AOF (Append Only File)

Registra cada operacion de escritura en un log.

**Configuracion en redis.conf**
```conf
appendonly yes
appendfilename "appendonly.aof"
appendfsync everysec        # politicas: always, everysec, no
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
```

**AOF Rewrite**
```bash
redis-cli BGREWRITEAOF      # compacta el AOF en segundo plano
```

**Ventajas** | **Desventajas**
- Minima perdida de datos (1s con everysec)
- Formato legible (protocolo Redis)
- Tamanio de archivo mayor
- Reescritura costosa en I/O

## Combinacion RDB + AOF (Redis 7)

Redis 7 recomienda usar ambos:
- **RDB** para recuperacion rapida y backups
- **AOF** para durabilidad con perdida minima

```conf
save 900 1
appendonly yes
appendfsync everysec
aof-use-rdb-preamble yes    # AOF con prefijo RDB (Redis 7+)
```

## Configuracion general

```conf
maxmemory 512mb                         # limite de memoria
maxmemory-policy allkeys-lru            # politica de expulsion
requirepass mysecretpassword            # contraseña
port 6379                               # puerto
bind 127.0.0.1                          # interfaz
daemonize yes                           # modo demonio
loglevel notice                         # nivel de log
logfile /var/log/redis/redis.log
```

## Tabla comparativa RDB vs AOF

| Caracteristica       | RDB               | AOF                     |
|----------------------|-------------------|-------------------------|
| Formato              | Binario compacto  | Protocolo texto         |
| Perdida de datos     | Alta (snapshot)   | Minima (fsync everysec) |
| Velocidad escritura  | Rapida            | Mas lenta               |
| Velocidad de arranque| Rapida            | Lenta (replay)          |
| Backups              | Facil (copiar .rdb)| Mas pesado              |
| Recomendado          | Backups + startup | Durabilidad             |

---

**Documentación oficial**: https://redis.io/docs/latest/
**Siguiente**: [[05 - Bases de Datos/20 - Redis/04 - Módulo 4 - Pub-Sub y Transacciones|Módulo 4]]
**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
