# Módulo 3: Depuración y Flujos Avanzados

**Objetivo**: Dominar la depuración integrada y flujos de trabajo avanzados.

---

## Depuración (Debugging)

### Configuración básica
```json
// .vscode/launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Iniciar App",
      "skipFiles": ["<node_internals>/**"],
      "program": "${workspaceFolder}/src/index.js",
      "env": { "NODE_ENV": "development" }
    },
    {
      "type": "node",
      "request": "attach",
      "name": "Attach a proceso",
      "port": 9229
    }
  ]
}
```

### Puntos de ruptura
| Acción | Atajo |
|--------|-------|
| Toggle breakpoint | `F9` |
| Iniciar depuración | `F5` |
| Step over | `F10` |
| Step into | `F11` |
| Step out | `Shift+F11` |
| Continuar | `F5` |
| Detener | `Shift+F5` |

### Breakpoints avanzados
- **Conditional breakpoints**: Click derecho > "Conditional Breakpoint"
- **Logpoints**: Muestra mensaje sin pausar
- **Hit count**: Se activa tras N ejecuciones
- **Function breakpoint**: Se activa al entrar a una función

---

## Tareas (Tasks)

### tasks.json
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Ejecutar tests",
      "type": "shell",
      "command": "npm test",
      "group": { "kind": "test", "isDefault": true },
      "presentation": { "reveal": "always" }
    },
    {
      "label": "Build proyecto",
      "type": "shell",
      "command": "npm run build",
      "group": "build",
      "problemMatcher": ["$esbuild"]
    }
  ]
}
```

### Atajos para tasks
```json
{
  "key": "ctrl+shift+b",
  "command": "workbench.action.tasks.build"
}
```

---

## Live Share

Colaboración en tiempo real:
```powershell
Ctrl+Shift+P > "Live Share: Start collaboration session"
```
- Edición sincrónica
- Debug compartido
- Terminal compartida
- Servidores locales compartidos

---

## Remote Development

### WSL, SSH, Containers
```powershell
# Abrir carpeta en WSL
code --remote wsl+Ubuntu D:\proyecto

# Abrir en contenedor
Ctrl+Shift+P > "Dev Containers: Reopen in Container"
```

### Dev Container
```json
// .devcontainer/devcontainer.json
{
  "name": "Node.js Dev",
  "image": "mcr.microsoft.com/devcontainers/javascript-node:22",
  "forwardPorts": [3000],
  "extensions": ["dbaeumer.vscode-eslint"],
  "postCreateCommand": "npm install"
}
```

---

## Productividad Avanzada

### Comandos del explorador
```powershell
Ctrl+P          # Abrir archivo por nombre
Ctrl+Tab        # Navegar entre archivos recientes
Ctrl+Shift+O    # Ir a símbolo en archivo
Ctrl+T          # Ir a símbolo en proyecto
Ctrl+G          # Ir a línea específica
```

### Problemas y errores
```powershell
Ctrl+Shift+M    # Panel de problemas
F8              # Siguiente error
Shift+F8        # Error anterior
```

### Source Control
```powershell
Ctrl+Shift+G    # Abrir Source Control
```
- Stage/Unstage visual
- Commit con caja de mensaje
- Diff inline
- Ver historial de archivo

---

## Flujo de Trabajo Avanzado

### Perfiles de trabajo
```json
// Crea perfiles para diferentes contextos
// Frontend, Backend, Data Science, etc.
```
`Ctrl+Shift+P` > "Profiles: Create Profile"

### Multi-root workspace
Trabaja con múltiples proyectos simultáneamente:
```json
{
  "folders": [
    { "name": "API", "path": "backend" },
    { "name": "Web", "path": "frontend" },
    { "name": "Docs", "path": "docs" }
  ]
}
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[01 - Editores y Terminal/04 - VS Code/02 - Módulo 2 - Extensiones y Personalización\|Módulo 2 - Extensiones y Personalización]] |
| **Siguiente →** | [[04 - Módulo 4 - Remote Development y Dev Containers\|Módulo 4: Remote Development y Dev Containers]] |
| **Inicio herramienta** | [[vscode\|VS Code]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [VS Code Docs](https://code.visualstudio.com/docs) |

---
