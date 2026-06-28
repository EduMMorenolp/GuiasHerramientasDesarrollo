# MÃ³dulo 5: Agents Window y GitHub Copilot

**Objetivo**: Dominar la ventana de agentes y la integraciÃ³n con GitHub Copilot.

---

## Agents Window

### Â¿QuÃ© es?
Nueva funcionalidad 2026 que permite ejecutar agentes de IA dentro de VS Code.

### Abrir Agents Window
```powershell
Ctrl+Shift+P > "Agents: Open Agents Window"
# O hacer clic en el icono de agentes en la activity bar
```

### CaracterÃ­sticas
| Feature | DescripciÃ³n |
|---------|-------------|
| **Multi-agente** | Varios agentes trabajando en paralelo |
| **Aislamiento** | Cada agente en su propio contexto |
| **Files panel** | Archivos modificados por el agente |
| **Changes panel** | Diffs de cambios realizados |
| **Persistencia** | Preferencias guardadas entre sesiones |

### Uso bÃ¡sico
1. Abre Agents Window
2. Describe la tarea
3. El agente analiza, edita y muestra resultados
4. Revisa cambios en Changes panel
5. Acepta o descarta modificaciones

### ConfiguraciÃ³n de agentes
```json
{
  "agent.harness": "default",
  "agent.isolation": "workspace",
  "extensions.supportAgentsWindow": ["github.copilot", "ms-python.python"]
}
```

### Atajos
```powershell
Ctrl+Shift+I    # Nueva sesiÃ³n de agente
Ctrl+Enter      # Ejecutar agente con prompt seleccionado
```

---

## GitHub Copilot

### InstalaciÃ³n
```powershell
# Extensiones necesarias
# - GitHub Copilot
# - GitHub Copilot Chat

# AutenticaciÃ³n
Ctrl+Shift+P > "GitHub Copilot: Sign In"
```

### Inline Suggestions
```powershell
Tab           # Aceptar sugerencia
Esc           # Rechazar sugerencia
Ctrl+Enter    # Ver mÃ¡s sugerencias
Alt+]         # Siguiente sugerencia
Alt+[         # Anterior sugerencia
```

### Copilot Chat
```powershell
Ctrl+Shift+I     # Abrir chat
Ctrl+Shift+P > "Copilot: Ask a Question"

# Comandos de chat
/explain         # Explicar cÃ³digo seleccionado
/fix             # Corregir errores
/tests           # Generar tests
/doc             # Generar documentaciÃ³n
/optimize        # Optimizar cÃ³digo
/clear           # Limpiar chat
```

### Inline Chat
```powershell
Ctrl+I           # Abrir inline chat
# Ej: Seleccionar cÃ³digo, Ctrl+I, escribir "refactor this to use async"
```

### Custom Instructions
```json
// settings.json
{
  "github.copilot.chat.codeGeneration.instructions": [
    {
      "file": ".github/copilot-instructions.md"
    }
  ]
}
```

### Edits Mode
```powershell
Ctrl+Shift+I     # Abrir Copilot Edits
# Permite ediciones multi-archivo con IA
```

---

## Testing Integrado

### Test Explorer
```powershell
Ctrl+Shift+P > "Testing: Focus on Test Explorer"
```

### ConfiguraciÃ³n de testing
```json
{
  "testExplorer.useNativeTesting": true,
  "testing.automaticallyOpenPeekView": "failure"
}
```

### Test coverage
```json
{
  "testExplorer.gutterDecoration": true,
  "coverage.decorator": "highlight",
  "coverage.displayBalloons": true
}
```

---

## Integrated Browser y Port Forwarding

### Browser Preview
```powershell
Ctrl+Shift+P > "Simple Browser: Show"
```

### Port Forwarding
```json
{
  "remote.portsAttributes": {
    "3000": {
      "label": "Web App",
      "onAutoForward": "openBrowser"
    }
  }
}
```

---

## Profiles

### Crear perfil
```powershell
Ctrl+Shift+P > "Profiles: Create Profile"
# Crear perfiles para Frontend, Backend, Data Science, etc.
```

### Compartir perfiles
```powershell
Ctrl+Shift+P > "Profiles: Export Profile"
Ctrl+Shift+P > "Profiles: Import Profile"
```

---

## Resumen del MÃ³dulo

| Feature | Comando |
|---------|---------|
| Agents Window | `Ctrl+Shift+P > Agents` |
| Copilot Inline | `Tab` aceptar |
| Copilot Chat | `Ctrl+Shift+I` |
| Inline Chat | `Ctrl+I` |
| Copilot Edits | `Ctrl+Shift+I` |
| Test Explorer | `Ctrl+Shift+P > Testing` |
| Profiles | `Ctrl+Shift+P > Profiles` |

---
**Documentación oficial**: https://code.visualstudio.com/docs

**Siguiente**: [[06 - MÃ³dulo 6 - Settings Sync, Enterprise y Accesibilidad|MÃ³dulo 6: Settings Sync, Enterprise y Accesibilidad]]
**Inicio herramienta**: [[vscode|VS Code]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



