# Módulo 3: Gestión de Paquetes

**Objetivo**: Aprender y dominar: Gestión de Paquetes.

## Store virtual

pnpm organiza `node_modules` con una estructura de store virtual:

- `.pnpm/` contiene los paquetes como symlinks al store global.
- Cada paquete solo ve sus dependencias declaradas (no hoisting).
- Content-addressable: los archivos se almacenan por hash, evitando duplicados.

```bash
pnpm store status
pnpm store prune
```

## Dependencias peer

Las dependencias peer se instalan automaticamente si se configura:

```json
{
  "pnpm": {
    "strict-peer-dependencies": false
  }
}
```

Con `strict-peer-dependencies: true` se lanza un error si alguna peer no esta satisfecha.

## Overrides

Para forzar versiones de dependencias transitivas se usa `pnpm.overrides`:

```json
{
  "pnpm": {
    "overrides": {
      "lodash": "4.17.21",
      "react": "18.2.0"
    }
  }
}
```

## Parcheo de paquetes

```bash
# Extraer un paquete para modificarlo
pnpm patch lodash

# Aplicar el parche
pnpm patch-commit <ruta-del-parche>
```

## Actualizacion y diagnostico

```bash
# Actualizar todas las dependencias
pnpm update

# Ver paquetes desactualizados
pnpm outdated

# Saber por que un paquete esta instalado
pnpm why lodash
```

## Ciclo de vida de paquetes

| Etapa | Comando | Descripcion |
|-------|---------|-------------|
| Instalacion | `pnpm install` | Resuelve e instala dependencias desde el lockfile |
| Adicion | `pnpm add <pkg>` | Agrega nueva dependencia y actualiza lockfile |
| Actualizacion | `pnpm update` | Actualiza versiones segun el rango semver |
| Parcheo | `pnpm patch/commit` | Modifica temporalmente un paquete externo |
| Limpieza | `pnpm store prune` | Elimina paquetes no referenciados del store |
| Diagnostico | `pnpm why <pkg>` | Muestra el arbol de dependencia que incluye al paquete |

## Navegacion

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/16 - pnpm/02 - Módulo 2 - Workspaces\|Módulo 2 - Workspaces]] |
| **Siguiente →** | [[02 - Lenguajes y Runtimes/16 - pnpm/04 - Módulo 4 - Scripts y CI-CD\|Módulo 4 - Scripts y CI-CD]] |
| **Inicio herramienta** | [[pnpm\|pnpm]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [pnpm Docs](https://pnpm.io/motivation) |

---
