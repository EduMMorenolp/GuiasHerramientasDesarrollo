# Módulo 5: Plugins Esenciales

**Objetivo**: Aprender y dominar: Plugins Esenciales.

## Dataview
Dataview convierte el vault en una base de datos consultable. Usa propiedades YAML y contenido Markdown para generar tablas y listas.

### Consultas basicas

```dataview
TABLE fecha, estado, tags
FROM "Proyectos"
WHERE estado = "activo"
SORT fecha DESC
```

| Comando  | Funcion                          |
| -------- | -------------------------------- |
| `TABLE`  | Muestra columnas de propiedades  |
| `LIST`   | Lista notas con metadatos        |
| `FROM`   | Origen: carpeta, tag o enlace    |
| `WHERE`  | Filtro condicional               |

## Tasks
Tasks convierte `- [ ]` en un sistema de gestion de tareas con fechas, prioridades y filtros.

```
- [x] Tarea completada
- [ ] Tarea pendiente
- [ ] Tarea con fecha ðŸ“… 2026-06-28
- [ ] Tarea urgente â«
```

Las consultas se escriben en bloques de codigo `tasks` y permiten filtrar por fecha, prioridad, estado y mas.

## Kanban
Plugin que crea tableros Kanban desde archivos Markdown. Cada lista es un encabezado y cada tarjeta es un item de lista.

## Calendar
Muestra un calendario en la barra lateral que permite navegar entre daily notes y ver el historial de actividad.

## Excalidraw
Editor de diagramas y dibujos integrado. Los dibujos se guardan como archivos Markdown con SVG embebido.

## Templater
Sistema avanzado de plantillas con funciones JavaScript. Permite crear plantillas dinamicas con logica condicional, bucles y acceso al API de Obsidian.

## Omnisearch
Buscador alternativo con soporte para busqueda difusa, operadores booleanos y resultados en tiempo real.

## Tracker
Plugin para visualizar datos numericos de propiedades en graficos (barras, lineas, radar). Util para seguimiento de habitos, peso, finanzas, etc.

---

**Documentación oficial**: https://help.obsidian.md
**Siguiente**: [[06 - Módulo 6 - Sync y Publish|Módulo 6: Sync y Publish]]
**Inicio herramienta**: [[obsidian|Obsidian]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
