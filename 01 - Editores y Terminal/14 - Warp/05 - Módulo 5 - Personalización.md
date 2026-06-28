# Módulo 5: Personalización

**Objetivo**: Configurar Warp al gusto con temas, fuentes, keybindings y ajustes avanzados.

---

## Themes

Warp incluye una colección de temas predefinidos y permite crear temas personalizados.

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

## Fuentes y Tipografía

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
| Fuente | Ligaduras | Programación |
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

Warp permite configurar el comportamiento de las pestañas.

### Opciones de pestaña
```powershell
tab:
  show_close_button: true
  show_icon: true
  position: top  # top o bottom
  reuse_empty: true  # Reutilizar pestaña vacia
```

### Comportamiento
- **Nueva pestaña**: Ctrl+T
- **Cerrar pestaña**: Ctrl+W
- **Siguiente pestaña**: Ctrl+Tab
- **Anterior pestaña**: Ctrl+Shift+Tab

---

## Keybindings

Warp permite reasignar todos los atajos de teclado.

### Archivo de keybindings
```powershell
%USERPROFILE%\.warp\keybindings.yaml
```

### Ejemplo de personalización
```powershell
keybindings:
  - action: ToggleTerminalMode
    key: Ctrl+Shift+A
  - action: OpenWarpDrive
    key: Ctrl+Shift+D
  - action: NewTab
    key: Ctrl+Shift+T
```

### Atajos predeterminados útiles
| Atajo | Acción |
|-------|--------|
| Ctrl+Shift+C | Copiar |
| Ctrl+Shift+V | Pegar |
| Ctrl+Shift+F | Buscar |
| Ctrl+Shift+P | Paleta de comandos |
| Ctrl+Shift+M | Minimap toggle |

---

## Settings File

El archivo principal de configuración es `settings.yaml`.

### Ubicación
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

| Aspecto | Configuración |
|---------|---------------|
| Temas | Predefinidos o personalizados en YAML |
| Fuente | Familia, tamaño, ligaduras, opacidad |
| Keybindings | `keybindings.yaml` |
| Settings | `%USERPROFILE%\.warp\settings.yaml` |
| Pestañas | Posición, iconos, comportamiento |

---

**Documentación oficial**: https://docs.warp.dev
**Siguiente**: [[06 - Módulo 6 - Avanzado|Módulo 6: Avanzado]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
