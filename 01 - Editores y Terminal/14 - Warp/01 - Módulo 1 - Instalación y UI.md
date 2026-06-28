# MÃ³dulo 1: InstalaciÃ³n y UI

**Objetivo**: Instalar Warp y comprender su interfaz de usuario basada en bloques.

---

## Â¿QuÃ© es Warp?

Warp es una terminal moderna construida en Rust con inteligencia artificial integrada. Es de cÃ³digo abierto bajo licencia AGPLv3. Combina una terminal tradicional con un asistente AI (Oz) para mejorar la productividad en la lÃ­nea de comandos.

### CaracterÃ­sticas principales
- **Blocks**: cada comando y su salida se agrupan en un bloque
- **AI Agent**: asistente integrado que ayuda a escribir y depurar comandos
- **Input Editor**: editor multilÃ­nea con resaltado de sintaxis
- **Rendimiento**: escrito en Rust, rÃ¡pido y eficiente

---

## InstalaciÃ³n

### Windows (winget)
```powershell
winget install Warp.Warp
```

### macOS (Homebrew)
```powershell
brew install --cask warp
```

### Verificar instalaciÃ³n
```powershell
warp --version
```

---

## Interfaz de Usuario (UI)

### Blocks
A diferencia de una terminal tradicional donde el texto es continuo, Warp organiza cada comando y su salida en un **bloque** visualmente separado. Esto facilita la lectura, navegaciÃ³n y reutilizaciÃ³n.

| CaracterÃ­stica | Terminal tradicional | Warp |
|---------------|---------------------|------|
| Estructura | Flujo de texto continuo | Bloques agrupados |
| NavegaciÃ³n | Scroll manual | Ctrl+Up / Ctrl+Down entre bloques |
| ReutilizaciÃ³n | Copiar manual | Click en bloque para reusar |
| EdiciÃ³n | LÃ­nea simple | Editor multilÃ­nea integrado |

### NavegaciÃ³n entre bloques
- **Ctrl+Up**: ir al bloque anterior
- **Ctrl+Down**: ir al bloque siguiente
- **Ctrl+Shift+Up/Down**: seleccionar mÃºltiples bloques
- **Click**: posicionar cursor en cualquier parte del bloque

### Panel lateral
- **Warp Drive**: acceso a notebooks, workflows y prompts guardados
- **Sessions**: historial de sesiones anteriores
- **Configuration**: ajustes de tema, fuente y atajos

---

## Diferencias con una terminal tradicional

| Aspecto | Terminal tradicional | Warp |
|---------|---------------------|------|
| EdiciÃ³n | LÃ­nea Ãºnica | Editor multilÃ­nea |
| Historial | Texto plano | Bloques con formato |
| AI | No incluido | Oz integrado |
| Resaltado | BÃ¡sico | Syntax + error highlighting |
| Multiplataforma | VarÃ­a | Windows, macOS, Linux |
| Licencia | VarÃ­a | AGPLv3 (open source) |

### Ventajas clave
- **Productividad**: comandos complejos se editan en mÃºltiples lÃ­neas
- **Legibilidad**: bloques claramente separados
- **AI asistido**: Oz sugiere, corrige y explica comandos
- **PersonalizaciÃ³n**: temas, keybindings y configuraciones avanzadas

---

## Resumen

| Concepto | DescripciÃ³n |
|----------|-------------|
| Warp | Terminal moderna con AI, open source, escrita en Rust |
| Blocks | Comando + salida agrupados visualmente |
| Ctrl+Up/Down | NavegaciÃ³n entre bloques |
| Oz | Asistente AI integrado |
| InstalaciÃ³n | `winget install Warp.Warp` |

---

**Documentación oficial**: https://docs.warp.dev

**Siguiente**: [[02 - MÃ³dulo 2 - Input Editor|MÃ³dulo 2: Input Editor]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



