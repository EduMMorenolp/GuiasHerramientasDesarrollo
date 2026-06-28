# Módulo 2: Input Editor

**Objetivo**: Dominar el editor multilínea de Warp y sus capacidades de edición avanzada.

---

## Editor Multilínea

A diferencia de las terminales tradicionales donde solo se puede editar una línea, Warp incorpora un editor multilínea completo.

### Atajos principales

| Acción | Atajo |
|--------|-------|
| Nueva línea | Shift+Enter |
| Ejecutar comando | Enter |
| Posicionar cursor | Click |
| Seleccionar texto | Click + arrastrar |
| Cortar línea | Ctrl+X |
| Copiar línea | Ctrl+C |
| Pegar | Ctrl+V |
| Deshacer | Ctrl+Z |
| Rehacer | Ctrl+Shift+Z |
| Seleccionar todo | Ctrl+A |

---

## Funcionalidades del Editor

### Click para posicionar cursor
Puedes hacer click en cualquier parte del comando para colocar el cursor exactamente donde necesitas editar. Esto es especialmente útil en comandos largos o pipes complejos.

### Alias Expansion
Warp expande automáticamente los alias definidos en tu shell. Al escribir un alias, Warp muestra el comando completo al que corresponde.

```powershell
# Si tienes definido:
alias ll = "ls -la"

# Warp expande "ll" a "ls -la" en el editor
```

### Syntax Highlighting
El editor resalta la sintaxis del comando en tiempo real:
- Comandos en un color
- Banderas y opciones en otro
- Strings y rutas en otro
- Variables de entorno resaltadas

### Error Highlighting
Warp analiza el comando mientras escribes y resalta posibles errores:
- Comandos no encontrados (subrayado rojo)
- Argumentos inválidos
- Sintaxis incorrecta
- Archivos o rutas que no existen

---

## Command Inspector

El inspector de comandos muestra información detallada antes de ejecutar:

| Elemento | Descripción |
|----------|-------------|
| Ruta del comando | Ubicación del binario (con `which`) |
| Versión | Versión instalada |
| Ayuda | Extracto de `--help` |
| Argumentos | Validación de argumentos |
| Riesgos | Advertencias de seguridad |

### Abrir el inspector
- **Ctrl+I**: abre el inspector del comando actual
- Muestra información en el panel lateral sin ejecutar

```powershell
# Ejemplo: inspector muestra la ruta y versión de git
git push --force
# Warp advierte: "force push puede sobrescribir cambios remotos"
```

---

## Vim Keybindings

Warp permite habilitar keybindings de Vim en el editor de entrada.

### Activación
```powershell
# En settings.yaml
editor:
  vim_mode: true
```

### Modos disponibles
| Modo | Descripción |
|------|-------------|
| Normal | Navegación con teclas vim (h, j, k, l) |
| Insert | Escritura normal de texto |
| Visual | Selección con movimiento vim |

### Atajos vim comunes
- **h/j/k/l**: mover cursor
- **i**: entrar en modo insert
- **Esc**: volver a modo normal
- **dd**: borrar línea
- **yy**: copiar línea
- **p**: pegar
- **u**: deshacer
- **Ctrl+r**: rehacer

---

## Resumen

| Funcionalidad | Descripción |
|---------------|-------------|
| Editor multilínea | Shift+Enter nueva línea, Enter ejecuta |
| Syntax highlighting | Resalta comandos, banderas, rutas |
| Error highlighting | Detecta typos y errores en tiempo real |
| Command inspector | Ctrl+I para información del comando |
| Vim mode | Keybindings de Vim opcionales |

---

**Documentación oficial**: https://docs.warp.dev
**Siguiente**: [[03 - Módulo 3 - Completions y Correcciones|Módulo 3: Completions y Correcciones]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
