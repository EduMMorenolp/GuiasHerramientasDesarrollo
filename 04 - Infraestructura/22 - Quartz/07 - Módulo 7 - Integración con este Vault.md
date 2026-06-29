# Módulo 7: Integración con este Vault

**Objetivo**: Comprender cómo este vault utiliza Quartz para construir y desplegar el sitio.

---

## Arquitectura del vault

Este repositorio (`GuiasHerramientasDesarrollo`) es un vault de Obsidian que también funciona como la fuente de contenido para un sitio Quartz. La estructura es:

```
GuiasHerramientasDesarrollo/
├── .github/
│   └── workflows/
│       └── deploy.yml       # CI/CD Pipeline
├── 00 - Índice/              # Páginas de índice
├── 01 - Editores y Terminal/ # Categorías de herramientas
├── ...                       # Más categorías
├── quartz.config.ts          # Configuración de Quartz
├── quartz.layout.ts          # Layout de Quartz
└── index.md                  # Página de inicio
```

## Pipeline de CI/CD

El workflow `deploy.yml` construye el sitio en cada push a `master`:

```yaml
- name: Clone Quartz
  run: |
    git clone -b v4.5.2 https://github.com/jackyzha0/quartz.git --depth 1 _quartz
    rm -rf _quartz/.git
```

En lugar de incluir Quartz como submódulo o dependencia, el workflow:
1. Clona Quartz v4.5.2 en una carpeta temporal `_quartz`
2. Elimina el `.git` del clon
3. Copia el vault como contenido

```yaml
- name: Copy vault content to Quartz
  run: |
    mkdir -p _quartz/content
    rsync -av --delete \
      --exclude='.git' \
      --exclude='.obsidian' \
      --exclude='.github' \
      --exclude='scripts' \
      --exclude='Plantillas' \
      --exclude='.gitignore' \
      --exclude='README.md' \
      --exclude='quartz.config.ts' \
      --exclude='quartz.layout.ts' \
      ./ _quartz/content/
```

Los archivos excluidos:
- `.git` y `.github/` — control de versiones y CI
- `.obsidian` — configuración local de Obsidian
- `scripts/` y `Plantillas/` — contenido no destinado al sitio
- `quartz.config.ts` y `quartz.layout.ts` — se copian aparte

```yaml
- name: Copy Quartz config
  run: |
    cp quartz.config.ts _quartz/
    cp quartz.layout.ts _quartz/
```

Luego se instalan dependencias y se construye:

```yaml
- name: Install dependencies
  run: cd _quartz && npm install

- name: Build Quartz
  run: cd _quartz && npx quartz build
```

El resultado se despliega a GitHub Pages.

## Configuración del vault

### quartz.config.ts

```typescript
configuration: {
  pageTitle: "Guías de Herramientas de Desarrollo",
  enableSPA: true,
  enablePopovers: true,
  analytics: null,
  locale: "es-ES",
  baseUrl: "EduMMorenolp.github.io/GuiasHerramientasDesarrollo",
  ignorePatterns: [".obsidian", "scripts", "Plantillas", ".gitignore", "README.md"],
  defaultDateType: "modified",
  theme: { /* Inter, colores personalizados */ },
},
plugins: {
  transformers: [
    Plugin.FrontMatter(),
    Plugin.CreatedModifiedDate({ priority: ["frontmatter", "filesystem"] }),
    Plugin.SyntaxHighlighting({ theme: { light: "github-light", dark: "github-dark" } }),
    Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
    Plugin.GitHubFlavoredMarkdown(),
    Plugin.TableOfContents(),
    Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
    Plugin.Latex({ renderEngine: "katex" }),
    Plugin.Description({ maxLength: 200, type: "automatically" }),
  ],
  filters: [Plugin.RemoveDrafts()],
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

### quartz.layout.ts

El layout usa:
- **Left sidebar**: PageTitle, Search, Darkmode, TableOfContents
- **Right sidebar**: RecentNotes, Backlinks, Graph (local y global)
- **beforeBody**: Breadcrumbs, ArticleTitle, ContentMeta, TagList
- **Footer**: Enlace al repositorio de GitHub

## Manejo de wikilinks

La opción `markdownLinkResolution: "shortest"` en `CrawlLinks` resuelve wikilinks buscando el nombre del archivo en todo el directorio `content/`. Esto permite usar `[[nota]]` sin ruta completa, pero puede causar conflictos si dos archivos tienen el mismo nombre en distintas carpetas.

Para evitarlo, las landing pages y módulos usan rutas completas como:

```
[[01 - Editores y Terminal/11 - Obsidian/01 - Módulo 1 - Fundamentos e Instalación|Módulo 1]]
```

## Índice general y MOCs

El índice principal (`00 - Índice/Índice General.md`) y los MOCs por categoría organizan el contenido en el explorador de Quartz, permitiendo navegar por carpetas desde `FolderPage`.

---

| Concepto | Descripción |
|----------|-------------|
| CI Pipeline | GitHub Actions que clona, construye y despliega |
| ignorePatterns | Archivos excluidos del build (.obsidian, scripts) |
| CrawlLinks | Resolución de wikilinks con `shortest` |
| FolderPage | Páginas de índice de carpeta generadas automáticamente |

**Documentación oficial**: https://quartz.jzhao.xyz
**Inicio herramienta**: [[04 - Infraestructura/22 - Quartz/quartz|Quartz]]
**Inicio principal**: [[../../00 - Índice/Índice General|← Índice General]]
