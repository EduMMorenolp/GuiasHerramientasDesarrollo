# Módulo 4: Sistema de Memoria

**Objetivo**: Comprender y utilizar la memoria persistente de Hermes Agent para conversaciones contextuales a largo plazo.

---

## Arquitectura de memoria

Hermes Agent implementa un sistema de memoria persistente de múltiples capas que permite al agente recordar información entre sesiones.

### Componentes

| Componente | Función |
|------------|---------|
| FTS5 Search | Búsqueda textual completa sobre conversaciones pasadas |
| LLM Summarization | Resúmenes periódicos de conocimiento acumulado |
| Periodic Nudges | Recordatorios automáticos para consolidar memoria |
| User Profiles | Perfiles de usuario que evolucionan con el tiempo |
| Honcho Integration | Modelado dialéctico del usuario |

## Memoria por defecto

La memoria está habilitada por defecto. Para verificar su estado:

```bash
hermes config get memory.enabled
```

### Configuración básica

```yaml
memory:
  enabled: true
  fts5: true
  summarization:
    interval_hours: 24
  nudges:
    enabled: true
    interval_hours: 6
```

## Búsqueda en memoria

Durante una conversación, Hermes busca automáticamente en su memoria información relevante. También se puede buscar explícitamente:

```
hermes: busca en tu memoria sobre el proyecto X
```

El agente utiliza FTS5 para búsqueda textual y LLM para resumir los resultados.

## Perfiles de usuario

Hermes construye un modelo del usuario a través del tiempo:

- Preferencias de herramientas
- Estilos de trabajo recurrentes
- Proyectos activos
- Historial de decisiones

Estos perfiles se actualizan automáticamente con cada interacción.

## Mejores prácticas

- Hablar con Hermes de forma consistente para construir un perfil rico
- Usar `hermes memory save` para guardar información importante explícitamente
- Revisar periódicamente `hermes memory search` para ver qué recuerda
- Las skills creadas automáticamente se benefician de la memoria acumulada
