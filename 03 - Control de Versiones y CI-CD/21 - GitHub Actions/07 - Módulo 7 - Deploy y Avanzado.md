# MÃ³dulo 7: Deploy y Avanzado

## Deploy multi-ambiente

Promueve el mismo artefacto a traves de distintos entornos con reglas de proteccion progresivas.

```yaml
name: Deploy multi-ambiente

on:
  push:
    branches: [main]

jobs:
  dev:
    environment: dev
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando en dev"

  staging:
    needs: dev
    environment: staging
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando en staging"

  production:
    needs: staging
    environment:
      name: production
      url: https://mi-app.com
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando en produccion"
```

## Workflows reutilizables (`workflow_call`)

Permiten definir un workflow y llamarlo desde otros workflows.

### workflow llamado (`.github/workflows/deploy.yml`)

```yaml
name: Deploy Reutilizable

on:
  workflow_call:
    inputs:
      environment:
        required: true
        type: string
    secrets:
      DEPLOY_KEY:
        required: true

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: ${{ inputs.environment }}
    steps:
      - run: echo "Desplegando en ${{ inputs.environment }}"
        env:
          KEY: ${{ secrets.DEPLOY_KEY }}
```

### workflow que llama

```yaml
jobs:
  call-deploy:
    uses: ./.github/workflows/deploy.yml
    with:
      environment: production
    secrets:
      DEPLOY_KEY: ${{ secrets.DEPLOY_KEY }}
```

## `workflow_dispatch` con inputs

Permite parametrizar la ejecucion manual desde la interfaz de GitHub.

```yaml
name: Deploy Manual

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Entorno de deploy'
        required: true
        default: 'staging'
        type: choice
        options:
          - dev
          - staging
          - production
      version:
        description: 'Version a desplegar'
        required: true

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando ${{ inputs.version }} en ${{ inputs.environment }}"
```

## Monitoreo con `actions/github-script`

Ejecuta scripts de JavaScript directamente en el workflow para interactuar con la API de GitHub.

```yaml
- uses: actions/github-script@v7
  with:
    script: |
      github.rest.issues.createComment({
        issue_number: context.issue.number,
        owner: context.repo.owner,
        repo: context.repo.repo,
        body: 'Workflow completado exitosamente'
      })
```

## Eventos avanzados

```yaml
on:
  issue_comment:
    types: [created]
  registry_package:
    types: [published]
  release:
    types: [published]
```

## Tabla resumen final

| Concepto | Módulo | Proposito |
|---|---|---|
| Sintaxis YAML | 1 | Estructura basica de workflows |
| Triggers | 1 | Eventos que inician el workflow |
| Matrices | 2 | Multi-version con `strategy.matrix` |
| Dependencias | 2 | Orden con `needs` |
| Condiciones | 2 | Ejecucion condicional con `if` |
| Actions | 3 | Bloques reutilizables (Marketplace, Docker, JS, Composite) |
| Runners | 4 | Maquinas donde se ejecutan los jobs |
| Artefactos | 5 | Compartir archivos entre jobs |
| Cache | 5 | Acelerar con dependencias cacheadas |
| Secretos | 6 | Datos sensibles encriptados |
| OIDC | 6 | Autenticacion sin credenciales |
| Permissions | 6 | Permisos minimos del `GITHUB_TOKEN` |
| Deploy multi-ambiente | 7 | Promocion progresiva dev -> staging -> production |
| Workflows reutilizables | 7 | `workflow_call` para compartir pipelines |
| Monitoreo | 7 | `github-script` para comentarios en PR |

---

**Documentación oficial**: https://docs.github.com/en/actions
**Inicio herramienta**: [[github-actions|GitHub Actions]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]








