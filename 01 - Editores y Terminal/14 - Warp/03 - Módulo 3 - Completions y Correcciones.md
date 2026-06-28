# MÃ³dulo 3: Completions y Correcciones

**Objetivo**: Aprovechar las sugerencias automÃ¡ticas, completado con tabulador y correcciÃ³n de errores de Warp.

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

### ConfiguraciÃ³n
```powershell
# En settings.yaml
features:
  autosuggestions: true  # Desactivar con false
```

---

## Tab Completions

Las completaciones con tabulador en Warp son mÃ¡s inteligentes que las terminales tradicionales.

### CaracterÃ­sticas
- **Completado jerÃ¡rquico**: navega por subcomandos
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

### MenÃº de completado
```powershell
# Presiona Tab para abrir el menÃº
# Usa Up/Down para navegar opciones
# Enter para seleccionar
git <Tab>  # Muestra menÃº con todos los subcomandos
```

---

## Command Corrections

Warp detecta errores tipogrÃ¡ficos (typos) en los comandos y sugiere correcciones.

### CorrecciÃ³n automÃ¡tica
- Subraya en rojo comandos desconocidos
- Sugiere el comando correcto mÃ¡s cercano
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

### BÃºsqueda en historial
- **Ctrl+R**: abre bÃºsqueda en el historial
- Escribe para filtrar comandos
- **Enter** para ejecutar, **Tab** para editar
- Muestra el bloque completo con salida incluida

### BÃºsqueda sincronizada
Los comandos buscados se sincronizan entre mÃºltiples terminales y sesiones, permitiendo encontrar comandos aunque se ejecutaron en otra ventana.

---

## Synchronized Inputs

Warp permite sincronizar la entrada entre mÃºltiples paneles o terminales.

### Uso
- Abre mÃºltiples paneles con **Ctrl+Shift+\**
- Activa input sincronizado con **Ctrl+Shift+I**
- Lo que escribes en un panel se replica en todos

### Aplicaciones
- Ejecutar el mismo comando en mÃºltiples servidores
- Configurar entornos idÃ©nticos
- Debugging paralelo

---

## Resumen

| Funcionalidad | DescripciÃ³n |
|---------------|-------------|
| Autosuggestions | Sugiere comandos del historial |
| Tab completions | Completado jerÃ¡rquico inteligente |
| Command corrections | Detecta y corrige typos |
| Command search | Ctrl+R para buscar en historial |
| Synchronized inputs | Entrada replicada en mÃºltiples paneles |

---

**Documentación oficial**: https://docs.warp.dev

**Siguiente**: [[04 - MÃ³dulo 4 - Agent Mode|MÃ³dulo 4: Agent Mode]]
**Inicio herramienta**: [[warp|Warp]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



