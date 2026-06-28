# Módulo 3: Herramientas y Skills

**Objetivo**: Utilizar las herramientas integradas de OpenClaw y crear skills para flujos de trabajo repetitivos.

---

## Categorías de herramientas

Las herramientas en OpenClaw son funciones con tipo que el agente puede llamar. Se organizan en categorías:

| Categoría | Propósito | Herramientas representativas |
|-----------|-----------|------------------------------|
| Runtime | Ejecutar comandos | `exec`, `process`, `code_execution` |
| Archivos | Leer y modificar archivos | `read`, `write`, `edit`, `apply_patch` |
| Web | Buscar en la web | `web_search`, `x_search`, `web_fetch` |
| Navegador | Operar el navegador | `browser` |
| Mensajería | Enviar respuestas | `message` |
| Sesiones | Inspeccionar y delegar | `sessions_*`, `subagents` |
| Automatización | Programar tareas | `cron`, `heartbeat_respond` |
| Media | Generar y analizar | `image`, `image_generate`, `tts` |

### Política de herramientas

Controla qué herramientas puede usar el agente:

```json
{
  "tools": {
    "allow": ["exec", "read", "write", "web_search"],
    "deny": ["code_execution"]
  }
}
```

## Skills

Un skill es un archivo `SKILL.md` con instrucciones que se cargan en el prompt del agente.

### Crear un skill

```bash
# Crear un skill interactivamente
openclaw skill create "deploy-docker"

# Estructura del skill
~/.openclaw/skills/deploy-docker/SKILL.md
```

### Ejemplo de SKILL.md

```markdown
# Deploy Docker

Despliega una aplicación usando Docker.

## Pasos
1. Construir la imagen: `docker build -t app .`
2. Ejecutar tests: `docker run app npm test`
3. Publicar: `docker push registry/app:latest`
4. Desplegar: `docker compose up -d`
```

### Skill Workshop

El Skill Workshop permite crear skills asistidos por IA:

```bash
openclaw skill workshop
```

## Gestión de skills

```bash
# Listar skills instalados
openclaw skill list

# Buscar skills
openclaw skill search "docker"

# Instalar skill del repositorio
openclaw skill install community/deploy-node

# Exportar skill
openclaw skill export deploy-docker > skill.yml
```
