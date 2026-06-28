# Módulo 7: Clustering y Alta Disponibilidad

## Replicacion (Master-Replica)

**Configurar replica**
```redis
REPLICAOF 192.168.1.10 6379     -- convierte el nodo en replica
REPLICAOF NO ONE                -- deshace la replica
```

**redis.conf del replica**
```conf
replicaof 192.168.1.10 6379
replica-read-only yes
replica-priority 100
```

**Ver estado**
```bash
redis-cli INFO replication
```

## Sentinel (alta disponibilidad)

**redis-sentinel.conf**
```conf
sentinel monitor mymaster 192.168.1.10 6379 2
sentinel down-after-milliseconds mymaster 5000
sentinel failover-timeout mymaster 60000
sentinel parallel-syncs mymaster 1
```

**Ejecutar Sentinel**
```bash
redis-sentinel /etc/redis-sentinel.conf
redis-server /etc/redis-sentinel.conf --sentinel
```

**Ver estado**
```bash
redis-cli -p 26379 SENTINEL master mymaster
redis-cli -p 26379 SENTINEL replicas mymaster
redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster
```

## Cluster (escalado horizontal)

Redis Cluster distribuye datos en 16384 slots hash.

**Crear cluster**
```bash
redis-cli --cluster create \
  192.168.1.10:6379 192.168.1.11:6379 192.168.1.12:6379 \
  192.168.1.13:6379 192.168.1.14:6379 192.168.1.15:6379 \
  --cluster-replicas 1
```

**Comandos del cluster**
```redis
CLUSTER INFO              -- estado del cluster
CLUSTER NODES             -- lista de nodos
CLUSTER KEYSLOT key       -- slot de una key
CLUSTER COUNTKEYSINSLOT 1234
```

**Hash tags** - claves con `{tag}` se ubican en el mismo slot
```redis
SET user:{alice}:profile "datos"
SET user:{alice}:orders "pedidos"    -- mismo slot que arriba
```

## Redis en Docker Compose (Sentinel + App)

```yaml
version: '3.8'

services:
  redis-master:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  redis-replica:
    image: redis:7-alpine
    command: redis-server --replicaof redis-master 6379
    depends_on:
      - redis-master

  sentinel:
    image: redis:7-alpine
    command: >
      redis-sentinel /sentinel.conf
    volumes:
      - ./sentinel.conf:/sentinel.conf
    depends_on:
      - redis-master
      - redis-replica

  app:
    build: .
    environment:
      REDIS_SENTINEL_SERVICE: mymaster
      REDIS_SENTINEL_HOSTS: sentinel:26379
    depends_on:
      - sentinel
```

## Tabla de configuracion cluster

| Concepto           | Descripcion                                      |
|--------------------|--------------------------------------------------|
| Slots              | 16384 slots hash distribuidos entre nodos        |
| Hash tag           | `{...}` fuerza misma slot para claves relacionales|
| Quorum (Sentinel)  | Minimo de sentineles para declarar fallo         |
| Replicas           | Copias de solo lectura para alta disponibilidad  |
| Gossip protocol    | Nodos se comunican entre si para detectar fallos |
| Cluster bus        | Puerto base + 10000 para comunicacion interna    |

---

**Documentación oficial**: https://redis.io/docs/latest/

**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]







