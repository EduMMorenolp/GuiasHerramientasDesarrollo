# MÃ³dulo 4: Docker Buildx y Seguridad

**Objetivo**: Optimizar builds multi-plataforma y hardening de seguridad.

---

## Docker Buildx

### Â¿QuÃ© es?
Plugin de Docker para builds avanzados con soporte multi-plataforma.

### ConfiguraciÃ³n
```powershell
# Ver builders disponibles
docker buildx ls

# Crear builder multi-arquitectura
docker buildx create --name multiarch --driver docker-container --use
docker buildx inspect --bootstrap

# Build para mÃºltiples plataformas
docker buildx build --platform linux/amd64,linux/arm64 -t user/app:latest --push .
```

### Buildx vs Build legacy
| CaracterÃ­stica | docker build | docker buildx |
|---------------|-------------|---------------|
| Multi-plataforma | No | SÃ­ |
| Cache remoto | No | SÃ­ |
| BuildKit | Opcional | Nativo |
| Outputs mÃºltiples | No | SÃ­ |

### Cache avanzado
```dockerfile
# Usar cache montado para npm
RUN --mount=type=cache,target=/root/.npm \
    npm ci
```

```powershell
docker buildx build --cache-from=type=registry,ref=user/app:cache \
                     --cache-to=type=registry,ref=user/app:cache,mode=max .
```

---

## Seguridad en Contenedores

### Principios bÃ¡sicos
```dockerfile
# 1. No ejecutar como root
RUN addgroup -g 1001 -S appuser && adduser -S appuser -u 1001 -G appuser
USER appuser

# 2. Sistema de archivos read-only
# docker run --read-only mi-app

# 3. Drop capabilities innecesarias
RUN apt-get update && apt-get install -y --no-install-recommends curl
# vs --no-install-recommends evita paquetes innecesarios

# 4. Usar imÃ¡genes distroless
FROM gcr.io/distroless/nodejs22-debian12
```

### Docker Scout
```powershell
# Escanear imÃ¡genes por vulnerabilidades
docker scout quickstart
docker scout analyze mi-app:v1

# Ver polÃ­ticas de seguridad
docker scout policy

# Comparar imÃ¡genes
docker scout compare mi-app:v1 mi-app:v2

# IntegraciÃ³n en CI
docker scout cves mi-app:v1
```

### Hardening
```powershell
# Ejecutar con mÃ­nimos privilegios
docker run --read-only \
           --cap-drop=ALL \
           --cap-add=NET_BIND_SERVICE \
           --security-opt=no-new-privileges \
           --user=1001:1001 \
           mi-app

# No exponer Docker socket a menos que sea necesario
# Evitar: -v /var/run/docker.sock:/var/run/docker.sock
```

### Secretos
```powershell
# Usar secretos en build (no ARG)
docker buildx build --secret id=mysecret,src=./secret.txt .

# Usar secretos en runtime
docker run -e DB_PASSWORD -e API_KEY mi-app  # Preferir
# docker run --secret id=db_password mi-app  # Con secret mounts
```

---

## Docker Init

Inicializa proyectos Docker automÃ¡ticamente:

```powershell
docker init
```
Analiza el proyecto y genera:
- Dockerfile optimizado
- docker-compose.yml
- .dockerignore
- README.Docker.md

---

## .dockerignore

```dockerignore
node_modules/
npm-debug.log
.git/
.gitignore
.env
*.md
dist/
.git/
```

---

## Resumen del MÃ³dulo

| Comando | DescripciÃ³n |
|---------|-------------|
| `docker buildx build --platform` | Build multi-plataforma |
| `docker scout analyze` | Escanear vulnerabilidades |
| `docker run --read-only` | Sistema de archivos read-only |
| `docker init` | Inicializar proyecto Docker |
| `docker buildx create` | Crear builder multi-arquitectura |

---
**Documentación oficial**: https://docs.docker.com

**Siguiente**: [[05 - MÃ³dulo 5 - Docker Compose Avanzado y CI-CD|MÃ³dulo 5: Docker Compose Avanzado y CI-CD]]
**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



