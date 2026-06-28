$ErrorActionPreference = "Stop"
$base = "D:\Proyectos\Herramientas"

$mdFiles = Get-ChildItem -Path $base -Recurse -Filter "*.md" | Where-Object {
    $_.FullName -notmatch "\\.git" -and $_.FullName -notmatch "node_modules"
}

$fixedCount = 0

foreach ($file in $mdFiles) {
    $fullPath = $file.FullName
    $relativePath = $fullPath.Substring($base.Length).TrimStart('\')
    $dirDepth = ($relativePath.Split('\') | Measure-Object).Count - 1

    $content = [System.IO.File]::ReadAllText($fullPath, [System.Text.Encoding]::UTF8)
    $original = $content
    $changed = $false

    # Fix trailing backslash in module wikilinks from overviews
    if ($content -match '\\\]\]') {
        $content = $content -replace '\\\]\]', ']]'
        $changed = $true
    }

    # Fix 'Inicio principal' / 'Inicio herramienta' wikilinks to Indice
    if ($dirDepth -eq 2) {
        # Modules / overviews: '../../../00' is wrong (goes 1 level too far)
        if ($content -match '\.\./\.\./\.\./00') {
            $content = $content -replace '\.\./\.\./\.\./00 -', '../../00 -'
            Write-Host "  Fixed module link: $($file.Directory.Name)\$($file.Name)"
            $changed = $true
        }
    } elseif ($dirDepth -eq 1) {
        # MOCs: '../../00' is wrong (goes 1 level too far)
        if ($content -match '\.\./\.\./00') {
            $content = $content -replace '\.\./\.\./00 -', '../00 -'
            Write-Host "  Fixed MOC link: $($file.Directory.Name)\$($file.Name)"
            $changed = $true
        }
    }

    if ($changed) {
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($fullPath, $content, $utf8NoBom)
        $fixedCount++
    }
}

Write-Host ""
Write-Host "Done! Fixed $fixedCount files."
