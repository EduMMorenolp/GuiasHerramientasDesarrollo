# Módulo 4: Plugins

**Objetivo**: Extender OpenClaw con plugins para añadir herramientas, canales y proveedores personalizados.

---

## Arquitectura de plugins

Los plugins son el mecanismo de extensión de OpenClaw. Pueden añadir:

- Herramientas personalizadas
- Canales de mensajería
- Proveedores de modelos
- Hooks y eventos
- Skills empaquetados
- Funcionalidades de voz, medios y búsqueda

## Instalación de plugins

### Desde ClawHub

```bash
openclaw plugin install canvas
openclaw plugin install diffs
```

### Desde npm

```bash
openclaw plugin install openclaw-plugin-web-search
```

### Desde git

```bash
openclaw plugin install https://github.com/usuario/mi-plugin
```

### Desde directorio local

```bash
openclaw plugin install ./mi-plugin
```

## Plugins populares

| Plugin | Funcionalidad |
|--------|---------------|
| `canvas` | Control de Canvas y renderizado A2UI |
| `diffs` | Diferencia de archivos y markdown |
| `llm-task` | Pasos de workflow solo JSON |
| `lobster` | Workflows tipados con aprobaciones |
| `tokenjuice` | Compresión de salida de `exec` |
| `tool-search` | Búsqueda en catálogos grandes de herramientas |

## Desarrollo de plugins

### SDK de plugins

```typescript
import { api, definePlugin } from "openclaw/plugin-sdk"

export default definePlugin({
  id: "mi-herramienta",
  name: "Mi Herramienta",
  async setup(ctx) {
    api.registerTool("mi-tool", {
      description: "Descripción de mi herramienta",
      parameters: {
        type: "object",
        properties: {
          input: { type: "string" }
        }
      },
      async execute(args, context) {
        return { result: `Procesado: ${args.input}` }
      }
    })
  }
})
```

### Manifiesto del plugin

```yaml
# plugin.yaml
id: mi-herramienta
version: 1.0.0
contracts:
  tools:
    - mi-tool
  channels: []
```

## Configuración de plugins

```bash
# Listar plugins instalados
openclaw plugin list

# Habilitar/deshabilitar plugin
openclaw plugin enable canvas
openclaw plugin disable canvas

# Actualizar plugin
openclaw plugin update diffs

# Eliminar plugin
openclaw plugin remove mi-herramienta
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/15 - OpenClaw/03 - Módulo 3 - Herramientas y Skills\|Módulo 3 - Herramientas y Skills]] |
| **Siguiente →** | [[07 - IA/15 - OpenClaw/05 - Módulo 5 - Automatización y Subagentes\|Módulo 5 - Automatización y Subagentes]] |
| **Inicio herramienta** | [[07 - IA/15 - OpenClaw/openclaw\|OpenClaw]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [OpenClaw Docs](https://openclaw.ai) |

---
