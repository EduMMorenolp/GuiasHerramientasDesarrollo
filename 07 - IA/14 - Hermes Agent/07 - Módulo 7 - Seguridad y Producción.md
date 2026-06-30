# Módulo 7: Seguridad y Producción

**Objetivo**: Configurar Hermes Agent para entornos de producción con medidas de seguridad y despliegue serverless.

---

## Seguridad

### Aprobación de comandos

Hermes Agent puede requerir aprobación antes de ejecutar comandos sensibles:

```bash
hermes config set security.command_approval true
```

### Modos de aprobación

| Modo | Descripción |
|------|-------------|
| `auto` | Ejecuta comandos sin aprobación |
| `approve` | Solicita aprobación para cada comando |
| `pairing` | Solo usuarios autorizados pueden aprobar |

### Pairing por DM

```bash
hermes config set security.pairing_mode dm
```

Los usuarios deben estar vinculados a través de un código de pairing antes de interactuar con el agente.

### Aislamiento por contenedor

```bash
hermes config set terminal.backend docker
hermes config set docker.image "hermes-sandbox:latest"
```

Ejecuta todos los comandos del agente dentro de un contenedor Docker aislado.

## Despliegue serverless

### Modal

```bash
hermes config set terminal.backend modal
hermes modal deploy
```

Modal ofrece entornos serverless que hibernan cuando están inactivos, reduciendo costos.

### Daytona

```bash
hermes config set terminal.backend daytona
```

Espacios de trabajo remotos preconfigurados para desarrollo.

## Subagentes y delegación

Hermes puede delegar tareas a subagentes para trabajar en paralelo:

```
hermes: delega la revisión del código a un subagente mientras tú sigues investigando
```

## Actualizaciones

```bash
# Actualizar Hermes Agent
hermes update

# Ver versión actual
hermes --version
```

## Monitoreo

```bash
# Ver logs en tiempo real
hermes logs -f

# Exportar trayectorias para análisis
hermes trajectories export

# Estadísticas de uso
hermes stats
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/14 - Hermes Agent/06 - Módulo 6 - Plataformas de Mensajería\|Módulo 6 - Plataformas de Mensajería]] |
| **Siguiente →** | — |
| **Inicio herramienta** | [[07 - IA/14 - Hermes Agent/hermes-agent\|Hermes Agent]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [Hermes Agent Docs](https://hermes-agent.ai) |

---
