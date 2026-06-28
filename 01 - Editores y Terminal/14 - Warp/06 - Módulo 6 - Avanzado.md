# Módulo 6: Avanzado

**Objetivo**: Explorar características avanzadas de Warp: Warp Drive, agentes cloud, SSH, editor integrado y más.

---

## Warp Drive

Warp Drive es un sistema de almacenamiento para notebooks, workflows y prompts reutilizables.

### Componentes

| Componente | Descripción |
|------------|-------------|
| Notebooks | Documentos interactivos con comandos y anotaciones |
| Workflows | Secuencias de comandos parametrizadas |
| Prompts | Plantillas de comandos reutilizables |

### Crear un Notebook
```powershell
# Desde Warp Drive > New Notebook
# Escribe comandos y notas en formato markdown
# Los comandos se pueden ejecutar directamente desde el notebook
```

### Workflows
Los workflows son comandos con variables que puedes rellenar:
```powershell
# Workflow: "Deploy to server"
ssh {{user}}@{{host}}
cd {{project_path}}
git pull
docker-compose up -d --build
```

---

## Cloud Agents

Warp permite ejecutar agentes AI en la nube para tareas específicas.

### PR Review
- El agente revisa Pull Requests automáticamente
- Analiza cambios, sugiere mejoras y detecta problemas
- Se integra con GitHub, GitLab y Bitbucket

### Issues
- Crea y gestiona issues desde la terminal
- El agente ayuda a describir el problema técnicamente
- Sugiere etiquetas, asignaciones y prioridades

```powershell
# Ejemplo: pedir revisión de PR
@warp review PR #42
```

---

## SSH con Warpify

Warpify extiende las capacidades de Warp a sesiones SSH.

### Cómo funciona
- Instalas warpify en el servidor remoto
- Las sesiones SSH obtienen la UI de Warp
- Blocks, editor multilínea y agentes funcionan remotamente

### Instalación remota
```powershell
# En el servidor remoto
curl -fsSL https://warp.dev/install-warpify.sh | bash

# Conectar con warpify
ssh usuario@servidor
```

---

## Code Editor Integrado

Warp incluye un editor de código ligero integrado.

### Características
- **LSP**: Language Server Protocol para resaltado y autocompletado
- **Git worktrees**: trabajar con múltiples branches simultáneamente
- **Vista de archivos**: navegador de archivos integrado
- **Diff viewer**: comparar cambios visualmente

### Abrir archivo
```powershell
# Editar archivo en el editor integrado
warp open archivo.js

# Desde la terminal
Ctrl+Click en una ruta de archivo
```

### LSP
```powershell
# Los servidores LSP se detectan automáticamente
# Soporta: TypeScript, Python, Rust, Go, Java, etc.
# Proporciona: go to definition, hover info, autocomplete
```

---

## Markdown Viewer

Warp puede renderizar archivos markdown directamente en la terminal.

### Uso
```powershell
# Ver un archivo markdown renderizado
warp view README.md

# Desde Warp Drive, los notebooks usan markdown
```

### Características
- Títulos, listas, tablas renderizadas
- Código con syntax highlighting
- Enlaces cliqueables
- Imágenes (si la terminal lo soporta)

---

## URI Scheme (warp://)

Warp registra el protocolo `warp://` para integraciones profundas.

### Ejemplos de uso
```powershell
# Abrir Warp con un comando específico
warp://run/git%20status

# Abrir un notebook específico
warp://notebook/deploy-workflow

# Abrir settings
warp://settings/themes
```

### Integración con navegador
Puedes crear enlaces en páginas web que abran Warp con acciones específicas.

---

## Split Panes

Warp permite dividir la terminal en múltiples paneles.

### Atajos
| Acción | Atajo |
|--------|-------|
| Split vertical | Ctrl+Shift+\ |
| Split horizontal | Ctrl+Shift+- |
| Navegar entre paneles | Ctrl+Alt+Up/Down/Left/Right |
| Cerrar panel | Ctrl+Shift+W |
| Redimensionar | Ctrl+Shift+Alt+Arrow |

### Usos comunes
- Editor y terminal lado a lado
- Monitorizar logs en un panel mientras trabajas en otro
- Comparar salidas de comandos

---

## Session Restoration

Warp guarda y restaura sesiones automáticamente.

### Cómo funciona
- Al cerrar Warp, guarda el estado completo
- Al abrir de nuevo, restaura pestañas, paneles y directorios
- El historial de comandos se conserva entre sesiones

### Configuración
```powershell
# En settings.yaml
session:
  restore: true
  save_history: true
  max_sessions: 50
```

---

## Settings Sync

Sincroniza la configuración de Warp entre múltiples dispositivos.

### Activación
```powershell
# En settings.yaml
cloud:
  sync_settings: true
  sync_workflows: true
  sync_notebooks: true
```

### Requisitos
- Cuenta de Warp (gratuita)
- Iniciar sesión en todos los dispositivos
- Los temas, keybindings y workflows se sincronizan automáticamente

---

## Resumen

| Característica | Descripción |
|----------------|-------------|
| Warp Drive | Notebooks, workflows y prompts |
| Cloud Agents | PR review, issues automatizados |
| SSH Warpify | Warp en sesiones remotas |
| Code Editor | Editor con LSP y git worktrees |
| Markdown Viewer | Renderizado de markdown |
| URI Scheme | warp:// para integraciones |
| Split Panes | Paneles múltiples |
| Session Restoration | Restaura sesiones anteriores |
| Settings Sync | Sincronización multi-dispositivo |

---

**Documentación oficial**: https://docs.warp.dev

**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
