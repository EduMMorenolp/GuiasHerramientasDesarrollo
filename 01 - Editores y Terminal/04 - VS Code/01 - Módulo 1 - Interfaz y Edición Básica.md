# Módulo 1: Interfaz y Edición Básica

**Objetivo**: Conocer la interfaz de VS Code y dominar la edición de código.

---

## ¿Qué es VS Code?

Editor de código fuente desarrollado por Microsoft, ligero pero potente, con soporte para cientos de lenguajes mediante extensiones.

---

## Interfaz

### Layout Principal
```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ Activity Bar  â”‚  Editor Tabs           â”‚
â”‚ â”Œâ”€â”€â”          â”‚ â”Œâ”€â”€â”€â”€â”¬â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”      â”‚
â”‚ â”‚ 1 â”‚          â”‚ â”‚Tab1â”‚Tab2â”‚Tab3â”‚      â”‚
â”‚ â”‚ 2 â”‚  Sidebar â”‚ â””â”€â”€â”€â”€â”´â”€â”€â”€â”€â”´â”€â”€â”€â”€â”˜      â”‚
â”‚ â”‚ 3 â”‚          â”‚                       â”‚
â”‚ â”‚ 4 â”‚          â”‚  Editor               â”‚
â”‚ â”‚ 5 â”‚          â”‚                       â”‚
â”‚ â””â”€â”€â”˜          â”‚                       â”‚
â”‚               â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚               â”‚  Status Bar           â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

### Atajos Esenciales
| Acción | Windows/Linux | macOS |
|--------|--------------|-------|
| Paleta de comandos | `Ctrl+Shift+P` | `Cmd+Shift+P` |
| Abrir archivo | `Ctrl+P` | `Cmd+P` |
| Buscar en archivo | `Ctrl+F` | `Cmd+F` |
| Buscar en proyecto | `Ctrl+Shift+F` | `Cmd+Shift+F` |
| Terminal integrada | `Ctrl+Ã‘` | `Cmd+Ã‘` |
| Explorador | `Ctrl+B` | `Cmd+B` |
| Cerrar pestaña | `Ctrl+W` | `Cmd+W` |

---

## Edición de Código

### Selección y navegación
```powershell
Ctrl+D          # Seleccionar palabra siguiente igual
Ctrl+Shift+L   # Seleccionar todas las ocurrencias
Alt+Up/Down    # Mover línea arriba/abajo
Alt+Click      # Añadir cursor múltiple
Ctrl+Shift+K   # Eliminar línea
Ctrl+/         # Comentar/descomentar línea
```

### IntelliSense
- Autocompletado inteligente con `Ctrl+Space`
- Información de parámetros
- Ir a definición (`F12`)
- Ver referencias (`Shift+F12`)
- Cambiar nombre simbólico (`F2`)

### Multi-cursor
```powershell
Alt+Click        # Añadir cursor
Ctrl+Alt+Up/Down # Añadir cursor arriba/abajo
Ctrl+U           # Deshacer último cursor
```

---

## Gestión de Archivos

### Explorer
- `Ctrl+B` - Mostrar/ocultar explorador
- `Ctrl+Shift+E` - Enfocar explorador
- Arrastrar archivos para mover
- Botón derecho: Renombrar, eliminar, nuevo archivo

### Búsqueda global
- `Ctrl+Shift+F` - Buscar en todos los archivos
- Soporte de regex
- Reemplazar en múltiples archivos

---

## Configuración Básica

```json
{
  "editor.fontSize": 14,
  "editor.fontFamily": "JetBrains Mono, Cascadia Code, Fira Code",
  "editor.tabSize": 2,
  "editor.renderWhitespace": "all",
  "editor.minimap.enabled": true,
  "editor.wordWrap": "on",
  "files.autoSave": "onFocusChange",
  "workbench.colorTheme": "One Dark Pro"
}
```

---

**Documentación oficial**: https://code.visualstudio.com/docs
**Siguiente**: [[02 - Módulo 2 - Extensiones y Personalización|Módulo 2: Extensiones y Personalización]]
**Inicio herramienta**: [[vscode|VS Code]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
