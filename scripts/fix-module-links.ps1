$ErrorActionPreference = "Stop"
$base = "D:\Proyectos\Herramientas"

# Get all markdown files
$mdFiles = Get-ChildItem -Path $base -Recurse -Filter "*.md" | Where-Object {
    $_.FullName -notmatch "\\.git" -and $_.FullName -notmatch "node_modules" -and $_.FullName -notmatch "Plantillas"
}

# Build lookup: for each directory, map module number -> filename
$dirModuleMap = @{}
foreach ($file in $mdFiles) {
    if ($file.BaseName -match '^(\d+)\s*-\s*Módulo\s+\d+\s*-\s*(.+)') {
        $dir = $file.Directory.FullName
        $num = $matches[1]
        if (-not $dirModuleMap.ContainsKey($dir)) {
            $dirModuleMap[$dir] = @{}
        }
        $dirModuleMap[$dir][$num] = @{
            FileName = $file.Name
            BaseName = $file.BaseName
        }
    }
}

$fixedCount = 0

foreach ($file in $mdFiles) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $original = $content
    $changed = $false
    $dir = $file.Directory.FullName

    if (-not $dirModuleMap.ContainsKey($dir)) {
        continue
    }

    # Find all bare wikilinks that reference modules
    $content = [regex]::Replace($content, '\[\[Módulo (\d+)([^\]]*)\]\]', {
        param($match)
        $num = $match.Groups[1].Value
        $rest = $match.Groups[2].Value.Trim()
        $paddedNum = $num.PadLeft(2, '0')
        $fullLink = "Módulo $num$rest"

        if ($dirModuleMap[$dir].ContainsKey($paddedNum)) {
            $info = $dirModuleMap[$dir][$paddedNum]
            $targetDir = $dir.Substring($base.Length).TrimStart('\') -replace '\\', '/'
            $targetFile = "$targetDir/$($info.BaseName)"

            return "[[$targetFile|$fullLink]]"
        }
        return $match.Value
    })

    if ($content -ne $original) {
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
        $fixedCount++
        Write-Host "Fixed: $($file.FullName.Substring($base.Length).TrimStart('\'))"
    }
}

Write-Host ""
Write-Host "Done! Fixed $fixedCount files."
