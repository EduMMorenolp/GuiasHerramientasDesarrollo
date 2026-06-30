# Módulo 3: Completions y Correcciones

**Objetivo**: Aprovechar las sugerencias automáticas, completado con tabulador y corrección de errores de Warp.

---

## Autosuggestions

Warp analiza tu historial de comandos y sugiere comandos completos mientras escribes, similares a fish shell.

### Funcionamiento
- Mientras escribes, Warp muestra en gris claro el comando sugerido
- **Ctrl+Right** o **Ctrl+F**: aceptar sugerencia completa
- **Ctrl+E**: aceptar siguiente palabra de la sugerencia
- Las sugerencias se basan en el historial y patrones de uso

```powershell
# Ejemplo: si escribes "git pu" y antes ejecutaste "git push origin main"
# Warp sugiere: git push origin main
```

### Configuración
```powershell
# En settings.yaml
features:
  autosuggestions: true  # Desactivar con false
```

---

## Tab Completions

Las completaciones con tabulador en Warp son más inteligentes que las terminales tradicionales.

### Características
- **Completado jerárquico**: navega por subcomandos
- **Argumentos y banderas**: muestra opciones disponibles
- **Rutas**: autocompletado de archivos y directorios
- **Variables de entorno**: sugiere variables definidas
- **Git**: completado de branches, tags y remotos

| Tipo | Ejemplo | Completado |
|------|---------|------------|
| Comando | `git` | `add`, `commit`, `push`, `pull`... |
| Bandea | `git commit -` | `-m`, `-a`, `--amend`... |
| Ruta | `cd Doc` | `cd Documents/` |
| Git branch | `git checkout ma` | `git checkout main` |
| Variable | `echo $HOM` | `echo $HOME` |

### Menú de completado
```powershell
# Presiona Tab para abrir el menú
# Usa Up/Down para navegar opciones
# Enter para seleccionar
git <Tab>  # Muestra menú con todos los subcomandos
```

---

## Command Corrections

Warp detecta errores tipográficos (typos) en los comandos y sugiere correcciones.

### Corrección automática
- Subraya en rojo comandos desconocidos
- Sugiere el comando correcto más cercano
- **Click** en la sugerencia para reemplazar

```powershell
# Typo
gti status
# Warp sugiere: "git status" (con click para corregir)

# Otro ejemplo
docker ps
# Si escribes "dockr ps" Warp sugiere "docker ps"
```

### Fuzzy matching
Warp usa fuzzy matching para encontrar comandos similares aunque el texto no coincida exactamente:
- `gti` -> `git`
- `dokcer` -> `docker`
- `npn` -> `npm`

---

## Command Search

Warp permite buscar comandos ejecutados anteriormente de forma inteligente.

### Búsqueda en historial
- **Ctrl+R**: abre búsqueda en el historial
- Escribe para filtrar comandos
- **Enter** para ejecutar, **Tab** para editar
- Muestra el bloque completo con salida incluida

### Búsqueda sincronizada
Los comandos buscados se sincronizan entre múltiples terminales y sesiones, permitiendo encontrar comandos aunque se ejecutaron en otra ventana.

---

## Synchronized Inputs

Warp permite sincronizar la entrada entre múltiples paneles o terminales.

### Uso
- Abre múltiples paneles con **Ctrl+Shift+\**
- Activa input sincronizado con **Ctrl+Shift+I**
- Lo que escribes en un panel se replica en todos

### Aplicaciones
- Ejecutar el mismo comando en múltiples servidores
- Configurar entornos idénticos
- Debugging paralelo

---

## Resumen

| Funcionalidad | Descripción |
|---------------|-------------|
| Autosuggestions | Sugiere comandos del historial |
| Tab completions | Completado jerárquico inteligente |
| Command corrections | Detecta y corrige typos |
| Command search | Ctrl+R para buscar en historial |
| Synchronized inputs | Entrada replicada en múltiples paneles |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[01 - Editores y Terminal/14 - Warp/02 - Módulo 2 - Input Editor\|Módulo 2 - Input Editor]] |
| **Siguiente →** | [[04 - Módulo 4 - Agent Mode\|Módulo 4: Agent Mode]] |
| **Inicio herramienta** | [[warp\|Warp]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Warp Docs](https://docs.warp.dev) |

---
