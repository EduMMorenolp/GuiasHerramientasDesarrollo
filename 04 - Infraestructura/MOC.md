# MOC - Infraestructura

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### Quartz ↔ Nginx
- Quartz se despliega tras Nginx como proxy inverso (self-hosting)
- Nginx sirve archivos estáticos de Quartz con caché de contenido hasheado
- Rate limiting y SSL en Nginx protegen el sitio Quartz

### Quartz ↔ Docker
- Quartz puede ejecutarse y construirse dentro de contenedores Docker
- Docker Compose orquesta Quartz + Nginx para despliegue local
- Imágenes Docker con Quartz para CI/CD

### Quartz ↔ GitHub Actions
- El pipeline CI/CD de Quartz se ejecuta en GitHub Actions
- El workflow clona Quartz, copia el vault, construye y despliega
- Caché de dependencias optimiza tiempos de build

### Docker ↔ Nginx
- Nginx se ejecuta comúnmente como contenedor Docker
- Docker Compose orquesta Nginx + backend (Node.js, Python, etc.)
- Nginx como proxy inverso frente a contenedores de aplicación

### Nginx ↔ Bases de Datos
- Nginx puede cachear respuestas de APIs que consultan bases de datos
- Proxy inverso de Nginx enruta a servicios que usan PostgreSQL, MySQL o Redis
- Rate limiting en Nginx protege bases de datos de sobrecarga

### Docker ↔ CI/CD
- Imágenes Docker se construyen en pipelines CI/CD
- GitLab Container Registry y GitHub Container Registry almacenan imágenes
- Docker Compose para tests de integración en pipelines

## Patrón de Infraestructura Típico

```
Nginx (proxy/SSL)
  → Backend (Node.js / Python en Docker)
    → PostgreSQL / MySQL
    → Redis (caché)
```

---
**Inicio herramienta**: [[Índice General]]
