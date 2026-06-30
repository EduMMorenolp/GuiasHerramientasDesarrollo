# Módulo 5: Integración y Flujos de Trabajo Avanzados

**Objetivo**: Integrar OpenCode en el ecosistema de desarrollo y explorar sus capacidades más potentes.

---

## Integración con el Entorno de Desarrollo

### Uso con IDEs

#### VS Code
- OpenCode funciona de forma independiente en la terminal
- Puedes tener VS Code y OpenCode lado a lado
- Usa `Cmd+Esc` (macOS) o `Ctrl+Esc` (Windows/Linux) para vista dividida

#### Cursor
- Similar a VS Code, compatible con OpenCode en terminal integrada
- Flujo: Cursor para edición manual + OpenCode para automatización

### Atajo de Vista Dividida
```powershell
# Windows/Linux
Ctrl+Esc  # Alternar vista dividida

# macOS
Cmd+Esc   # Alternar vista dividida
```

### Terminal Integrada del IDE
Puedes ejecutar OpenCode directamente en la terminal integrada de tu IDE:
1. Abre la terminal integrada (`Ctrl+Ã‘` en VS Code)
2. Ejecuta `opencode`
3. Trabaja con OpenCode sin salir del editor

---

## Integración con GitHub

### Automatización de Issues
OpenCode puede leer y analizar issues de GitHub:

```markdown
"Analiza el issue #42 del repositorio y propon una solución"
"Revisa todos los issues abiertos etiquetados como 'bug'"
```

### Automatización de Pull Requests
```markdown
"Revisa el PR #15 y verifica que los tests pasen"
"Genera un resumen de los cambios en el PR #23"
```

### Comando /opencode en GitHub
Puedes invocar OpenCode directamente desde comentarios de GitHub:

```markdown
/opencode "Revisa este PR y sugiere mejoras"
# o abreviado
/oc "Ejecuta los tests y reporta resultados"
```

Esto requiere configurar la integración en el repositorio.

---

## Modo No Interactivo (Scripting)

### Uso en scripts y pipelines
```powershell
# Pregunta simple
opencode -p "¿Qué versión de Node.js recomiendas para este proyecto?"

# Con contexto de archivo
Get-Content "codigo.js" | opencode -p "Revisa este código en busca de bugs"

# Generar documentación
opencode -p "Genera documentación para la API en docs/api.md"

# Modo batch
opencode -p "Refactoriza todos los archivos en src/ para usar arrow functions"
```

### Integración en CI/CD
```yaml
# Ejemplo de GitHub Action
- name: OpenCode Review
  run: |
    opencode -p "Revisa el código cambiado en este PR" > review.md
```

---

## Compartir Sesiones

### Creación de Enlaces
OpenCode permite compartir sesiones de conversación con tu equipo:

```markdown
/compartir  # Genera un enlace para compartir
```

### Modos de uso compartido
| Modo | Descripción |
|------|-------------|
| `manual` | Compartes sesiones explícitamente |
| `auto` | Comparte automáticamente al finalizar |
| `disabled` | No compartir sesiones |

### Configuración
```json
{
  "share": {
    "mode": "manual",
    "expiration": "7d"
  }
}
```

---

## Evolución y Novedades (Basado en Changelog)

### Mejoras en Core
- **MCP** (Model Context Protocol): Integración con servidores MCP para ampliar capacidades
- **Nuevas capacidades de agentes**: Subagentes más inteligentes, mejor paralelización
- **Snapshots de sesiones**: Guarda y restaura estados completos de conversación
- **Mejoras de rendimiento**: Reducción de latencia y uso de tokens

### OpenCode Desktop
- **Nueva aplicación de escritorio** con interfaz gráfica
- **Soporte de pestañas** para múltiples sesiones
- **Mejoras en la interfaz**: Navegación más intuitiva
- **Integración directa** con el sistema de archivos

### Mejoras en la TUI
- **Visualización de diffs**: Más clara y detallada
- **Navegación mejorada**: Atajos de teclado ampliados
- **Barra de estado**: Más información visible
- **Soporte para imágenes**: Vista previa en la terminal

---

## Casos de Uso Avanzados

### Refactorización Masiva
```markdown
"Renombra el directorio 'utils' a 'helpers' y actualiza todos los imports en el proyecto"
"Migra todos los componentes de clase a funciones con hooks"
```

### Generación de Documentación Automática
```markdown
"Genera documentación JSDoc para todas las funciones en src/services/"
"Crea un README.md basado en la estructura del proyecto"
```

### Análisis de Seguridad
```markdown
"Escanea el proyecto en busca de vulnerabilidades conocidas en las dependencias"
"Revisa el código por posibles fugas de información sensible"
```

### Automatización de Releases
```markdown
"Prepara una nueva release: actualiza la versión en package.json, genera el changelog, y crea el tag"
```

---

## Mejores Prácticas de Integración

### Con Docker
```markdown
"Crea un Dockerfile multi-stage para optimizar el tamaño de la imagen"
"Analiza el Dockerfile actual y sugiere mejoras de seguridad"
```

### Con Bases de Datos
```markdown
"Genera una migración para añadir la tabla 'orders' con relaciones a 'users'"
"Revisa las consultas SQL en el proyecto y sugiere índices"
```

### Con CI/CD
```markdown
"Configura GitHub Actions para ejecutar tests y linting en cada PR"
"Revisa el pipeline actual y sugiere optimizaciones"
```

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [ ] Integrar OpenCode con IDEs (VS Code, Cursor)
- [ ] Automatizar flujos de GitHub (issues, PRs)
- [ ] Usar OpenCode en modo scripting/no interactivo
- [ ] Compartir sesiones con el equipo
- [ ] Mantenerse actualizado con las novedades
- [ ] Implementar casos de uso avanzados

---

## Siguientes Pasos

Has completado los 5 módulos de la guía de OpenCode. Ahora puedes:

1. **Crear agentes personalizados** para tu flujo de trabajo
2. **Integrar OpenCode** en tu pipeline de CI/CD
3. **Compartir sesiones y configuraciones** con tu equipo
4. **Explorar la documentación oficial** en [opencode.ai](https://opencode.ai)
5. **Mantenerte actualizado** con los changelogs y releases

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/01 - OpenCode/04 - Módulo 4 - Personalización y Configuración Avanzada\|Módulo 4 - Personalización y Configuración Avanzada]] |
| **Siguiente →** | [[06 - Módulo 6 - MCP Servers, Skills y Plugins\|Módulo 6: MCP Servers, Skills y Plugins]] |
| **Inicio herramienta** | [[opencode\|OpenCode]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [OpenCode Docs](https://opencode.ai) |

---
