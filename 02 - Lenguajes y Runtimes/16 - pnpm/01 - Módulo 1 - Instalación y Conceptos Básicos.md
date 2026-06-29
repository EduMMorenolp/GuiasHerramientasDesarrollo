# Módulo 1: Instalación y Conceptos Básicos

**Objetivo**: Aprender y dominar: Instalación y Conceptos Básicos.

## Instalación

pnpm puede instalarse de varias formas:

```bash
# Via npm (global)
npm install -g pnpm

# Via winget (Windows)
winget install pnpm

# Via scoop (Windows)
scoop install pnpm
```

Verificar la instalación:

```bash
pnpm --version
```

## Comandos fundamentales

| Comando | Descripción |
|---------|-------------|
| `pnpm init` | Inicializa un `package.json` |
| `pnpm install` | Instala dependencias desde `pnpm-lock.yaml` |
| `pnpm add <pkg>` | Agrega una dependencia |
| `pnpm remove <pkg>` | Elimina una dependencia |
| `pnpm dev` | Ejecuta el script `dev` |
| `pnpm run <script>` | Ejecuta cualquier script definido |
| `pnpm exec <cmd>` | Ejecuta un binario desde `node_modules/.bin` |

## Diferencias clave con npm

- **Store universal**: pnpm almacena todos los paquetes en un store global (`~/.pnpm-store`) y crea hard links, ahorrando espacio en disco.
- **Symlinks**: los `node_modules` usan symlinks en lugar de copiar todo, manteniendo una estructura estricta.
- **No hoisting**: a diferencia de npm, pnpm no eleva dependencias al nivel superior; cada paquete solo accede a sus dependencias declaradas.

## Store

```bash
# Ruta del store local
pnpm store path

# Importar desde package-lock.json de npm
pnpm import
```

## Comparativa npm vs pnpm

| Característica | npm | pnpm |
|----------------|-----|------|
| Store global | No | Si (hard links) |
| Hoisting | Si | No |
| Espacio en disco | Alto | Bajo |
| Velocidad instalación | Media | Alta |
| Estructura node_modules | Plana | Anidada con symlinks |
| Soporte monorepos | workspaces | Workspaces nativos |

## Navegación

---

**Documentación oficial**: https://pnpm.io/motivation
**Siguiente**: [[02 - Lenguajes y Runtimes/16 - pnpm/02 - Módulo 2 - Workspaces|Módulo 2 - Workspaces]]
**Inicio herramienta**: [[pnpm|pnpm]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
