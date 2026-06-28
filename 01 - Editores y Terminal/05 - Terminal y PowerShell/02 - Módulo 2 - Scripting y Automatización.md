# Módulo 2: Scripting y Automatización

**Objetivo**: Escribir scripts para automatizar tareas repetitivas.

---

## Variables

```powershell
# Declaración
$nombre = "Mundo"
$numero = 42
$lista = @(1, 2, 3, 4, 5)
$hash = @{ clave = "valor"; nombre = "Juan" }

# Tipado fuerte
[int]$edad = 25
[string]$mensaje = "Hola"

# Interpolación
Write-Host "Hola $nombre, tienes $edad años"

# Variables de entorno
$env:PATH
$env:MY_VAR = "valor"
```

---

## Estructuras de Control

### Condicionales
```powershell
if ($edad -ge 18) {
    Write-Host "Adulto"
} elseif ($edad -ge 13) {
    Write-Host "Adolescente"
} else {
    Write-Host "Niño"
}

# Switch
switch ($dia) {
    "lunes" { Write-Host "Inicio de semana" }
    "viernes" { Write-Host "Finde cerca" }
    default { Write-Host "Día normal" }
}
```

### Bucles
```powershell
# For
for ($i = 0; $i -lt 10; $i++) {
    Write-Host $i
}

# Foreach
$items = @(1, 2, 3, 4, 5)
foreach ($item in $items) {
    Write-Host $item
}

# While
$count = 0
while ($count -lt 5) {
    Write-Host $count
    $count++
}

# Do-While
do {
    $input = Read-Host "¿Continuar? (s/n)"
} while ($input -ne "n")
```

---

## Funciones

```powershell
# Función básica
function Saludar {
    param([string]$nombre)
    Write-Host "Hola, $nombre!"
}

# Función con pipeline
function Get-CalculatedSize {
    param(
        [Parameter(ValueFromPipeline)]
        [string]$Path
    )
    process {
        $item = Get-Item $Path
        [PSCustomObject]@{
            Name = $item.Name
            SizeMB = [math]::Round($item.Length / 1MB, 2)
        }
    }
}

# Ejemplo: backup automático
function Backup-Project {
    param(
        [string]$Source = ".",
        [string]$Destination = "backup"
    )
    
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupName = "$Destination/backup_$timestamp"
    
    New-Item -ItemType Directory -Path $backupName -Force
    Copy-Item -Recurse "$Source/*" $backupName
    Write-Host "Backup creado en: $backupName"
}
```

---

## Módulos

```powershell
# Listar módulos instalados
Get-Module -ListAvailable

# Instalar módulo
Install-Module -Name PSScriptAnalyzer

# Importar módulo
Import-Module PSScriptAnalyzer

# Crear módulo simple
# modulo.psm1
function Get-Hello { "Hello from module" }
Export-ModuleMember -Function Get-Hello
```

---

## Trabajar con Archivos

```powershell
# Leer CSV
$data = Import-Csv "datos.csv"
$data | Where-Object Edad -gt 18

# Exportar CSV
Get-Process | Export-Csv "procesos.csv" -NoTypeInformation

# Leer JSON
$config = Get-Content "config.json" | ConvertFrom-Json

# Escribir JSON
$data | ConvertTo-Json -Depth 3 | Set-Content "output.json"

# Leer archivo línea por línea
Get-Content "log.txt" | ForEach-Object {
    if ($_ -match "ERROR") {
        Write-Host $_ -ForegroundColor Red
    }
}
```

---

## Manejo de Errores

```powershell
# Try/Catch/Finally
try {
    Get-Item "archivo_que_no_existe.txt" -ErrorAction Stop
} catch [System.IO.FileNotFoundException] {
    Write-Host "Archivo no encontrado: $_"
} catch {
    Write-Host "Error general: $_"
} finally {
    Write-Host "Bloque finally siempre se ejecuta"
}

# ErrorAction preferencias
Get-ChildItem "no_existe" -ErrorAction SilentlyContinue
Get-ChildItem "no_existe" -ErrorAction Stop
```

---

## Automatización de Tareas

### Ejemplo: Limpiar archivos temporales
```powershell
function Clear-TempFiles {
    param([int]$DaysOld = 7)
    
    $tempPath = "$env:TEMP"
    $cutoffDate = (Get-Date).AddDays(-$DaysOld)
    
    Get-ChildItem $tempPath -Recurse | 
        Where-Object { $_.LastWriteTime -lt $cutoffDate } |
        Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "Archivos temporales anteriores a $DaysOld días eliminados"
}
```

### Ejemplo: Monitoreo de procesos
```powershell
function Watch-Process {
    param([string]$ProcessName, [int]$MaxCPU = 80)
    
    while ($true) {
        $process = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue
        if ($process.CPU -gt $MaxCPU) {
            Write-Warning "$ProcessName usando $($process.CPU)% CPU!"
        }
        Start-Sleep -Seconds 5
    }
}
```

---

**Documentación oficial**: https://learn.microsoft.com/en-us/powershell/
**Siguiente**: [[03 - Módulo 3 - Perfiles y Personalización|Módulo 3: Perfiles y Personalización]]
**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
