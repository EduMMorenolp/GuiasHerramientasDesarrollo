# Módulo 3: Herramientas y Toolsets

**Objetivo**: Dominar el sistema de herramientas de Hermes Agent, organizar toolsets y utilizar los backends de terminal.

---

## Sistema de herramientas

Hermes Agent incluye más de 60 herramientas integradas organizadas en toolsets lógicos. Las herramientas son funciones que extienden las capacidades del agente.

### Toolsets principales

| Toolset | Propósito | Herramientas representativas |
|---------|-----------|------------------------------|
| `web` | Navegación web | `web_search`, `web_fetch` |
| `terminal` | Ejecución de comandos | `exec`, `terminal` |
| `file` | Manipulación de archivos | `read`, `write`, `edit` |
| `browser` | Automatización de navegador | `browser` |
| `vision` | Análisis de imágenes | `vision` |
| `image_gen` | Generación de imágenes | `image_generate` |
| `skills` | Gestión de habilidades | `create_skill`, `improve_skill` |
| `memory` | Sistema de memoria | `memory_search`, `memory_save` |
| `cronjob` | Tareas programadas | `cron_schedule` |
| `delegation` | Delegación a subagentes | `delegate` |
| `messaging` | Mensajería | `message_send` |

## Backends de terminal

Hermes Agent soporta seis backends de terminal para ejecutar código y comandos:

| Backend | Descripción | Ideal para |
|---------|-------------|------------|
| Local | Ejecución directa en la máquina | Desarrollo local |
| Docker | Ejecución en contenedor | Aislamiento |
| SSH | Ejecución remota | Servidores |
| Daytona | Espacios de trabajo serverless | Desarrollo en la nube |
| Singularity | Entornos HPC | Computación científica |
| Modal | Serverless con hibernación | Tareas esporádicas |

### Configurar backend

```bash
hermes config set terminal.backend docker
```

## Tool Gateway (Nous Portal)

Los suscriptores de Nous Portal pueden usar herramientas adicionales sin API keys separadas:

```bash
hermes model
```

Habilita búsqueda web, generación de imágenes, TTS y automatización del navegador a través del Tool Gateway.

## Tareas programadas con cron

```bash
# Programar una tarea
hermes cron add "0 9 * * *" "Revisar mis correos y resumir lo importante"

# Listar tareas
hermes cron list

# Eliminar tarea
hermes cron remove <id>
```

Las tareas programadas pueden entregar resultados a cualquier plataforma de mensajería configurada.

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/14 - Hermes Agent/02 - Módulo 2 - Configuración del Agente\|Módulo 2 - Configuración del Agente]] |
| **Siguiente →** | [[07 - IA/14 - Hermes Agent/04 - Módulo 4 - Sistema de Memoria\|Módulo 4 - Sistema de Memoria]] |
| **Inicio herramienta** | [[07 - IA/14 - Hermes Agent/hermes-agent\|Hermes Agent]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [Hermes Agent Docs](https://hermes-agent.ai) |

---
