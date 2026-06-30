# Módulo 4: Plugins

**Objetivo**: Comprender el sistema de plugins de Quartz: transformadores, filtros y emisores.

---

## Arquitectura de plugins

Quartz procesa el contenido mediante una tubería de transformaciones. Cada plugin opera en una etapa distinta:

```
Markdown → [Transformers] → [Filters] → [Emitters] → HTML
```

### Tipos de plugin

| Tipo | Función | Ejemplos |
|------|---------|----------|
| Transformer | Mapea y transforma contenido | FrontMatter, SyntaxHighlighting, Latex |
| Filter | Filtra contenido (incluye/excluye) | RemoveDrafts |
| Emitter | Genera archivos de salida | ContentPage, TagPage, RSS |

## Configuración de plugins

Los plugins se configuran en `quartz.config.ts` dentro de `plugins`:

```typescript
plugins: {
  transformers: [
    Plugin.FrontMatter(),
    Plugin.CreatedModifiedDate({
      priority: ["frontmatter", "filesystem"],
    }),
    Plugin.SyntaxHighlighting({
      theme: { light: "github-light", dark: "github-dark" },
      keepBackground: true,
    }),
    Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
    Plugin.GitHubFlavoredMarkdown(),
    Plugin.TableOfContents(),
    Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
    Plugin.Latex({ renderEngine: "katex" }),
    Plugin.Description({ maxLength: 200, type: "automatically" }),
  ],
  filters: [
    Plugin.RemoveDrafts(),
  ],
  emitters: [
    Plugin.AliasRedirects(),
    Plugin.ComponentResources({ fontOrigin: "googleFonts" }),
    Plugin.ContentPage(),
    Plugin.FolderPage(),
    Plugin.TagPage(),
    Plugin.ContentIndex({ enableSiteMap: true, enableRSS: true }),
    Plugin.Assets(),
    Plugin.Static(),
    Plugin.NotFoundPage(),
  ],
}
```

## Transformadores principales

### FrontMatter

Parsea el frontmatter YAML de los archivos Markdown. Sin este plugin, Quartz no puede leer metadatos como título, tags o fecha.

### CreatedModifiedDate

Determina la fecha de creación/modificación de cada página. Puede obtenerla del frontmatter, de Git o del sistema de archivos.

```typescript
Plugin.CreatedModifiedDate({
  priority: ["frontmatter", "git", "filesystem"],
})
```

### ObsidianFlavoredMarkdown

El plugin más importante. Habilita la sintaxis de Obsidian:
- Wikilinks `[[nota]]` y `[[nota|display]]`
- Transclusiones `![[nota]]`
- Callouts `> [!note]`
- Comentarios `%%texto%%`
- Alt text en enlaces `[texto](url|alt)`

### CrawlLinks

Controla cómo se resuelven los wikilinks. La opción `markdownLinkResolution` tiene tres modos:

```typescript
Plugin.CrawlLinks({ markdownLinkResolution: "shortest" })
```

- `"shortest"`: busca por nombre de archivo (más corto)
- `"absolute"`: usa la ruta completa desde content/
- `"relative"`: usa rutas relativas

## Filtros

### RemoveDrafts

Excluye páginas marcadas como borrador en el frontmatter:

```yaml
---
draft: true
---
```

## Emisores principales

| Emisor | Función |
|--------|---------|
| ContentPage | Genera páginas HTML para cada archivo Markdown |
| FolderPage | Genera páginas de índice para cada carpeta |
| TagPage | Genera páginas de índice para cada tag |
| ContentIndex | Genera sitemap XML y RSS feed |
| Assets | Copia archivos estáticos (imágenes, PDFs) |
| Static | Copia archivos de la carpeta `static/` |
| NotFoundPage | Genera página 404 personalizada |
| AliasRedirects | Genera redirecciones para aliases de notas |

## Orden de ejecución

Los plugins se ejecutan en el orden en que aparecen en el array. Los transformadores primero, luego los filtros, luego los emisores.

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[04 - Infraestructura/22 - Quartz/03 - Módulo 3 - Layout y Componentes\|Módulo 3 - Layout y Componentes]] |
| **Siguiente →** | [[04 - Infraestructura/22 - Quartz/05 - Módulo 5 - Deploy\|Módulo 5: Deploy]] |
| **Inicio herramienta** | [[04 - Infraestructura/22 - Quartz/quartz\|Quartz]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|← Índice General]] |
| **Documentación oficial** | [Quartz Docs](https://quartz.jzhao.xyz/configuration#plugins) |

---
