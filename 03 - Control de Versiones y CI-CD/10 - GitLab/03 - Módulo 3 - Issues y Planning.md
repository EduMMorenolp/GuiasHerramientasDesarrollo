# Módulo 3: Issues y Planning

**Objetivo**: Gestionar el trabajo del equipo con Issues, Boards y planificación ágil.

---

## Issues

### Crear un Issue

Desde el proyecto: Issues > New Issue

Campos clave:
- **Title**: Título descriptivo
- **Description**: Plantilla con checklist, contexto, criterios de aceptación
- **Type**: Issue, Task, Incident
- **Labels**: Etiquetas para categorizar
- **Milestone**: Asignar a un hito
- **Due date**: Fecha límite
- **Weight**: Puntos de esfuerzo estimados
- **Assignee**: Responsable
- **Confidential**: Issue privado (solo miembros)

### Etiquetas

Etiquetas predefinidas y personalizadas:

```yaml
# Etiquetas comunes
bug:        Error reportado
feature:    Nueva funcionalidad
enhancement: Mejora existente
documentation: Documentación
priority::high, priority::low
status::in-progress, status::done
```

### Descripción con Checklist

```
## Tareas
- [ ] Investigar solución
- [ ] Implementar cambios
- [ ] Escribir tests
- [ ] Actualizar documentación
```

---

## Boards

Tableros estilo Kanban para visualizar el flujo de trabajo:

| Columna | Propósito |
|---------|-----------|
| **Open** | Issues nuevos sin asignar |
| **In Progress** | Trabajo en curso |
| **In Review** | Pendiente de code review |
| **Done** | Completado |

### Board Avanzado

```yaml
# Configuración de Board
lists:
  - label: "status::backlog"
  - label: "status::ready"
  - label: "status::in-progress"
  - label: "status::review"
  - label: "status::done"
scope: project  # o group
```

---

## Milestones

Hitos que agrupan issues con fecha objetivo:

| Concepto | Descripción |
|----------|-------------|
| **Title** | Nombre del hito (ej: v2.0) |
| **Start date** | Fecha de inicio |
| **Due date** | Fecha de entrega |
| **Progress** | % completado automático |
| **Burndown Chart** | Gráfico de progreso |

---

## Epics

Agrupan múltiples issues y milestones (disponible en Premium+):

```yaml
Epic: Migración a microservicios
  â”œâ”€â”€ Milestone: MVP APIs
  â”‚   â”œâ”€â”€ Issue: Auth service
  â”‚   â””â”€â”€ Issue: User service
  â””â”€â”€ Milestone: Mejoras
      â”œâ”€â”€ Issue: Rate limiting
      â””â”€â”€ Issue: Monitoring
```

---

## Time Tracking

```yaml
# En descripción del issue
/time estimate: 8h
/time spent: 6h
```

```powershell
# Spent: 6h
# Estimate: 8h
# Remaining: 2h
```

### Comandos rápidos

| Comando | Acción |
|---------|--------|
| `/spend 3h` | Registrar tiempo |
| `/estimate 5h` | Estimar duración |
| `/weight 3` | Asignar peso |
| `/due 2026-07-15` | Fecha límite |
| `/assign @usuario` | Asignar usuario |
| `/label ~bug` | Añadir etiqueta |
| `/close` | Cerrar issue |
| `/epic epic-name` | Vincular épica |

---

## GitLab Duo AI

Capacidades asistidas por IA:

| Característica | Descripción |
|----------------|-------------|
| **Code Suggestions** | Autocompletado de código |
| **Issue description** | Generar descripción automática |
| **MR summary** | Resumir cambios en MR |
| **Code Review** | Sugerencias en revisiones |
| **Chat** | Asistente conversacional |
| **Test Generation** | Generar tests automáticos |
| **Root Cause Analysis** | Analizar fallos en CI/CD |

---

## Resumen del Módulo

| Concepto | Descripción |
|----------|-------------|
| **Issue** | Tarea, bug o incidencia |
| **Board** | Tablero Kanban visual |
| **Milestone** | Hito con fecha objetivo |
| **Epic** | Agrupación de alto nivel |
| **Time Tracking** | Registro de tiempo |
| **Weight** | Puntos de esfuerzo |
| **GitLab Duo** | Asistente IA integrado |

---

**Documentación oficial**: https://docs.gitlab.com
**Siguiente**: [[04 - Módulo 4 - GitLab CI-CD|Módulo 4: GitLab CI/CD]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
