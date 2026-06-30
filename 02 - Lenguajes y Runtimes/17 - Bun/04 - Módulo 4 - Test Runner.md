# Módulo 4: Test Runner

**Objetivo**: Aprender y dominar: Test Runner.

## Ejecutar tests

```bash
# Ejecutar todos los tests
bun test

# Tests con cobertura
bun test --coverage

# Modo watch
bun test --watch
```

## API de testing (compatible con Jest)

```ts
import { describe, it, expect, test } from "bun:test";

describe("matematicas", () => {
  it("suma dos numeros", () => {
    expect(2 + 2).toBe(4);
  });
});

test("objeto es igual", () => {
  expect({ a: 1 }).toEqual({ a: 1 });
});
```

## Mocks

```ts
import { mock, spyOn, fn } from "bun:test";

const suma = mock((a, b) => a + b);
suma(1, 2);
expect(suma).toHaveBeenCalledWith(1, 2);

const objeto = { metodo: () => "original" };
const espiado = spyOn(objeto, "metodo");
```

## Snapshots

```ts
test("snapshot de objeto", () => {
  const data = { nombre: "Bun", version: "1.0" };
  expect(data).toMatchSnapshot();
});
```

## API de testing

| Funcion | Descripcion |
|---|---|
| `describe(nombre, fn)` | Agrupa tests |
| `it(nombre, fn)` / `test(nombre, fn)` | Define un test |
| `expect(valor)` | Realiza aserciones |
| `mock(fn)` | Crea una funcion mock |
| `spyOn(obj, metodo)` | Espia un metodo |
| `fn(impl)` | Crea una funcion simulada |
| `toMatchSnapshot()` | Compara con snapshot guardado |
| `--coverage` | Genera reporte de cobertura |
| `--watch` | Vuelve a ejecutar tests al cambiar archivos |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/17 - Bun/03 - Módulo 3 - Bundler\|Módulo 3 - Bundler]] |
| **Siguiente →** | [[02 - Lenguajes y Runtimes/17 - Bun/05 - Módulo 5 - APIs del Runtime\|Módulo 5: APIs del Runtime]] |
| **Inicio herramienta** | [[bun\|Bun]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Bun Docs](https://bun.sh/docs) |

---
