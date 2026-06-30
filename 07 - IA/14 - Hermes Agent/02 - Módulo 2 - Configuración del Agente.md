# Módulo 2: Configuración del Agente

**Objetivo**: Configurar proveedores de modelos, ajustar opciones del agente y dominar los comandos CLI principales.

---

## Proveedores de modelos

Hermes Agent funciona con múltiples proveedores:

### Nous Portal (recomendado)

```bash
hermes setup --portal
```

Una suscripción a Nous Portal cubre un modelo de lenguaje más las herramientas del Tool Gateway (búsqueda web, generación de imágenes, TTS y navegador).

### OpenRouter

```bash
hermes model
```

Configura OpenRouter como proveedor. El asistente solicitará la API key.

### OpenAI y otros endpoints

```bash
hermes config set provider openai
hermes config set openai.api_key sk-...
```

Soporta cualquier endpoint compatible con la API de OpenAI.

## Archivo de configuración

El archivo de configuración principal se encuentra en:

```bash
~/.config/hermes/config.yaml
```

### Ejemplo de configuración

```yaml
provider: portal
model: hermes-4
toolsets:
  - web
  - terminal
  - file
memory:
  enabled: true
  fts5: true
messaging:
  gateway:
    enabled: false
```

## Comandos CLI esenciales

| Comando | Descripción |
|---------|-------------|
| `hermes chat` | Inicia sesión interactiva |
| `hermes setup` | Asistente de configuración |
| `hermes model` | Cambia proveedor o modelo |
| `hermes config` | Gestiona configuración |
| `hermes tools` | Lista y configura toolsets |
| `hermes status` | Muestra estado del agente |
| `hermes update` | Actualiza a la última versión |
| `hermes gateway` | Gestiona el gateway de mensajería |

## Gestión de toolsets

```bash
# Ver toolsets disponibles
hermes tools

# Iniciar chat con toolsets específicos
hermes chat --toolsets "web,terminal,file"

# Configurar toolsets por plataforma
hermes tools
```

Toolsets comunes: `web`, `search`, `terminal`, `file`, `browser`, `vision`, `image_gen`, `skills`, `tts`, `memory`, `cronjob`, `delegation`, `homeassistant`, `messaging`.

## Variables de entorno

| Variable | Descripción |
|----------|-------------|
| `HERMES_CONFIG_PATH` | Ruta al archivo de configuración |
| `HERMES_DATA_DIR` | Directorio de datos del agente |
| `OPENAI_API_KEY` | API key de OpenAI |
| `ANTHROPIC_API_KEY` | API key de Anthropic |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/14 - Hermes Agent/01 - Módulo 1 - Instalación y Fundamentos\|Módulo 1 - Instalación y Fundamentos]] |
| **Siguiente →** | [[07 - IA/14 - Hermes Agent/03 - Módulo 3 - Herramientas y Toolsets\|Módulo 3 - Herramientas y Toolsets]] |
| **Inicio herramienta** | [[07 - IA/14 - Hermes Agent/hermes-agent\|Hermes Agent]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [Hermes Agent Docs](https://hermes-agent.ai) |

---
