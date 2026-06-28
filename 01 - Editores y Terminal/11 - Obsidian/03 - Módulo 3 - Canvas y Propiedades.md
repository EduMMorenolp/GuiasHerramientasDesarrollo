# Módulo 3: Canvas y Propiedades

**Objetivo**: Aprender y dominar: Canvas y Propiedades.

## Canvas
Canvas es un editor visual basado en tarjetas interconectadas. Permite organizar ideas, diagramas y mapas conceptuales de forma libre.

### Tarjetas
Cada elemento en un canvas es una tarjeta que puede contener texto Markdown, imágenes, PDFs, notas embebidas o páginas web. Se crean con doble clic o arrastrando archivos.

### Conexiones
Las tarjetas se conectan mediante flechas arrastrando desde los bordes. Cada conexión puede tener etiquetas de texto y color.

### Grupos
Los grupos agrupan tarjetas visualmente con un fondo y borde. Permiten organizar secciones dentro del canvas.

## Properties (YAML Frontmatter)
Las propiedades son metadatos estructurados al inicio de cada nota, delimitados por `---`. Definen campos como título, fecha, tags, estado, etc.

```yaml
---
title: Nota Ejemplo
fecha: 2026-06-27
tags:
  - ejemplo
estado: pendiente
---
```

Las propiedades se editan desde la interfaz de Obsidian y son consultables desde Dataview.

## Templates
Las plantillas permiten crear notas con estructura predefinida. Se configuran desde Ajustes > Plantillas. Al insertar una plantilla se reemplazan variables como `{{date}}` o `{{title}}`.

## Daily Notes
Las notas diarias se crean con la fecha actual. Se configuran desde Ajustes > Daily Notes. Se puede definir carpeta, formato de fecha y plantilla.

## Command Palette
La paleta de comandos (Ctrl+P) permite ejecutar acciones sin navegar menús, incluyendo inserción de plantillas, creación de daily notes y manipulación de propiedades.

---

**Documentación oficial**: https://help.obsidian.md
**Siguiente**: [[04 - Módulo 4 - Plugins|Módulo 4: Plugins]]
**Inicio herramienta**: [[obsidian|Obsidian]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
