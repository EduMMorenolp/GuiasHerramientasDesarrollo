# MÃ³dulo 7: OpenCode Go, Desktop y Modo Server

**Objetivo**: Explorar OpenCode Go, la aplicaciÃ³n de escritorio y el modo servidor headless.

---

## OpenCode Go

### Â¿QuÃ© es?
SuscripciÃ³n low-cost ($5 primer mes, $10/mes) para acceder a modelos open source sin necesidad de APIs externas.

### CaracterÃ­sticas
- Modelos open source curados y probados
- Sin necesidad de API keys de terceros
- LÃ­mites generosos de uso
- Ideal para equipos pequeÃ±os y desarrolladores individuales

### ConfiguraciÃ³n
```powershell
# Iniciar sesiÃ³n en OpenCode Go
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

### InstalaciÃ³n
Descarga desde [opencode.ai](https://opencode.ai) para macOS, Windows y Linux (beta).

### CaracterÃ­sticas exclusivas
| Feature | DescripciÃ³n |
|---------|-------------|
| **Multi-sesiÃ³n** | MÃºltiples agentes en paralelo sobre el mismo proyecto |
| **PestaÃ±as** | Organiza conversaciones en pestaÃ±as |
| **Notificaciones** | Alertas cuando un agente completa una tarea |
| **Vista dividida** | Editor y chat lado a lado |
| **IntegraciÃ³n OS** | MenÃº de sistema, atajos globales |

### Atajos de escritorio
| Atajo | AcciÃ³n |
|-------|--------|
| `Cmd/Ctrl+Esc` | Abrir/cerrar OpenCode |
| `Cmd/Ctrl+Shift+N` | Nueva sesiÃ³n |
| `Cmd/Ctrl+Shift+T` | Nueva pestaÃ±a |
| `Cmd/Ctrl+W` | Cerrar sesiÃ³n |

### SincronizaciÃ³n
- Sesiones sincronizadas entre desktop y terminal
- ConfiguraciÃ³n compartida
- Historial de conversaciones

---

## Modo Server

### Â¿QuÃ© es?
Modo headless que expone OpenCode como servidor HTTP, ideal para CI/CD y automatizaciÃ³n.

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
    { "role": "user", "content": "Revisa el cÃ³digo en src/" }
  ],
  "tools": ["read", "edit", "bash"]
}
```

### Usos del modo server
- **CI/CD**: Code reviews automÃ¡ticos en pipelines
- **IntegraciÃ³n**: Conectar OpenCode a herramientas custom
- **Web**: Backend para interfaces web personalizadas
- **Batch**: Procesamiento por lotes de archivos

---

## ACP (Agent Client Protocol)

### Â¿QuÃ© es?
Protocolo que permite a IDEs como Zed, JetBrains y Neovim comunicarse con OpenCode como backend de IA.

### IDEs compatibles
| IDE | Estado |
|-----|--------|
| **Zed** | Compatible nativo |
| **JetBrains** | VÃ­a plugin |
| **Neovim** | VÃ­a plugin |

### ConfiguraciÃ³n
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

## Resumen del MÃ³dulo

Al completar este mÃ³dulo deberÃ­as poder:
- [x] Configurar y usar OpenCode Go
- [x] Usar la Desktop App con multi-sesiÃ³n
- [x] Ejecutar OpenCode en modo server
- [x] Integrar OpenCode con IDEs vÃ­a ACP

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[08 - MÃ³dulo 8 - Custom Tools, Formateadores y Enterprise|MÃ³dulo 8: Custom Tools, Formateadores y Enterprise]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
