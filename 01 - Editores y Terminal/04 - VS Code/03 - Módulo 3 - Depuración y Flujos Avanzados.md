# MÃ³dulo 3: DepuraciÃ³n y Flujos Avanzados

**Objetivo**: Dominar la depuraciÃ³n integrada y flujos de trabajo avanzados.

---

## DepuraciÃ³n (Debugging)

### ConfiguraciÃ³n bÃ¡sica
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
| AcciÃ³n | Atajo |
|--------|-------|
| Toggle breakpoint | `F9` |
| Iniciar depuraciÃ³n | `F5` |
| Step over | `F10` |
| Step into | `F11` |
| Step out | `Shift+F11` |
| Continuar | `F5` |
| Detener | `Shift+F5` |

### Breakpoints avanzados
- **Conditional breakpoints**: Click derecho > "Conditional Breakpoint"
- **Logpoints**: Muestra mensaje sin pausar
- **Hit count**: Se activa tras N ejecuciones
- **Function breakpoint**: Se activa al entrar a una funciÃ³n

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

ColaboraciÃ³n en tiempo real:
```powershell
Ctrl+Shift+P > "Live Share: Start collaboration session"
```
- EdiciÃ³n sincrÃ³nica
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
Ctrl+Shift+O    # Ir a sÃ­mbolo en archivo
Ctrl+T          # Ir a sÃ­mbolo en proyecto
Ctrl+G          # Ir a lÃ­nea especÃ­fica
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
Trabaja con mÃºltiples proyectos simultÃ¡neamente:
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
**Documentación oficial**: https://code.visualstudio.com/docs

**Siguiente**: [[04 - MÃ³dulo 4 - Remote Development y Dev Containers|MÃ³dulo 4: Remote Development y Dev Containers]]
**Inicio herramienta**: [[vscode|VS Code]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



