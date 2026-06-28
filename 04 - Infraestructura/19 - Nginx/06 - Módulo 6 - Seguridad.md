# MÃ³dulo 6: Seguridad

## Rate limiting

Limita peticiones por IP para prevenir abusos.

```nginx
http {
    limit_req_zone $binary_remote_addr zone=login:10m rate=5r/s;
}

server {
    location /api/login {
        limit_req zone=login burst=10 nodelay;
        proxy_pass http://backend:3000;
    }
}
```

- `zone=login:10m` â€” zona compartida de 10 MB.
- `rate=5r/s` â€” mÃ¡ximo 5 requests por segundo.
- `burst=10` â€” cola de hasta 10 requests extras.
- `nodelay` â€” sirve el burst inmediatamente.

## Control de acceso por IP

```nginx
location /admin {
    allow 192.168.1.0/24;
    allow 10.0.0.1;
    deny all;
    proxy_pass http://backend:3000;
}
```

### Geo block

```nginx
http {
    geo $block_country {
        default 0;
        CN 1;
        RU 1;
    }
}

server {
    if ($block_country) {
        return 403;
    }
}
```

## Ocultar versiÃ³n de Nginx

```nginx
server_tokens off;
```

## Headers de seguridad

```nginx
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header X-XSS-Protection "0" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Permissions-Policy "geolocation=(), camera=()" always;
```

## ModSecurity con Nginx

```bash
# Compilar Nginx con ModSecurity (open source)
git clone https://github.com/SpiderLabs/ModSecurity-nginx.git
./configure --add-dynamic-module=../ModSecurity-nginx
```

```nginx
load_module modules/ngx_http_modsecurity_module.so;

http {
    modsecurity on;
    modsecurity_rules_file /etc/nginx/modsecurity/main.conf;
}
```

## Tabla de seguridad

| Directiva | PropÃ³sito |
|---|---|
| `limit_req_zone` / `limit_req` | Rate limiting por IP |
| `allow / deny` | Control de acceso por IP |
| `server_tokens off` | Oculta versiÃ³n de Nginx |
| `add_header X-Frame-Options` | Previene clickjacking |
| `add_header X-Content-Type-Options` | Evita MIME sniffing |
| `add_header X-XSS-Protection` | XSS filter legacy |
| `add_header Referrer-Policy` | Controla cabecera Referer |
| `add_header Permissions-Policy` | Restringe APIs del navegador |
| `modsecurity` | WAF (Web Application Firewall) |

---
**Documentación oficial**: https://nginx.org/en/docs/

**Siguiente**: [[../../19 - Nginx/07 - MÃ³dulo 7 - Avanzado|MÃ³dulo 7: Avanzado]]
**Inicio herramienta**: [[nginx|Nginx]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




