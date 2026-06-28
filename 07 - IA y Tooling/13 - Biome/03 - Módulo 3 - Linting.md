# Módulo 3: Linting

**Objetivo**: Aprender y dominar: Linting.

Biome incluye más de 500 reglas de linting organizadas en categorías.

## Comando básico

```powershell
npx @biomejs/biome lint --write
```

## Categorías de reglas

- `correctness`
- `complexity`
- `performance`
- `security`
- `style`
- `suspicious`

## Configuración

```json
{
  "linter": {
    "rules": {
      "recommended": true
    }
  }
}
```

## Ignorar reglas

```typescript
// biome-ignore lint/suspicious/noDoubleEquals: validacion necesaria
if (x == null) { }
```
---

**Documentación oficial**: https://biomejs.dev
**Siguiente**: [[04 - Módulo 4 - Check Unificado|Módulo 4: Check Unificado]]
**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
