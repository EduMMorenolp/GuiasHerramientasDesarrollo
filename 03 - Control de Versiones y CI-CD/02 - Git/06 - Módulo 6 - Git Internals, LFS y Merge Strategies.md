# Módulo 6: Git Internals, LFS y Merge Strategies

**Objetivo**: Comprender el funcionamiento interno de Git y manejo de archivos grandes.

---

## Git Internals

### Objetos fundamentales
Git almacena todo como objetos en `.git/objects/`:

| Objeto | Descripción |
|--------|-------------|
| **Blob** | Contenido de archivo |
| **Tree** | Directorio (contiene blobs y trees) |
| **Commit** | Snapshot + metadatos (author, message, parent) |
| **Tag** | Referencia con nombre a un commit |

### Explorar objetos
```powershell
# Hash de un objeto
git hash-object archivo.js

# Ver contenido de un objeto
git cat-file -p abc123
git cat-file -t abc123  # Tipo del objeto

# Ver árbol de un commit
git ls-tree -r HEAD

# Ver estructura interna
git rev-parse HEAD
git rev-parse main~2
```

### References (refs)
```powershell
# Ver referencias
cat .git/refs/heads/main
cat .git/refs/tags/v1.0

# HEAD como referencia simbólica
cat .git/HEAD
# Output: ref: refs/heads/main
```

### Packfiles
```powershell
# Comprimir objetos sueltos
git gc

# Ver estadísticas
git count-objects -v

# Forzar empaquetado
git gc --aggressive
```

---

## Git LFS (Large File Storage)

### ¿Qué es?
Reemplaza archivos grandes con punteros, almacenando el contenido real en servidores externos.

### Instalación y uso
```powershell
# Instalar
git lfs install

# Trackear extensión
git lfs track "*.psd"
git lfs track "*.zip"
git lfs track "models/*.h5"

# Añadir .gitattributes generado
git add .gitattributes

# Ver archivos trackeados
git lfs ls-files

# Migrar archivos existentes
git lfs migrate import --include="*.psd" --everything
```

### LFS en equipo
```powershell
# Clonar repo con LFS
git clone https://github.com/user/repo.git
# LFS se descarga automáticamente

# Si no quieres archivos LFS
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/user/repo.git

# Verificar integridad
git lfs fsck
```

### LFS en GitHub
```yaml
# Límites GitHub
# - 2 GB por archivo
# - 5 GB/mes gratis
# - Planes de pago para más almacenamiento
```

---

## Merge Strategies

### Tipos de merge
```powershell
# Recursive (por defecto)
git merge feature

# Ours (ignora cambios de la otra rama)
git merge -s ours feature

# Octopus (múltiples ramas)
git merge feature1 feature2 feature3

# Subtree (fusionar proyecto dentro de subdirectorio)
git merge -s subtree feature

# Resolve (3-way, sin detección de renombres)
git merge -s resolve feature
```

### Merge ortogonal (ort)
Nueva estrategia desde Git 2.33+:
```powershell
git merge -s ort feature  # Más rápido, mejor manejo de conflictos
```

### Estrategias avanzadas de resolución
```powershell
# Usar "ours" para conflicto específico
git merge -Xours feature    # Nuestra versión en conflictos
git merge -Xtheirs feature  # Su versión en conflictos

# Patience diff (mejor para código reestructurado)
git merge -Xpatience feature
```

---

## Advanced Bisect

```powershell
# Iniciar búsqueda automática
git bisect start
git bisect bad HEAD
git bisect good v1.0.0

# Puedes automatizar con script
git bisect run npm test

# Salir del bisect
git bisect reset
```

### Bisect con skip
```powershell
# Si un commit no se puede probar, saltarlo
git bisect skip

# Ver commits saltados
git bisect visualize
```

---

## Resumen del Módulo

| Concepto | Descripción |
|----------|-------------|
| **Blobs/Trees/Commits** | Objetos fundamentales de Git |
| **Packfiles** | Compresión y almacenamiento eficiente |
| **LFS** | Manejo de archivos binarios grandes |
| **Merge strategies** | Control granular de fusiones |
| **Bisect** | Depuración binaria de regresiones |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[03 - Control de Versiones y CI-CD/02 - Git/05 - Módulo 5 - Personalización, Hooks y Git Attributes\|Módulo 5 - Personalización, Hooks y Git Attributes]] |
| **Siguiente →** | — |
| **Inicio herramienta** | [[git\|Git]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Git Docs](https://git-scm.com/doc) |

---
