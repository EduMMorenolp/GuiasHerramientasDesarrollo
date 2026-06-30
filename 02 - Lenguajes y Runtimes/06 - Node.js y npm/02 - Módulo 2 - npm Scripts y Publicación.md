# Módulo 2: npm Scripts y Publicación

**Objetivo**: Scripts avanzados, seguridad y publicación de paquetes.

---

## npx

Ejecuta paquetes sin instalarlos globalmente:

```powershell
# Sin npx (requiere instalación global)
npm install -g create-react-app
create-react-app mi-app

# Con npx (descarga y ejecuta temporalmente)
npx create-react-app mi-app
npx eslint src/
npx prettier --check .
npx cowsay "Hola mundo"
```

---

## Scripts Compuestos

```json
{
  "scripts": {
    "lint": "eslint src/",
    "test": "jest",
    "lint:fix": "eslint src/ --fix",
    "format": "prettier --write src/",
    "check": "npm run lint && npm run test",
    "clean": "rm -rf dist/",
    "rebuild": "npm run clean && npm run build",
    "prebuild": "npm run lint",
    "postbuild": "echo 'Build completado!'",
    "prepare": "husky"
  }
}
```

### Pre/Post hooks
Los scripts con prefijo `pre` o `post` se ejecutan automáticamente:
- `prebuild` se ejecuta antes de `build`
- `postbuild` se ejecuta después de `build`

---

## npm Audit (Seguridad)

```powershell
# Auditar dependencias
npm audit

# Auditar solo alto/crítico
npm audit --audit-level=high

# Arreglar automáticamente (cuando sea posible)
npm audit fix

# Forzar arreglo (puede romper compatibilidad)
npm audit fix --force
```

---

## Publicar Paquetes

### Preparación
```json
{
  "name": "@usuario/mi-paquete",
  "version": "1.0.0",
  "main": "dist/index.js",
  "types": "dist/index.d.ts",
  "files": ["dist/", "README.md"],
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "git+https://github.com/usuario/mi-paquete.git"
  }
}
```

### Publicar
```powershell
# Login
npm login

# Publicar (público)
npm publish

# Publicar como paquete público
npm publish --access public

# Publicar versión específica
npm publish --tag next

# Actualizar versión
npm version patch    # 1.0.0 -> 1.0.1
npm version minor    # 1.0.0 -> 1.1.0
npm version major    # 1.0.0 -> 2.0.0

# Publicar con tag
npm publish --tag beta
```

---

## Semantic Versioning (SemVer)

```
MAJOR.MINOR.PATCH
   ^      ^     ^
   |      |     â””â”€â”€ PATCH: bug fixes (backwards compatible)
   |      â””â”€â”€â”€â”€â”€â”€â”€â”€ MINOR: new features (backwards compatible)
   â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ MAJOR: breaking changes
```

### Rangos de versiones
| Símbolo | Significado | Ejemplo |
|---------|-------------|---------|
| `^1.0.0` | Compatible con 1.x.x | `^1.0.0` permite `1.9.9` |
| `~1.0.0` | Compatible con 1.0.x | `~1.0.0` permite `1.0.9` |
| `>=1.0.0 <2.0.0` | Rango | |
| `1.0.0` | Versión exacta | |
| `*` | Cualquier versión | |

---

## npm Config

```powershell
# Ver configuración
npm config list
npm config list -l  # Todas las opciones

# Configurar
npm config set init-author-name "Tu Nombre"
npm config set init-license "MIT"
npm config set registry "https://registry.npmjs.org"

# Usar registry privado
npm config set @mi-empresa:registry "https://npm.mi-empresa.com"
```

---

## Buenas Prácticas

1. **package-lock.json** siempre en el repositorio
2. **node_modules** en .gitignore
3. **npm ci** en lugar de npm install en CI/CD
4. **npm audit** regularmente
5. **Versiones exactas** en producción si es crítico
6. **Scripts descriptivos** para tareas comunes
7. **precommit hooks** para lint y tests

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/06 - Node.js y npm/01 - Módulo 1 - Instalación y Conceptos Básicos\|Módulo 1 - Instalación y Conceptos Básicos]] |
| **Siguiente →** | [[03 - Módulo 3 - Asincronía y Event Loop\|Módulo 3: Asincronía y Event Loop]] |
| **Inicio herramienta** | [[nodejs\|Node.js y npm]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Node.js y npm Docs](https://nodejs.org/docs/latest/api/) |

---
