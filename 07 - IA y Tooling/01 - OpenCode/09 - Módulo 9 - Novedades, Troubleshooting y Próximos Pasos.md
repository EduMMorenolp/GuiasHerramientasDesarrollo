# MÃ³dulo 9: Novedades, Troubleshooting y PrÃ³ximos Pasos

**Objetivo**: Mantenerse actualizado, resolver problemas comunes y planificar los prÃ³ximos pasos.

---

## Troubleshooting

### Problemas de conexiÃ³n
```powershell
# Verificar conectividad con el proveedor
opencode doctor

# Probar provider especÃ­fico
opencode doctor --provider anthropic

# Ver logs detallados
opencode --verbose
```

### Errores comunes
| Problema | SoluciÃ³n |
|----------|----------|
| API Key invÃ¡lida | Verificar `opencode auth login` |
| Rate limiting | Cambiar a modelo mÃ¡s pequeÃ±o o reducir solicitudes |
| Out of tokens | Usar `/compact` para comprimir conversaciÃ³n |
| Error de permisos | Revisar `permissions` en `opencode.json` |
| LSP no funciona | Verificar que el servidor LSP estÃ¡ instalado |

### Modo verbose
```powershell
opencode --log-level debug
```
Muestra informaciÃ³n detallada de cada paso que ejecuta OpenCode.

### DiagnÃ³stico de red
```json
{
  "network": {
    "proxy": "http://proxy:8080",
    "timeout": 30000,
    "retries": 3
  }
}
```

---

## Rendimiento y OptimizaciÃ³n

### Modelo pequeÃ±o (small_model)
```json
{
  "model": "claude-sonnet-4-20250514",
  "small_model": "claude-haiku-3-5-20241022"
}
```
El `small_model` se usa para tareas simples, ahorrando tokens y costos.

### CompactaciÃ³n
```json
{
  "compaction": {
    "enabled": true,
    "strategy": "smart",
    "maxTokens": 32000
  }
}
```
Reduce el contexto automÃ¡ticamente cuando se acerca al lÃ­mite.

### Cache
OpenCode cachea resultados de operaciones repetitivas:
- BÃºsquedas de archivos
- Resultados de LSP
- Metadata de proyectos

---

## Novedades 2026

### VersiÃ³n actual
OpenCode v1.14.48+ (junio 2026)

### Lo nuevo en 2026
- **Desktop App beta** â€” AplicaciÃ³n nativa para macOS, Windows y Linux
- **Multi-sesiÃ³n** â€” MÃºltiples agentes en paralelo
- **MCP mejorado** â€” Soporte para Streamable HTTP
- **Agent Skills** â€” Sistema de habilidades reutilizables
- **OpenCode Go** â€” Plan low-cost con modelos open source
- **GitHub Copilot / ChatGPT Plus** â€” Login con suscripciones existentes
- **160K+ GitHub stars** â€” Comunidad masiva
- **7.5M+ developers** mensuales activos

### Roadmap
- OpenCode Zen improvements
- MÃ¡s proveedores de modelos
- Plugin marketplace oficial
- Mejoras en el SDK
- Enterprise GA

---

## PrÃ³ximos Pasos

### Rutas de especializaciÃ³n

```mermaid
flowchart LR
    A[OpenCode General] --> B[Agentes Avanzados]
    A --> C[IntegraciÃ³n CI/CD]
    A --> D[Plugin Developer]
    A --> E[Enterprise Admin]
    
    B --> B1[Prompt Engineering]
    C --> C1[GitHub Actions]
    D --> D1[JS/TS SDK]
    E --> E1[SSO/Security]
```

### Recursos oficiales
| Recurso | URL |
|---------|-----|
| DocumentaciÃ³n | [opencode.ai/docs](https://opencode.ai/docs) |
| GitHub | [github.com/anomalyco/opencode](https://github.com/anomalyco/opencode) |
| Discord | [opencode.ai/discord](https://opencode.ai/discord) |
| Changelog | [opencode.ai/changelog](https://opencode.ai/changelog) |
| Models.dev | [models.dev](https://models.dev) |

---

## Resumen de toda la guÃ­a

Has completado los **9 mÃ³dulos** de la guÃ­a de OpenCode:

| MÃ³dulo | Tema |
|--------|------|
| 1 | Fundamentos y Primeros Pasos |
| 2 | Flujo de Trabajo BÃ¡sico y Modos de OperaciÃ³n |
| 3 | Agentes: EspecializaciÃ³n y AutomatizaciÃ³n |
| 4 | PersonalizaciÃ³n y ConfiguraciÃ³n Avanzada |
| 5 | IntegraciÃ³n y Flujos de Trabajo Avanzados |
| 6 | MCP Servers, Skills y Plugins |
| 7 | OpenCode Go, Desktop y Modo Server |
| 8 | Custom Tools, Formateadores y Enterprise |
| 9 | Novedades, Troubleshooting y PrÃ³ximos Pasos |

---

**Documentación oficial**: https://opencode.ai

**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



