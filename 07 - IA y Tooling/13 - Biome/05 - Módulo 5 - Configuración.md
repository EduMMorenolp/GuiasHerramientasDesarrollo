# Módulo 5: Configuración

**Objetivo**: Aprender y dominar: Configuración.

Toda la configuración de Biome se centraliza en `biome.json`.

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
- `formatter` â€” configuración de formateo
- `linter` â€” configuración de linting
- `organizeImports` â€” ordenamiento automático de imports
- `javascript` â€” opciones específicas de JS/TS

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
**Siguiente**: [[06 - Módulo 6 - Integración y Migración|Módulo 6: Integración y Migración]]
**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
