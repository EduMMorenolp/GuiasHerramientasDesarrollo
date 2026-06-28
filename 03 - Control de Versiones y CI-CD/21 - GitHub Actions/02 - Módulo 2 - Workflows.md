# MÃ³dulo 2: Workflows

## Matrices (`strategy.matrix`)

Permite ejecutar un mismo job con mÃºltiples versiones o configuraciones.

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

Controla el orden de ejecuciÃ³n. Un job puede esperar a que otro finalice.

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

Ejecuta un paso o job solo si se cumple una condiciÃ³n.

```yaml
jobs:
  deploy:
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando a producciÃ³n"
```

## Entornos (`environment`)

Agrupa reglas de protecciÃ³n, secrets y approvals.

```yaml
jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando con aprobaciÃ³n"
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

## Tabla de configuraciÃ³n de jobs

| OpciÃ³n | DescripciÃ³n | Ejemplo |
|---|---|---|
| `strategy.matrix` | Ejecuta el job con mÃºltiples variantes | `matrix: { node: [18, 20] }` |
| `needs` | Dependencia entre jobs | `needs: lint` |
| `if` | CondiciÃ³n de ejecuciÃ³n | `if: github.ref == 'refs/heads/main'` |
| `environment` | Entorno con protecciÃ³n | `environment: production` |
| `concurrency.group` | Grupo de concurrencia | `concurrency.group: ci-${{ github.ref }}` |
| `concurrency.cancel-in-progress` | Cancela ejecuciÃ³n en curso | `cancel-in-progress: true` |

---

**Documentación oficial**: https://docs.github.com/en/actions
**Siguiente**: [[03 - MÃ³dulo 3 - Actions|MÃ³dulo 3 - Actions]]
**Inicio herramienta**: [[github-actions|GitHub Actions]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



