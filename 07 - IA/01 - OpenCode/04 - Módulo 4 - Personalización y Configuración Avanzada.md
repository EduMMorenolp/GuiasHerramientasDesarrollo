# Módulo 4: Personalización y Configuración Avanzada

**Objetivo**: Aprender a personalizar OpenCode a través de su sistema de configuración jerárquico.

---

## Entendiendo el Sistema de Configuración

### Formato
- **JSON**: Formato estándar de configuración
- **JSONC**: JSON con comentarios (recomendado para legibilidad)

### Jerarquía de Precedencia
La configuración se aplica en este orden (de menor a mayor prioridad):

```mermaid
flowchart LR
    A[Remota] --> B[Global]
    B --> C[Personalizada]
    C --> D[Proyecto]
    D --> E[Resultado Final]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#bfb,stroke:#333
    style D fill:#fbb,stroke:#333
```

1. **Remota** (`~/.config/opencode/remotes/`): Configuración compartida del equipo
2. **Global** (`~/.config/opencode/opencode.json`): Preferencias del usuario
3. **Personalizada** (`OPENCODE_CONFIG`): Ruta alternativa vía variable de entorno
4. **Proyecto** (`opencode.json` en raíz): Configuración específica del proyecto

---

## Ubicaciones de los Archivos de Configuración

### Global (`~/.config/opencode/opencode.json`)
```json
{
  "provider": "anthropic",
  "model": "claude-sonnet-4-20250514",
  "theme": "dark",
  "keybinds": {
    "undo": "ctrl+z",
    "redo": "ctrl+y"
  }
}
```

### Proyecto (`opencode.json`)
```json
{
  "project": {
    "name": "Mi Proyecto",
    "description": "API REST con Express y PostgreSQL"
  },
  "agents": {
    "revisor": {
      "description": "Revisor de código",
      "prompt": "Eres un revisor senior..."
    }
  }
}
```

### Ruta Personalizada
```powershell
$env:OPENCODE_CONFIG = "D:\config\opencode.json"
opencode
```

---

## Opciones de Configuración Clave

### Proveedores y Modelos
```json
{
  "provider": "anthropic",
  "model": "claude-sonnet-4-20250514",
  "small_model": "claude-haiku-3-5-20241022"
}
```
- `provider`: Proveedor de IA (anthropic, openai, google, ollama)
- `model`: Modelo principal para tareas complejas
- `small_model`: Modelo ligero para tareas simples (ahorra costos)

### Tema
```json
{
  "theme": {
    "type": "dark",
    "colors": {
      "primary": "#8b5cf6",
      "background": "#1a1a2e"
    }
  }
}
```

### Permisos Globales
```json
{
  "permissions": {
    "edit": true,
    "bash": true,
    "network": false,
    "filesystem": ["/proyecto", "/tmp"]
  }
}
```
Control granular de qué acciones puede realizar OpenCode.

### Atajos de Teclado (keybinds)
```json
{
  "keybinds": [
    {
      "key": "ctrl+shift+p",
      "command": "opencode.agent.switch",
      "args": { "agent": "revisor" }
    },
    {
      "key": "ctrl+shift+m",
      "command": "opencode.mode.toggle"
    }
  ]
}
```

### Comandos Personalizados
```json
{
  "commands": [
    {
      "name": "test",
      "description": "Ejecutar tests del proyecto",
      "command": "npm test",
      "keybind": "ctrl+shift+t"
    },
    {
      "name": "build",
      "description": "Compilar proyecto",
      "command": "npm run build",
      "keybind": "ctrl+shift+b"
    }
  ]
}
```

---

## Otras Opciones de Configuración

### Servidor
```json
{
  "server": {
    "port": 8080,
    "host": "localhost"
  }
}
```

### Formateadores
```json
{
  "formatters": {
    "javascript": "prettier",
    "python": "black",
    "go": "gofmt"
  }
}
```

### Compactación (Compaction)
Controla cómo se compacta el historial de la conversación para mantener el contexto relevante:

```json
{
  "compaction": {
    "enabled": true,
    "strategy": "smart",
    "max_tokens": 32000
  }
}
```

### Observador de Archivos (Watch)
OpenCode puede observar archivos y reaccionar a cambios:

```json
{
  "watch": {
    "enabled": true,
    "patterns": ["src/**/*.ts", "tests/**/*.ts"],
    "ignore": ["node_modules", "dist"]
  }
}
```

---

## Ejemplo: Configuración Completa de Proyecto

```json
{
  "project": {
    "name": "API de Comercio Electrónico",
    "description": "API REST con Express, TypeScript y PostgreSQL",
    "version": "1.0.0"
  },
  "provider": "anthropic",
  "model": "claude-sonnet-4-20250514",
  "small_model": "claude-haiku-3-5-20241022",
  "theme": "dark",
  "permissions": {
    "edit": true,
    "bash": true,
    "network": false
  },
  "agents": {
    "revisor": {
      "description": "Revisor de código senior",
      "prompt": "Revisa el código buscando bugs, problemas de seguridad y rendimiento. Sigue las convenciones de TypeScript y Express del proyecto.",
      "mode": "subagent",
      "temperature": 0.2,
      "color": "#00aa00"
    },
    "testeador": {
      "description": "Generador de tests",
      "prompt": "Genera tests unitarios usando Jest siguiendo los patrones existentes en el proyecto.",
      "mode": "subagent",
      "temperature": 0.4,
      "color": "#aa00aa"
    }
  },
  "commands": [
    { "name": "test", "command": "npm test" },
    { "name": "lint", "command": "npm run lint" },
    { "name": "build", "command": "npm run build" },
    { "name": "dev", "command": "npm run dev" }
  ],
  "keybinds": [
    { "key": "ctrl+shift+t", "command": "opencode.command.run", "args": { "name": "test" } },
    { "key": "ctrl+shift+b", "command": "opencode.command.run", "args": { "name": "build" } }
  ],
  "watch": {
    "enabled": true,
    "patterns": ["src/**/*.ts"],
    "ignore": ["node_modules", "dist"]
  }
}
```

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [ ] Entender la jerarquía de configuración de OpenCode
- [ ] Configurar proveedores, modelos y temas
- [ ] Gestionar permisos de forma granular
- [ ] Crear atajos de teclado y comandos personalizados
- [ ] Utilizar el observador de archivos y compactación
- [ ] Crear una configuración completa de proyecto

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[05 - Módulo 5 - Integración y Flujos de Trabajo Avanzados|Módulo 5: Integración y Flujos de Trabajo Avanzados]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
