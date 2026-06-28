# MÃ³dulo 6: Desired State Configuration y Seguridad

**Objetivo**: Automatizar configuraciÃ³n de sistemas con DSC y hardening de PowerShell.

---

## Desired State Configuration (DSC)

### Â¿QuÃ© es?
Plataforma de gestiÃ³n de configuraciÃ³n que asegura que los sistemas estÃ©n en el estado deseado (declarativo).

### DSC v3 (PowerShell 7+)
```powershell
# DSC v3 usa recursos independientes (no mÃ³dulos PS)
# Instalar recursos DSC
Install-PSResource -Name Microsoft.Windows.DSC
```

### ConfiguraciÃ³n bÃ¡sica (DSC v2)
```powershell
Configuration WebServerConfig {
    Node "localhost" {
        WindowsFeature IIS {
            Name = "Web-Server"
            Ensure = "Present"
        }
        
        File WebsiteContent {
            DestinationPath = "C:\inetpub\wwwroot"
            Type = "Directory"
            Ensure = "Present"
        }
        
        Script CustomConfig {
            GetScript = { @{ Result = "check" } }
            SetScript = {
                Set-Content -Path "C:\inetpub\wwwroot\index.html" -Value "<h1>OK</h1>"
            }
            TestScript = {
                Test-Path "C:\inetpub\wwwroot\index.html"
            }
        }
    }
}

# Compilar MOF
WebServerConfig -OutputPath .\DSC

# Aplicar
Start-DscConfiguration -Path .\DSC -Wait -Verbose
```

### DSC v3 (nuevo)
```yaml
# dscconfig.yml
$schema: https://raw.githubusercontent.com/PowerShell/DSC/main/schemas/2024/02/config/document.json
resources:
  - name: Windows features
    type: Microsoft.Windows/WindowsFeature
    properties:
      Name: Web-Server
      Ensure: Present

  - name: IIS Config
    type: Microsoft.Web/IisSite
    properties:
      Name: Default Web Site
      PhysicalPath: C:\inetpub\wwwroot
      State: Started
```

```powershell
# Aplicar DSC v3
dsc config set dscconfig.yml
dsc config get
```

### DSC en Linux
```yaml
# DSC v3 soporta Linux con adaptador Python
resources:
  - name: Install nginx
    type: Linux/Service
    properties:
      Name: nginx
      State: Running

  - name: nginx config
    type: Linux/File
    properties:
      Path: /etc/nginx/nginx.conf
      Content: |
        events { worker_connections 1024; }
        http { server { listen 80; } }
```

---

## Seguridad en PowerShell

### Execution Policy
```powershell
# PolÃ­ticas de ejecuciÃ³n
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Scopes: MachinePolicy, UserPolicy, Process, CurrentUser, LocalMachine
# PolÃ­ticas: Restricted, RemoteSigned, AllSigned, Unrestricted, Bypass
```

### PowerShell Constrained Language Mode
```powershell
# Modo restringido (no permite scripts maliciosos)
$ExecutionContext.SessionState.LanguageMode
# FullLanguage o ConstrainedLanguage

# Habilitar constrained mode
# GPO: Turn on PowerShell Script Block Logging
# O via: System Center, JEA
```

### Just Enough Administration (JEA)
```powershell
# Crear archivo de capacidad de rol
New-PSRoleCapabilityFile -Path .\RoleCapabilities\WebAdmin.psrc

# Contenido del .psrc
@{
    ModulesToImport = @('WebAdministration')
    VisibleCmdlets = @(
        'Get-Website',
        'Start-Website',
        'Stop-Website'
    )
    VisibleFunctions = @()
    VisibleAliases = @()
}

# Crear archivo de endpoint
New-PSSessionConfigurationFile -Path .\WebAdmin.pssc

# Registrar endpoint JEA
Register-PSSessionConfiguration -Name WebAdmin -Path .\WebAdmin.pssc
```

### Logging y AuditorÃ­a
```powershell
# Script Block Logging
# GPO: Computer Configuration > Admin Templates > Windows Components > Windows PowerShell
# Turn on PowerShell Script Block Logging

# Module Logging
# GPO: Turn on Module Logging
# Modules: * (todos)

# Transcription
Start-Transcript -Path C:\Logs\PowerShell\Transcript-$(Get-Date -Format yyyyMMdd).txt
# ... commands ...
Stop-Transcript

# Protected Event Logging
# Encrypts logs so only authorized decryptors can read
```

### Secure Strings
```powershell
# Convertir string segura a texto plano
$secure = Read-Host -AsSecureString
$plain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
)

# Guardar credenciales cifradas
$cred = Get-Credential
$cred.Password | ConvertFrom-SecureString | Set-Content "user.cred"

# Leer credenciales
$password = Get-Content "user.cred" | ConvertTo-SecureString
$cred = New-Object System.Management.Automation.PSCredential("user", $password)
```

---

## PowerShell 7.6/7.7 Novedades

```powershell
# PowerShell 7.6 (LTS actual)
# - .NET 10 runtime
# - Tab completion mejorado
# - Nuevo PSResourceGet v1.2

# PowerShell 7.7 (prÃ³ximo)
# - MCP Server (Model Context Protocol)
# - Bash-style aliases
# - Non-profile module loading
```

---

## Resumen del MÃ³dulo

| Tema | Herramienta |
|------|-------------|
| DSC v2 | `Start-DscConfiguration` |
| DSC v3 | `dsc config set` |
| Execution Policy | `Set-ExecutionPolicy` |
| JEA | `Register-PSSessionConfiguration` |
| Logging | Start-Transcript, Script Block Logging |
| Secure Strings | ConvertFrom-SecureString |

---
**Documentación oficial**: https://learn.microsoft.com/en-us/powershell/

**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
