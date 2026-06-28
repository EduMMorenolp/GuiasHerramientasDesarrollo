# Módulo 5: Deploy y CI/CD

**Objetivo**: Despliegue automatizado zero-downtime mediante el comando deploy de PM2 y pipelines CI/CD.

## Configuracion de deploy

En el `ecosystem.config.js` se agrega la seccion `deploy`:

```javascript
// ecosystem.config.js
module.exports = {
  apps: [
    {
      name: 'api',
      script: 'server.js',
      instances: 'max',
      exec_mode: 'cluster'
    }
  ],

  deploy: {
    production: {
      user: 'deploy',
      host: '192.168.1.100',
      ref: 'origin/main',
      repo: 'git@github.com:usuario/mi-app.git',
      path: '/var/www/mi-app',
      'post-deploy': 'npm install && pm2 reload ecosystem.config.js --env production'
    },
    staging: {
      user: 'deploy',
      host: '192.168.1.101',
      ref: 'origin/develop',
      repo: 'git@github.com:usuario/mi-app.git',
      path: '/var/www/mi-app-staging',
      'post-deploy': 'npm install && pm2 reload ecosystem.config.js --env staging'
    }
  }
};
```

### Propiedades de deploy

| Propiedad | Descripcion |
|-----------|-------------|
| `user` | Usuario SSH para conexion |
| `host` | Direccion del servidor remoto |
| `ref` | Rama o tag a desplegar |
| `repo` | URL del repositorio git |
| `path` | Ruta en el servidor destino |
| `pre-deploy` | Comando antes del deploy |
| `post-deploy` | Comando despues del deploy |
| `pre-deploy-local` | Comando local antes del deploy |
| `key` | Ruta a la clave SSH (opcional) |
| `ssh_options` | Opciones SSH adicionales |

## Comandos de deploy

### Configurar el servidor remoto

```bash
pm2 deploy production setup
```

Clona el repositorio por primera vez y prepara la estructura de directorios.

### Desplegar

```bash
pm2 deploy production
```

Ejecuta el proceso completo: pull, post-deploy, reload.

### Listar despliegues

```bash
pm2 deploy production list
```

### Rollback

```bash
pm2 deploy production revert 1
```

Vuelve al despliegue anterior. El numero indica cuantos pasos retroceder.

## Estrategias de deploy

| Entorno | Rama | Comando |
|---------|------|---------|
| Produccion | `origin/main` | `pm2 deploy production` |
| Staging | `origin/develop` | `pm2 deploy staging` |
| Preview | `origin/feature/*` | `pm2 deploy preview` |

## Integracion con GitHub Actions

Ejemplo de pipeline YAML para deploy automatico:

```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup SSH
        run: |
          mkdir -p ~/.ssh
          echo "${{ secrets.SSH_PRIVATE_KEY }}" > ~/.ssh/deploy_key
          chmod 600 ~/.ssh/deploy_key
          echo "${{ secrets.SSH_KNOWN_HOSTS }}" > ~/.ssh/known_hosts

      - name: Install PM2
        run: npm install -g pm2

      - name: Deploy
        run: pm2 deploy production
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
```

### Ejemplo mas completo con test previo

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm ci
      - run: npm test

  deploy-staging:
    needs: test
    if: github.ref == 'refs/heads/develop'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Staging
        run: |
          npm install -g pm2
          pm2 deploy staging

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Production
        run: |
          npm install -g pm2
          pm2 deploy production
```

## Tabla de comandos deploy

| Comando | Descripcion |
|---------|-------------|
| `pm2 deploy <env> setup` | Prepara el servidor remoto |
| `pm2 deploy <env>` | Ejecuta el despliegue |
| `pm2 deploy <env> list` | Lista los despliegues realizados |
| `pm2 deploy <env> revert <n>` | Revierte al despliegue N anterior |
| `pm2 deploy <env> current` | Muestra el despliegue actual |

---

**Documentación oficial**: https://pm2.keymetrics.io/docs/
**Siguiente**: [[Módulo 6]]
**Inicio herramienta**: [[pm2|PM2]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
