# MÃ³dulo 6: Docker Swarm y OrquestaciÃ³n

**Objetivo**: Orquestar contenedores en clÃºster con Docker Swarm.

---

## Â¿QuÃ© es Docker Swarm?

Modo nativo de Docker para orquestaciÃ³n de contenedores en clÃºster.

### Conceptos clave
| TÃ©rmino | DescripciÃ³n |
|---------|-------------|
| **Swarm** | ClÃºster de nodos Docker |
| **Manager** | Nodo que gestiona el clÃºster |
| **Worker** | Nodo que ejecuta tareas |
| **Service** | DefiniciÃ³n de una aplicaciÃ³n en el swarm |
| **Task** | Contenedor individual ejecutando un servicio |
| **Stack** | Grupo de servicios (como Compose pero para swarm) |

---

## Configurar Swarm

### Inicializar
```powershell
# Manager node
docker swarm init --advertise-addr 192.168.1.100

# Obtener token para workers
docker swarm join-token worker
docker swarm join-token manager

# Worker node
docker swarm join --token SWMTKN-1-xxx 192.168.1.100:2377
```

### Gestionar nodos
```powershell
# Listar nodos
docker node ls

# Promover worker a manager
docker node promote node2

# Demote manager a worker
docker node demote node1

# Etiquetar nodos
docker node update --label-add storage=ssd node1

# Drenar nodo (mover contenedores)
docker node update --availability drain node2
```

---

## Services

### Desplegar servicios
```powershell
# Crear servicio
docker service create --name web --replicas 3 -p 80:80 nginx

# Exponer puerto
docker service create --name api --replicas 2 -p 3000:3000 mi-api

# Con red overlay
docker network create --driver overlay mi-red
docker service create --name db --network mi-red --replicas 1 postgres:16
```

### Gestionar servicios
```powershell
# Listar servicios
docker service ls

# Escalar
docker service scale api=5

# Actualizar imagen
docker service update --image mi-api:v2 api

# Ver logs
docker service logs -f api

# Ver tasks (contenedores)
docker service ps api

# Rollback
docker service update --rollback api
```

### Actualizaciones rolling
```powershell
# Rolling update con control
docker service create \
  --name api \
  --replicas 5 \
  --update-parallelism 2 \
  --update-delay 30s \
  --update-failure-action rollback \
  --rollback-parallelism 2 \
  --rollback-monitor 60s \
  mi-api:v1
```

---

## Stack (Compose para Swarm)

```yaml
# docker-stack.yml
version: "3.8"

services:
  api:
    image: mi-api:${VERSION:-latest}
    deploy:
      replicas: 3
      update_config:
        parallelism: 1
        delay: 30s
        order: start-first
      restart_policy:
        condition: on-failure
        delay: 5s
      resources:
        limits:
          cpus: "0.5"
          memory: 512M
    environment:
      - DB_HOST=db
    secrets:
      - api_key
    networks:
      - backend

  db:
    image: postgres:16
    deploy:
      replicas: 1
      placement:
        constraints:
          - node.labels.storage == ssd
    volumes:
      - pgdata:/var/lib/postgresql/data
    networks:
      - backend

volumes:
  pgdata:
    driver: rexray

networks:
  backend:
    driver: overlay

secrets:
  api_key:
    external: true
```

```powershell
# Desplegar stack
docker stack deploy -c docker-stack.yml prod

# Listar stacks
docker stack ls

# Ver servicios del stack
docker stack services prod

# Ver tareas
docker stack ps prod

# Eliminar stack
docker stack rm prod
```

---

## Secret Management

```powershell
# Crear secret
printf "mi-clave-secreta" | docker secret create db_password -

# Usar en servicio
docker service create --secret db_password --name api mi-api

# Listar secrets
docker secret ls
```

---

## Configs (Configuraciones)

```powershell
# Crear config
docker config create nginx.conf ./nginx.conf

# Usar en servicio
docker service create --config src=nginx.conf,target=/etc/nginx/nginx.conf --name web nginx
```

---

## Monitoreo del Swarm

```powershell
# Ver estado del swarm
docker info | Select-String Swarm

# Visualizar nodos
docker node ls

# Visualizar services
docker service ls

# Logs centralizados
docker service logs --tail 100 api

# EstadÃ­sticas del nodo
docker node ps $(docker node ls -q)
```

---

## Resumen del MÃ³dulo

| Comando | DescripciÃ³n |
|---------|-------------|
| `docker swarm init` | Inicializar clÃºster |
| `docker service create` | Desplegar servicio |
| `docker service scale` | Escalar servicio |
| `docker stack deploy` | Desplegar stack Compose |
| `docker node ls` | Listar nodos del clÃºster |
| `docker secret create` | Gestionar secretos |

---
**Documentación oficial**: https://docs.docker.com

**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
