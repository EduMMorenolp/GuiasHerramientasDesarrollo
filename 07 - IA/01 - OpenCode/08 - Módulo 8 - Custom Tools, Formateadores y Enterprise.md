# Módulo 8: Custom Tools, Formateadores y Enterprise

**Objetivo**: Crear herramientas personalizadas, configurar formateadores y explorar características enterprise.

---

## Custom Tools

### ¿Qué son?
Herramientas que extienden las capacidades de OpenCode más allá de las herramientas integradas (read, edit, bash).

### API de Custom Tools
```javascript
// .opencode/tools/deploy.js
export default {
  name: "deploy",
  description: "Despliega la aplicación en producción",
  
  parameters: {
    type: "object",
    properties: {
      environment: {
        type: "string",
        enum: ["staging", "production"],
        description: "Entorno de despliegue"
      }
    }
  },
  
  execute: async ({ environment }) => {
    const result = await exec(`npm run deploy:${environment}`);
    return { success: true, output: result };
  }
};
```

### Registrar Custom Tools
```json
{
  "tools": {
    "deploy": {
      "type": "custom",
      "path": ".opencode/tools/deploy.js"
    },
    "analizar-rendimiento": {
      "type": "custom",
      "path": ".opencode/tools/performance.js"
    }
  }
}
```

### Permisos para custom tools
Las custom tools pueden tener permisos específicos:
```json
{
  "tools": {
    "deploy": {
      "permissions": ["bash", "network"],
      "allowedCommands": ["npm run deploy:*"]
    }
  }
}
```

---

## Formateadores

### Configuración
OpenCode puede usar formateadores externos para mantener código consistente:

```json
{
  "formatters": {
    "javascript": "prettier",
    "typescript": "prettier",
    "python": "black",
    "go": "gofmt",
    "rust": "rustfmt",
    "sql": "sqlfmt"
  }
}
```

### Formateo automático
OpenCode formatea automáticamente el código que escribe según las reglas configuradas.

### Formateadores soportados
| Lenguaje | Formateador | Configuración |
|----------|------------|---------------|
| JavaScript/TypeScript | Prettier | `.prettierrc` |
| Python | Black | `pyproject.toml` |
| Go | gofmt | Built-in |
| Rust | rustfmt | `rustfmt.toml` |
| SQL | sqlfmt | `sqlfmt.ini` |

---

## Políticas (Policies)

### ¿Qué son?
Reglas que controlan el comportamiento de OpenCode a nivel granular.

### Tipos de políticas
```json
{
  "policies": {
    "edits": {
      "maxFileSize": "1MB",
      "allowedPaths": ["src/", "tests/"],
      "blockedPaths": ["node_modules/", "dist/", ".env"]
    },
    "bash": {
      "allowedCommands": ["npm", "git", "docker", "node"],
      "blockedCommands": ["rm -rf", "sudo"]
    }
  }
}
```

### Políticas por agente
```json
{
  "agents": {
    "revisor": {
      "policies": {
        "edits": { "enabled": false },
        "bash": { "enabled": false }
      }
    }
  }
}
```

---

## Enterprise

### Características enterprise
| Feature | Descripción |
|---------|-------------|
| **SSO/SAML** | Autenticación corporativa |
| **Audit Logs** | Registro completo de acciones |
| **RBAC** | Control de acceso basado en roles |
| **On-premise** | Despliegue en infraestructura propia |
| **Soporte dedicado** | SLA garantizado |
| **Modelos privados** | Despliegue de modelos propietarios |

### Configuración enterprise
```json
{
  "enterprise": {
    "audit": {
      "enabled": true,
      "retention": "90d"
    },
    "sso": {
      "provider": "okta",
      "samlUrl": "https://okta.com/saml/..."
    },
    "rbac": {
      "roles": ["developer", "senior", "admin"]
    }
  }
}
```

---

## LSP Integration

OpenCode puede cargar automáticamente LSPs para mejorar la comprensión del código:

```json
{
  "lsp": {
    "enabled": true,
    "servers": {
      "typescript": "typescript-language-server",
      "python": "pyright-langserver"
    }
  }
}
```

Beneficios:
- Mejor comprensión del código
- Autocompletado más preciso
- Detección de errores en tiempo real
- Navegación de símbolos

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [x] Crear y registrar Custom Tools
- [x] Configurar formateadores por lenguaje
- [x] Definir políticas de seguridad y permisos
- [x] Conocer las características enterprise
- [x] Integrar servidores LSP

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[09 - Módulo 9 - Novedades, Troubleshooting y Próximos Pasos|Módulo 9: Novedades, Troubleshooting y Próximos Pasos]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
