# MÃ³dulo 1: Fundamentos y Sintaxis

Los workflows de GitHub Actions se definen en archivos YAML dentro de la carpeta `.github/workflows/`. Cada archivo describe un proceso automatizado que se activa ante eventos del repositorio.

## Estructura YAML

```yaml
name: CI
on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hola mundo"
```

## Triggers (`on`)

| Trigger | DescripciÃ³n |
|---|---|
| `push` | Se ejecuta al hacer push a cualquier rama |
| `pull_request` | Se ejecuta al abrir o sincronizar un PR |
| `schedule` | EjecuciÃ³n programada con cron (`cron: '0 0 * * *'`) |
| `workflow_dispatch` | EjecuciÃ³n manual desde la interfaz de GitHub |

## Componentes principales

- **`name`**: nombre descriptivo del workflow.
- **`on`**: evento(s) que disparan el workflow.
- **`jobs`**: conjunto de trabajos que se ejecutan.
- **`runs-on`**: tipo de runner donde corre el job.
- **`steps`**: lista de pasos dentro de un job.
- **`uses`**: acciÃ³n externa a reutilizar.
- **`run`**: comando shell a ejecutar.
- **`with`**: parÃ¡metros de entrada para una acciÃ³n.
- **`env`**: variables de entorno para el paso o job.

## Primer workflow

```yaml
name: Mi primer workflow

on: [push, workflow_dispatch]

jobs:
  saludo:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Ejecutar script
        run: echo "Hola desde GitHub Actions"
```

## Tabla de sintaxis bÃ¡sica

| Elemento | Uso | Ejemplo |
|---|---|---|
| `name` | Nombre del workflow | `name: CI` |
| `on` | Evento disparador | `on: push` |
| `jobs` | Contenedor de trabajos | `jobs:` |
| `runs-on` | Tipo de runner | `runs-on: ubuntu-latest` |
| `steps` | Pasos del job | `steps:` |
| `uses` | AcciÃ³n externa | `uses: actions/checkout@v4` |
| `run` | Comando shell | `run: npm test` |
| `with` | Inputs de acciÃ³n | `with: { node-version: 18 }` |
| `env` | Variables de entorno | `env: { NODE_ENV: test }` |

---

**Documentación oficial**: https://docs.github.com/en/actions
**Siguiente**: [[02 - MÃ³dulo 2 - Workflows|MÃ³dulo 2 - Workflows]]
**Inicio herramienta**: [[github-actions|GitHub Actions]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



