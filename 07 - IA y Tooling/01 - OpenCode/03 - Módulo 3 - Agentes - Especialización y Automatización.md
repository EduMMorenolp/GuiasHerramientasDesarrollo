# Módulo 3: Agentes - Especialización y Automatización

**Objetivo**: Dominar el sistema de agentes para tareas especializadas y flujos de trabajo complejos.

---

## Sistema de Agentes en OpenCode

### Agentes Primarios
Son los asistentes principales con los que interactúas directamente:
- **Build**: Todas las herramientas habilitadas (lectura, escritura, bash)
- **Plan**: Restringido a solo lectura y planificación
- **Personalizados**: Agentes que tú creas con configuraciones específicas

### Subagentes
Asistentes especializados invocados por agentes principales o mediante mención `@`:
- Se ejecutan en segundo plano
- Reportan resultados al agente principal
- Ideales para tareas paralelas o de investigación

---

## Agentes Integrados

### Primarios
| Agente | Herramientas | Uso principal |
|--------|-------------|---------------|
| **Build** | Todas habilitadas | Implementación, escritura, debugging |
| **Plan** | Solo lectura | Análisis, planificación, exploración |

### Subagentes
| Agente | Descripción |
|--------|-------------|
| **General** | Tareas complejas de múltiples pasos |
| **Explore** | Exploración rápida de solo lectura del código base |
| **Scout** | Investigación de dependencias externas y documentación |

### Cómo usar subagentes
```markdown
@explore "Encuentra todos los archivos que importan express en el proyecto"
@general "Revisa la estructura de carpetas y crea un diagrama"
@scout "Investiga la última versión de react-router y sus breaking changes"
```

---

## Creación de Agentes Personalizados

### Motivación
- Codificar conocimientos específicos de un proyecto
- Estandarizar flujos de trabajo del equipo
- Crear asistentes especializados (revisor de código, generador de tests, etc.)

### Métodos de Configuración

#### JSON (Configuración centralizada en `opencode.json`)
```json
{
  "agents": {
    "revisor": {
      "description": "Agente revisor de código",
      "prompt": "Eres un revisor de código senior. Revisa el código en busca de: bugs, problemas de rendimiento, seguridad, y adherencia a las convenciones del proyecto.",
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
- Generar nuevos archivos de migración
```

### Wizard Interactivo
```powershell
opencode agent create
```
Te guía paso a paso para crear un agente personalizado.

### Ubicación de Agentes
| Ubicación | Ámbito | Uso |
|-----------|--------|-----|
| `~/.config/opencode/agents/` | Global | Agentes personales, multi-proyecto |
| `.opencode/agents/` | Proyecto | Agentes específicos del proyecto, compartibles vía git |

---

## Opciones de Configuración de Agentes

### Parámetros básicos
| Opción | Descripción | Ejemplo |
|--------|-------------|---------|
| `mode` | Rol del agente | `primary`, `subagent`, `all` |
| `description` | Breve descripción | `"Experto en testing"` |
| `prompt` | Instrucciones del sistema | `"Eres un experto en..."` |

### Parámetros del modelo
| Opción | Descripción |
|--------|-------------|
| `model` | Modelo de IA a usar |
| `temperature` | Creatividad (0.0 - 1.0) |
| `steps` | Pasos máximos antes de detenerse |

### Herramientas y permisos
| Opción | Descripción |
|--------|-------------|
| `tools` | Herramientas específicas habilitadas |
| `permission` | Nivel de permisos granular |

### Personalización visual
| Opción | Descripción |
|--------|-------------|
| `color` | Color del agente en la TUI (hex) |
| `hidden` | Ocultar agente del selector |

---

## Buenas Prácticas con Agentes

1. **Agentes específicos** = Mejores resultados
   - Crea agentes enfocados en una tarea específica
   - No mezcles responsabilidades

2. **Prompts detallados**
   - Incluye ejemplos concretos
   - Define el tono y formato de respuesta
   - Especifica qué herramientas usar

3. **Temperatura adecuada**
   - Baja (0.0-0.3): Tareas precisas, revisión de código
   - Media (0.3-0.7): Generación de código, creatividad
   - Alta (0.7-1.0): Brainstorming, exploración

4. **Usa subagentes para paralelizar**
   - Un agente principal coordina
   - Subagentes investigan en paralelo
   - Mayor eficiencia en tareas complejas

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [ ] Diferenciar entre agentes primarios y subagentes
- [ ] Usar los agentes integrados (Build, Plan, Explore, Scout)
- [ ] Crear agentes personalizados vía JSON y Markdown
- [ ] Configurar parámetros avanzados de agentes
- [ ] Aplicar buenas prácticas en la creación de agentes

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[04 - Módulo 4 - Personalización y Configuración Avanzada|Módulo 4: Personalización y Configuración Avanzada]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
