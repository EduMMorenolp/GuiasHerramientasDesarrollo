// Configuración del layout visual del sitio Quartz
// Controla qué componentes aparecen y dónde (sidebar, cabecera, pie, etc.)

import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// COMPONENTES COMPARTIDOS: aparecen en todas las páginas
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),              // Metadatos del <head> HTML (title, scripts, estilos)
  header: [],                          // Barra superior horizontal (vacía por defecto)
  afterBody: [],                       // Contenido después del cuerpo
  footer: Component.Footer({
    links: {
      GitHub: "https://github.com/EduMMorenolp/GuiasHerramientasDesarrollo",
    },
  }),
}

// SIDEBAR IZQUIERDO: visible en desktop, se pliega en móvil
const left: Component.Component[] = [
  Component.PageTitle(),               // Título del sitio ("Guías de Herramientas...")
  Component.MobileOnly(Component.Spacer()), // Espaciador en vista móvil
  Component.Search(),                  // Búsqueda full-text
  Component.Darkmode(),                // Alternador tema claro/oscuro
  Component.DesktopOnly(Component.TableOfContents()), // Índice de la página actual
]

// SIDEBAR DERECHO: visible en desktop, debajo del contenido en móvil/tablet
const right: Component.Component[] = [
  Component.Graph({
    localGraph: {                      // Grafo de la página actual y sus vecinos (2 niveles)
      drag: true,
      zoom: true,
      depth: 2,
      scale: 0.8,
      repelForce: 0.3,
      centerForce: 0.2,
      linkDistance: 80,
      fontSize: 0.7,
      opacityScale: 1.2,
      showTags: true,
      removeTags: [],
    },
    globalGraph: {                     // Grafo de todo el sitio (profundidad ilimitada)
      drag: true,
      zoom: true,
      depth: -1,
      scale: 0.7,
      repelForce: 0.2,
      centerForce: 0.1,
      linkDistance: 100,
      fontSize: 0.6,
      opacityScale: 1.5,
      showTags: true,
      removeTags: [],
    },
  }),
  Component.DesktopOnly(Component.ReaderMode()), // Botón modo lectura sin distracciones
  Component.RecentNotes({ limit: 2, showTags: false }), // Últimas 2 notas modificadas
  Component.Backlinks(),               // Enlaces que apuntan a la página actual
]

// LAYOUT PARA PÁGINAS DE CONTENIDO (notas individuales)
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [                        // Sección sobre el título del artículo
    Component.Breadcrumbs(),           // Migas de pan (ej: 04 > 22-Quartz > Módulo 1)
    Component.ArticleTitle(),          // Título del artículo
    Component.ContentMeta(),           // Metadatos (fecha, tags, etc.)
    Component.TagList(),               // Lista de tags como enlaces
  ],
  left,
  right,
}

// LAYOUT PARA PÁGINAS DE LISTADO (índices de carpeta, tag, etc.)
export const defaultListPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta(), Component.TagList()],
  left,
  right,
}
