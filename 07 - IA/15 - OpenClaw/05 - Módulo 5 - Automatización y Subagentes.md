# Módulo 5: Automatización y Subagentes

**Objetivo**: Programar tareas automáticas y coordinar múltiples agentes en OpenClaw.

---

## Automatización

OpenClaw incluye un sistema de automatización completo para ejecutar tareas en segundo plano.

### Tareas programadas (Cron)

```bash
# Crear tarea recurrente
openclaw automation add --cron "0 9 * * 1-5" --task "Resumir correo diario"

# Crear tarea única
openclaw automation add --at "2026-12-31T23:59" --task "Recordatorio fin de año"

# Listar tareas
openclaw automation list

# Eliminar tarea
openclaw automation remove <id>
```

### Heartbeat

El heartbeat ejecuta tareas periódicas de mantenimiento:

```yaml
automation:
  heartbeat:
    interval_minutes: 15
    tasks:
      - "Revisar bandeja de entrada"
      - "Actualizar estado del sistema"
```

### Standing Orders

Órdenes permanentes que el agente sigue en cada interacción:

```yaml
automation:
  standing_orders:
    - "Antes de responder, busca en la memoria"
    - "Si hay errores, sugiere soluciones"
```

## Subagentes

OpenClaw permite coordinar múltiples agentes para tareas complejas.

### Delegación

```json
{
  "type": "delegate",
  "agent": "code-reviewer",
  "task": "Revisar el pull request #42"
}
```

### Agent Send

```bash
openclaw agent send --agent "investigador" --task "Buscar documentación sobre Kubernetes"
```

### ACP Agents

El protocolo ACP (Agent Communication Protocol) permite que agentes se comuniquen entre sí:

```yaml
agents:
  code-reviewer:
    provider: anthropic
    model: claude-sonnet-4
    tools:
      - exec
      - read
  investigador:
    provider: openai
    model: gpt-5
    tools:
      - web_search
      - web_fetch
```

## Task Flow

El sistema Task Flow permite definir flujos de trabajo multi-paso:

```yaml
tasks:
  deploy-flow:
    steps:
      - Ejecutar tests
      - Construir artefacto
      - Publicar versión
      - Notificar al equipo
    on_failure: Detener y notificar
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/15 - OpenClaw/04 - Módulo 4 - Plugins\|Módulo 4 - Plugins]] |
| **Siguiente →** | [[07 - IA/15 - OpenClaw/06 - Módulo 6 - Producción y Avanzado\|Módulo 6 - Producción y Avanzado]] |
| **Inicio herramienta** | [[07 - IA/15 - OpenClaw/openclaw\|OpenClaw]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [OpenClaw Docs](https://openclaw.ai) |

---
