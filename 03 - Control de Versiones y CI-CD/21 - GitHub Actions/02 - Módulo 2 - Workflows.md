# Módulo 2: Workflows


**Objetivo**: Aprender y dominar: Workflows.

## Matrices (`strategy.matrix`)

Permite ejecutar un mismo job con múltiples versiones o configuraciones.

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node: [18, 20, 22]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm test
```

## Dependencias entre jobs (`needs`)

Controla el orden de ejecución. Un job puede esperar a que otro finalice.

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Linting..."
  test:
    needs: lint
    runs-on: ubuntu-latest
    steps:
      - run: echo "Testing..."
  deploy:
    needs: [lint, test]
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploying..."
```

## Condiciones (`if`)

Ejecuta un paso o job solo si se cumple una condición.

```yaml
jobs:
  deploy:
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando a producción"
```

## Entornos (`environment`)

Agrupa reglas de protección, secrets y approvals.

```yaml
jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando con aprobación"
```

## Concurrencia (`concurrency`)

Evita ejecuciones duplicadas del mismo workflow en la misma rama.

```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
```

## Ejemplo completo: test en Node 18, 20, 22

```yaml
name: Node CI

on: [push, pull_request]

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node: [18, 20, 22]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm ci
      - run: npm test
```

## Tabla de configuración de jobs

| Opción | Descripción | Ejemplo |
|---|---|---|
| `strategy.matrix` | Ejecuta el job con múltiples variantes | `matrix: { node: [18, 20] }` |
| `needs` | Dependencia entre jobs | `needs: lint` |
| `if` | Condición de ejecución | `if: github.ref == 'refs/heads/main'` |
| `environment` | Entorno con protección | `environment: production` |
| `concurrency.group` | Grupo de concurrencia | `concurrency.group: ci-${{ github.ref }}` |
| `concurrency.cancel-in-progress` | Cancela ejecución en curso | `cancel-in-progress: true` |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[03 - Control de Versiones y CI-CD/21 - GitHub Actions/01 - Módulo 1 - Fundamentos y Sintaxis\|Módulo 1 - Fundamentos y Sintaxis]] |
| **Siguiente →** | [[03 - Módulo 3 - Actions\|Módulo 3 - Actions]] |
| **Inicio herramienta** | [[github-actions\|GitHub Actions]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [GitHub Actions Docs](https://docs.github.com/en/actions) |

---
