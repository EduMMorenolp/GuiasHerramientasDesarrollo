# Módulo 4: Pub/Sub y Transacciones

**Objetivo**: Aprender y dominar: Pub/Sub y Transacciones.

## Pub/Sub

**Suscriptor**
```redis
SUBSCRIBE noticias                        -- escucha el canal "noticias"
PSUBSCRIBE noticias:*                     -- patron de canales
UNSUBSCRIBE noticias                      -- deja de escuchar
```

**Publicador**
```redis
PUBLISH noticias "texto del mensaje"      -- (integer) numero de subscriptores
```

**Ejemplo: dos terminales**
```bash
# Terminal 1
redis-cli SUBSCRIBE canal1

# Terminal 2
redis-cli PUBLISH canal1 "hola mundo"
```

## Transacciones

**MULTI / EXEC**
```redis
MULTI                     -- inicio de transaccion
SET clave1 "valor1"
SET clave2 "valor2"
EXEC                      -- ejecuta todo en orden
```

**DISCARD**
```redis
MULTI
SET clave1 "valor1"
DISCARD                   -- descarta los comandos en cola
```

**WATCH (optimistic locking)**
```redis
WATCH contador            -- monitorea la clave
valor = GET contador
MULTI
SET contador (valor + 1)
EXEC                      -- falla si otro cliente modifico contador
```

## Lua Scripting

```bash
redis-cli EVAL "return redis.call('SET', KEYS[1], ARGV[1])" 1 key value
```

**Ejemplo: INCR con limite**
```bash
redis-cli EVAL "
  local val = redis.call('GET', KEYS[1])
  if val and tonumber(val) >= tonumber(ARGV[1]) then
    return nil
  end
  return redis.call('INCR', KEYS[1])
" 1 contador 100
```

## Ejemplo practico: cola de mensajes simple

```bash
# Productor
redis-cli PUBLISH cola:pedidos "{id: 1, producto: 'laptop'}"

# Consumidor
redis-cli SUBSCRIBE cola:pedidos
```

## Tabla de comandos Pub/Sub y transacciones

| Categoria    | Comando       | Descripcion                         |
|--------------|---------------|-------------------------------------|
| Pub/Sub      | SUBSCRIBE     | Escuchar un canal                   |
| Pub/Sub      | PSUBSCRIBE    | Escuchar por patron                 |
| Pub/Sub      | PUBLISH       | Enviar mensaje a un canal           |
| Pub/Sub      | UNSUBSCRIBE   | Dejar de escuchar                   |
| Transaccion  | MULTI         | Iniciar bloque de comandos          |
| Transaccion  | EXEC          | Ejecutar bloque                     |
| Transaccion  | DISCARD       | Cancelar bloque                     |
| Transaccion  | WATCH         | Monitorear claves para CAS          |
| Scripting    | EVAL          | Ejecutar script Lua                 |
| Scripting    | EVALSHA       | Ejecutar script cacheado            |

---

**Documentación oficial**: https://redis.io/docs/latest/
**Siguiente**: [[Módulo 5]]
**Inicio herramienta**: [[redis|Redis]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
