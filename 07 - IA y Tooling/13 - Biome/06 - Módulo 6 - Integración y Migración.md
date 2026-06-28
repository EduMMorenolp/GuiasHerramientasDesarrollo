# Módulo 6: Integración y Migración

**Objetivo**: Aprender y dominar: Integración y Migración.

## VS Code Extension

Instalar la extensión oficial `biomejs.biome` y configurar como formateador por defecto:

```json
{
  "editor.defaultFormatter": "biomejs.biome",
  "[javascript]": {
    "editor.defaultFormatter": "biomejs.biome"
  },
  "[typescript]": {
    "editor.defaultFormatter": "biomejs.biome"
  }
}
```

## Husky + lint-staged

```json
{
  "lint-staged": {
    "*.{js,ts,jsx,tsx,json,css}": [
      "npx @biomejs/biome check --write --no-errors-on-unmatched"
    ]
  }
}
```

## Migrar desde ESLint

```powershell
npx @biomejs/biome migrate eslint
```

## Migrar desde Prettier

```powershell
npx @biomejs/biome migrate prettier
```
---

**Documentación oficial**: https://biomejs.dev

**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
