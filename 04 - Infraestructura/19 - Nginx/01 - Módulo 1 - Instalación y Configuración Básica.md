# Módulo 1: Instalación y Configuración Básica


**Objetivo**: Aprender y dominar: Instalación y Configuración Básica.

## Instalación

Nginx puede instalarse de varias formas según el sistema operativo.

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

**Compilación desde fuente (Linux):**
```bash
wget https://nginx.org/download/nginx-1.26.0.tar.gz
tar -xzf nginx-1.26.0.tar.gz
cd nginx-1.26.0
./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf
make
sudo make install
```

## Directorios principales

| Directorio | Descripción |
|---|---|
| `/etc/nginx` | Configuración global de Nginx |
| `/etc/nginx/nginx.conf` | Archivo principal de configuración |
| `/etc/nginx/sites-available/` | Configuraciones de sitios disponibles |
| `/etc/nginx/sites-enabled/` | Configuraciones de sitios activos (symlinks) |
| `/var/www/` | Raíz por defecto para archivos estáticos |
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

- `worker_processes`: cantidad de procesos worker (auto = número de CPUs).
- `events`: configuración de conexiones (worker_connections).
- `http`: bloque principal para tráfico HTTP.

## Server blocks (virtual hosts)

Permiten servir múltiples dominios desde un mismo servidor.

```nginx
server {
    listen 80;
    server_name ejemplo.com www.ejemplo.com;

    root /var/www/ejemplo;
    index index.html;
}
```

## Comandos esenciales

| Comando | Descripción |
|---|---|
| `nginx -t` | Verificar sintaxis de la configuración |
| `nginx -s reload` | Recargar configuración sin cortar conexiones |
| `nginx -s stop` | Detener Nginx inmediatamente |
| `nginx -s quit` | Detener Nginx de forma graceful |
| `systemctl start nginx` | Iniciar Nginx (systemd) |
| `systemctl enable nginx` | Habilitar inicio automático |

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

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[../../19 - Nginx/02 - Módulo 2 - Servidor Estático y Location\|Módulo 2: Servidor Estático y Location]] |
| **Inicio herramienta** | [[nginx\|Nginx]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Nginx Docs](https://nginx.org/en/docs/) |

---
