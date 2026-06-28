# MÃ³dulo 1: Interfaz y EdiciÃ³n BÃ¡sica

**Objetivo**: Conocer la interfaz de VS Code y dominar la ediciÃ³n de cÃ³digo.

---

## Â¿QuÃ© es VS Code?

Editor de cÃ³digo fuente desarrollado por Microsoft, ligero pero potente, con soporte para cientos de lenguajes mediante extensiones.

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
| AcciÃ³n | Windows/Linux | macOS |
|--------|--------------|-------|
| Paleta de comandos | `Ctrl+Shift+P` | `Cmd+Shift+P` |
| Abrir archivo | `Ctrl+P` | `Cmd+P` |
| Buscar en archivo | `Ctrl+F` | `Cmd+F` |
| Buscar en proyecto | `Ctrl+Shift+F` | `Cmd+Shift+F` |
| Terminal integrada | `Ctrl+Ã‘` | `Cmd+Ã‘` |
| Explorador | `Ctrl+B` | `Cmd+B` |
| Cerrar pestaÃ±a | `Ctrl+W` | `Cmd+W` |

---

## EdiciÃ³n de CÃ³digo

### SelecciÃ³n y navegaciÃ³n
```powershell
Ctrl+D          # Seleccionar palabra siguiente igual
Ctrl+Shift+L   # Seleccionar todas las ocurrencias
Alt+Up/Down    # Mover lÃ­nea arriba/abajo
Alt+Click      # AÃ±adir cursor mÃºltiple
Ctrl+Shift+K   # Eliminar lÃ­nea
Ctrl+/         # Comentar/descomentar lÃ­nea
```

### IntelliSense
- Autocompletado inteligente con `Ctrl+Space`
- InformaciÃ³n de parÃ¡metros
- Ir a definiciÃ³n (`F12`)
- Ver referencias (`Shift+F12`)
- Cambiar nombre simbÃ³lico (`F2`)

### Multi-cursor
```powershell
Alt+Click        # AÃ±adir cursor
Ctrl+Alt+Up/Down # AÃ±adir cursor arriba/abajo
Ctrl+U           # Deshacer Ãºltimo cursor
```

---

## GestiÃ³n de Archivos

### Explorer
- `Ctrl+B` - Mostrar/ocultar explorador
- `Ctrl+Shift+E` - Enfocar explorador
- Arrastrar archivos para mover
- BotÃ³n derecho: Renombrar, eliminar, nuevo archivo

### BÃºsqueda global
- `Ctrl+Shift+F` - Buscar en todos los archivos
- Soporte de regex
- Reemplazar en mÃºltiples archivos

---

## ConfiguraciÃ³n BÃ¡sica

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

**Siguiente**: [[02 - MÃ³dulo 2 - Extensiones y PersonalizaciÃ³n|MÃ³dulo 2: Extensiones y PersonalizaciÃ³n]]
**Inicio herramienta**: [[vscode|VS Code]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



