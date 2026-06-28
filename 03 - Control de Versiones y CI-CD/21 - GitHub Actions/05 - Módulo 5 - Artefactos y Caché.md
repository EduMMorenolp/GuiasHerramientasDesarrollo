# MÃ³dulo 5: Artefactos y CachÃ©

## Artefactos

Los artefactos permiten compartir archivos entre jobs o descargarlos tras la ejecucion.

### Subir artefacto

```yaml
- uses: actions/upload-artifact@v4
  with:
    name: mi-build
    path: dist/
```

### Descargar artefacto

```yaml
- uses: actions/download-artifact@v4
  with:
    name: mi-build
    path: ./descargado
```

## Cache

El cache acelera los workflows reutilizando dependencias entre ejecuciones.

```yaml
- uses: actions/cache@v4
  with:
    path: node_modules
    key: ${{ runner.os }}-node-${{ hashFiles('package-lock.json') }}
  id: cache-node
```

### Usar `cache-hit` para condicionar

```yaml
- if: steps.cache-node.outputs.cache-hit != 'true'
  run: npm ci
```

## Pasar datos entre pasos

### Con `GITHUB_OUTPUT`

```yaml
- name: Generar version
  id: version
  run: echo "version=1.0.0" >> $env:GITHUB_OUTPUT

- name: Mostrar version
  run: echo "Version ${{ steps.version.outputs.version }}"
```

### Con `GITHUB_ENV`

```yaml
- name: Fijar variable global
  run: echo "API_URL=https://api.example.com" >> $env:GITHUB_ENV

- name: Usar variable
  run: echo "Conectando a $env:API_URL"
```

## Ejemplo completo: build + upload + deploy

```yaml
name: Build and Deploy

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci && npm run build
      - uses: actions/upload-artifact@v4
        with:
          name: build-output
          path: dist/

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: build-output
          path: ./dist
      - run: echo "Desplegando desde ./dist"
```

## Tabla de acciones de artefactos

| Accion | Proposito | Ejemplo de uso |
|---|---|---|
| `actions/upload-artifact@v4` | Sube archivos al workflow | Resultados de build, logs, reports |
| `actions/download-artifact@v4` | Descarga artefactos de jobs anteriores | Binarios para deploy |
| `actions/cache@v4` | Cachea dependencias entre ejecuciones | `node_modules`, `~/.cache` |

---

**Documentación oficial**: https://docs.github.com/en/actions
**Siguiente**: [[06 - MÃ³dulo 6 - Seguridad|MÃ³dulo 6 - Seguridad]]
**Inicio herramienta**: [[github-actions|GitHub Actions]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



