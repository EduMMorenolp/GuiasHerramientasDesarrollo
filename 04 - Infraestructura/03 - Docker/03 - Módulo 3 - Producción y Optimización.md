# Módulo 3: Producción y Optimización

**Objetivo**: Optimizar imágenes, desplegar en producción y monitorizar.

---

## Optimización de Imágenes

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

### Buenas prácticas
```dockerfile
# Ordenar capas de menos a más cambiantes
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./    # Cambia poco
RUN npm ci               # Capa cacheable
COPY . .                 # Cambia frecuentemente
```

### Reducir tamaño
```dockerfile
FROM node:22-alpine  # ~120MB vs ~350MB (full)
RUN npm ci --production  # Solo dependencias de producción
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

### Comandos de producción
```powershell
# Usar compose de producción
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# Escalar servicios
docker compose up -d --scale app=3
```

---

## Monitorización

```powershell
# Estadísticas en tiempo real
docker stats

# Ver recursos de un contenedor
docker stats mi-app

# Logs con timestamp
docker logs -f --timestamps mi-app
```

---

## Comandos de Diagnóstico

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

## Buenas Prácticas de Producción

1. **Imágenes inmutables** - Siempre taggear con versión, nunca `latest`
2. **Healthchecks** - Para orquestación y auto-recuperación
3. **Límites de recursos** - CPU y memoria
4. **Read-only** - Sistema de archivos root readonly
5. **Logs centralizados** - stdout/stderr para Docker
6. **Secrets** - Usar Docker secrets, no variables de entorno para credenciales

---

**Documentación oficial**: https://docs.docker.com
**Siguiente**: [[04 - Módulo 4 - Docker Buildx y Seguridad|Módulo 4: Docker Buildx y Seguridad]]
**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
