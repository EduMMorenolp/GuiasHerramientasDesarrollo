# Módulo 5: Cache

**Objetivo**: Aprender y dominar: Cache.

## Cache de estáticos

```nginx
location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg|woff2)$ {
    expires 30d;
    add_header Cache-Control "public, immutable";
}

location ~* \.(html)$ {
    expires 1h;
    add_header Cache-Control "public, must-revalidate";
}
```

## Proxy cache

Configuración en el bloque `http`:

```nginx
http {
    proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=mycache:10m
                     max_size=1g inactive=60m use_temp_path=off;
    # ...
}
```

Uso en un `location`:

```nginx
server {
    listen 80;
    server_name app.ejemplo.com;

    location / {
        proxy_cache mycache;
        proxy_cache_valid 200 302 10m;
        proxy_cache_valid 404 1m;
        proxy_cache_use_stale error timeout updating;
        proxy_cache_key "$scheme$request_method$host$request_uri";

        proxy_pass http://backend:3000;
    }
}
```

## Microcaching

Caché de corta duración para aplicaciones dinámicas (API, SSR):

```nginx
proxy_cache_valid 200 5s;
proxy_cache_use_stale updating;
```

`proxy_cache_use_stale updating` sirve contenido viejo mientras se refresca la caché, evitando picos al backend.

## fastcgi_cache para PHP

```nginx
http {
    fastcgi_cache_path /var/cache/nginx/fastcgi levels=1:2 keys_zone=phpcache:10m;
}

server {
    location ~ \.php$ {
        fastcgi_cache phpcache;
        fastcgi_cache_valid 200 60m;
        fastcgi_cache_use_stale updating;

        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
```

## Tabla de directivas de cache

| Directiva | Ubicación | Descripción |
|---|---|---|
| `proxy_cache_path` | `http` | Define zona de caché, ruta, tamaño y niveles |
| `proxy_cache` | `location`, `server` | Activa la caché referenciando la zona |
| `proxy_cache_valid` | `location`, `server` | Tiempo de validez por código de estado |
| `proxy_cache_key` | `location`, `server` | Clave única para cada entrada de caché |
| `proxy_cache_use_stale` | `location`, `server` | Sirve contenido obsoleto en caso de error |
| `expires` | `location`, `server` | Cache-Control para el cliente |
| `fastcgi_cache_path` | `http` | Define zona de caché FastCGI |
| `fastcgi_cache` | `location` | Activa caché FastCGI |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[../../19 - Nginx/06 - Módulo 6 - Seguridad\|Módulo 6: Seguridad]] |
| **Inicio herramienta** | [[nginx\|Nginx]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Nginx Docs](https://nginx.org/en/docs/) |

---
