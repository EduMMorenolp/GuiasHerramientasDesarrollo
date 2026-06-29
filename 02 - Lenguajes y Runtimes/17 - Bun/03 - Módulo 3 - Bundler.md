# Módulo 3: Bundler

**Objetivo**: Aprender y dominar: Bundler.

## Build basico

```bash
bun build ./src/index.ts --outdir ./dist
```

## Flags principales

```bash
# Definir target (bun, node, browser)
bun build ./src/index.ts --target=browser

# Minificar salida
bun build ./src/index.ts --minify

# Generar sourcemaps
bun build ./src/index.ts --sourcemap

# Multiples puntos de entrada
bun build ./src/index.ts ./src/admin.ts --outdir ./dist

# Code splitting
bun build ./src/index.ts --splitting

# Formato de salida (esm o cjs)
bun build ./src/index.ts --format=esm
```

## JSX, TSX, CSS y assets

Bun maneja de forma nativa JSX, TSX, CSS y assets como imagenes y fuentes sin necesidad de plugins adicionales.

```tsx
// Componente React con Bun
function App() {
  return <h1>Hola desde Bun</h1>;
}
```

## Ejemplo de build con React

```bash
bun build ./src/app.tsx --outdir ./dist --target=browser --minify
```

## Opciones de bundle

| Opcion | Descripcion |
|---|---|
| `--target` | `bun`, `node` o `browser` |
| `--outdir` | Directorio de salida |
| `--minify` | Minifica el codigo generado |
| `--sourcemap` | Genera sourcemaps |
| `--splitting` | Activa code splitting |
| `--format` | `esm` o `cjs` |
| `--external` | Excluye dependencias del bundle |

---

**Documentación oficial**: https://bun.sh/docs
**Siguiente**: [[02 - Lenguajes y Runtimes/17 - Bun/04 - Módulo 4 - Test Runner|Módulo 4: Test Runner]]
**Inicio herramienta**: [[bun|Bun]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
