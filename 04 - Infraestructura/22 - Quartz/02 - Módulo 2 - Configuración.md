# Módulo 2: Configuración

**Objetivo**: Configurar Quartz mediante `quartz.config.ts`: tema, metadatos, analíticas y opciones globales.

---

## Archivo de configuración

`quartz.config.ts` es el archivo principal de configuración. Exporta un objeto `QuartzConfig` con dos secciones: `configuration` y `plugins`.

```typescript
import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

const config: QuartzConfig = {
  configuration: {
    // opciones generales del sitio
  },
  plugins: {
    transformers: [],
    filters: [],
    emitters: [],
  },
}

export default config
```

## Opciones de configuración general

### pageTitle

Título del sitio. Se usa en la pestaña del navegador y en el RSS feed.

```typescript
pageTitle: "Mi Sitio",
```

### enableSPA

Activa la navegación Single Page Application. Las transiciones entre páginas son instantáneas sin recargar el navegador.

```typescript
enableSPA: true,
```

### enablePopovers

Activa vistas previas al hacer hover sobre enlaces internos.

```typescript
enablePopovers: true,
```

### analytics

Proveedor de analíticas. Puede ser `null` para desactivar.

```typescript
analytics: null,
// o
analytics: {
  provider: "google",
  tagId: "G-XXXXXXXXXX",
},
// o
analytics: {
  provider: "plausible",
},
```

Proveedores soportados: `google`, `plausible`, `umami`, `goatcounter`, `posthog`, `tinylytics`, `cabin`, `clarity`, `vercel`.

### locale

Locale para formato de fechas e i18n.

```typescript
locale: "es-ES",
```

### baseUrl

URL base del sitio desplegado. Se usa para sitemaps y RSS. Sin protocolo ni barras.

```typescript
baseUrl: "tu-usuario.github.io/mi-sitio",
```

### ignorePatterns

Patrones glob para ignorar archivos dentro de `content/`.

```typescript
ignorePatterns: [".obsidian", "scripts", "Plantillas"],
```

### defaultDateType

Cómo se determina la fecha de una página.

```typescript
defaultDateType: "modified", // "created", "modified", "published"
```

## Configuración de tema

### typography

Fuentes del sitio. Cualquier fuente de Google Fonts.

```typescript
typography: {
  header: "Inter",
  body: "Inter",
  code: "JetBrains Mono",
},
```

### cdnCaching

Usa CDN de Google para las fuentes. Más rápido pero requiere conexión.

```typescript
cdnCaching: true,
```

### colors

Esquema de colores para modo claro y oscuro.

```typescript
colors: {
  lightMode: {
    light: "#faf8f5",       // fondo de página
    lightgray: "#e5e2dd",   // bordes
    gray: "#918d87",        // enlaces del grafo
    darkgray: "#4e4a45",    // texto del cuerpo
    dark: "#2b2825",        // encabezados
    secondary: "#5b6f9e",   // color de enlaces
    tertiary: "#a38d6b",    // hover y grafos visitados
    highlight: "rgba(143, 159, 169, 0.15)", // fondo de enlaces internos
  },
  darkMode: { /* misma estructura */ },
},
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[04 - Infraestructura/22 - Quartz/01 - Módulo 1 - Fundamentos e Instalación\|Módulo 1 - Fundamentos e Instalación]] |
| **Siguiente →** | [[04 - Infraestructura/22 - Quartz/03 - Módulo 3 - Layout y Componentes\|Módulo 3: Layout y Componentes]] |
| **Inicio herramienta** | [[04 - Infraestructura/22 - Quartz/quartz\|Quartz]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|← Índice General]] |
| **Documentación oficial** | [Quartz Docs](https://quartz.jzhao.xyz/configuration) |

---
