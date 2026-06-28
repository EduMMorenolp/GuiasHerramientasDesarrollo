# MÃ³dulo 1: Contenedores e ImÃ¡genes

**Objetivo**: Comprender Docker, instalar y dominar contenedores e imÃ¡genes.

---

## Â¿QuÃ© es Docker?

### DefiniciÃ³n
Docker es una plataforma de contenedores que empaqueta aplicaciones y sus dependencias en unidades ligeras y portÃ¡tiles.

### Contenedor vs MÃ¡quina Virtual
| CaracterÃ­stica | Contenedor | VM |
|---------------|------------|-----|
| Inicio | Segundos | Minutos |
| TamaÃ±o | MB | GB |
| Kernel | Compartido | Propio |
| Aislamiento | Procesos | Completo |

---

## InstalaciÃ³n

```powershell
# Verificar instalaciÃ³n
docker --version
docker info

# Comandos bÃ¡sicos post-instalaciÃ³n
docker run hello-world
```

---

## ImÃ¡genes

### Gestionar imÃ¡genes
```powershell
# Listar imÃ¡genes
docker images

# Descargar imagen
docker pull node:22-alpine

# Buscar imÃ¡genes
docker search node

# Eliminar imagen
docker rmi node:22-alpine
```

### Dockerfile bÃ¡sico
```dockerfile
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

### Construir imÃ¡genes
```powershell
docker build -t mi-app:v1 .
docker build -t mi-app:v1 --no-cache .
```

---

## Contenedores

### Ciclo de vida
```powershell
# Crear y ejecutar
docker run -d -p 3000:3000 --name mi-app mi-app:v1

# Listar contenedores
docker ps        # Activos
docker ps -a     # Todos

# Detener
docker stop mi-app

# Iniciar
docker start mi-app

# Eliminar
docker rm mi-app
```

### Logs y ejecuciÃ³n
```powershell
# Ver logs
docker logs mi-app
docker logs -f mi-app  # Follow mode

# Ejecutar comando dentro del contenedor
docker exec -it mi-app sh
docker exec -it mi-app node -e "console.log('hola')"
```

---

## VolÃºmenes y Persistencia

### Tipos de montaje
```powershell
# Volumen gestionado por Docker
docker run -v datos:/data mi-app

# Bind mount (directorio local)
docker run -v D:\data:/data mi-app
```

### Gestionar volÃºmenes
```powershell
docker volume ls
docker volume create datos
docker volume inspect datos
```

---

## Comandos Esenciales

| Comando | DescripciÃ³n |
|---------|-------------|
| `docker ps` | Contenedores activos |
| `docker images` | ImÃ¡genes locales |
| `docker build` | Construir imagen |
| `docker run` | Ejecutar contenedor |
| `docker exec` | Ejecutar comando |
| `docker logs` | Ver logs |
| `docker stop/start` | Detener/iniciar |
| `docker rm/rmi` | Eliminar contenedor/imagen |

---
**Documentación oficial**: https://docs.docker.com

**Siguiente**: [[02 - MÃ³dulo 2 - Docker Compose y Redes|MÃ³dulo 2: Docker Compose y Redes]]
**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



