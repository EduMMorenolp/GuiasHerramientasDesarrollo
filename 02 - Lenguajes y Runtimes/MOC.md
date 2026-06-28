# MOC - Lenguajes y Runtimes

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### Node.js ↔ Bun
- Bun es un reemplazo directo de Node.js (misma API, mismo ecosistema npm)
- Ambos usan JavaScript/TypeScript y comparten módulos npm
- Bun incluye bundler, test runner y package manager integrados

### pnpm ↔ npm (Node.js)
- pnpm es alternativa a npm, compatible con el mismo package.json y node_modules
- Workspaces de pnpm son más eficientes que npm workspaces
- pnpm store es global vs node_modules plano de npm

### Node.js / Bun ↔ PM2
- PM2 gestiona procesos de aplicaciones Node.js en producción
- Bun tiene su propio watch mode y server nativo, pero PM2 añade cluster y monitoreo
- PM2 funciona con Node.js y Bun

### Python ↔ Node.js / Bun
- Python y JavaScript/TypeScript son lenguajes back-end populares
- Ambos tienen ecosistemas de paquetes (PyPI vs npm/pnpm)
- Bun puede ejecutar scripts que combinan Python (child_process)

## Flujo de Trabajo Recomendado

1. **Elegir runtime**: Node.js (estable, maduro) o Bun (rápido, moderno)
2. **Gestionar paquetes**: pnpm (rápido, eficiente)
3. **Ejecutar en producción**: PM2 (cluster, monitoreo, zero-downtime)
4. **Alternativa Python**: scripts de automatización, data science, backend

---
**Inicio herramienta**: [[Índice General]]
