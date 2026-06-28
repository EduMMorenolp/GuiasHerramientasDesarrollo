# MÃ³dulo 2: Servidor EstÃ¡tico y Location

## root vs alias

| Directiva | Comportamiento | Ejemplo |
|---|---|---|
| `root` | Concatena la ruta al URI | `root /var/www;` + `/img/logo.png` â†’ `/var/www/img/logo.png` |
| `alias` | Reemplaza el prefijo del location | `alias /data;` + `/files/doc.pdf` â†’ `/data/doc.pdf` |

Ejemplo de alias:

```nginx
location /images/ {
    alias /var/www/images/;
}
```

## index, try_files y autoindex

```nginx
server {
    listen 80;
    server_name static.ejemplo.com;
    root /var/www/static;

    index index.html index.htm;
    autoindex on;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

- `index`: archivos por defecto al acceder a un directorio.
- `try_files`: intenta rutas en orden; si ninguna existe, cae en la Ãºltima.
- `autoindex`: muestra listado de directorios si no hay `index`.

## Location blocks

Nginx evalÃºa los `location` blocks en este orden de prioridad:

1. `= /exacto` (coincidencia exacta)
2. `^~ /prefijo` (coincidencia preferencial, sin regex)
3. `~ \.php$` o `~* \.jpg$` (regex, sensible o no a mayÃºsculas)
4. `/prefijo` (coincidencia por prefijo simple)

### Tabla de directivas location

| Tipo | Sintaxis | EvaluaciÃ³n |
|---|---|---|
| Exacta | `= /path` | Coincidencia literal, detiene bÃºsqueda |
| Prefijo | `/path` | Coincide si el URI empieza con /path |
| Preferencial | `^~ /path` | Igual que prefijo pero descarta regex |
| Regex sensible | `~ pattern` | ExpresiÃ³n regular (primera que coincida) |
| Regex insensible | `~* pattern` | Igual que ~ pero sin distinguir mayÃºsculas |

```nginx
location = /favicon.ico {
    log_not_found off;
    access_log off;
}

location /static/ {
    root /var/www;
    expires 30d;
}

location ~* \.(css|js|png|jpg)$ {
    expires 7d;
    add_header Cache-Control "public";
}

location /api/ {
    proxy_pass http://backend:3000;
}
```

## Servir SPA (Single Page Application)

```nginx
server {
    listen 80;
    server_name app.ejemplo.com;
    root /var/www/app/dist;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

Esto redirige todas las rutas no encontradas a `index.html`, permitiendo que el router del frontend maneje la navegaciÃ³n.

---
**Documentación oficial**: https://nginx.org/en/docs/

**Siguiente**: [[../../19 - Nginx/03 - MÃ³dulo 3 - Proxy Inverso|MÃ³dulo 3: Proxy Inverso]]
**Inicio herramienta**: [[nginx|Nginx]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




