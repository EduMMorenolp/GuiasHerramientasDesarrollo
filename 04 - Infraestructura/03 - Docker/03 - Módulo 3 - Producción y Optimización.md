# MÃ³dulo 3: ProducciÃ³n y OptimizaciÃ³n

**Objetivo**: Optimizar imÃ¡genes, desplegar en producciÃ³n y monitorizar.

---

## OptimizaciÃ³n de ImÃ¡genes

### Dockerfile multi-stage
```dockerfile
# Build stage
FROM node:22-alpine AS build
WORKDIR /build
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:22-alpine
WORKDIR /app
COPY --from=build /build/dist ./dist
COPY --from=build /build/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

### Buenas prÃ¡cticas
```dockerfile
# Ordenar capas de menos a mÃ¡s cambiantes
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./    # Cambia poco
RUN npm ci               # Capa cacheable
COPY . .                 # Cambia frecuentemente
```

### Reducir tamaÃ±o
```dockerfile
FROM node:22-alpine  # ~120MB vs ~350MB (full)
RUN npm ci --production  # Solo dependencias de producciÃ³n
```

---

## Seguridad

```dockerfile
# No ejecutar como root
RUN addgroup -g 1001 -S app && adduser -S app -u 1001
USER app

# Escanear vulnerabilidades
docker scout quickstart
docker scout analyze mi-app:v1
```

---

## Despliegue

### Estrategias
```yaml
# docker-compose.prod.yml
services:
  app:
    image: registry/mi-app:v1
    restart: always
    healthcheck:
      test: ["CMD", "wget", "--spider", "http://localhost:3000/health"]
      interval: 30s
      retries: 3
    deploy:
      replicas: 3
      resources:
        limits:
          memory: 512M
```

### Comandos de producciÃ³n
```powershell
# Usar compose de producciÃ³n
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# Escalar servicios
docker compose up -d --scale app=3
```

---

## MonitorizaciÃ³n

```powershell
# EstadÃ­sticas en tiempo real
docker stats

# Ver recursos de un contenedor
docker stats mi-app

# Logs con timestamp
docker logs -f --timestamps mi-app
```

---

## Comandos de DiagnÃ³stico

```powershell
# Inspeccionar contenedor
docker inspect mi-app

# Ver procesos dentro del contenedor
docker top mi-app

# Copiar archivos
docker cp mi-app:/app/logs ./logs

# Ver cambios en el sistema de archivos
docker diff mi-app
```

---

## Buenas PrÃ¡cticas de ProducciÃ³n

1. **ImÃ¡genes inmutables** - Siempre taggear con versiÃ³n, nunca `latest`
2. **Healthchecks** - Para orquestaciÃ³n y auto-recuperaciÃ³n
3. **LÃ­mites de recursos** - CPU y memoria
4. **Read-only** - Sistema de archivos root readonly
5. **Logs centralizados** - stdout/stderr para Docker
6. **Secrets** - Usar Docker secrets, no variables de entorno para credenciales

---

**Documentación oficial**: https://docs.docker.com
**Siguiente**: [[04 - MÃ³dulo 4 - Docker Buildx y Seguridad|MÃ³dulo 4: Docker Buildx y Seguridad]]
**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
