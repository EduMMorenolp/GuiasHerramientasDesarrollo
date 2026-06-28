$base = "D:\Proyectos\Herramientas"

$categoryTags = @{
    "01 - Editores y Terminal" = "categoria/editores-terminal"
    "02 - Lenguajes y Runtimes" = "categoria/lenguajes-runtimes"
    "03 - Control de Versiones y CI-CD" = "categoria/control-versiones-cicd"
    "04 - Infraestructura" = "categoria/infraestructura"
    "05 - Bases de Datos" = "categoria/bases-datos"
    "06 - APIs y Testing" = "categoria/apis-testing"
    "07 - IA y Tooling" = "categoria/ia-tooling"
}

$toolTags = @{
    "01 - OpenCode" = @("opencode", "ia", "asistente")
    "02 - Git" = @("git", "control-versiones")
    "03 - Docker" = @("docker", "contenedores")
    "04 - VS Code" = @("vscode", "editor")
    "05 - Terminal y PowerShell" = @("terminal", "powershell", "shell")
    "06 - Node.js y npm" = @("nodejs", "npm", "javascript", "runtime")
    "07 - Bases de Datos" = @("base-datos", "sql", "postgresql", "mysql", "sqlite")
    "08 - Python" = @("python", "lenguaje")
    "09 - Ollama" = @("ollama", "ia-local", "llm")
    "10 - GitLab" = @("gitlab", "cicd", "devops")
    "11 - Obsidian" = @("obsidian", "conocimiento")
    "12 - Postman" = @("postman", "api", "testing")
    "13 - Biome" = @("biome", "formateo", "linting")
    "14 - Warp" = @("warp", "terminal")
    "15 - PM2" = @("pm2", "process-manager", "nodejs")
    "16 - pnpm" = @("pnpm", "package-manager")
    "17 - Bun" = @("bun", "runtime", "javascript")
    "18 - Playwright" = @("playwright", "testing", "e2e", "browser")
    "19 - Nginx" = @("nginx", "servidor", "proxy")
    "20 - Redis" = @("redis", "cache", "base-datos")
    "21 - GitHub Actions" = @("github-actions", "cicd", "devops")
}

$keywordTags = @{
    "instalaci" = "instalacion"
    "fundamento" = "fundamentos"
    "configuraci" = "configuracion"
    "seguridad" = "seguridad"
    "avanzado" = "temas-avanzados"
    "testing" = "testing"
    "despliegue" = "deploy"
    "rendimiento" = "rendimiento"
    "automatizaci" = "automatizacion"
    "monitoreo" = "monitoreo"
    "logs" = "logs"
    "api" = "api"
    "docker" = "docker"
    "ci-cd" = "cicd"
    "cache" = "cache"
    "cluster" = "cluster"
    "proxy" = "proxy"
    "ssl" = "ssl"
    "persistenci" = "persistencia"
    "pub-sub" = "pub-sub"
    "colas" = "colas"
}

$count = 0
Get-ChildItem -Path $base -Recurse -Filter "*Módulo*" | ForEach-Object {
    $content = Get-Content -LiteralPath $_.FullName -Raw
    
    if ($content.StartsWith("---")) {
        return
    }
    
    $lines = $content -split "`n"
    $firstLine = $lines[0].Trim()
    $title = ""
    if ($firstLine -match "^#+\s+(.+)") {
        $title = $matches[1].Trim()
    }
    
    $modNum = 1
    if ($_.Name -match "(\d{2}) - Módulo") {
        $modNum = [int]$matches[1]
    }
    
    $tags = @()
    
    $toolDir = $_.Directory.Name
    if ($toolTags.ContainsKey($toolDir)) {
        $tags += $toolTags[$toolDir]
    }
    
    $catDir = $_.Directory.Parent.Name
    if ($categoryTags.ContainsKey($catDir)) {
        $tags += $categoryTags[$catDir]
    }
    
    if ($modNum -le 2) { $tags += "nivel/fundamentos" }
    elseif ($modNum -le 4) { $tags += "nivel/intermedio" }
    else { $tags += "nivel/avanzado" }
    
    if ($title) {
        $titleLower = $title.ToLower()
        foreach ($kw in $keywordTags.Keys) {
            if ($titleLower -match $kw) {
                $tags += $keywordTags[$kw]
            }
        }
    }
    
    $tags = $tags | Sort-Object -Unique
    
    $fm = "---`ntitle: `"$title`"`ntags: [$($tags -join ', ')]`ndate: 2026-06-27`n---"
    
    $content = $fm + "`n`n" + $content
    Set-Content -LiteralPath $_.FullName -Value $content -Encoding UTF8
    $count++
}

Write-Output "Módulos con frontmatter agregado: $count"
