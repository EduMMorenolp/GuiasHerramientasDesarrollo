# Módulo 5: Clases, Expresiones Regulares y Jobs

**Objetivo**: Programación orientada a objetos en PowerShell, regex y ejecución asíncrona.

---

## Clases en PowerShell

PowerShell 5.0+ soporta definición de clases como en C# o Python.

### Definición básica
```powershell
class Usuario {
    # Propiedades
    [string]$Nombre
    [int]$Edad
    [string]$Email
    
    # Constructor
    Usuario([string]$nombre, [int]$edad) {
        $this.Nombre = $nombre
        $this.Edad = $edad
    }
    
    # Método
    [string]Saludar() {
        return "Hola, soy $($this.Nombre)"
    }
    
    # Propiedad calculada
    [bool]EsMayorDeEdad() {
        return $this.Edad -ge 18
    }
}

# Usar clase
$user = [Usuario]::new("Juan", 25)
$user.Saludar()
```

### Herencia
```powershell
class Empleado : Usuario {
    [string]$Departamento
    [decimal]$Salario
    
    Empleado([string]$nombre, [int]$edad, [string]$depto) : base($nombre, $edad) {
        $this.Departamento = $depto
    }
    
    [string]Saludar() {
        return "$([base]::Saludar()) - $($this.Departamento)"
    }
}
```

### Interfaces
```powershell
interface ILogger {
    [void]Log([string]$message)
}

class FileLogger : ILogger {
    [string]$Path
    
    [void]Log([string]$message) {
        Add-Content -Path $this.Path -Value "[$(Get-Date)] $message"
    }
}
```

### Enums
```powershell
enum Estado {
    Activo
    Inactivo
    Suspendido
}

class Cuenta {
    [string]$Nombre
    [Estado]$Estado = [Estado]::Activo
}
```

---

## Expresiones Regulares

### Operadores
```powershell
# -match (primer match)
"hola@mundo.com" -match "(\w+)@(\w+)\.(\w+)"
$Matches[1]  # hola
$Matches[2]  # mundo
$Matches[3]  # com

# -replace
"Color: #FF0000" -replace "#([A-F0-9]{6})", 'rgb($1)'

# -split
"a,b,c,d" -split ","

# Select-String (grep)
Get-ChildItem -Recurse -Filter "*.ps1" |
    Select-String -Pattern "function\s+\w+" |
    Select-Object LineNumber, Line
```

### Patrones comunes
```powershell
# Email
$emailPattern = '^[\w\.-]+@[\w\.-]+\.\w+$'

# IP Address
$ipPattern = '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$'

# URL
$urlPattern = '^https?://[\w\-]+(\.[\w\-]+)+[/#?]?.*$'

# Número de teléfono
$phonePattern = '^\+?\d{1,3}[\s-]?\d{3}[\s-]?\d{3}[\s-]?\d{4}$'

# Fecha ISO
$datePattern = '^\d{4}-\d{2}-\d{2}$'

# UUID
$uuidPattern = '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
```

### Regex .NET en PowerShell
```powershell
# Usar clase Regex de .NET
[regex]::Match("Hola Mundo 123", "\d+")
[regex]::Matches("Item1, Item2, Item3", "\w+\d+")

# Reemplazar con Regex
$pattern = [regex]"(?<name>\w+)@(?<domain>\w+\.\w+)"
$pattern.Replace("user@domain.com", '${domain} -> ${name}')
```

---

## PowerShell Jobs

### Background Jobs
```powershell
# Iniciar job
$job = Start-Job -ScriptBlock {
    Start-Sleep -Seconds 10
    Get-Service -Name *sql*
}

# Ver jobs
Get-Job

# Esperar
Wait-Job $job
Receive-Job $job

# Recibir mientras se ejecuta
Receive-Job $job -Keep

# Eliminar job
Remove-Job $job
```

### Thread Jobs
```powershell
# Más rápido que background jobs
$jobs = 1..5 | ForEach-Object -Parallel {
    # Cada bloque se ejecuta en su propio thread
    "Procesando item $_"
} -ThrottleLimit 3

$jobs
```

### Scheduled Jobs
```powershell
# Crear scheduled job
$trigger = New-JobTrigger -Daily -At "02:00AM"
Register-ScheduledJob -Name "CleanupLogs" -ScriptBlock {
    Get-ChildItem C:\logs\*.log -Recurse | Where-Object {
        $_.LastWriteTime -lt (Get-Date).AddDays(-30)
    } | Remove-Item
} -Trigger $trigger

# Ver scheduled jobs
Get-ScheduledJob

# Ejecutar manualmente
Start-Job -DefinitionName CleanupLogs
```

---

## WMI/CIM

```powershell
# CIM (nuevo, usa WS-MAN)
Get-CimInstance -ClassName Win32_Process
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

# WMI (legado)
Get-WmiObject -Class Win32_ComputerSystem

# Consultas WQL
Get-CimInstance -Query "SELECT * FROM Win32_Process WHERE Name LIKE '%chrome%'"

# Eventos WMI
Register-CimIndicationEvent -ClassName Win32_ProcessStartTrace -Action {
    Write-Host "Nuevo proceso: $($Event.SourceEventArgs.NewEvent.ProcessName)"
}
```

---

## Resumen del Módulo

| Concepto | Uso |
|----------|-----|
| Clases | POO con herencia, interfaces, enums |
| Regex | -match, -replace, [regex]::Matches |
| Jobs | Start-Job, ForEach-Object -Parallel |
| CIM | Get-CimInstance, WQL queries |

---

**Documentación oficial**: https://learn.microsoft.com/en-us/powershell/
**Siguiente**: [[06 - Módulo 6 - Desired State Configuration y Seguridad|Módulo 6: Desired State Configuration y Seguridad]]
**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
