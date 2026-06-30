# Módulo 2: Workspaces

**Objetivo**: Aprender y dominar: Workspaces.

## Configuracion

Se crea un archivo `pnpm-workspace.yaml` en la raiz del monorepo:

```yaml
packages:
  - "apps/*"
  - "packages/*"
```

## Dependencias internas

Para referenciar paquetes dentro del mismo monorepo se usa el protocolo `workspace:`:

```json
{
  "dependencies": {
    "@scope/shared": "workspace:*"
  }
}
```

## Filtros

El flag `--filter` permite ejecutar comandos en paquetes especificos:

```bash
# Agregar dependencia solo en un paquete
pnpm --filter @scope/web add react

# Ejecutar script en un paquete especifico
pnpm --filter @scope/api build
```

## Comandos recursivos

```bash
# Ejecutar script build en todos los paquetes
pnpm -r build

# Ejecutar en paralelo
pnpm --parallel -r dev
```

## Ejemplo de estructura de monorepo

```
mi-proyecto/
  pnpm-workspace.yaml
  package.json
  apps/
    web/
      package.json   # "@scope/web"
    api/
      package.json   # "@scope/api"
  packages/
    shared/
      package.json   # "@scope/shared"
```

## Tabla de comandos workspace

| Comando | Descripcion |
|---------|-------------|
| `pnpm -r <script>` | Ejecuta script en todos los paquetes del workspace |
| `pnpm --filter <pkg> <cmd>` | Ejecuta comando solo en el paquete indicado |
| `pnpm --parallel -r <cmd>` | Ejecuta en paralelo en todos los paquetes |
| `pnpm list --depth -1` | Muestra la topologia del workspace |
| `pnpm add <pkg> --filter <pkg>` | Agrega dependencia a un paquete especifico |

## Navegacion

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/16 - pnpm/01 - Módulo 1 - Instalación y Conceptos Básicos\|Módulo 1 - Instalación y Conceptos Básicos]] |
| **Siguiente →** | [[02 - Lenguajes y Runtimes/16 - pnpm/03 - Módulo 3 - Package Management\|Módulo 3 - Package Management]] |
| **Inicio herramienta** | [[pnpm\|pnpm]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [pnpm Docs](https://pnpm.io/motivation) |

---
