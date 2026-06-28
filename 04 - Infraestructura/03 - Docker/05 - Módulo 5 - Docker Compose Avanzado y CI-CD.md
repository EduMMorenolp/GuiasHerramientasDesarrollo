# MÃ³dulo 5: Docker Compose Avanzado y CI-CD

**Objetivo**: Flujos avanzados con Compose y pipelines CI/CD.

---

## Docker Compose Avanzado

### Perfiles (Profiles)
```yaml
services:
  app:
    image: mi-app
    profiles: ["production"]

  db:
    image: postgres:16

  redis:
    image: redis:7
    profiles: ["production", "staging"]

  adminer:
    image: adminer
    profiles: ["dev"]
```

```powershell
docker compose --profile dev up -d
docker compose --profile production up -d
```

### ExtensiÃ³n de servicios
```yaml
# docker-compose.yml (base)
services:
  app:
    image: mi-app
    ports: ["3000:3000"]
    environment:
      - NODE_ENV=production

# docker-compose.override.yml (dev)
services:
  app:
    build: .
    volumes:
      - .:/app
    environment:
      - NODE_ENV=development
      - DEBUG=true
```

### Healthchecks
```yaml
services:
  app:
    healthcheck:
      test: ["CMD", "wget", "--spider", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 10s

  db:
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d app"]
      interval: 5s
      timeout: 5s
      retries: 5
```

### Dependencias con healthcheck
```yaml
services:
  app:
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
```

### Variables de entorno
```yaml
services:
  app:
    env_file:
      - .env
      - .env.${NODE_ENV:-development}

  db:
    environment:
      POSTGRES_USER: ${DB_USER:-default}
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password
    secrets:
      - db_password

secrets:
  db_password:
    file: ./secrets/db_password.txt
```

---

## CI/CD con Docker

### GitHub Actions
```yaml
name: Docker Build and Push

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}

      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          push: true
          tags: user/app:latest,user/app:${{ github.sha }}
          cache-from: type=gha
          cache-to: type=gha,mode=max
```

### GitLab CI
```yaml
docker-build:
  stage: build
  image: docker:28
  services:
    - docker:dind
  variables:
    DOCKER_TLS_CERTDIR: ""
  script:
    - docker build -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
```

### Docker Compose en CI
```yaml
services:
  test:
    image: node:22
    working_dir: /app
    volumes: [.:/app]
    command: sh -c "npm ci && npm test"
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
```

```powershell
docker compose run --rm test
```

---

## Docker Context

Gestionar mÃºltiples entornos:

```powershell
# Listar contextos
docker context ls

# Crear contexto remoto (SSH)
docker context create prod --docker "host=ssh://user@server"

# Cambiar contexto
docker context use prod

# Usar contexto temporal
docker --context prod ps
```

---

## Docker App

Empaquetar aplicaciones completas:

```yaml
# app.dockerapp
version: "0.1"
name: mi-app
description: AplicaciÃ³n completa

services:
  app:
    image: user/mi-app:${VERSION:-latest}
  db:
    image: postgres:16
```

```powershell
docker app init mi-app
docker app build
docker app deploy mi-app.dockerapp
```

---

## Resumen del MÃ³dulo

| Tema | Comando/Concepto |
|------|-----------------|
| Perfiles Compose | `--profile dev` |
| Healthchecks | `condition: service_healthy` |
| CI/CD Buildx | `docker/build-push-action` |
| Contextos | `docker context use prod` |
| Docker App | `docker app deploy` |

---

**Documentación oficial**: https://docs.docker.com
**Siguiente**: [[06 - MÃ³dulo 6 - Docker Swarm y OrquestaciÃ³n|MÃ³dulo 6: Docker Swarm y OrquestaciÃ³n]]
**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
