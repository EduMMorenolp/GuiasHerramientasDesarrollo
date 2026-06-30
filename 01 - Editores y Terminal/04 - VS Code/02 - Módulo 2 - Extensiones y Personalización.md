# Módulo 2: Extensiones y Personalización

**Objetivo**: Dominar las extensiones y personalizar VS Code al máximo.

---

## Extensiones Esenciales

### Lenguajes y Frameworks
| Extensión | Propósito |
|-----------|-----------|
| ESLint | Linting JavaScript/TypeScript |
| Prettier | Formateador de código |
| Tailwind CSS IntelliSense | Autocompletado Tailwind |
| Python | Soporte para Python |
| Docker | Integración con Docker |

### Productividad
| Extensión | Propósito |
|-----------|-----------|
| GitLens | Visualización avanzada de Git |
| Error Lens | Muestra errores en línea |
| Path Intellisense | Autocompletado de rutas |
| Thunder Client | Cliente HTTP (alternativa a Postman) |
| TODO Highlight | Resaltar TODO, FIXME |

### Temas e Iconos
| Extensión | Propósito |
|-----------|-----------|
| One Dark Pro | Tema oscuro popular |
| Material Icon Theme | Iconos de archivos |

### Instalación desde terminal
```powershell
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --list-extensions  # Listar instaladas
```

---

## Snippets

### Snippets globales
```json
// settings.json
{
  "editor.snippets": {
    "log": {
      "prefix": "log",
      "body": "console.log('$1:', $1);",
      "description": "Log variable"
    },
    "af": {
      "prefix": "af",
      "body": "const ${1:name} = () => {\n  $2\n};",
      "description": "Arrow function"
    }
  }
}
```

---

## Settings Sincronizados

### Settings Sync
```powershell
# Activar desde:
Ctrl+Shift+P > "Settings Sync: Turn On"
# Sincroniza: settings, keybindings, extensions, snippets
```

---

## Keybindings Personalizados

```json
// keybindings.json
[
  {
    "key": "ctrl+shift+t",
    "command": "workbench.action.terminal.new"
  },
  {
    "key": "ctrl+alt+l",
    "command": "editor.action.formatDocument"
  },
  {
    "key": "ctrl+shift+d",
    "command": "editor.action.copyLinesDownAction"
  }
]
```

---

## Workspaces

### Archivo .code-workspace
```json
{
  "folders": [
    { "path": "../backend" },
    { "path": "../frontend" }
  ],
  "settings": {
    "editor.tabSize": 2
  },
  "extensions": {
    "recommendations": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode"
    ]
  }
}
```

---

## Terminal Integrada

```powershell
Ctrl+Ã‘          # Abrir/cerrar terminal
Ctrl+Shift+5    # Dividir terminal
Ctrl+Shift+Ã‘    # Nueva terminal
Alt+Up/Down     # Navegar entre terminales
```

### Perfiles de terminal
```json
{
  "terminal.integrated.profiles.windows": {
    "PowerShell": { "path": "pwsh" },
    "Git Bash": { "path": "C:\\Program Files\\Git\\bin\\bash.exe" }
  },
  "terminal.integrated.defaultProfile.windows": "PowerShell"
}
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[01 - Editores y Terminal/04 - VS Code/01 - Módulo 1 - Interfaz y Edición Básica\|Módulo 1 - Interfaz y Edición Básica]] |
| **Siguiente →** | [[03 - Módulo 3 - Depuración y Flujos Avanzados\|Módulo 3: Depuración y Flujos Avanzados]] |
| **Inicio herramienta** | [[vscode\|VS Code]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [VS Code Docs](https://code.visualstudio.com/docs) |

---
