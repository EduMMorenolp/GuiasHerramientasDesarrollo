# Módulo 5: Personalización, Hooks y Git Attributes

**Objetivo**: Personalizar Git con hooks, attributes y configuración avanzada.

---

## Git Hooks

Scripts que se ejecutan automáticamente en eventos de Git:

### Hooks del lado cliente
```powershell
# .git/hooks/pre-commit
#!/bin/sh
npm run lint
if [ $? -ne 0 ]; then
  echo "âŒ Linting failed. Commit aborted."
  exit 1
fi
```

```powershell
# .git/hooks/commit-msg
#!/bin/sh
# Validar Conventional Commits
if ! head -1 "$1" | grep -qE "^(feat|fix|docs|refactor|test|chore)(\(.+\))?: .{1,50}$"; then
  echo "âŒ Mensaje debe seguir Conventional Commits"
  exit 1
fi
```

### Hooks del lado servidor
| Hook | Disparador |
|------|-----------|
| `pre-receive` | Antes de aceptar push |
| `update` | Por cada rama actualizada |
| `post-receive` | Después de aceptar push |

### Gestionar hooks con Husky
```powershell
npx husky init
npx husky add .husky/pre-commit "npm run lint && npm test"
npx husky add .husky/commit-msg "npx --no -- commitlint --edit $1"
```

---

## Git Attributes

Archivo `.gitattributes` para configurar comportamiento por archivo:

```gitattributes
# Normalizar line endings
* text=auto
*.js text
*.png binary
*.pdf binary

# Linguist metadata (GitHub stats)
*.ts linguist-language=TypeScript
*.generated.js linguist-generated=true

# Diff configuration
*.vue diff=html
*.js diff=javascript
*.py diff=python

# Merge strategies
package-lock.json -merge
*.config.js merge=union
```

### Drivers de merge personalizados
```gitattributes
*.json merge=json-merge
```

```powershell
git config merge.json-merge.driver "./merge-json-driver.sh"
```

---

## Git Config Avanzado

### Aliases
```powershell
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last "log -1 HEAD"
git config --global alias.unstage "reset HEAD --"
git config --global alias.graph "log --graph --oneline --all"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

### Config condicional
```ini
[includeIf "gitdir:~/work/"]
  path = ~/.gitconfig-work

[includeIf "gitdir:~/personal/"]
  path = ~/.gitconfig-personal
```

---

## Git Worktrees

Trabajar con múltiples ramas simultáneamente:

```powershell
# Crear worktree
git worktree add ../project-feature feature/nueva-funcion

# Listar worktrees
git worktree list

# Crear worktree con rama nueva
git worktree add -b hotfix/login ../hotfix-login main

# Eliminar worktree
git worktree remove ../hotfix-login
# O limpiar worktrees huérfanos
git worktree prune
```

---

## Submódulos Avanzados

```powershell
# Actualizar submódulos recursivamente
git submodule update --init --recursive

# Sincronizar URLs de submódulos
git submodule sync --recursive

# Registrar submódulo
git submodule add -b main https://github.com/user/lib.git src/lib

# Commits en submódulos
cd src/lib
git checkout main
git pull
cd ..
git add src/lib
git commit -m "chore: actualizar submódulo lib"
```

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [x] Crear hooks pre-commit, commit-msg, pre-push
- [x] Configurar .gitattributes para normalización y diffs
- [x] Crear aliases y config condicional
- [x] Usar worktrees para múltiples ramas activas
- [x] Gestionar submódulos en proyectos complejos

---

**Documentación oficial**: https://git-scm.com/doc
**Siguiente**: [[06 - Módulo 6 - Git Internals, LFS y Merge Strategies|Módulo 6: Git Internals, LFS y Merge Strategies]]
**Inicio herramienta**: [[git|Git]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
