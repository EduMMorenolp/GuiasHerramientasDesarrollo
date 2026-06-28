# MÃ³dulo 2: Scripting y AutomatizaciÃ³n

**Objetivo**: Escribir scripts para automatizar tareas repetitivas.

---

## Variables

```powershell
# DeclaraciÃ³n
$nombre = "Mundo"
$numero = 42
$lista = @(1, 2, 3, 4, 5)
$hash = @{ clave = "valor"; nombre = "Juan" }

# Tipado fuerte
[int]$edad = 25
[string]$mensaje = "Hola"

# InterpolaciÃ³n
Write-Host "Hola $nombre, tienes $edad aÃ±os"

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
    Write-Host "NiÃ±o"
}

# Switch
switch ($dia) {
    "lunes" { Write-Host "Inicio de semana" }
    "viernes" { Write-Host "Finde cerca" }
    default { Write-Host "DÃ­a normal" }
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
    $input = Read-Host "Â¿Continuar? (s/n)"
} while ($input -ne "n")
```

---

## Funciones

```powershell
# FunciÃ³n bÃ¡sica
function Saludar {
    param([string]$nombre)
    Write-Host "Hola, $nombre!"
}

# FunciÃ³n con pipeline
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

# Ejemplo: backup automÃ¡tico
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

## MÃ³dulos

```powershell
# Listar mÃ³dulos instalados
Get-Module -ListAvailable

# Instalar mÃ³dulo
Install-Module -Name PSScriptAnalyzer

# Importar mÃ³dulo
Import-Module PSScriptAnalyzer

# Crear mÃ³dulo simple
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

# Leer archivo lÃ­nea por lÃ­nea
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

## AutomatizaciÃ³n de Tareas

### Ejemplo: Limpiar archivos temporales
```powershell
function Clear-TempFiles {
    param([int]$DaysOld = 7)
    
    $tempPath = "$env:TEMP"
    $cutoffDate = (Get-Date).AddDays(-$DaysOld)
    
    Get-ChildItem $tempPath -Recurse | 
        Where-Object { $_.LastWriteTime -lt $cutoffDate } |
        Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "Archivos temporales anteriores a $DaysOld dÃ­as eliminados"
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

**Siguiente**: [[03 - MÃ³dulo 3 - Perfiles y PersonalizaciÃ³n|MÃ³dulo 3: Perfiles y PersonalizaciÃ³n]]
**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



