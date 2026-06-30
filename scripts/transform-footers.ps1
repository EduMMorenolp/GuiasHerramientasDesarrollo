$vaultRoot = "D:\Proyectos\Herramientas"

Write-Host "=== Pass 1: Building reverse map ===" -ForegroundColor Cyan
$reverseMap = @{}
$mdFiles = Get-ChildItem -Path $vaultRoot -Recurse -Filter "*.md" | Where-Object { !$_.PSIsContainer }

foreach ($file in $mdFiles) {
    if (-not (Test-Path -LiteralPath $file.FullName)) { continue }
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    if (-not $content) { continue }

    if ($content -match '(?m)^\*\*Siguiente\*\*: \[\[([^\]]+)\]\]') {
        $wikilink = $Matches[1]
        $targetFile = $wikilink -replace '\|.*$', ''
        $sourcePath = $file.FullName.Substring($vaultRoot.Length + 1) -replace '\\', '/' -replace '\.md$', ''
        if ($targetFile -notmatch '/') {
            $sourceDir = $sourcePath -replace '/[^/]+$', ''
            $targetFile = "$sourceDir/$targetFile"
        }
        $reverseMap[$targetFile] = $sourcePath
    }
}

Write-Host "  $($reverseMap.Count) mappings built" -ForegroundColor Green

Write-Host "=== Pass 2: Transforming ===" -ForegroundColor Cyan
$transformedCount = 0

foreach ($file in $mdFiles) {
    if (-not (Test-Path -LiteralPath $file.FullName)) { continue }
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    if (-not $content) { continue }

    $original = $content

    $nl = if ($content -match '\r\n') { "`r`n" } else { "`n" }

    if ($content -notmatch '(?m)^\*\*Documentaci[oó]n oficial\*\*: ') { continue }

    $docUrl = ""
    if ($content -match '(?m)^\*\*Documentaci[oó]n oficial\*\*: (.+)$') {
        $docUrl = $Matches[1].Trim()
    }

    $siguiente = ""
    if ($content -match '(?m)^\*\*Siguiente\*\*: \[\[([^\]]+)\]\]') {
        $siguiente = $Matches[1]
    }

    $inicioHerramienta = ""
    if ($content -match '(?m)^\*\*Inicio herramienta\*\*: \[\[([^\]]+)\]\]') {
        $inicioHerramienta = $Matches[1]
    }

    $inicioPrincipal = ""
    if ($content -match '(?m)^\*\*Inicio principal\*\*: \[\[([^\]]+)\]\]') {
        $inicioPrincipal = $Matches[1]
    }

    $relativePath = $file.FullName.Substring($vaultRoot.Length + 1) -replace '\\', '/' -replace '\.md$', ''

    $anterior = "—"
    if ($reverseMap.ContainsKey($relativePath)) {
        $sourcePath = $reverseMap[$relativePath]
        $parts = $sourcePath -split '/'
        $sourceFilename = $parts[-1] + '.md'
        $sourceLabel = $sourceFilename -replace '\.md$', '' -replace '^\d+ - ', ''
        if ($sourceLabel -match '^M[oó]dulo \d+') {
            $anterior = "[[$sourcePath|$sourceLabel]]"
        } else {
            $anterior = "[[$sourcePath]]"
        }
    }

    $toolName = ""
    if ($inicioHerramienta -match '\|(.+)$') {
        $toolName = $Matches[1]
    } elseif ($inicioHerramienta -match '\[\[([^|\]]+)') {
        $toolName = Split-Path -Leaf ($Matches[1] -replace '/', '\')
    }

    $docLabel = "Documentation"
    if ($toolName) {
        $docLabel = "$toolName Docs"
    }

    function EscapeTablePipe($value) {
        $content = $value -replace '^\[\[', '' -replace '\]\]$', ''
        $content = $content -replace '(?<!\\)\|', '\|'
        return '[[' + $content + ']]'
    }

    $siguienteVal = "—"
    if ($siguiente) {
        $siguienteVal = EscapeTablePipe($siguiente)
    }

    $ihVal = "—"
    if ($inicioHerramienta) {
        $ihVal = EscapeTablePipe($inicioHerramienta)
    }

    $ipVal = "[[" + $inicioPrincipal + "]]"
    if ($ipVal -match '^\[\[([^|]+)\]\]$') {
        $ipVal = "[[$($Matches[1])|I$([char]0x00CD)ndice General]]"
    }
    $ipVal = EscapeTablePipe($ipVal)

    $anteriorVal = "—"
    if ($anterior -ne "—") {
        $anteriorVal = EscapeTablePipe($anterior)
    }

    $newFooter = @(
        "---",
        "",
        "| Navegaci$([char]0x00F3)n | Enlace |",
        "|------------|--------|",
        "| **← Anterior** | $anteriorVal |",
        "| **Siguiente →** | $siguienteVal |",
        "| **Inicio herramienta** | $ihVal |",
        "| **Inicio principal** | $ipVal |",
        "| **Documentaci$([char]0x00F3)n oficial** | [$docLabel]($docUrl) |",
        "",
        "---"
    ) -join $nl
    $newFooter += $nl

    $lastHrMatches = [regex]::Matches($content, '(?m)^---+\r?$')
    if ($lastHrMatches.Count -gt 0) {
        $lastHrPos = $lastHrMatches[$lastHrMatches.Count - 1].Index
        $content = $content.Substring(0, $lastHrPos) + $newFooter

        if ($content -ne $original) {
            [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
            $transformedCount++
        }
    }
}

Write-Host "  $transformedCount files transformed" -ForegroundColor Green
