# Módulo 3: Proxy Inverso

**Objetivo**: Aprender y dominar: Proxy Inverso.

## proxy_pass

La directiva `proxy_pass` redirige peticiones a un backend interno.

```nginx
server {
    listen 80;
    server_name api.ejemplo.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
    }
}
```

## Cabeceras del proxy

```nginx
location / {
    proxy_pass http://backend:3000;

    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

## Upstream y balanceo de carga

```nginx
upstream backend {
    least_conn;

    server 10.0.0.1:3000 weight=3;
    server 10.0.0.2:3000;
    server 10.0.0.3:3000 backup;
}

server {
    listen 80;
    server_name app.ejemplo.com;

    location / {
        proxy_pass http://backend;
    }
}
```

### Métodos de balanceo

| Método | Descripción |
|---|---|
| `least_conn` | Envía al servidor con menos conexiones activas |
| `ip_hash` | Persistencia por IP del cliente |
| `random` | Distribución aleatoria |
| `round-robin` | Por defecto, turnos equitativos |

## WebSocket proxy

```nginx
location /ws/ {
    proxy_pass http://websocket-backend;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    proxy_read_timeout 86400;
}
```

## Ejemplo: Node.js detrás de Nginx

```nginx
upstream node_app {
    least_conn;
    server 127.0.0.1:3000;
    server 127.0.0.1:3001;
}

server {
    listen 80;
    server_name app.ejemplo.com;

    location / {
        proxy_pass http://node_app;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    location /static/ {
        root /var/www/app;
        expires 30d;
    }
}
```

## Tabla de directivas proxy

| Directiva | Descripción |
|---|---|
| `proxy_pass` | URL del backend |
| `proxy_set_header` | Establece cabeceras HTTP |
| `proxy_http_version` | Versión HTTP del proxy (1.1 necesario para WebSocket) |
| `proxy_read_timeout` | Timeout de lectura del backend |
| `proxy_connect_timeout` | Timeout de conexión al backend |
| `proxy_buffering` | Habilita/deshabilita buffering |
| `proxy_cache` | Activa la caché del proxy |

---

**Documentación oficial**: https://nginx.org/en/docs/
**Siguiente**: [[../../19 - Nginx/04 - Módulo 4 - SSL-TLS y HTTPS|Módulo 4: SSL/TLS y HTTPS]]
**Inicio herramienta**: [[nginx|Nginx]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
