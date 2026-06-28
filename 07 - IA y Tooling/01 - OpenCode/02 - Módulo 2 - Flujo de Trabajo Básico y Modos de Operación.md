# MÃ³dulo 2: Flujo de Trabajo BÃ¡sico y Modos de OperaciÃ³n

**Objetivo**: Aprender a interactuar con OpenCode para tareas cotidianas de desarrollo.

---

## Modo Plan vs. Modo Build

### Modo Plan (Solo Lectura)
- **PropÃ³sito**: AnÃ¡lisis, planificaciÃ³n y exploraciÃ³n del cÃ³digo base
- **Herramientas disponibles**: Lectura de archivos, bÃºsqueda, navegaciÃ³n
- **Herramientas restringidas**: Escritura, ediciÃ³n, ejecuciÃ³n de comandos
- **CuÃ¡ndo usarlo**:
  - Entender cÃ³mo funciona una parte del cÃ³digo
  - Planificar una funcionalidad compleja antes de implementarla
  - Explorar el cÃ³digo base para encontrar patrones
  - Hacer preguntas sobre la arquitectura

### Modo Build (Acceso Total)
- **PropÃ³sito**: Implementar cambios, escribir cÃ³digo, ejecutar comandos
- **Herramientas disponibles**: Todas (lectura, escritura, ediciÃ³n, bash)
- **CuÃ¡ndo usarlo**:
  - Implementar una nueva funcionalidad
  - Corregir bugs
  - Refactorizar cÃ³digo
  - Ejecutar tests y comandos

### Cambio entre modos
Presiona la tecla **Tab** para alternar entre Plan y Build.

---

## Tipos de Interacciones

### Hacer preguntas y entender el cÃ³digo base
```markdown
"Â¿CÃ³mo funciona el sistema de autenticaciÃ³n en este proyecto?"
"Â¿QuÃ© archivos estÃ¡n involucrados en el proceso de checkout?"
"MuÃ©strame la estructura de carpetas del proyecto"
```

### Planificar una funcionalidad compleja
```markdown
(En modo Plan)
"Quiero aÃ±adir un sistema de cachÃ© para las consultas a la API.
Analiza la estructura actual y propÃ³n una implementaciÃ³n."
```

### Implementar cambios
```markdown
(En modo Build)
"AÃ±ade un endpoint GET /api/users/:id que devuelva los datos del usuario.
Sigue el mismo patrÃ³n que el endpoint de productos existente."
```

### Depurar y refactorizar
```markdown
"El test X estÃ¡ fallando. Revisa el cÃ³digo y encuentra el error."
"Refactoriza este componente para usar hooks en lugar de class components."
```

---

## GestiÃ³n de Cambios

### comandos /undo y /redo
- `/undo` - Deshace el Ãºltimo cambio realizado por OpenCode
- `/redo` - Rehace un cambio que fue deshecho
- **Importante**: Solo funciona dentro de la sesiÃ³n actual

### IteraciÃ³n sobre feedback
1. Revisa los cambios propuestos
2. Proporciona feedback especÃ­fico
3. OpenCode ajusta la implementaciÃ³n
4. Repite hasta que el resultado sea satisfactorio

### Buenas prÃ¡cticas
- Usa el modo **Plan** para funciones complejas antes de implementar
- Revisa siempre los **diffs** antes de aceptar cambios
- SÃ© especÃ­fico en tus instrucciones
- Proporciona **contexto** (archivos relevantes, patrones a seguir)

---

## Aprovechar la Capacidad Multimedia

### Arrastrar y soltar imÃ¡genes
Puedes arrastrar imÃ¡genes directamente a la terminal para:
- Mostrar errores visuales (UI bugs)
- Compartir diagramas de arquitectura
- Compartir capturas de diseÃ±o para implementar

---

## Flujo de Trabajo Recomendado

```mermaid
flowchart LR
    A[Idea/Meta] --> B[Modo Plan]
    B --> C{Â¿Plan claro?}
    C -- SÃ­ --> D[Modo Build]
    C -- No --> B
    D --> E[Revisar Diffs]
    E --> F{Â¿Correcto?}
    F -- SÃ­ --> G[Commit]
    F -- No --> H[Dar Feedback]
    H --> D
```

---

## Resumen del MÃ³dulo

Al completar este mÃ³dulo deberÃ­as poder:
- [ ] Diferenciar entre modo Plan y Build
- [ ] Usar el modo apropiado para cada tarea
- [ ] Gestionar cambios con /undo y /redo
- [ ] Proporcionar feedback efectivo
- [ ] Seguir un flujo de trabajo estructurado

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[03 - MÃ³dulo 3 - Agentes - EspecializaciÃ³n y AutomatizaciÃ³n|MÃ³dulo 3: Agentes - EspecializaciÃ³n y AutomatizaciÃ³n]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
