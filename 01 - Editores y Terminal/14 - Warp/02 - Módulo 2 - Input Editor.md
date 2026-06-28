# MÃ³dulo 2: Input Editor

**Objetivo**: Dominar el editor multilÃ­nea de Warp y sus capacidades de ediciÃ³n avanzada.

---

## Editor MultilÃ­nea

A diferencia de las terminales tradicionales donde solo se puede editar una lÃ­nea, Warp incorpora un editor multilÃ­nea completo.

### Atajos principales

| AcciÃ³n | Atajo |
|--------|-------|
| Nueva lÃ­nea | Shift+Enter |
| Ejecutar comando | Enter |
| Posicionar cursor | Click |
| Seleccionar texto | Click + arrastrar |
| Cortar lÃ­nea | Ctrl+X |
| Copiar lÃ­nea | Ctrl+C |
| Pegar | Ctrl+V |
| Deshacer | Ctrl+Z |
| Rehacer | Ctrl+Shift+Z |
| Seleccionar todo | Ctrl+A |

---

## Funcionalidades del Editor

### Click para posicionar cursor
Puedes hacer click en cualquier parte del comando para colocar el cursor exactamente donde necesitas editar. Esto es especialmente Ãºtil en comandos largos o pipes complejos.

### Alias Expansion
Warp expande automÃ¡ticamente los alias definidos en tu shell. Al escribir un alias, Warp muestra el comando completo al que corresponde.

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
- Argumentos invÃ¡lidos
- Sintaxis incorrecta
- Archivos o rutas que no existen

---

## Command Inspector

El inspector de comandos muestra informaciÃ³n detallada antes de ejecutar:

| Elemento | DescripciÃ³n |
|----------|-------------|
| Ruta del comando | UbicaciÃ³n del binario (con `which`) |
| VersiÃ³n | VersiÃ³n instalada |
| Ayuda | Extracto de `--help` |
| Argumentos | ValidaciÃ³n de argumentos |
| Riesgos | Advertencias de seguridad |

### Abrir el inspector
- **Ctrl+I**: abre el inspector del comando actual
- Muestra informaciÃ³n en el panel lateral sin ejecutar

```powershell
# Ejemplo: inspector muestra la ruta y versiÃ³n de git
git push --force
# Warp advierte: "force push puede sobrescribir cambios remotos"
```

---

## Vim Keybindings

Warp permite habilitar keybindings de Vim en el editor de entrada.

### ActivaciÃ³n
```powershell
# En settings.yaml
editor:
  vim_mode: true
```

### Modos disponibles
| Modo | DescripciÃ³n |
|------|-------------|
| Normal | NavegaciÃ³n con teclas vim (h, j, k, l) |
| Insert | Escritura normal de texto |
| Visual | SelecciÃ³n con movimiento vim |

### Atajos vim comunes
- **h/j/k/l**: mover cursor
- **i**: entrar en modo insert
- **Esc**: volver a modo normal
- **dd**: borrar lÃ­nea
- **yy**: copiar lÃ­nea
- **p**: pegar
- **u**: deshacer
- **Ctrl+r**: rehacer

---

## Resumen

| Funcionalidad | DescripciÃ³n |
|---------------|-------------|
| Editor multilÃ­nea | Shift+Enter nueva lÃ­nea, Enter ejecuta |
| Syntax highlighting | Resalta comandos, banderas, rutas |
| Error highlighting | Detecta typos y errores en tiempo real |
| Command inspector | Ctrl+I para informaciÃ³n del comando |
| Vim mode | Keybindings de Vim opcionales |

---

**Documentación oficial**: https://docs.warp.dev

**Siguiente**: [[03 - MÃ³dulo 3 - Completions y Correcciones|MÃ³dulo 3: Completions y Correcciones]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



