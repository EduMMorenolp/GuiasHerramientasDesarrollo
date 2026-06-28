# MÃ³dulo 4: SSL/TLS y HTTPS

**Objetivo**: Aprender y dominar: SSL/TLS y HTTPS.

## Certificados con Let's Encrypt / Certbot

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d ejemplo.com -d www.ejemplo.com
```

RenovaciÃ³n automÃ¡tica:

```bash
sudo certbot renew --dry-run
```

## ConfiguraciÃ³n manual de SSL

```nginx
server {
    listen 443 ssl;
    server_name ejemplo.com;

    ssl_certificate     /etc/ssl/certs/ejemplo.crt;
    ssl_certificate_key /etc/ssl/private/ejemplo.key;

    root /var/www/ejemplo;
    index index.html;
}
```

## HTTP/2

```nginx
server {
    listen 443 ssl http2;
    server_name ejemplo.com;
    # ...
}
```

HTTP/2 mejora rendimiento con multiplexaciÃ³n y compresiÃ³n de cabeceras.

## RedirecciÃ³n HTTP a HTTPS

```nginx
server {
    listen 80;
    server_name ejemplo.com www.ejemplo.com;
    return 301 https://$host$request_uri;
}
```

## Mejores prÃ¡cticas SSL

```nginx
server {
    listen 443 ssl http2;
    server_name ejemplo.com;

    ssl_certificate     /etc/ssl/certs/ejemplo.crt;
    ssl_certificate_key /etc/ssl/private/ejemplo.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    ssl_session_cache   shared:SSL:10m;
    ssl_session_timeout 10m;

    add_header Strict-Transport-Security "max-age=63072000" always;
}
```

### Tabla de mejores prÃ¡cticas SSL

| Directiva | RecomendaciÃ³n |
|---|---|
| `ssl_protocols` | `TLSv1.2 TLSv1.3` (deshabilitar SSLv3, TLSv1.0, TLSv1.1) |
| `ssl_ciphers` | `HIGH:!aNULL:!MD5` o usar Mozilla Intermediate |
| `ssl_prefer_server_ciphers` | `on` |
| `ssl_session_cache` | `shared:SSL:10m` |
| `ssl_session_timeout` | `10m` |
| HSTS | `add_header Strict-Transport-Security "max-age=63072000" always` |

## Cipher suite recomendado (Mozilla Intermediate)

```nginx
ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
```

---

**Documentación oficial**: https://nginx.org/en/docs/
**Siguiente**: [[../../19 - Nginx/05 - MÃ³dulo 5 - Cache|MÃ³dulo 5: Cache]]
**Inicio herramienta**: [[nginx|Nginx]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
