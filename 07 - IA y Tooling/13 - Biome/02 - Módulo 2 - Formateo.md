# MÃ³dulo 2: Formateo

**Objetivo**: Aprender y dominar: Formateo.

Biome ofrece formateo de cÃ³digo con un 97% de compatibilidad con Prettier.

## Comando bÃ¡sico

```powershell
npx @biomejs/biome format --write src/
```

## Opciones principales

| OpciÃ³n | DescripciÃ³n |
|--------|-------------|
| `indentStyle` | `tab` o `space` |
| `lineWidth` | Longitud mÃ¡xima de lÃ­nea (por defecto 80) |
| `quoteStyle` | `single` o `double` |

## Uso en CI

```powershell
npx @biomejs/biome format --error-on-warnings src/
```
---

**Documentación oficial**: https://biomejs.dev
**Siguiente**: [[03 - MÃ³dulo 3 - Linting|MÃ³dulo 3: Linting]]
**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
