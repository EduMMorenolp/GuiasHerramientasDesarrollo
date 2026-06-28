$root = "D:\Proyectos\Herramientas"
$files = Get-ChildItem -Recurse -Filter "*M*dulo*.md" -LiteralPath $root | Sort-Object FullName
$totalFiles = $files.Count
$modifiedFiles = 0
$stats = @{ h1Acento=0; objetivoAdded=0; docDeduped=0; wikilinkFixed=0; navSepAdded=0; trailingTrimmed=0 }

foreach ($file in $files) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    if (-not $content) { continue }
    $orig = $content; $changed = $false

    # ---- 1. Fix H1: Modulo -> Módulo ----
    if ($content -match '(?m)^# Modulo ') {
        $content = $content -replace '(?m)^# Modulo ', '# Módulo '
        $changed = $true; $stats.h1Acento++
    }

    # ---- 2. Add **Objetivo**: after H1 if missing (check ~300 chars after H1) ----
    $h1Match = [regex]::Match($content, '(?m)^# M.*?dulo \d+: [^\r\n]+$')
    if ($h1Match.Success) {
        $afterH1 = $content.Substring($h1Match.Index + $h1Match.Length)
        $lookahead = if ($afterH1.Length -gt 300) { $afterH1.Substring(0, 300) } else { $afterH1 }
        if ($lookahead -notmatch '\*\*Objetivo\*\*') {
            $name = ($h1Match.Value -replace '^# M.*?dulo \d+: ', '').Trim()
            $escapedH1 = [regex]::Escape($h1Match.Value)
            # Use [ \t]* to only match horizontal whitespace (not newlines)
            $content = $content -replace "($escapedH1)[ \t]*\r?\n", "`$1`r`n`r`n**Objetivo**: Aprender y dominar: $name.`r`n"
            $changed = $true; $stats.objetivoAdded++
        }
    }

    # ---- 3. Fix **Documentación oficial** duplicates (use regex for double-encoded ó) ----
    $docLines = [regex]::Matches($content, '(?m)^\*\*Documentaci.*?n oficial\*\*:.*$')
    if ($docLines.Count -gt 1) {
        $lastDocVal = $docLines[$docLines.Count - 1].Value
        $docUrl = if ($lastDocVal -match 'https?://\S+') { $matches[0] } else { 'https://pm2.keymetrics.io/docs/' }

        # Remove all doc lines (with their trailing newline)
        $content = $content -replace '(?m)^\*\*Documentaci.*?n oficial\*\*:.*\r?\n?', ''

        # Insert one clean doc line before first nav item
        $navIdx = $content.IndexOf('**Siguiente**:')
        if ($navIdx -lt 0) { $navIdx = $content.IndexOf('**Inicio') }
        if ($navIdx -ge 0) {
            $before = $content.Substring(0, $navIdx).TrimEnd()
            $after = $content.Substring($navIdx)
            $content = "$before`r`n`r`n**Documentación oficial**: $docUrl`r`n`r`n$after"
        }
        $changed = $true; $stats.docDeduped++
    }

    # ---- 4. Fix broken wikilinks: **Siguiente**: |Módulo -> [[Módulo ----
    if ($content -match '(?m)^\*\*Siguiente\*\*: \|M.*?dulo') {
        $content = $content -replace '(?m)(^\*\*Siguiente\*\*: )\|(M.*?dulo)', '${1}[[${2}'
        $changed = $true; $stats.wikilinkFixed++
    }

    # ---- 5. Ensure --- before nav section (remove misplaced ones inside nav) ----
    $navIdx = -1
    $docMatch = [regex]::Match($content, '(?m)^\*\*Documentaci.*?n oficial\*\*:')
    if ($docMatch.Success) { $navIdx = $docMatch.Index }
    if ($navIdx -lt 0) { $navIdx = $content.IndexOf('**Siguiente**') }
    if ($navIdx -ge 0) {
        $before = $content.Substring(0, $navIdx).TrimEnd()
        $after = $content.Substring($navIdx)
        $afterClean = $after -replace '(?m)^[ \t]*---[ \t]*\r?\n?', ''
        $hasBeforeSep = $before -match '(?m)^[ \t]*---[ \t]*\r?$'
        if ($hasBeforeSep) {
            if ($afterClean -ne $after) { $content = "$before`r`n`r`n$afterClean"; $changed = $true; $stats.navSepAdded++ }
        } else {
            $content = "$before`r`n---`r`n`r`n$afterClean"
            $changed = $true; $stats.navSepAdded++
        }
    }

    # ---- 6. Trim trailing whitespace to exactly one CRLF ----
    $trimmed = $content.TrimEnd() + "`r`n"
    if ($trimmed -ne $content) { $content = $trimmed; $changed = $true; $stats.trailingTrimmed++ }

    if ($changed) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        $modifiedFiles++
    }
}

Write-Host "`n=== RESULT ==="
Write-Host "Total: $totalFiles | Modified: $modifiedFiles"
Write-Host "H1 acento: $($stats.h1Acento)  | Objetivo added: $($stats.objetivoAdded)"
Write-Host "Doc dedup: $($stats.docDeduped)  | Wikilinks fixed: $($stats.wikilinkFixed)"
Write-Host "Nav sep added: $($stats.navSepAdded)  | Trailing: $($stats.trailingTrimmed)"
