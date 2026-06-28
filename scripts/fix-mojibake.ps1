$ErrorActionPreference = "Stop"

$mdFiles = Get-ChildItem -Recurse -Filter "*.md" -LiteralPath "D:\Proyectos\Herramientas" | Where-Object { $_.FullName -notmatch "\\.git" -and $_.FullName -notmatch "node_modules" }
Write-Host "Found $($mdFiles.Count) .md files"

# Build replacement map: corrupted 4-byte sequence → correct 2-byte sequence
# All C3 83 C2 XX → C3 XX (accents from original C3-prefixed chars)
# All C3 82 C2 XX → C2 XX (accents from original C2-prefixed chars like ¿ ¡)
$replacements = @{}
$replacements["C383C2A1"] = [byte[]]@(0xC3, 0xA1)  # á
$replacements["C383C2A9"] = [byte[]]@(0xC3, 0xA9)  # é
$replacements["C383C2AD"] = [byte[]]@(0xC3, 0xAD)  # í
$replacements["C383C2B3"] = [byte[]]@(0xC3, 0xB3)  # ó
$replacements["C383C2BA"] = [byte[]]@(0xC3, 0xBA)  # ú
$replacements["C383C2B1"] = [byte[]]@(0xC3, 0xB1)  # ñ
$replacements["C383C2BC"] = [byte[]]@(0xC3, 0xBC)  # ü
$replacements["C383C281"] = [byte[]]@(0xC3, 0x81)  # Á
$replacements["C383C289"] = [byte[]]@(0xC3, 0x89)  # É
$replacements["C383C28D"] = [byte[]]@(0xC3, 0x8D)  # Í
$replacements["C383C293"] = [byte[]]@(0xC3, 0x93)  # Ó
$replacements["C383C29A"] = [byte[]]@(0xC3, 0x9A)  # Ú
$replacements["C383C291"] = [byte[]]@(0xC3, 0x91)  # Ñ
$replacements["C382C2BF"] = [byte[]]@(0xC2, 0xBF)  # ¿
$replacements["C382C2A1"] = [byte[]]@(0xC2, 0xA1)  # ¡
$replacements["C382C2A0"] = [byte[]]@(0xC2, 0xA0)  # non-breaking space

$fixedCount = 0
$totalCorrupted = 0

foreach ($file in $mdFiles) {
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $originalLength = $bytes.Length
    $corrupted = $false

    # Check for corrupted sequences
    $i = 0
    while ($i -le $bytes.Length - 4) {
        $key = "{0:X2}{1:X2}{2:X2}{3:X2}" -f $bytes[$i], $bytes[$i+1], $bytes[$i+2], $bytes[$i+3]
        if ($replacements.ContainsKey($key)) {
            $corrupted = $true
            $replacement = $replacements[$key]
            # Rebuild byte array with fix
            $newBytes = [byte[]]::new($bytes.Length - 2)
            [Array]::Copy($bytes, 0, $newBytes, 0, $i)
            $newBytes[$i] = $replacement[0]
            $newBytes[$i+1] = $replacement[1]
            [Array]::Copy($bytes, $i+4, $newBytes, $i+2, $bytes.Length - $i - 4)
            $bytes = $newBytes
            $totalCorrupted++
            $i += 2  # Skip past the fixed bytes
        } else {
            $i++
        }
    }

    # Strip BOM if present
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        $bytes = $bytes[3..($bytes.Length-1)]
        $corrupted = $true
    }

    if ($corrupted) {
        [System.IO.File]::WriteAllBytes($file.FullName, $bytes)
        $fixedCount++
        Write-Host "  Fixed: $($file.Name) ($originalLength → $($bytes.Length) bytes)"
    }
}

Write-Host "`nDone! Fixed $fixedCount files, $totalCorrupted total corruptions."
