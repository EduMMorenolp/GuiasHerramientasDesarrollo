# Módulo 4: Check Unificado

**Objetivo**: Aprender y dominar: Check Unificado.

El comando `check` ejecuta formateo, linting y organización de imports en un solo paso.

## Comando básico

```powershell
npx @biomejs/biome check --write
```

## Control de subcomandos

```powershell
npx @biomejs/biome check --write --formatter-enabled=true --linter-enabled=true
```

## Pre-commit hooks

```powershell
npx @biomejs/biome check --staged --write
```
---

**Documentación oficial**: https://biomejs.dev
**Siguiente**: [[05 - Módulo 5 - Configuración|Módulo 5: Configuración]]
**Inicio herramienta**: [[biome|Biome]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
