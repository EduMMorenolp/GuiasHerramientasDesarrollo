# MÃ³dulo 4: Git Tools - Stash, Reflog y Reescritura

**Objetivo**: Dominar herramientas avanzadas de Git para gestiÃ³n del historial.

---

## Git Stash

Guardar cambios temporales sin commitear:

```powershell
# Guardar cambios
git stash
git stash push -m "WIP: refactor en progreso"

# Listar stashes
git stash list

# Aplicar stash
git stash apply        # Aplica pero mantiene en stash
git stash pop          # Aplica y elimina de stash
git stash apply stash@{2}

# Crear rama desde stash
git stash branch feature-fix stash@{0}

# Eliminar stash
git stash drop stash@{0}
git stash clear        # Eliminar todos
```

---

## Interactive Staging

### git add -p (patch mode)
Selecciona partes especÃ­ficas de un archivo para stage:

```powershell
git add -p archivo.js
# y/n/s/e/q - yes/no/split/edit/quit
```

### git add -i (interactive mode)
```powershell
git add -i
# MenÃº interactivo: stage, unstage, diff, etc.
```

---

## Reflog

El registro de referencias (reflog) registra cada movimiento de HEAD:

```powershell
# Ver reflog
git reflog
git reflog --all
git reflog main

# Recuperar commits "perdidos"
git reflog
# Encontrar el hash del commit perdido
git checkout abc123

# Recuperar despuÃ©s de un reset --hard
git reflog
git reset --hard HEAD@{2}  # Volver a donde estabas
```

---

## Reescritura de Historia

### git commit --amend
```powershell
# Modificar Ãºltimo commit (mensaje o archivos)
git commit --amend -m "Mensaje corregido"

# AÃ±adir archivo olvidado al Ãºltimo commit
git add archivo-olvidado.js
git commit --amend --no-edit
```

### git rebase -i (interactivo)
```powershell
# Reordenar, squash, editar, eliminar commits
git rebase -i HEAD~5

# Comandos en rebase interactivo
# pick  a1b2c3 - Usar commit tal cual
# reword r2d3f4 - Cambiar mensaje
# edit  e5f6g7 - Detenerse para editar
# squash s8h9i0 - Fusionar con commit anterior
# fixup j1k2l3 - Fusionar sin mensaje
# drop  m4n5o6 - Eliminar commit
```

### git filter-branch / git filter-repo
```powershell
# Eliminar archivo de TODO el historial
git filter-branch --tree-filter 'rm -f passwords.txt' HEAD

# git filter-repo (recomendado)
git filter-repo --path archivo-secreto.txt --invert-paths
```

---

## Cherry-pick y Revert

```powershell
# Aplicar commit especÃ­fico a la rama actual
git cherry-pick abc123
git cherry-pick abc123..def456  # Rango de commits

# Revertir un commit (crea commit inverso)
git revert abc123

# Revertir merge
git revert -m 1 hash-del-merge
```

---

## Bundle y Archive

```powershell
# Empaquetar repo en un archivo (sin servidor)
git bundle create repo.bundle --all
git bundle verify repo.bundle
git clone repo.bundle directorio-destino

# Crear archive
git archive --format=zip HEAD > proyecto.zip
git archive --format=tar.gz --prefix=proyecto/ v1.0 > proyecto.tar.gz
```

---

## Resumen del MÃ³dulo

| Comando | DescripciÃ³n |
|---------|-------------|
| `git stash` | Guardar cambios temporales |
| `git add -p` | Stage parcial interactivo |
| `git reflog` | Historial de movimientos de HEAD |
| `git rebase -i` | Reescritura interactiva |
| `git cherry-pick` | Aplicar commit especÃ­fico |
| `git revert` | Revertir commit (seguro) |
| `git bundle` | Empaquetar repo sin servidor |

---

**Documentación oficial**: https://git-scm.com/doc
**Siguiente**: [[05 - MÃ³dulo 5 - PersonalizaciÃ³n, Hooks y Git Attributes|MÃ³dulo 5: PersonalizaciÃ³n, Hooks y Git Attributes]]
**Inicio herramienta**: [[git|Git]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
