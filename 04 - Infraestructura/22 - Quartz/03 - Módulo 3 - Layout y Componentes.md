# Módulo 3: Layout y Componentes

**Objetivo**: Configurar la estructura visual del sitio mediante `quartz.layout.ts` y sus componentes.

---

## Archivo de layout

`quartz.layout.ts` define cómo se organizan los componentes en cada página. Exporta la configuración de layout compartido y los layouts por tipo de página.

```typescript
import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({ links: { GitHub: "..." } }),
}
```

## Secciones de la página

Cada página tiene las siguientes secciones:

| Sección | Ubicación | Tipo |
|---------|-----------|------|
| `head` | `<head>` HTML | Componente único |
| `header` | Barra superior horizontal | Array de componentes |
| `beforeBody` | Antes del contenido | Array (vertical) |
| `pageBody` | El contenido mismo | Componente único |
| `afterBody` | Después del contenido | Array (vertical) |
| `left` | Barra lateral izquierda | Array (vertical en desktop) |
| `right` | Barra lateral derecha | Array (vertical en desktop) |
| `footer` | Pie de página | Componente único |

## Componentes principales

### head, header y navegación

```typescript
const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({
    links: {
      GitHub: "https://github.com/usuario/repo",
    },
  }),
}
```

### Sidebar izquierdo

```typescript
const left: Component.Component[] = [
  Component.PageTitle(),
  Component.MobileOnly(Component.Spacer()),
  Component.Search(),
  Component.Darkmode(),
  Component.DesktopOnly(Component.TableOfContents()),
  Component.DesktopOnly(Component.Explorer()),
]
```

### Sidebar derecho

```typescript
const right: Component.Component[] = [
  Component.RecentNotes({ limit: 5, showTags: false }),
  Component.Backlinks(),
  Component.Graph({
    localGraph: { drag: true, zoom: true, depth: 2, scale: 0.8 },
    globalGraph: { drag: true, zoom: true, depth: -1, scale: 0.7 },
  }),
  Component.DesktopOnly(Component.TagList()),
]
```

### beforeBody (sobre el contenido)

```typescript
const beforeBody: Component.Component[] = [
  Component.Breadcrumbs(),
  Component.ArticleTitle(),
  Component.ContentMeta(),
  Component.TagList(),
]
```

## Layout por tipo de página

Se pueden definir layouts distintos para cada tipo de página:

```typescript
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta(), Component.TagList()],
  left,
  right,
}

export const defaultListPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta(), Component.TagList()],
  left,
  right,
}
```

## Componentes disponibles

| Componente | Descripción |
|------------|-------------|
| `PageTitle` | Título del sitio en la barra lateral |
| `Search` | Búsqueda full-text |
| `Darkmode` | Alternador de tema claro/oscuro |
| `Explorer` | Explorador de archivos tipo árbol |
| `Graph` | Grafo interactivo de conexiones |
| `Backlinks` | Enlaces entrantes a la página actual |
| `TableOfContents` | Tabla de contenidos de la página |
| `Breadcrumbs` | Migas de pan de navegación |
| `ArticleTitle` | Título del artículo actual |
| `ContentMeta` | Metadatos (fecha, etiquetas) |
| `TagList` | Lista de etiquetas |
| `RecentNotes` | Notas modificadas recientemente |
| `Footer` | Pie de página con enlaces |
| `MobileOnly` | Envoltorio para mostrar solo en móvil |
| `DesktopOnly` | Envoltorio para mostrar solo en desktop |
| `Spacer` | Espaciador flexible |
| `ReaderMode` | Botón de modo lectura |

---

| Concepto | Descripción |
|----------|-------------|
| SharedLayout | Elementos compartidos (head, header, footer) |
| PageLayout | Layout específico por tipo de página |
| Component | Elemento UI registrado en Quartz |
| beforeBody | Sección sobre el contenido (título, tags, breadcrumbs) |

**Documentación oficial**: https://quartz.jzhao.xyz/layout
**Siguiente**: [[04 - Infraestructura/22 - Quartz/04 - Módulo 4 - Plugins|Módulo 4: Plugins]]
**Inicio herramienta**: [[04 - Infraestructura/22 - Quartz/quartz|Quartz]]
**Inicio principal**: [[../../00 - Índice/Índice General|← Índice General]]
