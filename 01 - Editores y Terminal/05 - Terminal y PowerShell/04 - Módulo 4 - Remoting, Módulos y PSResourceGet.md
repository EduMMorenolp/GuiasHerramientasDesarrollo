# MÃ³dulo 4: Remoting, MÃ³dulos y PSResourceGet

**Objetivo**: Gestionar equipos remotos, crear mÃ³dulos profesionales y usar el nuevo gestor de paquetes.

---

## PowerShell Remoting

### WinRM
```powershell
# Habilitar remoting
Enable-PSRemoting -Force

# Conectar a equipo remoto
Enter-PSSession -ComputerName SERVER01
Enter-PSSession -ComputerName 192.168.1.100 -Credential (Get-Credential)

# Ejecutar comando remoto
Invoke-Command -ComputerName SERVER01 -ScriptBlock {
    Get-Service -Name *sql*
}

# SesiÃ³n persistente
$session = New-PSSession -ComputerName SERVER01
Invoke-Command -Session $session -ScriptBlock { Get-Process }
Remove-PSSession $session
```

### SSH Remoting (PowerShell 7+)
```powershell
# Configurar SSH remoting
# En servidor remoto: Install-Package -Name OpenSSH.Server
# En cliente: ssh-keygen, copiar clave pÃºblica

# Conectar por SSH
Enter-PSSession -HostName user@server -Port 22

# Ejecutar comando
Invoke-Command -HostName server -UserName user -ScriptBlock {
    Get-ChildItem /var/log
}
```

### Remoting avanzado
```powershell
# Ejecutar en mÃºltiples equipos
$computers = @("WEB01", "WEB02", "WEB03")
Invoke-Command -ComputerName $computers -ScriptBlock {
    Get-Service -Name w3svc | Select-Object Name, Status
}

# Sesiones con credenciales diferentes
$cred = Get-Credential
$session = New-PSSession -ComputerName DB01 -Credential $cred
```

---

## Crear MÃ³dulos Profesionales

### Estructura de mÃ³dulo
```powershell
# MiModulo/
#   MiModulo.psm1     # CÃ³digo del mÃ³dulo
#   MiModulo.psd1      # Manifest del mÃ³dulo
#   Functions/
#     Get-HelperFunction.ps1
#   en-US/
#     about_MiModulo.help.txt
```

### Module Manifest (.psd1)
```powershell
@{
    RootModule = 'MiModulo.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a1b2c3d4-...'
    Author = 'Tu Nombre'
    Description = 'MÃ³dulo de utilidades para administraciÃ³n'
    
    # Funciones exportadas
    FunctionsToExport = @(
        'Get-SystemInfo',
        'Set-EnvironmentConfig',
        'Test-NetworkLatency'
    )
    
    # Variables exportadas
    VariablesToExport = @()
    AliasesToExport = @('ginfo', 'nlat')
    
    # Requisitos
    PowerShellVersion = '7.0'
    RequiredModules = @('PSReadLine')
    CompatiblePSEditions = @('Core', 'Desktop')
}
```

### Module code (.psm1)
```powershell
# Funciones privadas (no exportadas)
function Get-InternalHelper {
    param([string]$Path)
    # LÃ³gica interna
}

# FunciÃ³n pÃºblica
function Get-SystemInfo {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string[]]$ComputerName
    )
    
    process {
        foreach ($computer in $ComputerName) {
            $os = Get-CimInstance -ClassName Win32_OperatingSystem
            [PSCustomObject]@{
                ComputerName = $computer
                OS = $os.Caption
                Version = $os.Version
                FreeMemGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
            }
        }
    }
}

Export-ModuleMember -Function Get-SystemInfo
```

---

## PSResourceGet (PowerShellGet v3)

### Â¿QuÃ© es?
Nuevo gestor de paquetes para PowerShell (reemplaza PowerShellGet).

```powershell
# Buscar mÃ³dulos
Find-PSResource -Name "*sql*"

# Instalar
Install-PSResource -Name PSScriptAnalyzer

# Instalar versiÃ³n especÃ­fica
Install-PSResource -Name Az -Version 12.0.0

# Actualizar
Update-PSResource -Name PSScriptAnalyzer

# Desinstalar
Uninstall-PSResource -Name PSScriptAnalyzer

# Listar recursos instalados
Get-InstalledPSResource

# Guardar mÃ³dulo sin instalar
Save-PSResource -Name PSScriptAnalyzer -Path .\modules
```

### Publicar en PSGallery
```powershell
# API Key desde powershellgallery.com
Register-PSResourceRepository -PSGallery
Publish-PSResource -Path .\MiModulo -ApiKey $apiKey
```

---

## PowerShell Gallery

```powershell
# Configurar repositorios
Get-PSResourceRepository
Register-PSResourceRepository -Name CompanyRepo -Uri "https://nuget.company.com"

# Buscar
Find-PSResource -Repository PSGallery -Tag azure,devops

# Ver dependencias
Find-PSResource -Name Az.Compute -IncludeDependencies
```

---

## Resumen del MÃ³dulo

| Comando | DescripciÃ³n |
|---------|-------------|
| `Enter-PSSession` | SesiÃ³n remota interactiva |
| `Invoke-Command` | Ejecutar comando remoto |
| `New-PSSession` | SesiÃ³n persistente |
| `Find-PSResource` | Buscar mÃ³dulos |
| `Install-PSResource` | Instalar mÃ³dulo |
| `Publish-PSResource` | Publicar mÃ³dulo |

---

**Documentación oficial**: https://learn.microsoft.com/en-us/powershell/
**Siguiente**: [[05 - MÃ³dulo 5 - Clases, Expresiones Regulares y Jobs|MÃ³dulo 5: Clases, Expresiones Regulares y Jobs]]
**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
