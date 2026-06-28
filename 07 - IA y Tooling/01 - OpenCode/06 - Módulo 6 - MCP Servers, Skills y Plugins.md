# Módulo 6: MCP Servers, Skills y Plugins

**Objetivo**: Dominar la integración con MCP, el sistema de Skills y Plugins.

---

## MCP Servers (Model Context Protocol)

### ¿Qué es MCP?
Protocolo estándar que permite a OpenCode conectarse con servidores externos para ampliar sus capacidades: bases de datos, APIs, sistemas de archivos, etc.

### Agregar un MCP Server
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

### Tipos de servidores MCP
| Tipo | Descripción |
|------|-------------|
| **Local** | Comando ejecutado localmente (npx, uvx, docker) |
| **Remoto** | URL de un servidor remoto |
| **Streamable HTTP** | Conexión HTTP con streaming |

### MCP tools
Una vez conectado, OpenCode puede usar las herramientas del servidor:
```
Conéctate a la base de datos usando MCP y tráeme los últimos 10 pedidos
```
OpenCode detecta automáticamente las tools disponibles del MCP server.

---

## Agent Skills

### ¿Qué son?
Fragmentos de prompt reutilizables que puedes adjuntar a cualquier agente. Codifican conocimientos específicos.

### Tipos de Skills
- **Global**: `~/.config/opencode/skills/`
- **Proyecto**: `.opencode/skills/`

### Crear un Skill
```markdown
---
description: Experto en testing con Jest
applies: always
---

## Instrucciones de testing
- Usa Jest con @testing-library/react
- Los tests deben cubrir: renderizado, interacciones, edge cases
- Sigue el patrón Arrange-Act-Assert
- Mockea llamadas API con msw
```

### Skills por contexto
```yaml
# En opencode.json
"skills": [
  { "name": "testing-jest", "applies": "always" },
  { "name": "revision-seguridad", "applies": "on-demand" }
]
```

### Skills del sistema
| Skill | Descripción |
|-------|-------------|
| `languages` | Reglas y frameworks detectados en el proyecto |
| `project` | Contexto extraído del AGENTS.md |
| `performance` | Optimización de queries y rendimiento |

---

## Plugins

### ¿Qué son?
Paquetes instalables que extienden OpenCode con nuevas herramientas y comportamientos.

### Instalar plugins
```powershell
# Desde npm
npm install -g @opencode/plugin-docker

# Desde marketplace
opencode plugin add @opencode/plugin-docker
```

### Crear un Plugin
```javascript
// plugin.js
export default {
  name: "mi-plugin",
  description: "Herramientas personalizadas para mi proyecto",
  
  tools: {
    "generate-model": {
      description: "Genera un modelo de base de datos",
      execute: async (params) => {
        // Lógica del plugin
      }
    }
  }
};
```

---

## SDK de OpenCode

### JavaScript/TypeScript SDK
```javascript
import { OpenCodeSDK } from "opencode-sdk";

const client = new OpenCodeSDK({
  apiKey: process.env.OPENCODE_API_KEY
});

// Ejecutar una consulta
const response = await client.query({
  messages: [{ role: "user", content: "Explica este código" }]
});
```

### Usos del SDK
- Automatización de code reviews
- Integración en CI/CD pipelines
- Herramientas CLI personalizadas
- Bots de código y asistentes

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [x] Configurar y usar MCP Servers locales y remotos
- [x] Crear y aplicar Skills reutilizables
- [x] Instalar y crear Plugins
- [x] Usar el SDK de OpenCode en proyectos JS/TS

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[07 - Módulo 7 - OpenCode Go, Desktop y Modo Server|Módulo 7: OpenCode Go, Desktop y Modo Server]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
