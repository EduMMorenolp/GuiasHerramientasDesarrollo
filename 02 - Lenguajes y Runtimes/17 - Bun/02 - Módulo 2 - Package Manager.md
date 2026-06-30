# Módulo 2: Gestor de Paquetes

**Objetivo**: Aprender y dominar: Gestor de Paquetes.

## Inicializar proyecto

```bash
bun init
```

Crea un `package.json` y un archivo de entrada basico.

## Instalar dependencias

```bash
# Instalar todas las dependencias del proyecto
bun install

# Anadir dependencia de produccion
bun add express

# Anadir dependencia de desarrollo
bun add -d typescript

# Anadir dependencia global
bun add -g bun
```

## Eliminar y actualizar

```bash
# Eliminar dependencia
bun remove lodash

# Actualizar todas las dependencias
bun update

# Actualizar una dependencia especifica
bun update express
```

## Bun.lock

Bun utiliza un archivo de bloqueo binario (`bun.lock`) en lugar del JSON de `package-lock.json` o `yarn.lock`. Esto permite una resolucion de dependencias mucho mas rapida.

## Workspaces

```json
{
  "name": "monorepo",
  "workspaces": [
    "packages/*"
  ]
}
```

| Comando | Descripcion |
|---|---|
| `bun init` | Inicializa un proyecto nuevo |
| `bun install` | Instala dependencias (10-30x mas rapido que npm) |
| `bun add <pkg>` | Agrega dependencia de produccion |
| `bun add -d <pkg>` | Agrega dependencia de desarrollo |
| `bun add -g <pkg>` | Agrega dependencia global |
| `bun remove <pkg>` | Elimina una dependencia |
| `bun update` | Actualiza todas las dependencias |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/17 - Bun/01 - Módulo 1 - Instalación y Runtime\|Módulo 1 - Instalación y Runtime]] |
| **Siguiente →** | [[02 - Lenguajes y Runtimes/17 - Bun/03 - Módulo 3 - Bundler\|Módulo 3: Bundler]] |
| **Inicio herramienta** | [[bun\|Bun]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Bun Docs](https://bun.sh/docs) |

---
