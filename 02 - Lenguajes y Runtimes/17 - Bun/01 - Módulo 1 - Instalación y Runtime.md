# MÃ³dulo 1: InstalaciÃ³n y Runtime

## InstalaciÃ³n

```bash
# InstalaciÃ³n global con curl (Linux/macOS)
curl -fsSL https://bun.sh/install | bash

# InstalaciÃ³n con npm
npm install -g bun

# Windows con winget
winget install Bun

# Verificar versiÃ³n
bun --version

# Ayuda
bun --help
```

## Ejecutar archivos

```bash
# Ejecutar archivo TypeScript/JavaScript
bun run archivo.ts

# Ejecutar script definido en package.json
bun run dev

# Hot reload -- reinicia al detectar cambios
bun run --watch archivo.ts
```

## Compatibilidad con Node.js

`bun run` puede reemplazar a `node` en la mayoria de los casos. Bun implementa la mayoria de las APIs nativas de Node.js (fs, path, http, etc.).

| Caracteristica | Node.js (V8) | Bun (JavaScriptCore) |
|---|---|---|
| Motor | V8 | WebKit JavaScriptCore |
| Arranque | Lento (compila JIT) | Rapido (interpretacion inicial optimizada) |
| Instalacion de paquetes | Lento (npm/yarn/pnpm) | 10-30x mas rapido |
| Compatibilidad | Estandar | ~90% de APIs de Node.js |
| TypeScript nativo | No (requiere ts-node/tsx) | Si, sin configuracion |

## Comandos basicos

| Comando | Descripcion |
|---|---|
| `bun --version` | Muestra la version instalada |
| `bun --help` | Muestra la ayuda |
| `bun run <archivo>` | Ejecuta un archivo |
| `bun run <script>` | Ejecuta un script del package.json |
| `bun run --watch` | Ejecuta con recarga automatica |

---

**Documentación oficial**: https://bun.sh/docs

**Siguiente**: |Módulo 2: Gestor de Paquetes]]
**Inicio herramienta**: [[bun|Bun]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]








