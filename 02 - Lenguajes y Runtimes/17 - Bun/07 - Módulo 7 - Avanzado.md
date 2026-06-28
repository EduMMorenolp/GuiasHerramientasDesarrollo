# MÃ³dulo 7: Avanzado

## Bun.build() API programatica

```ts
const result = await Bun.build({
  entrypoints: ["./src/index.ts"],
  outdir: "./dist",
  target: "browser",
  minify: true,
  sourcemap: "external",
});

if (!result.success) {
  console.error("Error de build:", result.logs);
}
```

## Plugins de Bun

Los plugins permiten extender el bundler y el runtime.

```ts
import { plugin } from "bun";

plugin({
  name: "mi-plugin",
  setup(build) {
    // Transformar archivos antes del build
    build.onLoad({ filter: /\.txt$/ }, async (args) => {
      const text = await Bun.file(args.path).text();
      return {
        contents: `export default ${JSON.stringify(text)}`,
        loader: "js",
      };
    });
  },
});
```

## Macros

Las macros ejecutan codigo en tiempo de build en lugar de ejecucion.

```ts
// archivo: macro.ts
export function saludar(nombre: string): string {
  return `Hola ${nombre}`;
}

// archivo: app.ts
import { saludar } from "./macro?macro";
console.log(saludar("Mundo")); // "Hola Mundo" (resuelto en build)
```

## Workers

```ts
// worker.ts
self.onmessage = (event) => {
  self.postMessage(event.data * 2);
};

// main.ts
const worker = new Worker("./worker.ts");
worker.postMessage(21);
worker.onmessage = (event) => {
  console.log(event.data); // 42
};
```

## Optimizacion de rendimiento

```bash
# Perfilamiento con Bun
bun run --profile app.ts

# Usar --smol para reducir uso de memoria
bun run --smol app.ts
```

## Tabla resumen avanzado

| Caracteristica | Descripcion |
|---|---|
| `Bun.build()` | API programatica de bundling |
| Plugins | Transform, resolve y onload hooks |
| Macros (`?macro`) | Codigo ejecutado en tiempo de build |
| Workers | Hilos paralelos con `new Worker()` |
| `--profile` | Perfilamiento de rendimiento |
| `--smol` | Modo de memoria reducida |

---

**Documentación oficial**: https://bun.sh/docs

**Inicio herramienta**: [[bun|Bun]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]







