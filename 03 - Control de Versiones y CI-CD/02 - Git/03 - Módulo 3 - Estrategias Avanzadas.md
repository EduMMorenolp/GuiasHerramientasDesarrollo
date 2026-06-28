# MÃ³dulo 3: Estrategias Avanzadas

**Objetivo**: Dominar estrategias de branching, automatizaciÃ³n y buenas prÃ¡cticas profesionales.

---

## Estrategias de Branching

### Git Flow
```mermaid
flowchart LR
    A[main] --> B[develop]
    B --> C[feature/*]
    B --> D[release/*]
    A --> E[hotfix/*]
```
- `main`: ProducciÃ³n
- `develop`: IntegraciÃ³n
- `feature/*`: Nuevas funcionalidades
- `release/*`: PreparaciÃ³n de releases
- `hotfix/*`: Correcciones urgentes

### GitHub Flow
- `main` siempre desplegable
- Ramas de funcionalidad desde `main`
- Pull requests para revisiÃ³n
- Despliegue inmediato tras merge

### Conventional Commits
```
feat: aÃ±adir sistema de autenticaciÃ³n
fix: corregir error en cÃ¡lculo de total
docs: actualizar README con ejemplos
refactor: simplificar lÃ³gica de checkout
test: aÃ±adir tests para el carrito
chore: actualizar dependencias
```

---

## AutomatizaciÃ³n con Hooks

### Git Hooks (scripts que se ejecutan en eventos)
```powershell
# .git/hooks/pre-commit
#!/bin/sh
npm run lint
npm test
```

### Husky (Node.js)
```powershell
npx husky init
npx husky add .husky/pre-commit "npm run lint"
```

---

## IntegraciÃ³n CI/CD

### GitHub Actions
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test
      - run: npm run build
```

---

## Git Avanzado

### Bisect (encontrar commits que introducen bugs)
```powershell
git bisect start
git bisect bad HEAD
git bisect good v1.0.0
# Git te guÃ­a: marca cada commit como good o bad
git bisect reset
```

### Cherry-pick (aplicar commits especÃ­ficos)
```powershell
git cherry-pick abc123 def456
```

### SubmÃ³dulos
```powershell
git submodule add https://github.com/usuario/lib.git libs/lib
git submodule update --init --recursive
```

### Rebase Interactivo
```powershell
# Squash, reordenar, editar commits
git rebase -i HEAD~5
```

---

## Buenas PrÃ¡cticas Profesionales

1. **Commits atÃ³micos**: Cada commit hace una sola cosa
2. **Mensajes descriptivos**: Usa conventional commits
3. **ProtecciÃ³n de ramas**: Bloquear push directo a main
4. **Code review obligatorio**: MÃ­nimo un approval
5. **Tests automatizados**: En cada PR
6. **DocumentaciÃ³n**: README, CONTRIBUTING, CHANGELOG

---

**Documentación oficial**: https://git-scm.com/doc
**Siguiente**: [[04 - MÃ³dulo 4 - Git Tools - Stash, Reflog y Reescritura|MÃ³dulo 4: Git Tools - Stash, Reflog y Reescritura]]
**Inicio herramienta**: [[git|Git]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
