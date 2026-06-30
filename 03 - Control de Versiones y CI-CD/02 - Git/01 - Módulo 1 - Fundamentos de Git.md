# Módulo 1: Fundamentos de Git

**Objetivo**: Comprender qué es Git, instalarlo y dominar las operaciones fundamentales.

---

## ¿Qué es Git?

### Definición
Git es un sistema de control de versiones distribuido que permite rastrear cambios en el código fuente durante el desarrollo de software.

### Conceptos Clave
- **Repositorio**: Almacén de tu proyecto con todo el historial
- **Commit**: Instantánea de los archivos en un momento dado
- **Branch**: Línea independiente de desarrollo
- **Working Directory**: Tus archivos actuales
- **Staging Area**: Preparación antes del commit

---

## Instalación y Configuración

### Instalación
```powershell
# Windows (Scoop)
scoop install git

# Windows (Chocolatey)
choco install git

# Verificar
git --version
```

### Configuración Inicial
```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
git config --global init.defaultBranch main
git config --global core.autocrlf true  # Windows
```

---

## Operaciones Fundamentales

### Inicializar un Repositorio
```powershell
cd D:\Proyectos\MiProyecto
git init
```

### Ciclo Básico
```powershell
# Ver estado
git status

# Añadir archivos al staging
git add archivo.js
git add .  # Todos los archivos

# Hacer commit
git commit -m "feat: añadir funcionalidad de login"

# Ver historial
git log --oneline --graph
```

### Comparar Cambios
```powershell
# Cambios sin staging
git diff

# Cambios en staging
git diff --staged

# Comparar commits
git diff abc123..def456
```

---

## Ignorar Archivos

### .gitignore
```
node_modules/
dist/
.env
*.log
.DS_Store
```

---

## Resumen

| Comando | Descripción |
|---------|-------------|
| `git init` | Inicializa repositorio |
| `git status` | Muestra estado actual |
| `git add` | Añade al staging |
| `git commit` | Crea instantánea |
| `git log` | Muestra historial |
| `git diff` | Compara cambios |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[02 - Módulo 2 - Branching y Colaboración\|Módulo 2: Branching y Colaboración]] |
| **Inicio herramienta** | [[git\|Git]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Git Docs](https://git-scm.com/doc) |

---
