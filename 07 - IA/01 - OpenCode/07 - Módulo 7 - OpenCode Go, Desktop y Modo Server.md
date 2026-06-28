# Módulo 7: OpenCode Go, Desktop y Modo Server

**Objetivo**: Explorar OpenCode Go, la aplicación de escritorio y el modo servidor headless.

---

## OpenCode Go

### ¿Qué es?
Suscripción low-cost ($5 primer mes, $10/mes) para acceder a modelos open source sin necesidad de APIs externas.

### Características
- Modelos open source curados y probados
- Sin necesidad de API keys de terceros
- Límites generosos de uso
- Ideal para equipos pequeños y desarrolladores individuales

### Configuración
```powershell
# Iniciar sesión en OpenCode Go
opencode auth login
# Seleccionar "OpenCode Go" como provider

# Seleccionar modelo
/models
```

### Modelos incluidos
- Modelos optimizados para coding
- Actualizados regularmente
- Benchmarks validados por el equipo de OpenCode

---

## Desktop App

### Instalación
Descarga desde [opencode.ai](https://opencode.ai) para macOS, Windows y Linux (beta).

### Características exclusivas
| Feature | Descripción |
|---------|-------------|
| **Multi-sesión** | Múltiples agentes en paralelo sobre el mismo proyecto |
| **Pestañas** | Organiza conversaciones en pestañas |
| **Notificaciones** | Alertas cuando un agente completa una tarea |
| **Vista dividida** | Editor y chat lado a lado |
| **Integración OS** | Menú de sistema, atajos globales |

### Atajos de escritorio
| Atajo | Acción |
|-------|--------|
| `Cmd/Ctrl+Esc` | Abrir/cerrar OpenCode |
| `Cmd/Ctrl+Shift+N` | Nueva sesión |
| `Cmd/Ctrl+Shift+T` | Nueva pestaña |
| `Cmd/Ctrl+W` | Cerrar sesión |

### Sincronización
- Sesiones sincronizadas entre desktop y terminal
- Configuración compartida
- Historial de conversaciones

---

## Modo Server

### ¿Qué es?
Modo headless que expone OpenCode como servidor HTTP, ideal para CI/CD y automatización.

### Iniciar servidor
```json
{
  "server": {
    "port": 8080,
    "host": "localhost"
  }
}
```

```powershell
opencode server
```

### API REST
```bash
POST /api/chat
Content-Type: application/json

{
  "messages": [
    { "role": "user", "content": "Revisa el código en src/" }
  ],
  "tools": ["read", "edit", "bash"]
}
```

### Usos del modo server
- **CI/CD**: Code reviews automáticos en pipelines
- **Integración**: Conectar OpenCode a herramientas custom
- **Web**: Backend para interfaces web personalizadas
- **Batch**: Procesamiento por lotes de archivos

---

## ACP (Agent Client Protocol)

### ¿Qué es?
Protocolo que permite a IDEs como Zed, JetBrains y Neovim comunicarse con OpenCode como backend de IA.

### IDEs compatibles
| IDE | Estado |
|-----|--------|
| **Zed** | Compatible nativo |
| **JetBrains** | Vía plugin |
| **Neovim** | Vía plugin |

### Configuración
```json
{
  "acp": {
    "enabled": true,
    "port": 8081,
    "allowedOrigins": ["http://localhost:3000"]
  }
}
```

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [x] Configurar y usar OpenCode Go
- [x] Usar la Desktop App con multi-sesión
- [x] Ejecutar OpenCode en modo server
- [x] Integrar OpenCode con IDEs vía ACP

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[08 - Módulo 8 - Custom Tools, Formateadores y Enterprise|Módulo 8: Custom Tools, Formateadores y Enterprise]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
