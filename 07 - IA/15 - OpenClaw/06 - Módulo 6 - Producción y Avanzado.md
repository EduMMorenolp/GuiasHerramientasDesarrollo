# Módulo 6: Producción y Avanzado

**Objetivo**: Desplegar OpenClaw en producción con Docker, configurar seguridad y optimizar el rendimiento.

---

## Despliegue con Docker

### Docker Compose

```yaml
services:
  openclaw:
    image: openclaw/openclaw:latest
    ports:
      - "18789:18789"
    volumes:
      - ~/.openclaw:/root/.openclaw
    environment:
      - OPENCLAW_CONFIG_PATH=/root/.openclaw/config.yaml
    restart: unless-stopped
```

```bash
docker compose up -d
```

### Variables de entorno

| Variable | Descripción |
|----------|-------------|
| `OPENCLAW_HOME` | Directorio base para resolución de rutas |
| `OPENCLAW_STATE_DIR` | Directorio de estado |
| `OPENCLAW_CONFIG_PATH` | Ruta al archivo de configuración |

## Seguridad

### Sandbox

El sandbox aísla la ejecución de herramientas del agente:

```yaml
sandbox:
  enabled: true
  type: container
  image: openclaw-sandbox:latest
  volumes:
    - ./workspace:/workspace:ro
```

### Aprobación de comandos

```yaml
tools:
  exec:
    approval: required
    allowed_patterns:
      - "git *"
      - "npm *"
    denied_patterns:
      - "rm -rf /"
      - "sudo *"
```

### Política por agente

```yaml
agents:
  code-reviewer:
    sandbox:
      enabled: true
    tools:
      allow: ["read", "exec"]
      deny: ["web_search", "browser"]
```

## Rendimiento

### Configuración avanzada del Gateway

```yaml
gateway:
  port: 18789
  host: 0.0.0.0
  max_sessions: 100
  session_timeout_minutes: 30
  rate_limit:
    messages_per_minute: 60
```

### Control UI personalizado

```bash
mkdir -p ~/.openclaw/control-ui-custom
```

```json
{
  "gateway": {
    "controlUi": {
      "enabled": true,
      "root": "~/.openclaw/control-ui-custom"
    }
  }
}
```

## Actualización

```bash
# Actualizar OpenClaw
openclaw update

# Cambiar canal de actualización
openclaw update --channel dev
openclaw update --channel stable
```
