# MÃ³dulo 5: PersonalizaciÃ³n

**Objetivo**: Configurar Warp al gusto con temas, fuentes, keybindings y ajustes avanzados.

---

## Themes

Warp incluye una colecciÃ³n de temas predefinidos y permite crear temas personalizados.

### Temas incluidos
- **Warp Dark** (predeterminado)
- **Warp Light**
- **One Dark**
- **Dracula**
- **Nord**
- **Solarized**
- **GitHub Dark**
- **Tokyo Night**

### Cambiar tema
```powershell
# Desde la interfaz
# Settings > Theme > Seleccionar tema
```

### Temas personalizados
Puedes crear tu propio tema en formato YAML y colocarlo en la carpeta de temas:

```powershell
# Ubicacion de temas personalizados
%USERPROFILE%\.warp\themes\

# Estructura de un tema personalizado
# archivo: mi-tema.yaml
name: Mi Tema
colors:
  background: "#1e1e2e"
  foreground: "#cdd6f4"
  cursor: "#f5e0dc"
  selection: "#585b70"
  # ... mas colores
```

---

## Fuentes y TipografÃ­a

### Cambiar fuente
```powershell
# Settings > Font > Seleccionar fuente
# O directamente en settings.yaml
font:
  family: "Cascadia Code"
  size: 12
  ligatures: true
```

### Fuentes recomendadas
| Fuente | Ligaduras | ProgramaciÃ³n |
|--------|-----------|--------------|
| Cascadia Code | Si | Microsoft |
| Fira Code | Si | Popular |
| JetBrains Mono | Si | JetBrains |
| Meslo Nerd Font | No | Powerlevel10k |
| Hack | No | Mono espaciada |

### Opacidad
```powershell
# Ajustar opacidad del fondo
opacity: 0.95  # 0.0 (transparente) a 1.0 (solido)
```

---

## Tab Configs

Warp permite configurar el comportamiento de las pestaÃ±as.

### Opciones de pestaÃ±a
```powershell
tab:
  show_close_button: true
  show_icon: true
  position: top  # top o bottom
  reuse_empty: true  # Reutilizar pestaÃ±a vacia
```

### Comportamiento
- **Nueva pestaÃ±a**: Ctrl+T
- **Cerrar pestaÃ±a**: Ctrl+W
- **Siguiente pestaÃ±a**: Ctrl+Tab
- **Anterior pestaÃ±a**: Ctrl+Shift+Tab

---

## Keybindings

Warp permite reasignar todos los atajos de teclado.

### Archivo de keybindings
```powershell
%USERPROFILE%\.warp\keybindings.yaml
```

### Ejemplo de personalizaciÃ³n
```powershell
keybindings:
  - action: ToggleTerminalMode
    key: Ctrl+Shift+A
  - action: OpenWarpDrive
    key: Ctrl+Shift+D
  - action: NewTab
    key: Ctrl+Shift+T
```

### Atajos predeterminados Ãºtiles
| Atajo | AcciÃ³n |
|-------|--------|
| Ctrl+Shift+C | Copiar |
| Ctrl+Shift+V | Pegar |
| Ctrl+Shift+F | Buscar |
| Ctrl+Shift+P | Paleta de comandos |
| Ctrl+Shift+M | Minimap toggle |

---

## Settings File

El archivo principal de configuraciÃ³n es `settings.yaml`.

### UbicaciÃ³n
```powershell
%USERPROFILE%\.warp\settings.yaml
```

### Estructura completa
```powershell
# settings.yaml (ejemplo)
theme: warp-dark
opacity: 0.95
font:
  family: "Cascadia Code"
  size: 12
  ligatures: true
editor:
  vim_mode: false
features:
  autosuggestions: true
  command_corrections: true
agents:
  default: oz
tab:
  position: top
  show_close_button: true
cloud:
  sync_settings: true
```

---

## Resumen

| Aspecto | ConfiguraciÃ³n |
|---------|---------------|
| Temas | Predefinidos o personalizados en YAML |
| Fuente | Familia, tamaÃ±o, ligaduras, opacidad |
| Keybindings | `keybindings.yaml` |
| Settings | `%USERPROFILE%\.warp\settings.yaml` |
| PestaÃ±as | PosiciÃ³n, iconos, comportamiento |

---

**Documentación oficial**: https://docs.warp.dev

**Siguiente**: [[06 - MÃ³dulo 6 - Avanzado|MÃ³dulo 6: Avanzado]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



