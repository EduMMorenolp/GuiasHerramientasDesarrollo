# MÃ³dulo 1: InstalaciÃ³n y ConfiguraciÃ³n BÃ¡sica

## InstalaciÃ³n

Nginx puede instalarse de varias formas segÃºn el sistema operativo.

**Debian/Ubuntu (apt):**
```bash
sudo apt update
sudo apt install nginx
```

**Windows (winget):**
```bash
winget install nginx
```

**Windows (Chocolatey):**
```bash
choco install nginx
```

**CompilaciÃ³n desde fuente (Linux):**
```bash
wget https://nginx.org/download/nginx-1.26.0.tar.gz
tar -xzf nginx-1.26.0.tar.gz
cd nginx-1.26.0
./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf
make
sudo make install
```

## Directorios principales

| Directorio | DescripciÃ³n |
|---|---|
| `/etc/nginx` | ConfiguraciÃ³n global de Nginx |
| `/etc/nginx/nginx.conf` | Archivo principal de configuraciÃ³n |
| `/etc/nginx/sites-available/` | Configuraciones de sitios disponibles |
| `/etc/nginx/sites-enabled/` | Configuraciones de sitios activos (symlinks) |
| `/var/www/` | RaÃ­z por defecto para archivos estÃ¡ticos |
| `/var/log/nginx/` | Logs de acceso y error |

## Estructura de `nginx.conf`

```nginx
worker_processes  auto;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    include /etc/nginx/sites-enabled/*;
}
```

- `worker_processes`: cantidad de procesos worker (auto = nÃºmero de CPUs).
- `events`: configuraciÃ³n de conexiones (worker_connections).
- `http`: bloque principal para trÃ¡fico HTTP.

## Server blocks (virtual hosts)

Permiten servir mÃºltiples dominios desde un mismo servidor.

```nginx
server {
    listen 80;
    server_name ejemplo.com www.ejemplo.com;

    root /var/www/ejemplo;
    index index.html;
}
```

## Comandos esenciales

| Comando | DescripciÃ³n |
|---|---|
| `nginx -t` | Verificar sintaxis de la configuraciÃ³n |
| `nginx -s reload` | Recargar configuraciÃ³n sin cortar conexiones |
| `nginx -s stop` | Detener Nginx inmediatamente |
| `nginx -s quit` | Detener Nginx de forma graceful |
| `systemctl start nginx` | Iniciar Nginx (systemd) |
| `systemctl enable nginx` | Habilitar inicio automÃ¡tico |

## Primer ejemplo

```nginx
server {
    listen 80;
    server_name localhost;

    root /var/www/html;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Guardar en `/etc/nginx/sites-available/default`, luego habilitar con un symlink a `sites-enabled` y ejecutar `nginx -t && nginx -s reload`.

---
**Documentación oficial**: https://nginx.org/en/docs/

**Siguiente**: [[../../19 - Nginx/02 - MÃ³dulo 2 - Servidor EstÃ¡tico y Location|MÃ³dulo 2: Servidor EstÃ¡tico y Location]]
**Inicio herramienta**: [[nginx|Nginx]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




