# Módulo 4: Scripts y CI/CD

**Objetivo**: Aprender y dominar: Scripts y CI/CD.

## Ejecucion de scripts

```bash
# Ejecutar script definido en package.json
pnpm run build

# Atajos: pnpm dev, pnpm test, pnpm start
pnpm dev
```

pnpm soporta scripts `pre` y `post`:

```json
{
  "scripts": {
    "prebuild": "rimraf dist",
    "build": "tsc",
    "postbuild": "cp package.json dist"
  }
}
```

## pnpm dlx

Similar a `npx`, ejecuta paquetes sin instalarlos globalmente:

```bash
pnpm dlx create-vite my-app
```

## Cache en CI

Para optimizar las ejecuciones en CI se debe cachear el store de pnpm:

```bash
# Obtener la ruta del store
pnpm store path
# ~/.local/share/pnpm/store o similar
```

## Frozen lockfile

En CI se recomienda `--frozen-lockfile` para evitar modificaciones no deseadas:

```bash
pnpm install --frozen-lockfile
```

## Ejemplo workflow GitHub Actions

```yaml
name: CI
on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
        with:
          version: 9
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: "pnpm"
      - run: pnpm install --frozen-lockfile
      - run: pnpm build
      - run: pnpm test
```

## Tabla de comandos de scripts

| Comando | Descripcion |
|---------|-------------|
| `pnpm run <script>` | Ejecuta un script arbitrario |
| `pnpm dev` | Atajo para `pnpm run dev` |
| `pnpm build` | Atajo para `pnpm run build` |
| `pnpm test` | Atajo para `pnpm run test` |
| `pnpm dlx <pkg>` | Ejecuta un binario sin instalarlo globalmente |
| `pnpm exec <cmd>` | Ejecuta un binario desde `node_modules/.bin` |

## Navegacion

---

**Documentación oficial**: https://pnpm.io/motivation
**Siguiente**: [[Módulo 5 - Catalogo y Seguridad]]
**Inicio herramienta**: [[pnpm|pnpm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
