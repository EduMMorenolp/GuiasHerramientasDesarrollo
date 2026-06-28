# MÃ³dulo 2: Docker Compose y Redes

**Objetivo**: Orquestar mÃºltiples contenedores y gestionar redes.

---

## Docker Compose

### DefiniciÃ³n
Herramienta para definir y ejecutar aplicaciones multi-contenedor con un archivo YAML.

### docker-compose.yml
```yaml
version: "3.8"
services:
  web:
    build: .
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      - DATABASE_URL=postgres://user:pass@db:5432/app

  db:
    image: postgres:16-alpine
    volumes:
      - pgdata:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: app

volumes:
  pgdata:
```

### Comandos Compose
```powershell
# Iniciar servicios
docker compose up -d

# Ver logs
docker compose logs -f

# Detener y eliminar
docker compose down

# Reconstruir y arrancar
docker compose up -d --build

# Ejecutar comando en servicio
docker compose exec web node -e "console.log('hola')"
```

---

## Redes en Docker

### Tipos de red
```powershell
# Listar redes
docker network ls

# Red bridge (por defecto)
docker network create mi-red

# Conectar contenedor a red
docker network connect mi-red mi-app

# Usar red en docker-compose
```

### ComunicaciÃ³n entre contenedores
Los contenedores en la misma red se comunican por nombre del servicio:
- `http://web:3000`
- `postgres://db:5432`

### Redes en Compose
```yaml
services:
  api:
    networks:
      - frontend
      - backend
  db:
    networks:
      - backend

networks:
  frontend:
  backend:
    internal: true  # Aislada del exterior
```

---

## Variables de Entorno

### En Dockerfile
```dockerfile
ENV NODE_ENV=production
```

### En docker-compose
```yaml
services:
  app:
    environment:
      - NODE_ENV=production
      - DEBUG=true
    env_file:
      - .env
```

---

## Mejores PrÃ¡cticas

1. **Un servicio por contenedor**
2. **ImÃ¡genes ligeras** (alpine, slim)
3. **Usar .dockerignore**
4. **No ejecutar como root**
5. **Healthchecks** para dependencias
6. **Logs a stdout/stderr**

---

**Documentación oficial**: https://docs.docker.com
**Siguiente**: [[03 - MÃ³dulo 3 - ProducciÃ³n y OptimizaciÃ³n|MÃ³dulo 3: ProducciÃ³n y OptimizaciÃ³n]]
**Inicio herramienta**: [[docker|Docker]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
