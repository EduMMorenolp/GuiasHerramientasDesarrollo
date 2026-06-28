param([switch]$Fix)

$base = "D:\Proyectos\Herramientas"
$issues = @()

Write-Output "=== Verificando wikilinks ==="
Get-ChildItem -Path $base -Recurse -Filter "*.md" | Where-Object { $_.Name -notmatch 'Plantilla' } | ForEach-Object {
    $file = $_
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    [regex]::Matches($content, '\[\[([^\]]+?)(?:\|[^\]]+)?\]\]') | ForEach-Object {
        $match = $_
        $target = $match.Groups[1].Value
        if ($target -match '\.\./') {
            $resolved = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($file.Directory.FullName, $target))
            if (-not (Test-Path -LiteralPath ($resolved + ".md")) -and -not (Test-Path -LiteralPath $resolved)) {
                $issues += "BROKEN: $($file.Directory.Name)\$($file.Name) -> $target"
            }
        } elseif ($target -notmatch 'https?://' -and $target -notmatch '^#') {
            $localPath = Join-Path $file.Directory.FullName ($target + ".md")
            if (-not (Test-Path -LiteralPath $localPath)) {
                $issues += "BROKEN: $($file.Directory.Name)\$($file.Name) -> $target"
            }
        }
    }
}

Write-Output "=== Verificando documentacion oficial ==="
Get-ChildItem -Path $base -Recurse -Filter "*Modulo*" | ForEach-Object {
    $has = Select-String -LiteralPath $_.FullName -Pattern "Documentacion oficial" -Quiet
    if (-not $has) {
        $issues += "MISSING DOC: $($_.Directory.Name)\$($_.Name)"
    }
}

Write-Output "=== Verificando overviews ==="
$expectedOverviews = @{
    "OpenCode" = "opencode.md"
    "Git" = "git.md"
    "Docker" = "docker.md"
    "VS Code" = "vscode.md"
    "Terminal y PowerShell" = "terminal.md"
    "Node.js y npm" = "nodejs.md"
    "Bases de Datos" = "bd.md"
    "Python" = "python.md"
    "Ollama" = "ollama.md"
    "GitLab" = "gitlab.md"
    "Obsidian" = "obsidian.md"
    "Postman" = "postman.md"
    "Biome" = "biome.md"
    "Warp" = "warp.md"
    "PM2" = "pm2.md"
    "pnpm" = "pnpm.md"
    "Bun" = "bun.md"
    "Playwright" = "playwright.md"
    "Nginx" = "nginx.md"
    "Redis" = "redis.md"
    "GitHub Actions" = "github-actions.md"
}

Get-ChildItem -Path $base -Directory -Recurse -Depth 2 | Where-Object { $_.Name -match '^\d{2} - ' -and $_.Parent.Name -match '^\d{2} - ' } | ForEach-Object {
    $toolName = $_.Name -replace '^\d{2} - ', ''
    if ($expectedOverviews.ContainsKey($toolName)) {
        $expectedFile = Join-Path $_.FullName $expectedOverviews[$toolName]
        if (-not (Test-Path -LiteralPath $expectedFile)) {
            $issues += "MISSING OVERVIEW: $($_.Name)\$($expectedOverviews[$toolName])"
        }
    }
}

Write-Output "=== Resumen ==="
if ($issues.Count -eq 0) {
    Write-Output "No se encontraron problemas."
} else {
    Write-Output "Problemas encontrados: $($issues.Count)"
    $issues | ForEach-Object { Write-Output "  $_" }
    exit 1
}
