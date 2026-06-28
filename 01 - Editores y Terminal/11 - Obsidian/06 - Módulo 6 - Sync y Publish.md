# Módulo 6: Sync y Publish

**Objetivo**: Aprender y dominar: Sync y Publish.

## Obsidian Sync
Servicio oficial de sincronizacion con cifrado de extremo a extremo (E2EE). Los datos se cifran localmente antes de subirse.

### Caracteristicas
- **E2EE**: Solo el usuario descifra los datos.
- **Versionado**: Historial de cambios con posibilidad de restaurar versiones anteriores.
- **Selectivo**: Elegir que carpetas sincronizar por vault.
- **Multi-dispositivo**: Soporta Windows, macOS, Linux, Android, iOS.

## Obsidian Publish
Servicio para publicar vaults como sitio web estatico.

### Caracteristicas
- Publicacion selectiva de notas.
- Visualizacion personalizable con temas.
- Soporte para **custom domain** mediante configuracion DNS.
- Navegacion con graph view y backlinks incluidos.

## Alternativas gratuitas

### Git + GitHub Pages
Usar un repositorio de Git para versionar las notas y publicarlas como sitio estatico mediante GitHub Pages. Requiere un generador de sitio estatico como Jekyll o Hugo.

### Quartz
Quartz es un generador de sitio estatico disenado especificamente para vaults de Obsidian. Convierte wikilinks, backlinks y graph view en un sitio web navegable.

| Alternativa  | Versionado | Dominio propio | Facilidad     |
| ------------ | ---------- | -------------- | ------------- |
| Sync         | Si         | No             | Alta          |
| Publish      | No         | Si             | Alta          |
| Git + Pages  | Si         | Si             | Media         |
| Quartz       | Si         | Si             | Media         |

---

**Documentación oficial**: https://help.obsidian.md
**Siguiente**: [[07 - Módulo 7 - Personalización|Módulo 7: Personalización]]
**Inicio herramienta**: [[obsidian|Obsidian]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
