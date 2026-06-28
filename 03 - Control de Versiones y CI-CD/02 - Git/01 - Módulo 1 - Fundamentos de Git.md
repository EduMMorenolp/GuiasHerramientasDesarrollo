# MÃ³dulo 1: Fundamentos de Git

**Objetivo**: Comprender quÃ© es Git, instalarlo y dominar las operaciones fundamentales.

---

## Â¿QuÃ© es Git?

### DefiniciÃ³n
Git es un sistema de control de versiones distribuido que permite rastrear cambios en el cÃ³digo fuente durante el desarrollo de software.

### Conceptos Clave
- **Repositorio**: AlmacÃ©n de tu proyecto con todo el historial
- **Commit**: InstantÃ¡nea de los archivos en un momento dado
- **Branch**: LÃ­nea independiente de desarrollo
- **Working Directory**: Tus archivos actuales
- **Staging Area**: PreparaciÃ³n antes del commit

---

## InstalaciÃ³n y ConfiguraciÃ³n

### InstalaciÃ³n
```powershell
# Windows (Scoop)
scoop install git

# Windows (Chocolatey)
choco install git

# Verificar
git --version
```

### ConfiguraciÃ³n Inicial
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

### Ciclo BÃ¡sico
```powershell
# Ver estado
git status

# AÃ±adir archivos al staging
git add archivo.js
git add .  # Todos los archivos

# Hacer commit
git commit -m "feat: aÃ±adir funcionalidad de login"

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

| Comando | DescripciÃ³n |
|---------|-------------|
| `git init` | Inicializa repositorio |
| `git status` | Muestra estado actual |
| `git add` | AÃ±ade al staging |
| `git commit` | Crea instantÃ¡nea |
| `git log` | Muestra historial |
| `git diff` | Compara cambios |

---

**Documentación oficial**: https://git-scm.com/doc
**Siguiente**: [[02 - MÃ³dulo 2 - Branching y ColaboraciÃ³n|MÃ³dulo 2: Branching y ColaboraciÃ³n]]
**Inicio herramienta**: [[git|Git]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
