# MÃ³dulo 6: Settings Sync, Enterprise y Accesibilidad

**Objetivo**: Sincronizar configuraciÃ³n y explorar caracterÃ­sticas enterprise y de accesibilidad.

---

## Settings Sync

### Â¿QuÃ© es?
Sincroniza configuraciones, keybindings, extensiones y snippets entre mÃ¡quinas.

### Activar
```powershell
Ctrl+Shift+P > "Settings Sync: Turn On"
# Autenticarse con GitHub o Microsoft
```

### QuÃ© sincroniza
| Elemento | Sincronizado |
|----------|-------------|
| Settings | SÃ­ |
| Keybindings | SÃ­ |
| Extensions | SÃ­ (instaladas automÃ¡ticamente) |
| Snippets | SÃ­ |
| UI State | SÃ­ |
| Tasks | SÃ­ |
| User Profiles | SÃ­ |

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
- Ideal para: ediciÃ³n rÃ¡pida, revisiÃ³n de PRs, documentaciÃ³n

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
| Escenario | SoluciÃ³n |
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
# NavegaciÃ³n por teclado completa
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
- SubtÃ­tulos en videos de ayuda
- Indicadores visuales en lugar de sonidos

---

## VS Code como Editor de DocumentaciÃ³n

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

## Resumen del MÃ³dulo

| Feature | DescripciÃ³n |
|---------|-------------|
| Settings Sync | Sincronizar entre mÃ¡quinas |
| vscode.dev | Editor en navegador |
| Workspace Trust | Confianza por workspace |
| Managed Policies | PolÃ­ticas corporativas |
| Accesibilidad | Screen reader, high contrast |
| Markdown | DocumentaciÃ³n integrada |

---
**Documentación oficial**: https://code.visualstudio.com/docs

**Inicio herramienta**: [[vscode|VS Code]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



