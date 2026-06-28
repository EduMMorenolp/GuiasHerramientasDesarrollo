# Módulo 1: Instalación y Conceptos Básicos

**Objetivo**: Instalar Node.js y dominar los fundamentos de npm.

---

## ¿Qué es Node.js?

Entorno de ejecución de JavaScript del lado del servidor basado en el motor V8 de Chrome.

```powershell
# Verificar instalación
node --version
npm --version
```

---

## Gestores de Versiones

### nvm-windows
```powershell
# Instalar nvm-windows
scoop install nvm

# Gestionar versiones
nvm list                    # Versiones instaladas
nvm install 22.5.0         # Instalar versión específica
nvm use 22.5.0             # Usar versión
nvm install latest          # Ãšltima versión
nvm install lts             # Ãšltima LTS
```

---

## package.json

```json
{
  "name": "mi-proyecto",
  "version": "1.0.0",
  "description": "Descripción del proyecto",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "dev": "node --watch index.js",
    "test": "jest",
    "lint": "eslint ."
  },
  "dependencies": {
    "express": "^4.18.0"
  },
  "devDependencies": {
    "jest": "^29.0.0",
    "eslint": "^8.0.0"
  }
}
```

---

## npm Comandos Esenciales

```powershell
# Inicializar proyecto
npm init -y

# Instalar dependencias
npm install express
npm install -D jest eslint     # Dev dependencies
npm install -g nodemon         # Global

# Instalar desde lockfile
npm ci                         # Más rápido, basado en package-lock.json

# Actualizar dependencias
npm update
npm outdated                   # Ver dependencias desactualizadas

# Eliminar
npm uninstall express

# Listar
npm list --depth=0
npm list -g --depth=0
```

---

## package-lock.json

- **Bloquea versiones exactas** de todas las dependencias (incluyendo transitivas)
- **Debe committearse** en el repositorio
- Garantiza que todos los desarrolladores tengan las mismas versiones

---

## node_modules

- Carpeta donde se almacenan las dependencias instaladas
- **No se commitea** (está en .gitignore)
- Se regenera con `npm install`

---

## npm Scripts

```json
{
  "scripts": {
    "dev": "node --watch src/index.js",
    "build": "esbuild src/index.js --bundle --outfile=dist/bundle.js",
    "start": "node dist/bundle.js",
    "test": "jest --coverage",
    "lint": "eslint src/ --fix",
    "format": "prettier --write src/",
    "precommit": "npm run lint && npm run test"
  }
}
```

```powershell
npm run dev
npm run build
npm test        # Atajo para npm run test
npm start       # Atajo para npm run start
```

---

**Documentación oficial**: https://nodejs.org/docs/latest/api/

**Siguiente**: [[02 - Módulo 2 - npm Scripts y Publicación|Módulo 2: npm Scripts y Publicación]]

**Inicio herramienta**: [[nodejs|Node.js y npm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
