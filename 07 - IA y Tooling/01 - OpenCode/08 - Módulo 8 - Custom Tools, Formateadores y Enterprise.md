# MÃ³dulo 8: Custom Tools, Formateadores y Enterprise

**Objetivo**: Crear herramientas personalizadas, configurar formateadores y explorar caracterÃ­sticas enterprise.

---

## Custom Tools

### Â¿QuÃ© son?
Herramientas que extienden las capacidades de OpenCode mÃ¡s allÃ¡ de las herramientas integradas (read, edit, bash).

### API de Custom Tools
```javascript
// .opencode/tools/deploy.js
export default {
  name: "deploy",
  description: "Despliega la aplicaciÃ³n en producciÃ³n",
  
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
Las custom tools pueden tener permisos especÃ­ficos:
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

### ConfiguraciÃ³n
OpenCode puede usar formateadores externos para mantener cÃ³digo consistente:

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

### Formateo automÃ¡tico
OpenCode formatea automÃ¡ticamente el cÃ³digo que escribe segÃºn las reglas configuradas.

### Formateadores soportados
| Lenguaje | Formateador | ConfiguraciÃ³n |
|----------|------------|---------------|
| JavaScript/TypeScript | Prettier | `.prettierrc` |
| Python | Black | `pyproject.toml` |
| Go | gofmt | Built-in |
| Rust | rustfmt | `rustfmt.toml` |
| SQL | sqlfmt | `sqlfmt.ini` |

---

## PolÃ­ticas (Policies)

### Â¿QuÃ© son?
Reglas que controlan el comportamiento de OpenCode a nivel granular.

### Tipos de polÃ­ticas
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

### PolÃ­ticas por agente
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

### CaracterÃ­sticas enterprise
| Feature | DescripciÃ³n |
|---------|-------------|
| **SSO/SAML** | AutenticaciÃ³n corporativa |
| **Audit Logs** | Registro completo de acciones |
| **RBAC** | Control de acceso basado en roles |
| **On-premise** | Despliegue en infraestructura propia |
| **Soporte dedicado** | SLA garantizado |
| **Modelos privados** | Despliegue de modelos propietarios |

### ConfiguraciÃ³n enterprise
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

OpenCode puede cargar automÃ¡ticamente LSPs para mejorar la comprensiÃ³n del cÃ³digo:

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
- Mejor comprensiÃ³n del cÃ³digo
- Autocompletado mÃ¡s preciso
- DetecciÃ³n de errores en tiempo real
- NavegaciÃ³n de sÃ­mbolos

---

## Resumen del MÃ³dulo

Al completar este mÃ³dulo deberÃ­as poder:
- [x] Crear y registrar Custom Tools
- [x] Configurar formateadores por lenguaje
- [x] Definir polÃ­ticas de seguridad y permisos
- [x] Conocer las caracterÃ­sticas enterprise
- [x] Integrar servidores LSP

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[09 - MÃ³dulo 9 - Novedades, Troubleshooting y PrÃ³ximos Pasos|MÃ³dulo 9: Novedades, Troubleshooting y PrÃ³ximos Pasos]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
