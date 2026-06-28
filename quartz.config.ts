import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "Guías de Herramientas de Desarrollo",
    enableSPA: true,
    enablePopovers: true,
    analytics: null,
    locale: "es-ES",
    baseUrl: "EduMMorenolp.github.io/GuiasHerramientasDesarrollo",
    ignorePatterns: [".obsidian", "scripts", "Plantillas", ".gitignore", "README.md"],
    defaultDateType: "modified",
    theme: {
      cdnCaching: true,
      typography: {
        header: "Inter",
        body: "Inter",
        code: "JetBrains Mono",
      },
      colors: {
        lightMode: {
          light: "#faf8f5",
          lightgray: "#e5e2dd",
          gray: "#918d87",
          darkgray: "#4e4a45",
          dark: "#2b2825",
          secondary: "#5b6f9e",
          tertiary: "#a38d6b",
          highlight: "rgba(143, 159, 169, 0.15)",
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
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
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
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config
