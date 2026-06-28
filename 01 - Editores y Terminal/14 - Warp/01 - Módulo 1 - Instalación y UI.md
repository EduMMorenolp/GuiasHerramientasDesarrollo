# Módulo 1: Instalación y UI

**Objetivo**: Instalar Warp y comprender su interfaz de usuario basada en bloques.

---

## ¿Qué es Warp?

Warp es una terminal moderna construida en Rust con inteligencia artificial integrada. Es de código abierto bajo licencia AGPLv3. Combina una terminal tradicional con un asistente AI (Oz) para mejorar la productividad en la línea de comandos.

### Características principales
- **Blocks**: cada comando y su salida se agrupan en un bloque
- **AI Agent**: asistente integrado que ayuda a escribir y depurar comandos
- **Input Editor**: editor multilínea con resaltado de sintaxis
- **Rendimiento**: escrito en Rust, rápido y eficiente

---

## Instalación

### Windows (winget)
```powershell
winget install Warp.Warp
```

### macOS (Homebrew)
```powershell
brew install --cask warp
```

### Verificar instalación
```powershell
warp --version
```

---

## Interfaz de Usuario (UI)

### Blocks
A diferencia de una terminal tradicional donde el texto es continuo, Warp organiza cada comando y su salida en un **bloque** visualmente separado. Esto facilita la lectura, navegación y reutilización.

| Característica | Terminal tradicional | Warp |
|---------------|---------------------|------|
| Estructura | Flujo de texto continuo | Bloques agrupados |
| Navegación | Scroll manual | Ctrl+Up / Ctrl+Down entre bloques |
| Reutilización | Copiar manual | Click en bloque para reusar |
| Edición | Línea simple | Editor multilínea integrado |

### Navegación entre bloques
- **Ctrl+Up**: ir al bloque anterior
- **Ctrl+Down**: ir al bloque siguiente
- **Ctrl+Shift+Up/Down**: seleccionar múltiples bloques
- **Click**: posicionar cursor en cualquier parte del bloque

### Panel lateral
- **Warp Drive**: acceso a notebooks, workflows y prompts guardados
- **Sessions**: historial de sesiones anteriores
- **Configuration**: ajustes de tema, fuente y atajos

---

## Diferencias con una terminal tradicional

| Aspecto | Terminal tradicional | Warp |
|---------|---------------------|------|
| Edición | Línea única | Editor multilínea |
| Historial | Texto plano | Bloques con formato |
| AI | No incluido | Oz integrado |
| Resaltado | Básico | Syntax + error highlighting |
| Multiplataforma | Varía | Windows, macOS, Linux |
| Licencia | Varía | AGPLv3 (open source) |

### Ventajas clave
- **Productividad**: comandos complejos se editan en múltiples líneas
- **Legibilidad**: bloques claramente separados
- **AI asistido**: Oz sugiere, corrige y explica comandos
- **Personalización**: temas, keybindings y configuraciones avanzadas

---

## Resumen

| Concepto | Descripción |
|----------|-------------|
| Warp | Terminal moderna con AI, open source, escrita en Rust |
| Blocks | Comando + salida agrupados visualmente |
| Ctrl+Up/Down | Navegación entre bloques |
| Oz | Asistente AI integrado |
| Instalación | `winget install Warp.Warp` |

---

**Documentación oficial**: https://docs.warp.dev
**Siguiente**: [[02 - Módulo 2 - Input Editor|Módulo 2: Input Editor]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
