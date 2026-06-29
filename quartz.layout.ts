import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({
    links: {
      GitHub: "https://github.com/EduMMorenolp/GuiasHerramientasDesarrollo",
    },
  }),
}

const left: Component.Component[] = [
  Component.PageTitle(),
  Component.MobileOnly(Component.Spacer()),
  Component.Search(),
  Component.Darkmode(),
  Component.DesktopOnly(Component.Explorer({
    folderDefaultState: "collapsed",
    folderClickBehavior: "link",
    useSavedState: true,
  })),
  Component.DesktopOnly(Component.TableOfContents()),
]

const right: Component.Component[] = [
  Component.RecentNotes({ limit: 5, showTags: false }),
  Component.Backlinks(),
  Component.Graph({
    localGraph: {
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
    globalGraph: {
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
  Component.DesktopOnly(Component.ReaderMode()),
]

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
