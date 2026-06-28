# MÃ³dulo 2: Repositorios y Merge Requests

**Objetivo**: Dominar el flujo de trabajo con repositorios GitLab y Merge Requests.

---

## Repositorios en GitLab

### Inicializar y Conectar

```powershell
# Crear repositorio local
git init
git add .
git commit -m "Initial commit"

# Conectar con GitLab
git remote add origin https://gitlab.com/usuario/mi-proyecto.git

# Verificar remoto
git remote -v
```

### Push Inicial

```powershell
# Subir rama principal
git push -u origin main

# Subir todas las ramas
git push --all origin
```

### Clonar Repositorio

```powershell
# Por HTTPS
git clone https://gitlab.com/usuario/repo.git

# Por SSH
git clone git@gitlab.com:usuario/repo.git
```

---

## Merge Requests

### Flujo de Trabajo

```mermaid
flowchart LR
    A[main] --> B[feature branch]
    B --> C[Push]
    C --> D[Crear MR]
    D --> E[Code Review]
    E --> F[Aprobar]
    F --> G[Merge]
    G --> A
```

### Crear Merge Request

```powershell
# Crear rama de feature
git checkout -b feature/nueva-funcionalidad

# Hacer cambios y commit
git add .
git commit -m "feat: aÃ±adir nueva funcionalidad"

# Subir rama
git push -u origin feature/nueva-funcionalidad
```

En GitLab: Merge Requests > New Merge Request

Seleccionar:
- **Source**: `feature/nueva-funcionalidad`
- **Target**: `main`
- **Title**: DescripciÃ³n clara
- **Description**: Contexto, cambios, screenshots
- **Assignee**: Revisor asignado
- **Reviewers**: Uno o mÃ¡s revisores

### Revisar y Aprobar

| AcciÃ³n | DescripciÃ³n |
|--------|-------------|
| **Comment** | Comentario general o en lÃ­nea |
| **Approve** | Aprueba los cambios |
| **Request Changes** | Solicita correcciones |
| **Resolve Thread** | Marca discusiÃ³n como resuelta |
| **Merge** | Fusiona cuando estÃ¡ aprobado |

### Tipos de Merge

| Estrategia | CuÃ¡ndo usarla |
|------------|---------------|
| **Merge Commit** | Preservar historial completo |
| **Squash Merge** | Historial limpio (1 commit) |
| **Fast-Forward Merge** | Sin commits de merge |

---

## Ramas Protegidas

```yaml
# ConfiguraciÃ³n en Settings > Repository > Protected Branches
branch: main
allowed_to_merge: Maintainers, Developers
allowed_to_push: No one (solo MR)
code_owner_approval_required: true
```

### Code Owners

Archivo `CODEOWNERS` en la raÃ­z del repositorio:

```
# DueÃ±os globales
* @usuario-principal

# Equipo frontend
/src/frontend/ @equipo-frontend

# Equipo backend
/src/api/ @equipo-backend

# DocumentaciÃ³n
/docs/ @tech-writer
```

---

## Web IDE

Acceso: `.` en el teclado o botÃ³n **Web IDE**

- Editor completo con VSCode en el navegador
- Terminal integrada
- Live Preview
- Git integrado (commit, push, branch)

### Snippets

Fragmentos de cÃ³digo reutilizables:

```python
# Ejemplo de snippet
def saludar(nombre):
    return f"Hola, {nombre}!"
```

- Visibles: Private, Internal, Public
- Formateo syntax highlighting automÃ¡tico

### Wiki

DocumentaciÃ³n integrada en el repositorio:

```
wiki/
  â”œâ”€â”€ home.md
  â”œâ”€â”€ getting-started.md
  â””â”€â”€ api-reference.md
```

- Formato Markdown
- Sidebar personalizable
- Historial de versiones

---

## Resumen del MÃ³dulo

| Concepto | DescripciÃ³n |
|----------|-------------|
| **git remote** | Conectar repo local con GitLab |
| **Merge Request** | Solicitud de fusiÃ³n con revisiÃ³n |
| **Protected Branches** | Ramas con reglas de push/merge |
| **Code Owners** | Revisores obligatorios por archivo |
| **Web IDE** | Editor en navegador |
| **Snippets** | Fragmentos de cÃ³digo |
| **Wiki** | DocumentaciÃ³n del proyecto |

---

**Documentación oficial**: https://docs.gitlab.com
**Siguiente**: [[03 - MÃ³dulo 3 - Issues y Planning|MÃ³dulo 3: Issues y Planning]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
