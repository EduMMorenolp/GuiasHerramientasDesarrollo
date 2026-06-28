# MÃ³dulo 1: Comandos Esenciales

**Objetivo**: Dominar la navegaciÃ³n y operaciones bÃ¡sicas en PowerShell.

---

## NavegaciÃ³n

```powershell
# Directorio actual
Get-Location   # alias: pwd

# Listar contenido
Get-ChildItem            # alias: ls, dir
Get-ChildItem -Recurse   # Listar recursivamente
Get-ChildItem -Filter "*.js"  # Filtrar por extensiÃ³n

# Cambiar directorio
Set-Location ..          # alias: cd ..
Set-Location D:\Proyectos   # Ir a ruta especÃ­fica

# Crear directorios
New-Item -ItemType Directory -Path "src/components"

# Eliminar directorios
Remove-Item -Recurse -Force "temp"   # alias: rm -r -fo temp
```

---

## Archivos

```powershell
# Crear archivo vacÃ­o
New-Item -ItemType File -Path "index.js"

# Leer archivo
Get-Content "index.js"         # alias: cat
Get-Content "index.js" -Tail 10  # Ãšltimas 10 lÃ­neas

# Escribir archivo
Set-Content "index.js" "console.log('hola');"   # Sobrescribe
Add-Content "index.js" "// nuevo cÃ³digo"         # AÃ±ade al final

# Copiar archivos
Copy-Item "origen.js" "destino.js"    # alias: cp

# Mover archivos
Move-Item "origen.js" "backup/"       # alias: mv

# Eliminar archivo
Remove-Item "temp.js"                 # alias: rm
```

---

## Pipe y Filtrado

```powershell
# Pipe bÃ¡sico
Get-Process | Where-Object { $_.CPU -gt 10 }

# Select specific properties
Get-ChildItem | Select-Object Name, Length

# Sort
Get-ChildItem | Sort-Object Length -Descending

# Agrupar
Get-ChildItem | Group-Object Extension

# Formatear como tabla
Get-Process | Format-Table -AutoSize

# Filter (Where-Object)
Get-Service | Where-Object Status -eq Running
```

---

## Aliases Comunes

| PowerShell | CMD/Unix | DescripciÃ³n |
|-----------|----------|-------------|
| `Get-ChildItem` | `ls`, `dir` | Listar archivos |
| `Set-Location` | `cd` | Cambiar directorio |
| `Get-Content` | `cat`, `type` | Leer archivo |
| `Set-Content` | `>` | Escribir archivo |
| `Copy-Item` | `cp`, `copy` | Copiar |
| `Move-Item` | `mv`, `move` | Mover |
| `Remove-Item` | `rm`, `del` | Eliminar |
| `Select-Object` | `select` | Seleccionar propiedades |
| `Where-Object` | `where`, `grep` | Filtrar |
| `Sort-Object` | `sort` | Ordenar |

---

## Ayuda Integrada

```powershell
# Obtener ayuda de un comando
Get-Help Get-ChildItem

# Ejemplos
Get-Help Get-ChildItem -Examples

# Actualizar ayuda (admin)
Update-Help

# Encontrar comandos por verbo
Get-Command -Verb Get
Get-Command -Noun Item
```

---

## Perfil de PowerShell

### UbicaciÃ³n del perfil
```powershell
$PROFILE  # Muestra la ruta
```

### Ejemplo de perfil
```powershell
# $PROFILE
oh-my-posh init pwsh | Invoke-Expression
Set-Alias g git
Set-Alias np npm

function ll { Get-ChildItem -Force }
function .. { Set-Location .. }

# Prompt personalizado
function prompt { "PS $($executionContext.SessionState.Path.CurrentLocation)> " }
```

---
**Documentación oficial**: https://learn.microsoft.com/en-us/powershell/

**Siguiente**: [[02 - MÃ³dulo 2 - Scripting y AutomatizaciÃ³n|MÃ³dulo 2: Scripting y AutomatizaciÃ³n]]
**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



