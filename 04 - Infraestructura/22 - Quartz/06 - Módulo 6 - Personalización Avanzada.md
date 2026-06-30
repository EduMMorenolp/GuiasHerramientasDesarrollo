# Módulo 6: Personalización Avanzada

**Objetivo**: Crear componentes personalizados, modificar estilos y extender Quartz con plugins de la comunidad.

---

## CSS personalizado

Quartz usa Sass para los estilos. Los estilos personalizados van en `quartz/styles/custom.scss`:

```scss
// custom.scss
.page-title {
  font-size: 1.5rem;
}

.article-title {
  color: var(--secondary);
}
```

Las variables CSS de Quartz permiten sobrescribir colores sin tocar el tema base:

```css
:root {
  --light: #faf8f5;
  --lightgray: #e5e2dd;
  --gray: #918d87;
  --darkgray: #4e4a45;
  --dark: #2b2825;
  --secondary: #5b6f9e;
  --tertiary: #a38d6b;
  --highlight: rgba(143, 159, 169, 0.15);
}
```

Modo oscuro:

```css
.saved-dark {
  --light: #1a1c20;
  --dark: #e8ecf4;
  /* ... */
}
```

## Componentes personalizados

Se pueden crear componentes JSX propios en `quartz/components/`:

```tsx
// quartz/components/MiComponente.tsx
import { QuartzComponent, QuartzComponentConstructor } from "./types"

export default ((userOpts?: Opciones) => {
  const opts = { ...defaults, ...userOpts }

  const component: QuartzComponent = ({ fileData, cfg }) => {
    return <div>Contenido personalizado</div>
  }

  component.css = `
    .mi-componente { color: var(--secondary); }
  `

  return component
}) satisfies QuartzComponentConstructor
```

Luego se registra en `quartz.layout.ts`:

```typescript
import MiComponente from "./quartz/components/MiComponente"

const right: Component.Component[] = [
  MiComponente({ /* opciones */ }),
  // ... otros componentes
]
```

## Plugins de la comunidad

### Instalar un plugin

```bash
npx quartz plugin add github:autor/repo
```

### Plugins populares

| Plugin | Descripción |
|--------|-------------|
| `quartz-community/explorer` | Explorador de archivos en árbol |
| `quartz-community/citations` | Soporte de citas académicas |
| `quartz-community/stackedpages` | Paneles apilados estilo Andy Matuschak |
| `quartz-community/encryptedpages` | Páginas protegidas por contraseña |
| `quartz-community/fonts` | Fuentes self-hosted sin Google Fonts |
| `quartz-community/note-properties` | Panel de propiedades de nota |

### Configurar plugin

```typescript
plugins: {
  transformers: [
    Plugin.Explorer({
      sortFn: (a, b) => a.name.localeCompare(b.name),
      filterFn: (node) => node.name !== " Plantillas",
    }),
  ],
}
```

Para opciones avanzadas que requieren callbacks, se usa el archivo `quartz.ts`:

```typescript
import { loadQuartzConfig, loadQuartzLayout } from "./quartz/plugins/loader/config-loader"
import * as ExternalPlugin from "./.quartz/plugins"

ExternalPlugin.Explorer({
  mapFn: (node) => {
    node.displayName = node.displayName.toUpperCase()
    return node
  },
})

const config = await loadQuartzConfig()
export default config
```

## Page frames

Los page frames controlan la estructura HTML general de la página. Quartz incluye tres:

| Frame | Descripción |
|-------|-------------|
| `default` | Layout de tres columnas (sidebar izq, contenido, sidebar der) |
| `full-width` | Sin sidebars, contenido a ancho completo |
| `minimal` | Solo contenido y footer (para 404) |

Se configuran por tipo de página:

```typescript
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [...],
  left: [],
  right: [], // sin sidebar derecho
}
```

## Layout responsive

Quartz tiene tres breakpoints:

```scss
$breakpoints: (
  mobile: 800px,
  desktop: 1200px,
);
```

- `< 800px`: layout móvil (sidebars apilados)
- `800px - 1200px`: layout tablet
- `> 1200px`: layout desktop

Los componentes se pueden mostrar condicionalmente:

```typescript
const left: Component.Component[] = [
  Component.DesktopOnly(Component.Explorer()),    // solo desktop
  Component.MobileOnly(Component.Search()),       // solo móvil
]
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[04 - Infraestructura/22 - Quartz/05 - Módulo 5 - Deploy\|Módulo 5 - Deploy]] |
| **Siguiente →** | [[04 - Infraestructura/22 - Quartz/07 - Módulo 7 - Integración con este Vault\|Módulo 7: Integración con este Vault]] |
| **Inicio herramienta** | [[04 - Infraestructura/22 - Quartz/quartz\|Quartz]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|← Índice General]] |
| **Documentación oficial** | [Quartz Docs](https://quartz.jzhao.xyz/advanced/creating-components) |

---
