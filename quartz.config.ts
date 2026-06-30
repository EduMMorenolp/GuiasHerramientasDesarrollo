// Configuración general del sitio Quartz
import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "Guías de Herramientas de Desarrollo",   // Título del sitio (pestaña + RSS)
    enableSPA: true,                                     // Navegación sin recarga de página
    enablePopovers: true,                                // Vista previa al hover sobre enlaces
    analytics: null,                                     // Proveedor de analíticas (null = desactivado)
    locale: "es-ES",                                     // Idioma para fechas y UI
    baseUrl: "EduMMorenolp.github.io/GuiasHerramientasDesarrollo", // URL base para sitemap y RSS
    ignorePatterns: [                                     // Archivos/carpetas excluidos del build
      ".obsidian", "scripts", "Plantillas", ".gitignore",
      "README.md", "CHANGELOG.md", "standardize.ps1"
    ],
    defaultDateType: "modified",                         // Fecha por defecto: created / modified / published
    theme: {
      cdnCaching: true,                                  // Fuentes desde CDN de Google (más rápido)
      typography: {
        header: "Inter",
        body: "Inter",
        code: "JetBrains Mono",
      },
      colors: {
        lightMode: {
          light: "#faf8f5",         // Fondo de página
          lightgray: "#e5e2dd",     // Bordes
          gray: "#918d87",          // Enlaces del grafo
          darkgray: "#4e4a45",      // Texto del cuerpo
          dark: "#2b2825",          // Encabezados e iconos
          secondary: "#5b6f9e",     // Color de enlaces
          tertiary: "#a38d6b",      // Hover y nodos visitados en grafo
          highlight: "rgba(143, 159, 169, 0.15)", // Fondo de enlaces internos
        },
        darkMode: {
          light: "#1a1c20",
          lightgray: "#2e3036",
          gray: "#7a7f8a",
          darkgray: "#c4c8d4",
          dark: "#e8ecf4",
          secondary: "#7b95c7",
          tertiary: "#c4a87c",
          highlight: "rgba(123, 149, 199, 0.15)",
        },
      },
    },
  },
  plugins: {
    // TRANSFORMERS: modifican el contenido Markdown antes de generar HTML
    transformers: [
      Plugin.FrontMatter(),              // Parsea el frontmatter YAML de cada nota
      Plugin.CreatedModifiedDate({       // Determina fecha de creación/modificación
        priority: ["frontmatter", "filesystem"], // 1° frontmatter, 2° filesystem
      }),
      Plugin.SyntaxHighlighting({        // Resaltado de sintaxis en bloques de código
        theme: { light: "github-light", dark: "github-dark" },
        keepBackground: true,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }), // Wikilinks, transclusiones, callouts
      Plugin.GitHubFlavoredMarkdown(),   // Tablas, tachado, URLs automáticas
      Plugin.TableOfContents(),          // Genera la tabla de contenidos de cada página
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }), // Resuelve [[wikilinks]] a rutas reales
      Plugin.Latex({ renderEngine: "katex" }), // Renderiza LaTeX con KaTeX
      Plugin.Description({ maxLength: 200, type: "both" }), // Descripción para SEO (frontmatter + auto)
    ],
    // FILTERS: incluyen/excluyen páginas del build
    filters: [
      Plugin.RemoveDrafts(),             // Excluye notas con draft: true en frontmatter
    ],
    // EMITTERS: generan los archivos de salida (HTML, RSS, etc.)
    emitters: [
      Plugin.AliasRedirects(),           // Redirecciones para aliases de notas
      Plugin.ComponentResources({ fontOrigin: "googleFonts" }), // Carga fuentes y recursos CSS/JS
      Plugin.ContentPage(),              // Genera página HTML por cada archivo .md
      Plugin.FolderPage(),               // Genera índice para cada carpeta
      Plugin.TagPage(),                  // Genera índice para cada tag
      Plugin.ContentIndex({              // Sitemap XML + RSS feed
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),                   // Copia imágenes, PDFs y otros assets
      Plugin.Static(),                   // Copia archivos de la carpeta content/static/
      Plugin.NotFoundPage(),             // Página 404 personalizada
    ],
  },
}

export default config
