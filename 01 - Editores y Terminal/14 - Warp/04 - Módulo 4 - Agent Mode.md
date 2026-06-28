# Módulo 4: Agent Mode

**Objetivo**: Utilizar el modo agente de Warp para asistencia AI en la terminal.

---

## Terminal vs Agent Mode

Warp ofrece dos modos de interacción principales:

### Terminal Mode
- Modo tradicional donde escribes comandos directamente
- Warp actúa como terminal mejorada con bloques y editor
- Sin interferencia de AI
- Uso normal del shell (PowerShell, bash, zsh)

### Agent Mode
- Modo conversacional con el agente AI
- Describes lo que quieres hacer en lenguaje natural
- El agente sugiere comandos que puedes revisar y ejecutar
- Puede explicar, depurar y transformar comandos

| Aspecto | Terminal Mode | Agent Mode |
|---------|---------------|------------|
| Entrada | Comandos directos | Lenguaje natural |
| Salida | Resultado del comando | Explicacion + comandos sugeridos |
| Control | Total sobre lo que ejecutas | El agente propone, tu decides |
| Ideal para | Usuarios expertos | Aprendizaje y automatizacion |

---

## Activacion del Agent Mode

### Atajo principal
- **Ctrl+Shift+Enter**: abre el input del agente en la terminal actual

### Formas de uso
```powershell
# Escribe tu peticion en lenguaje natural
"quiero encontrar archivos .log modificados en los ultimos 7 dias"

# El agente responde con:
find . -name "*.log" -mtime -7

# Puedes ejecutar el comando con un click
```

### Comandos que puedes pedir
- "explica este comando"
- "como comprimo estos archivos?"
- "encuentra procesos que usan mas de 1GB de RAM"
- "convierte este comando a PowerShell"
- "depura este error"

---

## Oz: El Agente de Warp

Oz es el agente AI integrado en Warp. Procesa el contexto de tu terminal para dar respuestas relevantes.

### Capacidades
- **Explicacion de comandos**: desglosa comandos complejos
- **Generacion de comandos**: crea comandos a partir de descripciones
- **Depuracion**: analiza errores y sugiere soluciones
- **Transformacion**: convierte entre shells (bash, zsh, PowerShell)
- **Revision de codigo**: analiza fragmentos de codigo

```powershell
# Ejemplo: pedir explicacion
"explica: git log --oneline --graph --all --decorate"

# Oz responde mostrando cada bandera y su funcion
```

---

## Codebase Context

Warp puede indexar tu repositorio Git para dar respuestas contextuales.

### Activacion
- Warp detecta automaticamente repositorios Git
- Indexa el codigo fuente para busquedas semanticas
- Oz puede responder preguntas sobre el codigo del proyecto

### Usos con contexto de codigo
- "encuentra donde se define esta funcion"
- "que hace este modulo?"
- "como se usa esta API?"
- "genera tests para este archivo"

### Privacidad
- El indexado es local
- No se envia codigo a servidores externos sin permiso
- Control granular sobre que repositorios indexar

---

## Agentes de Terceros

Warp soporta agentes AI externos ademas de Oz.

### Agentes compatibles

| Agente | Descripcion | Activacion |
|--------|-------------|------------|
| Claude Code | Agente de Anthropic para terminal | `claude` |
| Codex | OpenAI Codex para generacion de codigo | `codex` |
| OpenCode | Agente open source para desarrollo | `opencode` |

### Configuracion
```powershell
# En settings.yaml puedes configurar agentes externos
agents:
  default: oz
  third_party:
    - claude-code
    - codex
```

---

## Resumen

| Concepto | Descripcion |
|----------|-------------|
| Terminal Mode | Modo clasico sin AI |
| Agent Mode | Ctrl+Shift+Enter activa agente |
| Oz | Agente AI integrado de Warp |
| Codebase Context | Indexa Git para respuestas contextuales |
| Terceros | Claude Code, Codex, OpenCode |

---

**Documentación oficial**: https://docs.warp.dev
**Siguiente**: [[05 - Modulo 5 - Personalizacion|Modulo 5: Personalizacion]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
