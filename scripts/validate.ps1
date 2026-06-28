param(
    [switch]$Fix
)

$base = "D:\Proyectos\Herramientas"
$issues = @()

# 1. Verify all wikilinks point to existing files
Write-Output "=== Verificando wikilinks ==="
Get-ChildItem -Path $base -Recurse -Filter "*.md" | Where-Object { $_.Name -notmatch 'Plantilla' } | ForEach-Object {
    $content = Get-Content -LiteralPath $_.FullName -Raw
    [regex]::Matches($content, '\[\[([^\]]+?)(?:\|[^\]]+)?\]\]') | ForEach-Object {
        $target = $_.Groups[1].Value
        if ($target -match '\.\./') {
            # Relative path - resolve from file directory
            $resolved = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($_.Directory.FullName, $target))
            if (-not (Test-Path -LiteralPath ($resolved + ".md")) -and -not (Test-Path -LiteralPath $resolved)) {
                $issues += "BROKEN: $($_.Directory.Parent.Name)\$($_.Directory.Name)\$($_.Name) -> $target"
            }
        } elseif ($target -notmatch 'https?://' -and $target -notmatch '^#') {
            # Simple wikilink - should be in same directory or a known file
            $localPath = Join-Path $_.Directory.FullName ($target + ".md")
            if (-not (Test-Path -LiteralPath $localPath)) {
                $issues += "BROKEN: $($_.Directory.Parent.Name)\$($_.Directory.Name)\$($_.Name) -> $target (not found locally)"
            }
        }
    }
}

# 2. Verify all modules have Documentación oficial
Write-Output "=== Verificando documentación oficial ==="
Get-ChildItem -Path $base -Recurse -Filter "*Módulo*" | ForEach-Object {
    $has = Select-String -LiteralPath $_.FullName -Pattern "Documentación oficial" -Quiet
    if (-not $has) {
        $issues += "MISSING DOC: $($_.Directory.Parent.Name)\$($_.Directory.Name)\$($_.Name)"
    }
}

# 3. Verify all overview files exist for each tool
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

Get-ChildItem -Path $base -Directory -Recurse -Depth 1 | Where-Object { $_.Name -match '^\d{2} - ' } | ForEach-Object {
    $toolName = $_.Name -replace '^\d{2} - ', ''
    if ($expectedOverviews.ContainsKey($toolName)) {
        $expectedFile = Join-Path $_.FullName $expectedOverviews[$toolName]
        if (-not (Test-Path -LiteralPath $expectedFile)) {
            $issues += "MISSING OVERVIEW: $($_.Name)\$($expectedOverviews[$toolName])"
        }
    }
}

# Summary
Write-Output "=== Resumen ==="
if ($issues.Count -eq 0) {
    Write-Output "No se encontraron problemas."
} else {
    Write-Output "Problemas encontrados: $($issues.Count)"
    $issues | ForEach-Object { Write-Output "  $_" }
    exit 1
}
