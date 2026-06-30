# Scripts

## transform-footers.ps1

**Propósito:** Convierte el footer de todos los módulos del vault (formato plano con `**` bold) al nuevo formato de tabla markdown.

**Qué hace:**
- **Pass 1:** Escanea todos los `.md` y construye un mapa reverso: para cada archivo con `**Siguiente**: [[ruta]]`, registra qué archivo apunta a él.
- **Pass 2:** Para cada archivo con footer plano:
  1. Extrae `Documentación oficial`, `Siguiente`, `Inicio herramienta`, `Inicio principal` mediante regex.
  2. Busca en el mapa reverso para inferir el enlace **← Anterior**.
  3. Reemplaza todo desde el último `---` del archivo con el nuevo footer tabla.
  4. Escapes `|` dentro de wikilinks con `\|`.
  5. Si `Inicio principal` no tiene label personalizado, le agrega `|Índice General`.

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/transform-footers.ps1"
```

**Notas:**
- Requiere UTF-8 sin BOM para lectura (usa `ReadAllBytes` + `Encoding.UTF8.GetString`).
- Detecta CRLF vs LF automáticamente para mantener el line ending del archivo.
- El regex `(?m)^---+\r?$` funciona con CRLF porque `$` no matchea antes de `\r`.
- Los caracteres acentuados en el script se escriben como `$([char]0x00F3)` para evitar corrupción ANSI en PowerShell 5.1 al leer el `.ps1`.

---

## add-missing-footers.ps1

**Propósito:** Añade footer tabla desde cero a módulos que no tenían footer alguno (Hermes Agent y OpenClaw).

**Qué hace:**
1. Define cadena de 7 módulos para Hermes Agent y 6 para OpenClaw con números y nombres.
2. Para cada módulo, calcula el enlace **← Anterior** (módulo anterior en la cadena) y **Siguiente →** (módulo siguiente o `—` si es el último).
3. Llama a `AddFooter` que:
   - Lee el archivo como UTF-8.
   - Construye el footer tabla con columnas Navegación y Enlace.
   - Genera label automático desde el filename (ej. `Módulo 2 - Configuración del Agente`).
   - Escapes pipes internos en wikilinks.
   - Agrega el footer al final del archivo (después de `TrimEnd` + dos newlines).

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/add-missing-footers.ps1"
```

**Notas:**
- Usa `[int]$num -gt 1` para comparación numérica (no string, porque `"07" -gt 1` es falso en PowerShell).
- Los módulos se numeran sin cero leading en el display (ej. `Módulo 1` no `Módulo 01`), pero el filename usa `01 - Módulo 1 - ...`.
- `$([char]0x00CD)` = `Í`, `$([char]0x00F3)` = `ó`, `$([char]0x00ED)` = `í`.
- Hardcodeado para Hermes Agent (`07 - IA/14 - Hermes Agent/`) y OpenClaw (`07 - IA/15 - OpenClaw/`).
- Tiene guard: si el archivo ya tiene footer tabla (`| **← Anterior** |`), lo saltea para evitar duplicados.
- El número de módulo en el filename usa `$([int]$num)` para evitar formato `Módulo 01` (leading zero) en el nombre, solo en el número de orden (`01 - Módulo 1 - ...`).

---

## fix-module-links.ps1

**Propósito:** Convierte wikilinks simples como `[[Módulo 1 - Instalación y Fundamentos]]` en wikilinks con ruta relativa completa dentro del mismo directorio de herramienta.

**Qué hace:**
1. Escanea todos los `.md` y construye un mapa por directorio: número de módulo → nombre de archivo.
2. En cada archivo, busca wikilinks que empiecen con `[[Módulo N` y los reemplaza por `[[ruta/BaseName|Módulo N ...]]`.

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/fix-module-links.ps1"
```

**Notas:**
- Lee con `ReadAllText` + `Encoding.UTF8`, escribe con `UTF8Encoding` sin BOM.

---

## fix-mojibake.ps1

**Propósito:** Repara caracteres acentuados corruptos por doble codificación UTF-8 (mojibake), como `Ã¡` → `á`, `Ã©` → `é`, y también elimina BOM.

**Qué hace:**
1. Escanea todos los `.md` a nivel de bytes.
2. Busca secuencias de 4 bytes que corresponden a doble codificación (ej. `C3 83 C2 A1` = `á` corrupto).
3. Las reemplaza por los 2 bytes correctos.
4. Elimina BOM (`EF BB BF`) si está presente.

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/fix-mojibake.ps1"
```

**Notas:**
- Opera a nivel de bytes con `ReadAllBytes`/`WriteAllBytes`, no toca encoding.
- Cubre vocales acentuadas, `ñ`, `ü`, `¿`, `¡` y non-breaking space.

---

## fix-wikilinks.ps1

**Propósito:** Corrige dos tipos de wikilinks rotos: barras invertidas antes de `]]` y profundidad de ruta incorrecta en enlaces al índice.

**Qué hace:**
1. Elimina `\` antes de `]]` (ej. `fichero\]\]` → `fichero]]`).
2. Corrige `../../../00 -` a `../../00 -` en módulos (depth 2).
3. Corrige `../../00 -` a `../00 -` en MOCs (depth 1).

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/fix-wikilinks.ps1"
```

**Notas:**
- Lee con `ReadAllText` + `UTF8`, escribe con `UTF8Encoding` sin BOM.
- Calcula `dirDepth` automáticamente desde la ruta relativa al vault root.

---

## add-frontmatter.ps1

**Propósito:** Agrega frontmatter YAML (`title`, `tags`, `date`) a archivos `*Módulo*` que no tengan uno.

**Qué hace:**
1. Para cada módulo sin frontmatter, extrae el título del primer `# Heading`.
2. Asigna tags de herramienta, categoría y keyword matching.
3. Asigna nivel de dificultad según número de módulo (1-2 fundamentos, 3-4 intermedio, 5+ avanzado).
4. Agrega `---\ntitle: ...\ntags: [...]\ndate: 2026-06-27\n---` al inicio.

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/add-frontmatter.ps1"
```

**Notas:**
- Usa `Set-Content -Encoding UTF8` (UTF-8 con BOM en PS 5.1).
- Tags son _hardcoded_ para las herramientas existentes en el vault (`toolTags`, `categoryTags`, `keywordTags`).

---

## validate.ps1

**Propósito:** Valida la integridad del vault: wikilinks rotos, módulos sin documentación oficial, y overviews faltantes.

**Qué hace:**
- Busca wikilinks relativos (`../`) que apunten a archivos inexistentes.
- Verifica que cada `*Módulo*` tenga `Documentación oficial` en su contenido.
- Verifica que cada directorio de herramienta tenga su archivo overview esperado (ej. `git.md`, `docker.md`).
- Soporta flag `-Fix` (declarado, actualmente no implementado).

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/validate.ps1"
powershell -ExecutionPolicy Bypass -File "scripts/validate.ps1" -Fix
```

**Notas:**
- Salta archivos que contengan `Plantilla` en el nombre para validación de wikilinks.
- Sale con `exit 1` si encuentra problemas.

---

## debug.ps1

**Propósito:** Script de diagnóstico para inspeccionar caracteres y estructura al final de un archivo markdown.

**Qué hace:**
- Lee un archivo específico (Redis Módulo 1) y muestra los últimos 300 caracteres con escapes visibles para `\r`, `\n`.
- Cuenta y muestra las posiciones de los `---` (horizontal rules).

**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/debug.ps1"
```

**Notas:**
- Hardcodeado para `05 - Bases de Datos/20 - Redis/01 - Módulo 1 - Instalación y Fundamentos.md`.
- Útil para debugging de encoding y estructura de footer.

---

## Consideraciones generales

### Encoding
PowerShell 5.1 lee `.ps1` sin BOM como ANSI (Windows-1252), corrompiendo acentos. Todos los `.ps1` deben guardarse en **UTF-8 con BOM**. Si se editan y guardan sin BOM, los caracteres `$([char]0x...)` se dañan.

Para verificar:
```powershell
# Debe mostrar 3 (UTF-8 with BOM)
(Get-Content -Path "scripts/transform-footers.ps1" -Encoding Byte)[0..2]
```

Para convertir de vuelta:
```powershell
$path = "scripts/transform-footers.ps1"
$bytes = [System.IO.File]::ReadAllBytes($path)
# Si empieza con 0xEF 0xBB 0xBF, ya tiene BOM
# Si no, agregarlo: $bytes = [byte[]]@(0xEF,0xBB,0xBF) + $bytes
[System.IO.File]::WriteAllBytes($path, $bytes)
```

### Line endings
Los scripts que modifican contenido preservan CRLF o LF por archivo, no por proyecto.
Los scripts de validación y diagnosis son indiferentes al line ending.
