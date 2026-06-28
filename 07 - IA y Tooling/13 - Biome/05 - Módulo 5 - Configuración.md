# MÃ³dulo 5: ConfiguraciÃ³n

**Objetivo**: Aprender y dominar: ConfiguraciÃ³n.

Toda la configuraciÃ³n de Biome se centraliza en `biome.json`.

## Ejemplo completo

```json
{
  "$schema": "https://biomejs.dev/schemas/1.9.4/schema.json",
  "files": {
    "ignore": ["dist/", "node_modules/"],
    "include": ["src/"]
  },
  "formatter": {
    "indentStyle": "space",
    "lineWidth": 100
  },
  "linter": {
    "rules": {
      "recommended": true
    }
  },
  "organizeImports": {
    "enabled": true
  },
  "javascript": {
    "formatter": {
      "quoteStyle": "single"
    }
  }
}
```

## Secciones principales

- `files.ignore` / `files.include` â€” archivos a incluir o excluir
- `formatter` â€” configuraciÃ³n de formateo
- `linter` â€” configuraciÃ³n de linting
- `organizeImports` â€” ordenamiento automÃ¡tico de imports
- `javascript` â€” opciones especÃ­ficas de JS/TS

## Overrides

```json
{
  "overrides": [
    {
      "include": ["*.test.ts"],
      "linter": {
        "rules": {
          "suspicious": {
            "noConsoleLog": "off"
          }
        }
      }
    }
  ]
}
```

## VCS

```json
{
  "vcs": {
    "useIgnoreFile": true,
    "clientKind": "git"
  }
}
```
---

**Documentación oficial**: https://biomejs.dev
**Siguiente**: [[06 - MÃ³dulo 6 - IntegraciÃ³n y MigraciÃ³n|MÃ³dulo 6: IntegraciÃ³n y MigraciÃ³n]]
**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
