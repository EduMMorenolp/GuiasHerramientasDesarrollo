$vaultRoot = "D:\Proyectos\Herramientas"
$nl = "`r`n"

function AddFooter($file, $anterior, $siguiente, $herramienta, $landingFile, $herramientaLabel, $docUrl, $docLabel) {
    $bytes = [System.IO.File]::ReadAllBytes($file)
    $content = [System.Text.Encoding]::UTF8.GetString($bytes)
    $fileNl = if ($content -match '\r\n') { "`r`n" } else { "`n" }

    # Skip if file already has a table footer
    if ($content -match '(?m)^\| \*\*← Anterior\*\* \|') {
        Write-Host ("  SKIP (already has footer): " + ($file -replace '^.*\\', ''))
        return
    }

    $anteriorVal = if ($anterior) {
        $antLabel = $anterior -replace '^.*/' -replace '\.md$' -replace '^\d+ - ', ''
        $anteriorWrapped = "[[" + $anterior + "|" + $antLabel + "]]"
        $anteriorWrapped -replace '(?<!\\)\|', '\|'
    } else { "—" }

    $siguienteVal = if ($siguiente) {
        $sigLabel = $siguiente -replace '^.*/' -replace '\.md$' -replace '^\d+ - ', ''
        $siguienteWrapped = "[[" + $siguiente + "|" + $sigLabel + "]]"
        $siguienteWrapped -replace '(?<!\\)\|', '\|'
    } else { "—" }

    $ihVal = ("[[07 - IA/$herramienta/$landingFile|$herramientaLabel]]") -replace '(?<!\\)\|', '\|'

    $footer = @(
        "---",
        "",
        "| Navegaci$([char]0x00F3)n | Enlace |",
        "|------------|--------|",
        "| **← Anterior** | $anteriorVal |",
        "| **Siguiente →** | $siguienteVal |",
        "| **Inicio herramienta** | $ihVal |",
        "| **Inicio principal** | [[../../00 - $([char]0x00CD)ndice/$([char]0x00CD)ndice General|$([char]0x00CD)ndice General]] |",
        "| **Documentaci$([char]0x00F3)n oficial** | [$docLabel]($docUrl) |",
        "",
        "---"
    ) -join $fileNl
    $footer += $fileNl

    $content = $content.TrimEnd() + $fileNl + $fileNl + $footer
    [System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
    Write-Host "  $($file -replace '^.*\\', '')"
}

# == Hermes Agent modules ==
$ha = "14 - Hermes Agent"
$haModules = @(
    @{num="01"; name="Instalaci$([char]0x00F3)n y Fundamentos"; sig="02"}
    @{num="02"; name="Configuraci$([char]0x00F3)n del Agente"; sig="03"}
    @{num="03"; name="Herramientas y Toolsets"; sig="04"}
    @{num="04"; name="Sistema de Memoria"; sig="05"}
    @{num="05"; name="Sistema de Skills"; sig="06"}
    @{num="06"; name="Plataformas de Mensajer$([char]0x00ED)a"; sig="07"}
    @{num="07"; name="Seguridad y Producci$([char]0x00F3)n"; sig=$null}
)
$haDir = "$vaultRoot\07 - IA\$ha"
Write-Host "=== Hermes Agent ===" -ForegroundColor Cyan
foreach ($m in $haModules) {
    $num = $m.num
    $name = $m.name
    $sigNum = $m.sig
    $file = "$haDir\$num - M$([char]0x00F3)dulo $([int]$num) - $name.md"
    $ant = if ([int]$num -gt 1) {
        $prevNum = ([int]$num - 1).ToString("00")
        "07 - IA/$ha/$prevNum - M$([char]0x00F3)dulo $([int]$prevNum) - " + (@(
            "Instalaci$([char]0x00F3)n y Fundamentos"
            "Configuraci$([char]0x00F3)n del Agente"
            "Herramientas y Toolsets"
            "Sistema de Memoria"
            "Sistema de Skills"
            "Plataformas de Mensajer$([char]0x00ED)a"
            "Seguridad y Producci$([char]0x00F3)n"
        )[[int]$num - 2])
    } else { $null }
    $sig = if ($sigNum) {
        "07 - IA/$ha/$sigNum - M$([char]0x00F3)dulo $([int]$sigNum) - " + (@(
            "Instalaci$([char]0x00F3)n y Fundamentos"
            "Configuraci$([char]0x00F3)n del Agente"
            "Herramientas y Toolsets"
            "Sistema de Memoria"
            "Sistema de Skills"
            "Plataformas de Mensajer$([char]0x00ED)a"
            "Seguridad y Producci$([char]0x00F3)n"
        )[[int]$sigNum - 1])
    } else { $null }
    AddFooter $file $ant $sig $ha "hermes-agent" "Hermes Agent" "https://hermes-agent.ai" "Hermes Agent Docs"
}

# == OpenClaw modules ==
$oc = "15 - OpenClaw"
$ocModules = @(
    @{num="01"; name="Instalaci$([char]0x00F3)n y Fundamentos"; sig="02"}
    @{num="02"; name="Gateway y Canales"; sig="03"}
    @{num="03"; name="Herramientas y Skills"; sig="04"}
    @{num="04"; name="Plugins"; sig="05"}
    @{num="05"; name="Automatizaci$([char]0x00F3)n y Subagentes"; sig="06"}
    @{num="06"; name="Producci$([char]0x00F3)n y Avanzado"; sig=$null}
)
$ocDir = "$vaultRoot\07 - IA\$oc"
Write-Host "=== OpenClaw ===" -ForegroundColor Cyan
foreach ($m in $ocModules) {
    $num = $m.num
    $name = $m.name
    $sigNum = $m.sig
    $file = "$ocDir\$num - M$([char]0x00F3)dulo $([int]$num) - $name.md"
    $ant = if ([int]$num -gt 1) {
        $prevNum = ([int]$num - 1).ToString("00")
        "07 - IA/$oc/$prevNum - M$([char]0x00F3)dulo $([int]$prevNum) - " + (@(
            "Instalaci$([char]0x00F3)n y Fundamentos"
            "Gateway y Canales"
            "Herramientas y Skills"
            "Plugins"
            "Automatizaci$([char]0x00F3)n y Subagentes"
            "Producci$([char]0x00F3)n y Avanzado"
        )[[int]$num - 2])
    } else { $null }
    $sig = if ($sigNum) {
        "07 - IA/$oc/$sigNum - M$([char]0x00F3)dulo $([int]$sigNum) - " + (@(
            "Instalaci$([char]0x00F3)n y Fundamentos"
            "Gateway y Canales"
            "Herramientas y Skills"
            "Plugins"
            "Automatizaci$([char]0x00F3)n y Subagentes"
            "Producci$([char]0x00F3)n y Avanzado"
        )[[int]$sigNum - 1])
    } else { $null }
    AddFooter $file $ant $sig $oc "openclaw" "OpenClaw" "https://openclaw.ai" "OpenClaw Docs"
}
