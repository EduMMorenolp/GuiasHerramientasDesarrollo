# Módulo 5: Deploy

**Objetivo**: Desplegar un sitio Quartz en GitHub Pages, Cloudflare, Netlify, Vercel o self-hosted.

---

## Preparación

Antes del despliegue, asegurar que `baseUrl` en `quartz.config.ts` esté configurado:

```typescript
baseUrl: "tu-usuario.github.io/tu-repo",
```

## GitHub Pages

El método más común. Quartz incluye un workflow de GitHub Actions listo para usar.

### GitHub Actions workflow

Crear `.github/workflows/deploy.yml`:

```yaml
name: Deploy Quartz site to Pages

on:
  push:
    branches: [v4]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - name: Install dependencies
        run: npm ci
      - name: Build Quartz
        run: npx quartz build
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: public

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Configurar GitHub Pages

1. Ir a Settings → Pages del repositorio
2. En "Source", seleccionar "GitHub Actions"
3. Pushear a la rama configurada (ej: `v4`)

### Sincronizar cambios

```bash
npx quartz sync
```

Este comando hace commit y push de los cambios, activando el workflow.

## Cloudflare Pages

1. Ir a Cloudflare Dashboard → Pages → Create application → Connect to Git
2. Seleccionar el repositorio
3. Configuración:

| Opción | Valor |
|--------|-------|
| Production branch | `v4` |
| Framework preset | None |
| Build command | `npx quartz build` |
| Build output directory | `public` |

4. Presionar "Save and deploy"

Nota: Cloudflare hace shallow clone por defecto. Si usas fechas de Git, agregar `git fetch --unshallow &&` al inicio del build command.

## Netlify

1. Ir a Netlify → Add new site → Import from Git
2. Configuración:

| Opción | Valor |
|--------|-------|
| Build command | `npx quartz build` |
| Publish directory | `public` |

3. Presionar "Deploy"

## Vercel

1. Crear `vercel.json` en la raíz:

```json
{
  "cleanUrls": true
}
```

2. Ir a Vercel → Add New → Project
3. Configuración:

| Opción | Valor |
|--------|-------|
| Framework Preset | Other |
| Root Directory | ./ |
| Build Command | `npx quartz build` |

## Self-hosting

Copiar la carpeta `public/` al servidor web.

### Nginx

```nginx
server {
    listen 80;
    server_name example.com;
    root /path/to/quartz/public;
    index index.html;
    error_page 404 /404.html;

    location / {
        try_files $uri $uri.html $uri/ =404;
    }
}
```

### Apache (.htaccess)

```apache
RewriteEngine On
ErrorDocument 404 /404.html
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{DOCUMENT_ROOT}/%{REQUEST_URI}.html -f
RewriteRule ^(.*)$ $1.html [L]
```

## Custom domain

1. Configurar `baseUrl` en `quartz.config.ts`
2. Agregar registro DNS:
   - Apex domain: registrar A records apuntando a GitHub Pages IPs
   - Subdominio: registrar CNAME apuntando a `<usuario>.github.io`
3. En Settings → Pages, ingresar el dominio personalizado

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[04 - Infraestructura/22 - Quartz/04 - Módulo 4 - Plugins\|Módulo 4 - Plugins]] |
| **Siguiente →** | [[04 - Infraestructura/22 - Quartz/06 - Módulo 6 - Personalización Avanzada\|Módulo 6: Personalización Avanzada]] |
| **Inicio herramienta** | [[04 - Infraestructura/22 - Quartz/quartz\|Quartz]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|← Índice General]] |
| **Documentación oficial** | [Quartz Docs](https://quartz.jzhao.xyz/hosting) |

---
