# Módulo 1: Fundamentos e Instalación

**Objetivo**: Comprender qué es Quartz, instalarlo y realizar la configuración inicial.

---

## ¿Qué es Quartz?

Quartz es un generador de sitios estáticos rápido y completo, diseñado específicamente para convertir vaults de Obsidian en sitios web funcionales. A diferencia de otros SSGs (Hugo, Jekyll, MkDocs), Quartz entiende la sintaxis de Obsidian de forma nativa: wikilinks, transclusiones, callouts, Canvas y más.

### Características clave

- Compatibilidad total con Obsidian (wikilinks, transclusiones, callouts, LaTeX, Mermaid)
- SPA (Single Page Application) con navegación instantánea
- Búsqueda full-text
- Grafo interactivo de conexiones
- Vistas previas en hover (popovers)
- Hot-reload en ediciones de configuración y contenido
- Layout modular con componentes JSX
- Sistema de plugins (transformers, filters, emitters)
- Despliegue a GitHub Pages, Cloudflare, Netlify, Vercel

### Requisitos

- Node.js 18+ (v22 recomendado)
- npm (incluido con Node.js)
- Git

## Instalación

### Opción A: GitHub Template (recomendado)

1. Ir a https://github.com/jackyzha0/quartz/generate
2. Crear repositorio desde la template
3. Clonar localmente:
   ```bash
   git clone https://github.com/tu-usuario/tu-repo.git
   cd tu-repo
   ```

### Opción B: Clonar desde cero

```bash
git clone https://github.com/jackyzha0/quartz.git
cd quartz
```

### Inicializar sitio

```bash
# Instalar dependencias
npm i

# Ejecutar asistente de configuración
npx quartz create

# Instalar plugins del template seleccionado
npx quartz plugin install --from-config

# Vista previa local
npx quartz build --serve
```

El sitio estará disponible en `http://localhost:8080`.

El asistente `npx quartz create` guía la configuración inicial:
- Nombre del sitio (`pageTitle`)
- URL base (`baseUrl`)
- Template de inicio

## Estructura del proyecto

```
quartz/
├── content/             # Contenido Markdown (tu vault)
├── quartz/
│   ├── components/      # Componentes JSX
│   ├── plugins/         # Plugins internos
│   ├── styles/          # Estilos SCSS
│   └── cfg.ts           # Tipos de configuración
├── quartz.config.ts     # Configuración del sitio
├── quartz.layout.ts     # Configuración del layout
└── package.json
```

## Primeros pasos

1. Agrega archivos `.md` en `content/`
2. Ejecuta `npx quartz build --serve` para previsualizar
3. Los wikilinks `[[nota]]` se resuelven automáticamente
4. Los cambios en caliente se reflejan sin reconstruir

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[04 - Infraestructura/22 - Quartz/02 - Módulo 2 - Configuración\|Módulo 2: Configuración]] |
| **Inicio herramienta** | [[04 - Infraestructura/22 - Quartz/quartz\|Quartz]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|← Índice General]] |
| **Documentación oficial** | [Quartz Docs](https://quartz.jzhao.xyz) |

---
