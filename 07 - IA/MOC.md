# MOC - IA

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### OpenCode ↔ Ollama
- OpenCode puede usar Ollama como proveedor de modelos locales
- Ollama sirve modelos vía API REST que OpenCode consume
- Flujo: OpenCode solicita → Ollama ejecuta modelo local → OpenCode procesa

### Ollama ↔ Lenguajes
- Ollama tiene SDKs para Python y JavaScript
- Se integra con Node.js, Bun y Python para aplicaciones con IA
- Modelos de Ollama se usan desde scripts y servidores

### Hermes Agent ↔ OpenClaw
- Hermes Agent es un agente de IA que puede conectarse a plataformas de mensajería
- OpenClaw funciona como gateway de mensajería multi-canal para agentes
- Ambos soportan skills, herramientas y subagentes

## Flujo de Desarrollo con IA

1. **Asistencia**: OpenCode + Ollama (modelos locales) para generar y revisar código
2. **Automatización**: Scripts en Node.js, Bun o Python que usan Ollama API
3. **Agentes**: Hermes Agent o OpenClaw para tareas autónomas y mensajería

---
**Inicio herramienta**: [[Índice General]]
