# MÃ³dulo 3: Agentes - EspecializaciÃ³n y AutomatizaciÃ³n

**Objetivo**: Dominar el sistema de agentes para tareas especializadas y flujos de trabajo complejos.

---

## Sistema de Agentes en OpenCode

### Agentes Primarios
Son los asistentes principales con los que interactÃºas directamente:
- **Build**: Todas las herramientas habilitadas (lectura, escritura, bash)
- **Plan**: Restringido a solo lectura y planificaciÃ³n
- **Personalizados**: Agentes que tÃº creas con configuraciones especÃ­ficas

### Subagentes
Asistentes especializados invocados por agentes principales o mediante menciÃ³n `@`:
- Se ejecutan en segundo plano
- Reportan resultados al agente principal
- Ideales para tareas paralelas o de investigaciÃ³n

---

## Agentes Integrados

### Primarios
| Agente | Herramientas | Uso principal |
|--------|-------------|---------------|
| **Build** | Todas habilitadas | ImplementaciÃ³n, escritura, debugging |
| **Plan** | Solo lectura | AnÃ¡lisis, planificaciÃ³n, exploraciÃ³n |

### Subagentes
| Agente | DescripciÃ³n |
|--------|-------------|
| **General** | Tareas complejas de mÃºltiples pasos |
| **Explore** | ExploraciÃ³n rÃ¡pida de solo lectura del cÃ³digo base |
| **Scout** | InvestigaciÃ³n de dependencias externas y documentaciÃ³n |

### CÃ³mo usar subagentes
```markdown
@explore "Encuentra todos los archivos que importan express en el proyecto"
@general "Revisa la estructura de carpetas y crea un diagrama"
@scout "Investiga la Ãºltima versiÃ³n de react-router y sus breaking changes"
```

---

## CreaciÃ³n de Agentes Personalizados

### MotivaciÃ³n
- Codificar conocimientos especÃ­ficos de un proyecto
- Estandarizar flujos de trabajo del equipo
- Crear asistentes especializados (revisor de cÃ³digo, generador de tests, etc.)

### MÃ©todos de ConfiguraciÃ³n

#### JSON (ConfiguraciÃ³n centralizada en `opencode.json`)
```json
{
  "agents": {
    "revisor": {
      "description": "Agente revisor de cÃ³digo",
      "prompt": "Eres un revisor de cÃ³digo senior. Revisa el cÃ³digo en busca de: bugs, problemas de rendimiento, seguridad, y adherencia a las convenciones del proyecto.",
      "mode": "subagent",
      "model": "claude-sonnet-4-20250514",
      "temperature": 0.3,
      "color": "#00aa00"
    }
  }
}
```

#### Markdown (Prompts largos y detallados)
Crea un archivo `.md` en:
- **Global**: `~/.config/opencode/agents/nombre-del-agente.md`
- **Proyecto**: `.opencode/agents/nombre-del-agente.md`

```markdown
---
description: Experto en migraciones de base de datos
mode: subagent
model: claude-sonnet-4-20250514
temperature: 0.2
color: "#0000aa"
---

Eres un experto en migraciones de bases de datos PostgreSQL. Tu especialidad es:
- Revisar migraciones existentes
- Sugerir optimizaciones
- Detectar problemas potenciales (deadlocks, bloqueos, etc.)
- Generar nuevos archivos de migraciÃ³n
```

### Wizard Interactivo
```powershell
opencode agent create
```
Te guÃ­a paso a paso para crear un agente personalizado.

### UbicaciÃ³n de Agentes
| UbicaciÃ³n | Ãmbito | Uso |
|-----------|--------|-----|
| `~/.config/opencode/agents/` | Global | Agentes personales, multi-proyecto |
| `.opencode/agents/` | Proyecto | Agentes especÃ­ficos del proyecto, compartibles vÃ­a git |

---

## Opciones de ConfiguraciÃ³n de Agentes

### ParÃ¡metros bÃ¡sicos
| OpciÃ³n | DescripciÃ³n | Ejemplo |
|--------|-------------|---------|
| `mode` | Rol del agente | `primary`, `subagent`, `all` |
| `description` | Breve descripciÃ³n | `"Experto en testing"` |
| `prompt` | Instrucciones del sistema | `"Eres un experto en..."` |

### ParÃ¡metros del modelo
| OpciÃ³n | DescripciÃ³n |
|--------|-------------|
| `model` | Modelo de IA a usar |
| `temperature` | Creatividad (0.0 - 1.0) |
| `steps` | Pasos mÃ¡ximos antes de detenerse |

### Herramientas y permisos
| OpciÃ³n | DescripciÃ³n |
|--------|-------------|
| `tools` | Herramientas especÃ­ficas habilitadas |
| `permission` | Nivel de permisos granular |

### PersonalizaciÃ³n visual
| OpciÃ³n | DescripciÃ³n |
|--------|-------------|
| `color` | Color del agente en la TUI (hex) |
| `hidden` | Ocultar agente del selector |

---

## Buenas PrÃ¡cticas con Agentes

1. **Agentes especÃ­ficos** = Mejores resultados
   - Crea agentes enfocados en una tarea especÃ­fica
   - No mezcles responsabilidades

2. **Prompts detallados**
   - Incluye ejemplos concretos
   - Define el tono y formato de respuesta
   - Especifica quÃ© herramientas usar

3. **Temperatura adecuada**
   - Baja (0.0-0.3): Tareas precisas, revisiÃ³n de cÃ³digo
   - Media (0.3-0.7): GeneraciÃ³n de cÃ³digo, creatividad
   - Alta (0.7-1.0): Brainstorming, exploraciÃ³n

4. **Usa subagentes para paralelizar**
   - Un agente principal coordina
   - Subagentes investigan en paralelo
   - Mayor eficiencia en tareas complejas

---

## Resumen del MÃ³dulo

Al completar este mÃ³dulo deberÃ­as poder:
- [ ] Diferenciar entre agentes primarios y subagentes
- [ ] Usar los agentes integrados (Build, Plan, Explore, Scout)
- [ ] Crear agentes personalizados vÃ­a JSON y Markdown
- [ ] Configurar parÃ¡metros avanzados de agentes
- [ ] Aplicar buenas prÃ¡cticas en la creaciÃ³n de agentes

---
**Documentación oficial**: https://opencode.ai

**Siguiente**: [[04 - MÃ³dulo 4 - PersonalizaciÃ³n y ConfiguraciÃ³n Avanzada|MÃ³dulo 4: PersonalizaciÃ³n y ConfiguraciÃ³n Avanzada]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



