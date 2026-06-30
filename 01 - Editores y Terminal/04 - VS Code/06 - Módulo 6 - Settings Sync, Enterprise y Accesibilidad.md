# Módulo 6: Settings Sync, Enterprise y Accesibilidad

**Objetivo**: Sincronizar configuración y explorar características enterprise y de accesibilidad.

---

## Settings Sync

### ¿Qué es?
Sincroniza configuraciones, keybindings, extensiones y snippets entre máquinas.

### Activar
```powershell
Ctrl+Shift+P > "Settings Sync: Turn On"
# Autenticarse con GitHub o Microsoft
```

### Qué sincroniza
| Elemento | Sincronizado |
|----------|-------------|
| Settings | Sí |
| Keybindings | Sí |
| Extensions | Sí (instaladas automáticamente) |
| Snippets | Sí |
| UI State | Sí |
| Tasks | Sí |
| User Profiles | Sí |

### Solucionar conflictos
```powershell
Ctrl+Shift+P > "Settings Sync: Show Synced Data"
Ctrl+Shift+P > "Settings Sync: Resolve Conflict"
Ctrl+Shift+P > "Settings Sync: Turn Off"
```

---

## VS Code for the Web (vscode.dev)

### Acceso
```powershell
# Abrir en navegador
https://vscode.dev

# Abrir repositorio GitHub directamente
https://vscode.dev/github/user/repo
```

### Limitaciones
- Sin terminal integrada
- Sin debugging
- Extensiones limitadas (web extensions)
- Sin tasks
- Ideal para: edición rápida, revisión de PRs, documentación

---

## Enterprise Features

### Workspace Trust
```json
{
  "security.workspace.trust.enabled": true,
  "security.workspace.trust.startupPrompt": "always"
}
```

### Policy Management
```json
// managed policies (distribuido por admin)
{
  "workbench.colorTheme": "Default Dark+",
  "extensions.confirmedUriHandlerExtensionIds": [],
  "telemetry.telemetryLevel": "off"
}
```

### Locked Mode
```json
{
  "workbench.settings.editor": "json",
  "workbench.settings.enableNaturalLanguageSearch": false
}
```

### Extensibilidad corporativa
| Escenario | Solución |
|-----------|----------|
| Extensiones forzadas | `extensions.forceInstall` |
| Extensiones prohibidas | `extensions.denyList` |
| Settings inmutables | Managed policies |
| Marketplace restringido | Gallery privada |

---

## Accesibilidad

### Atajos de accesibilidad
```powershell
Ctrl+E            # Activar/desactivar accesibilidad
Ctrl+Shift+P > "Accessibility: ..."
```

### Screen reader
```powershell
# Optimizado para NVDA, JAWS, VoiceOver
# Navegación por teclado completa
# Anuncios de cambios en panel de problemas
```

### Accesibilidad visual
```json
{
  "editor.fontSize": 16,
  "editor.lineHeight": 24,
  "editor.fontFamily": "Atkinson Hyperlegible, Verdana",
  "editor.bracketPairColorization.enabled": true,
  "editor.cursorBlinking": "phase",
  "workbench.colorTheme": "Default High Contrast"
}
```

### Accesibilidad auditiva
- Notificaciones visuales para eventos
- Subtítulos en videos de ayuda
- Indicadores visuales en lugar de sonidos

---

## VS Code como Editor de Documentación

### Extensiones para Docs
```json
{
  "extensions": {
    "recommendations": [
      "yzhang.markdown-all-in-one",
      "streetsidesoftware.code-spell-checker",
      "bierner.markdown-mermaid",
      "hediet.vscode-drawio",
      "mushan.vscode-paste-image"
    ]
  }
}
```

### Markdown avanzado
```powershell
Ctrl+Shift+V        # Preview Markdown
Ctrl+K V            # Preview lado a lado
Alt+Shift+F         # Formatear tabla
```

---

## Resumen del Módulo

| Feature | Descripción |
|---------|-------------|
| Settings Sync | Sincronizar entre máquinas |
| vscode.dev | Editor en navegador |
| Workspace Trust | Confianza por workspace |
| Managed Policies | Políticas corporativas |
| Accesibilidad | Screen reader, high contrast |
| Markdown | Documentación integrada |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[01 - Editores y Terminal/04 - VS Code/05 - Módulo 5 - Agents Window y GitHub Copilot\|Módulo 5 - Agents Window y GitHub Copilot]] |
| **Siguiente →** | — |
| **Inicio herramienta** | [[vscode\|VS Code]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [VS Code Docs](https://code.visualstudio.com/docs) |

---
