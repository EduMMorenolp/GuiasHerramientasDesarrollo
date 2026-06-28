# MÃ³dulo 3: Linting

**Objetivo**: Aprender y dominar: Linting.

Biome incluye mÃ¡s de 500 reglas de linting organizadas en categorÃ­as.

## Comando bÃ¡sico

```powershell
npx @biomejs/biome lint --write
```

## CategorÃ­as de reglas

- `correctness`
- `complexity`
- `performance`
- `security`
- `style`
- `suspicious`

## ConfiguraciÃ³n

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
**Siguiente**: [[04 - MÃ³dulo 4 - Check Unificado|MÃ³dulo 4: Check Unificado]]
**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
