# MÃ³dulo 4: Remote Development y Dev Containers

**Objetivo**: Desarrollar remotamente con SSH, WSL y Dev Containers.

---

## Remote Development Overview

VS Code permite desarrollar en entornos remotos como si fueran locales.

### Tipos de conexiÃ³n
| Tipo | Uso |
|------|-----|
| **SSH** | Servidores remotos, VMs |
| **WSL** | Windows Subsystem for Linux |
| **Dev Containers** | Contenedores Docker |
| **GitHub Codespaces** | Cloud |

---

## SSH Remote

### ConfiguraciÃ³n
```powershell
# Requiere: Remote - SSH extension

# Conectar por primera vez
Ctrl+Shift+P > "Remote-SSH: Connect to Host..."

# Configurar hosts
# ~/.ssh/config
Host dev-server
  HostName 192.168.1.100
  User developer
  Port 22
  IdentityFile ~/.ssh/id_ed25519
```

### Abrir carpeta remota
```powershell
code --remote ssh-remote+dev-server /path/to/project
```

### Comandos Ãºtiles
```powershell
Ctrl+Shift+P > "Remote-SSH: Open SSH Configuration File..."
Ctrl+Shift+P > "Remote-SSH: Kill VS Code Server on Host..."
```

---

## WSL

### Requisitos
```powershell
# Instalar WSL
wsl --install

# Extensiones en WSL
# Las extensiones locales no funcionan en WSL
# VSCode instala extensiones automÃ¡ticamente en WSL

# Abrir carpeta en WSL
code --remote wsl+Ubuntu /home/user/project
```

### Comandos WSL
```powershell
Ctrl+Shift+P > "WSL: Reopen in WSL"
Ctrl+Shift+P > "WSL: Reopen in Windows"
```

---

## Dev Containers

### Â¿QuÃ© son?
Entornos de desarrollo completos dentro de contenedores Docker.

### .devcontainer/devcontainer.json
```json
{
  "name": "Node.js Dev Container",
  "image": "mcr.microsoft.com/devcontainers/javascript-node:22",
  "forwardPorts": [3000, 9229],
  "portsAttributes": {
    "3000": { "label": "Web" },
    "9229": { "label": "Debug" }
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "ms-vscode.vscode-typescript-next"
      ],
      "settings": {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "esbenp.prettier-vscode"
      }
    }
  },
  "postCreateCommand": "npm install",
  "remoteUser": "node",
  "features": {
    "ghcr.io/devcontainers/features/docker-in-docker:2": {}
  }
}
```

### Dev Container con Dockerfile
```json
{
  "name": "Custom Dev Container",
  "build": {
    "dockerfile": "Dockerfile",
    "args": {
      "NODE_VERSION": "22"
    }
  }
}
```

```dockerfile
# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/javascript-node:22

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*
```

### Comandos Dev Container
```powershell
Ctrl+Shift+P > "Dev Containers: Reopen in Container"
Ctrl+Shift+P > "Dev Containers: Rebuild and Reopen in Container"
Ctrl+Shift+P > "Dev Containers: Reopen in Folder Locally"
```

---

## GitHub Codespaces

### ConfiguraciÃ³n
```json
// .devcontainer/devcontainer.json (misma configuraciÃ³n)
// Abrir en Codespaces desde GitHub
// Code > "Open with Codespaces" > "New Codespace"
```

### Ventajas
- Entorno listo en segundos
- Accesible desde cualquier dispositivo
- 60 horas/mes gratis (free tier)
- Misma configuraciÃ³n que Dev Containers
- Prebuilds para apertura instantÃ¡nea

---

## VS Code Server

### Tunnel
```powershell
# Acceder a VS Code en servidor remoto desde cualquier navegador
code tunnel

# VS Code Server se ejecuta en el servidor
# Accedes via vscode.dev o vs code desktop
```

---

## Resumen del MÃ³dulo

| Herramienta | Comando de apertura |
|-------------|-------------------|
| SSH | `code --remote ssh-remote+host` |
| WSL | `code --remote wsl+Ubuntu` |
| Dev Container | Reopen in Container |
| Codespaces | Desde GitHub |
| Tunnel | `code tunnel` |

---
**Documentación oficial**: https://code.visualstudio.com/docs

**Siguiente**: [[05 - MÃ³dulo 5 - Agents Window y GitHub Copilot|MÃ³dulo 5: Agents Window y GitHub Copilot]]
**Inicio herramienta**: [[vscode|VS Code]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



