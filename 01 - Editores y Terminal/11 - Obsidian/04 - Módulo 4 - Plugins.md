# MÃ³dulo 4: Plugins

## Core vs Community Plugins
- **Core plugins**: Vienen incluidos con Obsidian. No requieren instalaciÃ³n adicional. Ejemplos: Backlinks, Graph View, Outline, Templates.
- **Community plugins**: Desarrollados por la comunidad. Requieren instalaciÃ³n manual desde Ajustes > Plugins comunitarios.

## Instalar/Actualizar/Desinstalar

### Instalar
1. Ir a Ajustes > Plugins comunitarios > Explorar.
2. Buscar el plugin deseado.
3. Hacer clic en Instalar y luego Activar.

### Actualizar
En Ajustes > Plugins comunitarios aparece el boton "Revisar actualizaciones". Los plugins se actualizan individualmente o todos a la vez.

### Desinstalar
Desactivar el plugin primero, luego hacer clic en el icono de papelera junto al plugin en la lista.

## BRAT (Beta Reviewers Auto-update Tester)
BRAT permite instalar plugins que aun no estan en el marketplace oficial. Se necesita la URL del repositorio de GitHub del plugin.

### Uso basico
1. Instalar BRAT desde plugins comunitarios.
2. Agregar la URL del repositorio en Ajustes > BRAT > Add beta plugin.
3. BRAT mantiene el plugin actualizado automaticamente.

## Themes y CSS Snippets
- **Themes**: Apariencia completa del editor. Se instalan desde Ajustes > Apariencia > Themes.
- **CSS Snippets**: Fragmentos CSS que sobreescriben partes del tema activo. Se colocan en la carpeta `.obsidian/snippets/`.

## Plugin API
Obsidian expone una API en TypeScript/JavaScript para desarrollar plugins. Los plugins se empaquetan como carpetas en `.obsidian/plugins/` con archivos `main.js`, `manifest.json` y `styles.css`.

---

**Documentación oficial**: https://help.obsidian.md

**Siguiente**: [[05 - MÃ³dulo 5 - Plugins Esenciales|MÃ³dulo 5: Plugins Esenciales]]
**Inicio herramienta**: [[obsidian|Obsidian]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



