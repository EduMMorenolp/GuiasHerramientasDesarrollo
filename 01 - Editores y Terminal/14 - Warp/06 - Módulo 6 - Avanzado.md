# MÃ³dulo 6: Avanzado

**Objetivo**: Explorar caracterÃ­sticas avanzadas de Warp: Warp Drive, agentes cloud, SSH, editor integrado y mÃ¡s.

---

## Warp Drive

Warp Drive es un sistema de almacenamiento para notebooks, workflows y prompts reutilizables.

### Componentes

| Componente | DescripciÃ³n |
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

Warp permite ejecutar agentes AI en la nube para tareas especÃ­ficas.

### PR Review
- El agente revisa Pull Requests automÃ¡ticamente
- Analiza cambios, sugiere mejoras y detecta problemas
- Se integra con GitHub, GitLab y Bitbucket

### Issues
- Crea y gestiona issues desde la terminal
- El agente ayuda a describir el problema tÃ©cnicamente
- Sugiere etiquetas, asignaciones y prioridades

```powershell
# Ejemplo: pedir revisiÃ³n de PR
@warp review PR #42
```

---

## SSH con Warpify

Warpify extiende las capacidades de Warp a sesiones SSH.

### CÃ³mo funciona
- Instalas warpify en el servidor remoto
- Las sesiones SSH obtienen la UI de Warp
- Blocks, editor multilÃ­nea y agentes funcionan remotamente

### InstalaciÃ³n remota
```powershell
# En el servidor remoto
curl -fsSL https://warp.dev/install-warpify.sh | bash

# Conectar con warpify
ssh usuario@servidor
```

---

## Code Editor Integrado

Warp incluye un editor de cÃ³digo ligero integrado.

### CaracterÃ­sticas
- **LSP**: Language Server Protocol para resaltado y autocompletado
- **Git worktrees**: trabajar con mÃºltiples branches simultÃ¡neamente
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
# Los servidores LSP se detectan automÃ¡ticamente
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

### CaracterÃ­sticas
- TÃ­tulos, listas, tablas renderizadas
- CÃ³digo con syntax highlighting
- Enlaces cliqueables
- ImÃ¡genes (si la terminal lo soporta)

---

## URI Scheme (warp://)

Warp registra el protocolo `warp://` para integraciones profundas.

### Ejemplos de uso
```powershell
# Abrir Warp con un comando especÃ­fico
warp://run/git%20status

# Abrir un notebook especÃ­fico
warp://notebook/deploy-workflow

# Abrir settings
warp://settings/themes
```

### IntegraciÃ³n con navegador
Puedes crear enlaces en pÃ¡ginas web que abran Warp con acciones especÃ­ficas.

---

## Split Panes

Warp permite dividir la terminal en mÃºltiples paneles.

### Atajos
| AcciÃ³n | Atajo |
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

Warp guarda y restaura sesiones automÃ¡ticamente.

### CÃ³mo funciona
- Al cerrar Warp, guarda el estado completo
- Al abrir de nuevo, restaura pestaÃ±as, paneles y directorios
- El historial de comandos se conserva entre sesiones

### ConfiguraciÃ³n
```powershell
# En settings.yaml
session:
  restore: true
  save_history: true
  max_sessions: 50
```

---

## Settings Sync

Sincroniza la configuraciÃ³n de Warp entre mÃºltiples dispositivos.

### ActivaciÃ³n
```powershell
# En settings.yaml
cloud:
  sync_settings: true
  sync_workflows: true
  sync_notebooks: true
```

### Requisitos
- Cuenta de Warp (gratuita)
- Iniciar sesiÃ³n en todos los dispositivos
- Los temas, keybindings y workflows se sincronizan automÃ¡ticamente

---

## Resumen

| CaracterÃ­stica | DescripciÃ³n |
|----------------|-------------|
| Warp Drive | Notebooks, workflows y prompts |
| Cloud Agents | PR review, issues automatizados |
| SSH Warpify | Warp en sesiones remotas |
| Code Editor | Editor con LSP y git worktrees |
| Markdown Viewer | Renderizado de markdown |
| URI Scheme | warp:// para integraciones |
| Split Panes | Paneles mÃºltiples |
| Session Restoration | Restaura sesiones anteriores |
| Settings Sync | SincronizaciÃ³n multi-dispositivo |

---

**Documentación oficial**: https://docs.warp.dev

**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



