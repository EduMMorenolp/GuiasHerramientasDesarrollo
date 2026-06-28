# MÃ³dulo 3: Issues y Planning

**Objetivo**: Gestionar el trabajo del equipo con Issues, Boards y planificaciÃ³n Ã¡gil.

---

## Issues

### Crear un Issue

Desde el proyecto: Issues > New Issue

Campos clave:
- **Title**: TÃ­tulo descriptivo
- **Description**: Plantilla con checklist, contexto, criterios de aceptaciÃ³n
- **Type**: Issue, Task, Incident
- **Labels**: Etiquetas para categorizar
- **Milestone**: Asignar a un hito
- **Due date**: Fecha lÃ­mite
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
documentation: DocumentaciÃ³n
priority::high, priority::low
status::in-progress, status::done
```

### DescripciÃ³n con Checklist

```
## Tareas
- [ ] Investigar soluciÃ³n
- [ ] Implementar cambios
- [ ] Escribir tests
- [ ] Actualizar documentaciÃ³n
```

---

## Boards

Tableros estilo Kanban para visualizar el flujo de trabajo:

| Columna | PropÃ³sito |
|---------|-----------|
| **Open** | Issues nuevos sin asignar |
| **In Progress** | Trabajo en curso |
| **In Review** | Pendiente de code review |
| **Done** | Completado |

### Board Avanzado

```yaml
# ConfiguraciÃ³n de Board
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

| Concepto | DescripciÃ³n |
|----------|-------------|
| **Title** | Nombre del hito (ej: v2.0) |
| **Start date** | Fecha de inicio |
| **Due date** | Fecha de entrega |
| **Progress** | % completado automÃ¡tico |
| **Burndown Chart** | GrÃ¡fico de progreso |

---

## Epics

Agrupan mÃºltiples issues y milestones (disponible en Premium+):

```yaml
Epic: MigraciÃ³n a microservicios
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
# En descripciÃ³n del issue
/time estimate: 8h
/time spent: 6h
```

```powershell
# Spent: 6h
# Estimate: 8h
# Remaining: 2h
```

### Comandos rÃ¡pidos

| Comando | AcciÃ³n |
|---------|--------|
| `/spend 3h` | Registrar tiempo |
| `/estimate 5h` | Estimar duraciÃ³n |
| `/weight 3` | Asignar peso |
| `/due 2026-07-15` | Fecha lÃ­mite |
| `/assign @usuario` | Asignar usuario |
| `/label ~bug` | AÃ±adir etiqueta |
| `/close` | Cerrar issue |
| `/epic epic-name` | Vincular Ã©pica |

---

## GitLab Duo AI

Capacidades asistidas por IA:

| CaracterÃ­stica | DescripciÃ³n |
|----------------|-------------|
| **Code Suggestions** | Autocompletado de cÃ³digo |
| **Issue description** | Generar descripciÃ³n automÃ¡tica |
| **MR summary** | Resumir cambios en MR |
| **Code Review** | Sugerencias en revisiones |
| **Chat** | Asistente conversacional |
| **Test Generation** | Generar tests automÃ¡ticos |
| **Root Cause Analysis** | Analizar fallos en CI/CD |

---

## Resumen del MÃ³dulo

| Concepto | DescripciÃ³n |
|----------|-------------|
| **Issue** | Tarea, bug o incidencia |
| **Board** | Tablero Kanban visual |
| **Milestone** | Hito con fecha objetivo |
| **Epic** | AgrupaciÃ³n de alto nivel |
| **Time Tracking** | Registro de tiempo |
| **Weight** | Puntos de esfuerzo |
| **GitLab Duo** | Asistente IA integrado |

---


**Documentación oficial**: https://docs.gitlab.com

**Siguiente**: [[04 - MÃ³dulo 4 - GitLab CI-CD|MÃ³dulo 4: GitLab CI/CD]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



