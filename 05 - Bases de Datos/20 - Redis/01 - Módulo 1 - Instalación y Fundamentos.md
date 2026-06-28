# Módulo 1: Instalación y Fundamentos

**Objetivo**: Aprender y dominar: Instalación y Fundamentos.

## Instalación

**apt (Debian/Ubuntu)**
```bash
sudo apt update
sudo apt install redis-server
sudo systemctl enable redis-server
sudo systemctl start redis-server
```

**winget (Windows)**
```bash
winget install "Redis"
```

**Docker**
```bash
docker run -d --name redis -p 6379:6379 redis:7-alpine
```

**Compilar desde fuente**
```bash
git clone https://github.com/redis/redis.git
cd redis
make
sudo make install
```

## Redis Server y CLI

```bash
redis-server                  # inicia el servidor
redis-cli                     # abre la terminal interactiva
redis-cli ping                # prueba conexion
```

## Comandos basicos

```redis
PING                  -- "PONG"
SET saludo "hola"     -- OK
GET saludo            -- "hola"
KEYS *                -- listar todas las keys
EXISTS saludo         -- 1
DEL saludo            -- 1
TYPE saludo           -- string
TTL saludo            -- -1 (sin expiracion)
EXPIRE saludo 60      -- expira en 60 segundos
```

## Tipos de datos

| Tipo         | Descripcion                          | Ejemplo                          |
|--------------|--------------------------------------|----------------------------------|
| STRING       | Cadena de texto o binario            | `SET name "alice"`               |
| LIST         | Lista ordenada de strings            | `LPUSH cola "a"`                 |
| HASH         | Mapa de campo-valor                  | `HSET user:1 name "alice"`       |
| SET          | Conjunto no ordenado unico           | `SADD tags "redis"`              |
| ZSET         | Conjunto ordenado por score          | `ZADD ranking 1 "alice"`         |

---

**Documentación oficial**: https://redis.io/docs/latest/
**Siguiente**: [[Módulo 2]]
**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
