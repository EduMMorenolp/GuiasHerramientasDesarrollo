# MOC - IA y Tooling

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### OpenCode ↔ Ollama
- OpenCode puede usar Ollama como proveedor de modelos locales
- Ollama sirve modelos vía API REST que OpenCode consume
- Flujo: OpenCode solicita → Ollama ejecuta modelo local → OpenCode procesa

### Biome ↔ VS Code
- Biome tiene extensión oficial para VS Code
- Formateo y linting automático al guardar archivos
- Biome reemplaza ESLint + Prettier en proyectos JS/TS

### Ollama ↔ Lenguajes
- Ollama tiene SDKs para Python y JavaScript
- Se integra con Node.js, Bun y Python para aplicaciones con IA
- Modelos de Ollama se usan desde scripts y servidores

## Flujo de Desarrollo con IA

1. **Código**: Biome formatea/linta automáticamente
2. **Asistencia**: OpenCode + Ollama (modelos locales) para generar y revisar código
3. **Automatización**: Scripts en Node.js, Bun o Python que usan Ollama API

---
**Inicio herramienta**: [[Índice General]]
