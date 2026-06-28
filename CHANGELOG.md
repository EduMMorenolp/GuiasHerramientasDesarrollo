# Changelog

Todas las mejoras notables del vault.

## 2026-06-27

### Fixed
- Mojibake corregido en los 143 archivos .md (2359 secuencias doble-codificadas reparadas) mediante `scripts/fix-mojibake.ps1`
- Script de validación `scripts/validate.ps1`: corregido bug de variable `$_` colapsada entre ForEach-Object anidados
- BOM UTF-8 eliminado de todos los archivos .md
- Verificación: archivos .md con UTF-8 válido y nombres de archivo correctos en disco

## 2026-06-27

### Added
- Quartz config + GitHub Action para deploy a GitHub Pages (`quartz.config.ts`, `quartz.layout.ts`, `.github/workflows/deploy.yml`)
- Frontmatter con tags en 145 módulos (herramienta, categoría, nivel, keyword)
- 7 MOCs (uno por categoría) conectando herramientas relacionadas
- Glosario cross-tool en 00 - Índice/Glosario.md` (60+ términos)
- Script de validación `scripts/validate.ps1` (verifica wikilinks y estructura)
- Script de frontmatter `scripts/add-frontmatter.ps1`
- Plantilla de prompt para futuras herramientas (`Plantillas/Prompt para Nueva Herramienta.md`)
- Documentación oficial enlazada en los 145 módulos
- README.md con tabla de contenido y badges
- `.gitignore` para archivos del sistema y Obsidian
- Repositorio Git con remote a GitHub

### Changed
- Reorganización completa: 21 herramientas agrupadas en 7 categorías (antes enumeración plana)
- Wikilinks actualizados a 3 niveles de profundidad (`../../../00 - Índice/`)
- Índice General reescrito con estructura jerárquica Categoría → Herramienta
- Estandarización de formato en los 145 módulos (separadores, tablas, cabeceras)
- Consistencia de acentos en títulos y wikilinks

### Fixed
- Nginx modules: wikilinks rotos de "Inicio herramienta" corregidos
- 28 wikilinks rotos reparados durante estandarización
- 27 líneas de documentación duplicadas eliminadas
- 61 módulos con "Objetivo" faltante restaurados

## 2026-06-25

### Added
- Sección 15 - PM2 (6 módulos, extraída de Node.js)
- Sección 16 - pnpm (6 módulos)
- Sección 17 - Bun (7 módulos)
- Sección 18 - Playwright (7 módulos)
- Sección 19 - Nginx (7 módulos)
- Sección 20 - Redis (7 módulos)
- Sección 21 - GitHub Actions (7 módulos)

### Changed
- PM2 removido de Node.js Módulo 7 a sección dedicada
- Índice General actualizado con secciones 15-21

## 2026-06-22

### Added
- Sección 07 - Bases de Datos (10 módulos, multi-engine)
- Sección 09 - Ollama (9 módulos)
- Sección 10 - GitLab (7 módulos)
- Sección 11 - Obsidian (7 módulos)
- Sección 12 - Postman (7 módulos)
- Sección 13 - Biome (6 módulos)
- Sección 14 - Warp (6 módulos)

### Changed
- Bases de Datos restructurado con SQLite, MySQL, PostgreSQL
- Índice General actualizado

## 2026-06-20

### Added
- Creación inicial del vault con secciones 01-08
- OpenCode (9 módulos), Git (6), Docker (6), VS Code (6)
- Terminal (6), Node.js y npm (7), Python (7)
- Índice General, plantilla de guía
- Configuración de Obsidian
