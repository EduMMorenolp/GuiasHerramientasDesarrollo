# MÃ³dulo 3: Perfiles y PersonalizaciÃ³n

**Objetivo**: Crear un entorno de terminal productivo y personalizado.

---

## Oh My Posh

### InstalaciÃ³n
```powershell
# Instalar Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# O con Scoop
scoop install oh-my-posh

# Fuente Nerd Font (necesaria para iconos)
oh-my-posh font install
```

### ConfiguraciÃ³n en $PROFILE
```powershell
# AÃ±adir a $PROFILE
oh-my-posh init pwsh --config ~/.config/posh/theme.omp.json | Invoke-Expression

# Temas populares
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/montys.omp.json"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/atomic.omp.json"
```

### Tema personalizado
```json
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "type": "prompt",
      "segments": [
        { "type": "path", "style": "powerline", "foreground": "#ffffff", "background": "#61afef" },
        { "type": "git", "style": "powerline", "foreground": "#ffffff", "background": "#98c379" },
        { "type": "node", "style": "powerline", "foreground": "#ffffff", "background": "#6a9955" },
        { "type": "executiontime", "style": "powerline", "foreground": "#ffffff", "background": "#e5c07b" }
      ]
    }
  ]
}
```

---

## PSReadLine

### Mejora la experiencia de lÃ­nea de comandos
```powershell
# En $PROFILE
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle Inline
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -EditMode Windows

# Atajos personalizados
Set-PSReadLineKeyHandler -Key Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Key Ctrl+RightArrow -Function ForwardWord
Set-PSReadLineKeyHandler -Key Ctrl+Backspace -Function KillWord
```

---

## Terminal Multiplexer

### Windows Terminal
- PestaÃ±as y paneles
- Perfiles personalizados (PowerShell, CMD, WSL, Git Bash)
- Temas y transparencia

```json
{
  "profiles": {
    "list": [
      {
        "name": "PowerShell",
        "commandline": "pwsh.exe",
        "font": { "face": "CascadiaCode NF" },
        "colorScheme": "One Half Dark",
        "opacity": 90,
        "useAcrylic": true
      }
    ]
  }
}
```

---

## Alias y Utilidades

### En $PROFILE
```powershell
# Alias Ãºtiles
Set-Alias g git
Set-Alias np npm
Set-Alias npx npx
Set-Alias d docker
Set-Alias dc docker compose

# Funciones helper
function find { Get-ChildItem -Recurse -Filter $args[0] }
function grep { Select-String $args[0] }
function touch { New-Item -ItemType File -Path $args[0] }

# NavegaciÃ³n rÃ¡pida
function ~ { Set-Location $HOME }
function .. { Set-Location .. }
function ... { Set-Location ..\.. }
function .... { Set-Location ..\..\.. }

# Utilidades de red
function myip { (Invoke-WebRequest ifconfig.me).Content.Trim() }

# Quick open
function code { & "C:\Program Files\Microsoft VS Code\bin\code.cmd" $args }
```

---

## ConfiguraciÃ³n Completa del Perfil

```powershell
# ==== $PROFILE ====

# Oh My Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/atomic.omp.json" | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle Inline
Set-PSReadLineOption -EditMode Windows

# Alias
Set-Alias g git
Set-Alias np npm
Set-Alias d docker
Set-Alias dc docker compose

# Funciones
function ll { Get-ChildItem -Force }
function .. { Set-Location .. }
function grep($pattern) { Select-String -Path . -Pattern $pattern }

# Prompt
function prompt {
    $path = (Get-Location).Path.Replace($HOME, "~")
    Write-Host "PS " -NoNewline -ForegroundColor Cyan
    Write-Host $path -NoNewline -ForegroundColor Yellow
    Write-Host "> " -NoNewline
    return " "
}
```

---

## Debugging y Diagnosis

```powershell
# Mostrar informaciÃ³n del sistema
$PSVersionTable           # VersiÃ³n de PowerShell
Get-ExecutionPolicy       # PolÃ­tica de ejecuciÃ³n
$PROFILE                  # Ruta del perfil actual
Get-Module                # MÃ³dulos cargados

# Probar perfil
. $PROFILE  # Recargar perfil
```

---

**Documentación oficial**: https://learn.microsoft.com/en-us/powershell/
**Siguiente**: [[04 - MÃ³dulo 4 - Remoting, MÃ³dulos y PSResourceGet|MÃ³dulo 4: Remoting, MÃ³dulos y PSResourceGet]]
**Inicio herramienta**: [[terminal|Terminal y PowerShell]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
