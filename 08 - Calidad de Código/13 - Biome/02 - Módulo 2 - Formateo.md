# Módulo 2: Formateo

**Objetivo**: Aprender y dominar: Formateo.

Biome ofrece formateo de código con un 97% de compatibilidad con Prettier.

## Comando básico

```powershell
npx @biomejs/biome format --write src/
```

## Opciones principales

| Opción | Descripción |
|--------|-------------|
| `indentStyle` | `tab` o `space` |
| `lineWidth` | Longitud máxima de línea (por defecto 80) |
| `quoteStyle` | `single` o `double` |

## Uso en CI

```powershell
npx @biomejs/biome format --error-on-warnings src/
```
---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[08 - Calidad de Código/13 - Biome/01 - Módulo 1 - Instalación\|Módulo 1 - Instalación]] |
| **Siguiente →** | [[03 - Módulo 3 - Linting\|Módulo 3: Linting]] |
| **Inicio herramienta** | [[biome\|Biome]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Biome Docs](https://biomejs.dev) |

---
