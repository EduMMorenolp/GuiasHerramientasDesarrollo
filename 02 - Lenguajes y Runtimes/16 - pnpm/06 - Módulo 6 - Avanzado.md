# Módulo 6: Avanzado

**Objetivo**: Aprender y dominar: Avanzado.

## Hooks (pnpmfile.js)

Se puede crear un archivo `pnpmfile.js` (o `.mjs`) en la raiz del proyecto para modificar resoluciones de paquetes durante la instalacion:

```js
module.exports = {
  hooks: {
    readPackage(pkg) {
      if (pkg.name === "lodash") {
        pkg.dependencies = {};
      }
      return pkg;
    }
  }
};
```

## package.json extendido

pnpm extiende el `package.json` con campos propios:

```json
{
  "publishConfig": {
    "registry": "https://npm.pkg.github.com"
  },
  "engines": {
    "node": ">=18",
    "pnpm": ">=9"
  }
}
```

## Parcheo con patch-package

Alternativa a `pnpm patch` usando la herramienta externa `patch-package`:

```bash
# Modificar el paquete dentro de node_modules
# Luego generar el parche
npx patch-package <nombre-paquete>

# Aplicar parches en instalacion
npx patch-package
```

## pnpm deploy

Para empaquetar solo dependencias de produccion en una carpeta deployable:

```bash
pnpm deploy --filter @scope/api ./dist/deploy
```

Esto copia solo lo necesario (dependencias de produccion, lockfile, etc.) en la carpeta destino.

## Comparativa rendimiento

| Aspecto | npm | yarn | pnpm |
|---------|-----|------|------|
| Velocidad instalacion | Media | Alta | Muy alta |
| Espacio en disco | Alto | Medio | Bajo (store global) |
| Estructura node_modules | Plana (hoisting) | Plana | Estricta (symlinks) |
| Monorepos nativos | workspaces | workspaces | workspaces + filtros |
| Seguridad (audit) | Si | Si | Si |
| Parcheo | No nativo | No nativo | pnpm patch |
| SBOM | No | No | pnpm sbom |

## Tabla resumen final

| Concepto | Descripcion |
|----------|-------------|
| Store global | Almacenamiento centralizado con hard links |
| Workspaces | Soporte nativo para monorepos con filtros |
| Lockfile YAML | `pnpm-lock.yaml` legible y versionable |
| Seguridad | Audit, licencias, SBOM, permisos de build |
| Catalogo | Versiones centralizadas con `catalog:` |
| Hooks | Modificacion de resoluciones via pnpmfile.js |
| Deploy | Empaquetado optimizado con `pnpm deploy` |

## Navegacion

---
**Documentación oficial**: https://pnpm.io/motivation

**Inicio herramienta**: [[pnpm|pnpm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
