# MÃ³dulo 2: npm Scripts y PublicaciÃ³n

**Objetivo**: Scripts avanzados, seguridad y publicaciÃ³n de paquetes.

---

## npx

Ejecuta paquetes sin instalarlos globalmente:

```powershell
# Sin npx (requiere instalaciÃ³n global)
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
Los scripts con prefijo `pre` o `post` se ejecutan automÃ¡ticamente:
- `prebuild` se ejecuta antes de `build`
- `postbuild` se ejecuta despuÃ©s de `build`

---

## npm Audit (Seguridad)

```powershell
# Auditar dependencias
npm audit

# Auditar solo alto/crÃ­tico
npm audit --audit-level=high

# Arreglar automÃ¡ticamente (cuando sea posible)
npm audit fix

# Forzar arreglo (puede romper compatibilidad)
npm audit fix --force
```

---

## Publicar Paquetes

### PreparaciÃ³n
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

# Publicar (pÃºblico)
npm publish

# Publicar como paquete pÃºblico
npm publish --access public

# Publicar versiÃ³n especÃ­fica
npm publish --tag next

# Actualizar versiÃ³n
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
| SÃ­mbolo | Significado | Ejemplo |
|---------|-------------|---------|
| `^1.0.0` | Compatible con 1.x.x | `^1.0.0` permite `1.9.9` |
| `~1.0.0` | Compatible con 1.0.x | `~1.0.0` permite `1.0.9` |
| `>=1.0.0 <2.0.0` | Rango | |
| `1.0.0` | VersiÃ³n exacta | |
| `*` | Cualquier versiÃ³n | |

---

## npm Config

```powershell
# Ver configuraciÃ³n
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

## Buenas PrÃ¡cticas

1. **package-lock.json** siempre en el repositorio
2. **node_modules** en .gitignore
3. **npm ci** en lugar de npm install en CI/CD
4. **npm audit** regularmente
5. **Versiones exactas** en producciÃ³n si es crÃ­tico
6. **Scripts descriptivos** para tareas comunes
7. **precommit hooks** para lint y tests

---
**DocumentaciÃ³n oficial**: https://nodejs.org/docs/latest/api/

**Documentación oficial**: https://nodejs.org/docs/latest/api/

**Siguiente**: [[03 - MÃ³dulo 3 - AsincronÃ­a y Event Loop|MÃ³dulo 3: AsincronÃ­a y Event Loop]]
**Documentación oficial**: https://nodejs.org/docs/latest/api/

**Inicio herramienta**: [[nodejs|Node.js y npm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




