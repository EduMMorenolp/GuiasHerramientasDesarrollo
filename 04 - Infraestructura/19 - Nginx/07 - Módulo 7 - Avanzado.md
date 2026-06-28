# Módulo 7: Avanzado

**Objetivo**: Aprender y dominar: Avanzado.

## Rewrite y redirect

```nginx
# Redirección permanente
rewrite ^/old-page$ /new-page permanent;
rewrite ^/blog/(.*)$ /news/$1 permanent;

# Con return
location /old-path {
    return 301 /new-path;
}

location ~ ^/posts/(\d+)$ {
    return 301 /articles/$1;
}
```

## Map block

Permite definir variables condicionales.

```nginx
http {
    map $http_host $backend_server {
        default     backend1:3000;
        api.ejemplo.com    backend2:3000;
        app.ejemplo.com    backend3:3000;
    }

    map $scheme $ssl_redirect {
        http  1;
        https 0;
    }
}

server {
    if ($ssl_redirect) {
        return 301 https://$host$request_uri;
    }

    location / {
        proxy_pass http://$backend_server;
    }
}
```

## Logs personalizados

```nginx
http {
    log_format main '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent"';

    log_format json escape=json '{'
        '"time":"$time_local",'
        '"remote_addr":"$remote_addr",'
        '"request":"$request",'
        '"status":$status,'
        '"bytes":$body_bytes_sent,'
        '"referer":"$http_referer",'
        '"agent":"$http_user_agent"'
    '}';

    access_log /var/log/nginx/access.log main;
    error_log  /var/log/nginx/error.log warn;
}
```

## Include para modularizar configs

```nginx
# nginx.conf
http {
    include /etc/nginx/mime.types;
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

Estructura recomendada:

```
/etc/nginx/
  nginx.conf
  conf.d/
    gzip.conf
    cache.conf
    ssl.conf
    security.conf
    proxy.conf
  sites-available/
    ejemplo.com
    api.ejemplo.com
  sites-enabled/
    ejemplo.com -> ../sites-available/ejemplo.com
```

## Tuning

```nginx
worker_processes auto;
worker_rlimit_nofile 65535;

events {
    worker_connections 4096;
    use epoll;
    multi_accept on;
}

http {
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;

    keepalive_timeout 65;
    keepalive_requests 1000;

    client_body_buffer_size 128k;
    client_max_body_size 10m;
    client_header_buffer_size 1k;
    large_client_header_buffers 4 8k;

    output_buffers 32 32k;
    postpone_output 1460;

    # Gzip
    gzip on;
    gzip_comp_level 5;
    gzip_min_length 256;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml image/svg+xml;
    gzip_vary on;
    gzip_disable "msie6";
}
```

## Nginx + Docker

### Dockerfile multi-stage

```dockerfile
# Build stage
FROM node:20 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Nginx stage
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### docker-compose.yml

```yaml
version: '3.8'

services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
      - ./static:/usr/share/nginx/html
      - ./ssl:/etc/ssl/certs
    networks:
      - frontend

  app:
    image: myapp:latest
    expose:
      - "3000"
    networks:
      - frontend
      - backend

networks:
  frontend:
  backend:
```

## Tabla resumen final

| Módulo | Tema | Directivas clave |
|---|---|---|
| 1 | Instalación y configuración básica | `worker_processes`, `server`, `listen` |
| 2 | Servidor estático y location | `root`, `alias`, `try_files`, `location` |
| 3 | Proxy inverso | `proxy_pass`, `upstream`, `proxy_set_header` |
| 4 | SSL/TLS y HTTPS | `ssl_certificate`, `http2`, `HSTS` |
| 5 | Cache | `proxy_cache`, `expires`, `fastcgi_cache` |
| 6 | Seguridad | `limit_req`, `allow/deny`, `add_header` |
| 7 | Avanzado | `rewrite`, `map`, `log_format`, `docker` |

---
**Documentación oficial**: https://nginx.org/en/docs/

**Inicio herramienta**: [[nginx|Nginx]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
