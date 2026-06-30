# Módulo 2: Docker Compose y Redes

**Objetivo**: Orquestar múltiples contenedores y gestionar redes.

---

## Docker Compose

### Definición
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

### Comunicación entre contenedores
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

## Mejores Prácticas

1. **Un servicio por contenedor**
2. **Imágenes ligeras** (alpine, slim)
3. **Usar .dockerignore**
4. **No ejecutar como root**
5. **Healthchecks** para dependencias
6. **Logs a stdout/stderr**

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[04 - Infraestructura/03 - Docker/01 - Módulo 1 - Contenedores e Imágenes\|Módulo 1 - Contenedores e Imágenes]] |
| **Siguiente →** | [[03 - Módulo 3 - Producción y Optimización\|Módulo 3: Producción y Optimización]] |
| **Inicio herramienta** | [[docker\|Docker]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Docker Docs](https://docs.docker.com) |

---
