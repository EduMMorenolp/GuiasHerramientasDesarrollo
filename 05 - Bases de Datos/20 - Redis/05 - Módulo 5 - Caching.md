# Módulo 5: Caching

**Objetivo**: Aprender y dominar: Caching.

## Estrategia cache-aside

La aplicacion consulta primero Redis; si no existe (cache miss), va a la base de datos y luego escribe en cache.

```python
def get_user(id):
    key = f"user:{id}"
    data = redis.get(key)
    if data is not None:
        return data
    data = db.query("SELECT * FROM users WHERE id = ?", id)
    redis.setex(key, 3600, data)   # cache por 1 hora
    return data
```

## TTL y expiracion

```redis
SET session:abc "datos"               -- sin TTL
EXPIRE session:abc 300                 -- expira en 5 min
TTL session:abc                        -- tiempo restante
SETEX cache:key 60 "valor"            -- SET + EXPIRE en uno
EXPIRE session:abc -1                  -- eliminar TTL

# Conteo de keys expiradas
INFO stats | grep expire
```

## Politicas de expulsion (maxmemory-policy)

```conf
maxmemory 256mb
maxmemory-policy allkeys-lru
```

| Politica          | Comportamiento                                          |
|-------------------|---------------------------------------------------------|
| noeviction        | Error en escritura si se alcanza el limite              |
| allkeys-lru       | Elimina las keys menos usadas (LRU) de todo el dataset  |
| allkeys-lfu       | Elimina las keys menos frecuentes (LFU)                 |
| volatile-lru      | LRU solo sobre keys con TTL                             |
| volatile-lfu      | LFU solo sobre keys con TTL                             |
| volatile-ttl      | Elimina las keys con TTL mas proximo a expirar          |
| volatile-random   | Elimina aleatoria sobre keys con TTL                    |
| allkeys-random    | Elimina aleatoria sobre todo el dataset                 |

## Patrones de cache

**Cache warming**
```python
# Precargar datos al iniciar la aplicacion
productos = db.query("SELECT * FROM productos")
for p in productos:
    redis.set(f"prod:{p.id}", p.json())
```

**Cache invalidation**
```python
def update_product(id, data):
    db.execute("UPDATE productos SET ... WHERE id = ?", id)
    redis.delete(f"prod:{id}")   # invalida cache
```

**Cache stampede (thundering herd)**
```python
import time

def compute_expensive():
    data = db.query("SELECT ...")
    redis.setex("cache:key", 60, data)
    return data

# Mutex lock para evitar cache stampede
lock = redis.setnx("lock:cache:key", "1")
if lock:
    redis.expire("lock:cache:key", 5)
    data = compute_expensive()
else:
    time.sleep(0.1)
    data = redis.get("cache:key")
```

## Ejemplo en Node.js con ioredis

```javascript
import Redis from 'ioredis';

const redis = new Redis({
  host: 'localhost',
  port: 6379,
  maxRetriesPerRequest: 3
});

async function getUser(id) {
  const key = `user:${id}`;
  const cached = await redis.get(key);
  if (cached) return JSON.parse(cached);

  const user = await db.findUser(id);
  await redis.setex(key, 3600, JSON.stringify(user));
  return user;
}
```

---

**Documentación oficial**: https://redis.io/docs/latest/
**Siguiente**: [[Módulo 6]]
**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
