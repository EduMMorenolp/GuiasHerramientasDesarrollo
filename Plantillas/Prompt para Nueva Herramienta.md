# Prompt para implementar [Herramienta] en el vault

## 1. Investigacion

Busca la documentacion oficial de la herramienta y extrae:

- Pagina oficial y docs
- Repositorio GitHub
- Instalacion (multi-plataforma: Windows, Linux, macOS)
- Comandos y conceptos fundamentales
- Caracteristicas intermedias y avanzadas
- Integraciones con otras herramientas del vault
- API, CLI, configuracion

## 2. Plan de modulos

Define entre 6 y 10 modulos progresivos.

| Modulo | Titulo | Contenido clave |
|--------|--------|-----------------|
| 1 | Fundamentos e Instalacion | Que es, instalar, primeros pasos |
| 2 | Flujo Basico | Comandos esenciales, uso diario |
| 3 | Intermedio | Caracteristicas principales, configuracion |
| 4 | Avanzado | Automatizacion, integraciones |
| 5 | ... | ... |
| N | Experto | Rendimiento, troubleshooting, novedades |

## 3. Archivos a crear

### Carpeta
```
XX - NombreHerramienta/
```

Donde `XX` es el numero secuencial siguiente al maximo existente.

### Overview: `herramienta.md`

```markdown
# [Herramienta] — Guia completa

Descripcion breve de la herramienta.

## Estructura de Modulos

| Modulo | Descripcion |
|--------|-------------|
| [[01 - Modulo 1 - Fundamentos e Instalacion\|01 — Fundamentos e Instalacion]] | ... |
| [[02 - Modulo 2 - ...\|02 — ...]] | ... |

---
**Inicio principal**: [[../00 - Indice/Indice General|Indice General]]
```

Nota: el overview esta a profundidad `Categoria/Herramienta/`, por eso usa `../00 - Indice/`.

### Modulos: `NN - Modulo N - Nombre.md`

Formato exacto de cada modulo:

```markdown
---
title: "Modulo N: Nombre"
tags: [herramienta-tag, categoria/nombre, nivel/fundamentos, keyword]
date: 2026-06-27
---

# Modulo N: Nombre

**Objetivo**: Descripcion del objetivo del modulo.

---

## Seccion 1

Contenido con ejemplos.

```lenguaje
codigo de ejemplo
```

### Subseccion

Mas contenido.

---

## Resumen del Modulo

| Concepto | Descripcion |
|----------|-------------|
| Termino | Explicacion |

---

**Documentacion oficial**: https://docs.ejemplo.com

**Siguiente**: [[NN+1 - Modulo N+1 - Nombre|Modulo N+1: Nombre]]
**Inicio herramienta**: [[herramienta|Herramienta]]
**Inicio principal**: [[../00 - Indice/Indice General|Indice General]]
```

El ultimo modulo NO lleva `**Siguiente**:`.

La profundidad a 00 - Indice` desde un modulo es `Categoria/Herramienta/Modulo`, es decir 3 niveles: `../00 - Indice/`.

## 4. Navegacion (wikilinks)

- **Siguiente**: link al modulo N+1 con el texto "Modulo N+1: Nombre"
- **Inicio herramienta**: link al overview en el mismo directorio: `[[herramienta|Herramienta]]`
- **Inicio principal**: `[[../00 - Indice/Indice General|Indice General]]`

## 5. Frontmatter y tags

Cada modulo necesita frontmatter YAML al inicio:

```yaml
---
title: "Modulo N: Nombre"
tags: [tool-tag, categoria/nombre, nivel/fundamentos, keyword]
date: 2026-06-27
---
```

Tags disponibles por nivel:
- Modulos 1-2: `nivel/fundamentos`
- Modulos 3-4: `nivel/intermedio`
- Modulos 5+: `nivel/avanzado`

Tags de categoria disponibles:
- `categoria/editores-terminal`
- `categoria/lenguajes-runtimes`
- `categoria/control-versiones-cicd`
- `categoria/infraestructura`
- `categoria/bases-datos`
- `categoria/apis-testing`
- `categoria/ia-tooling`

## 6. Documentacion oficial

Antes de la primera linea de navegacion al final del modulo, agregar:

```
**Documentacion oficial**: https://docs.ejemplo.com
```

## 7. Actualizar Indice General

En 00 - Indice/Indice General.md`, agregar la nueva herramienta dentro de su categoria:

```
### NN - [Herramienta]
Descripcion breve.

→ [[../XX - Categoria/NN - Herramienta/herramienta|[Herramienta] — Guia completa]]
```

## 8. Verificacion

Ejecutar el script de validacion:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\validate.ps1
```

Debe pasar sin errores.

## 9. Commit y Deploy

```bash
git add -A
git commit -m "feat: agregar [Herramienta] con N modulos"
git push
```

El push a `master` activa automaticamente el workflow de GitHub Actions que:
1. Clona Quartz
2. Copia el vault como contenido
3. Compila el sitio estatico
4. Publica en GitHub Pages

El sitio queda disponible en:
`https://EduMMorenolp.github.io/GuiasHerramientasDesarrollo/`

---

## Checklist de verificacion

- [ ] Los wikilinks `Siguiente` apuntan al modulo correcto
- [ ] `Inicio herramienta` apunta al overview
- [ ] `Inicio principal` usa `../../../` (modulos) o `../../` (overviews)
- [ ] El archivo overview existe y tiene tabla de modulos
- [ ] El `Indice General.md` tiene la nueva entrada
- [ ] El frontmatter tiene title, tags, date
- [ ] `**Documentacion oficial**:` esta presente
- [ ] El MOC de la categoria existe o se creo uno nuevo
- [ ] `scripts/validate.ps1` pasa sin errores

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[NN+1 - Modulo N+1 - Nombre\|Modulo N+1: Nombre]] |
| **Inicio herramienta** | [[herramienta\|Herramienta]] |
| **Inicio principal** | [[../00 - Indice/Indice General\|Indice General]] |
| **Documentación oficial** | [Herramienta Docs](https://docs.ejemplo.com) |

---
