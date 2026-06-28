# MÃ³dulo 3: Actions

Las acciones son bloques reutilizables que se publican en el [Marketplace](https://github.com/marketplace?type=actions) o se definen localmente.

## Actions del Marketplace

```yaml
steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-node@v4
    with:
      node-version: 20
  - uses: actions/cache@v4
    with:
      path: node_modules
      key: ${{ runner.os }}-node-${{ hashFiles('package-lock.json') }}
```

## Docker actions

Ejecutan cÃ³digo en un contenedor Docker pÃºblico.

```yaml
steps:
  - uses: docker://alpine:3.19
    with:
      entrypoint: /bin/sh
      args: -c "echo Hola desde Docker"
```

## JavaScript actions

Son acciones escritas en Node.js que incluyen un `action.yml` con la definiciÃ³n y un `index.js` con la lÃ³gica.

### action.yml

```yaml
name: 'Mi Action'
description: 'Saluda al usuario'
inputs:
  nombre:
    description: 'Nombre a saludar'
    required: true
    default: 'Mundo'
outputs:
  saludo:
    description: 'El saludo generado'
runs:
  using: 'node20'
  main: 'index.js'
```

### index.js

```javascript
const core = require('@actions/core');

try {
  const nombre = core.getInput('nombre');
  const saludo = `Hola ${nombre}`;
  console.log(saludo);
  core.setOutput('saludo', saludo);
} catch (error) {
  core.setFailed(error.message);
}
```

## Composite actions

Agrupan varios pasos en una sola acciÃ³n reutilizable sin necesidad de Docker ni Node.

```yaml
name: 'Lint and Test'
description: 'Ejecuta linter y tests'
inputs:
  node-version:
    required: true
    default: '20'
runs:
  using: 'composite'
  steps:
    - uses: actions/setup-node@v4
      with:
        node-version: ${{ inputs.node-version }}
    - run: npm ci
      shell: bash
    - run: npm run lint
      shell: bash
    - run: npm test
      shell: bash
```

## Tabla de tipos de actions

| Tipo | DescripciÃ³n | CuÃ¡ndo usarlo |
|---|---|---|
| **Docker** | Contenedor con cualquier lenguaje | Necesitas un entorno especÃ­fico |
| **JavaScript** | Node.js empaquetado con dependencias | RÃ¡pido, sin construir imagen |
| **Composite** | CombinaciÃ³n de pasos existentes | Reutilizar pasos sin escribir cÃ³digo |
| **Predefinida** | AcciÃ³n del Marketplace | Tareas comunes (checkout, cache, setup) |

---

**Documentación oficial**: https://docs.github.com/en/actions
**Siguiente**: [[04 - MÃ³dulo 4 - Runners|MÃ³dulo 4 - Runners]]
**Inicio herramienta**: [[github-actions|GitHub Actions]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



