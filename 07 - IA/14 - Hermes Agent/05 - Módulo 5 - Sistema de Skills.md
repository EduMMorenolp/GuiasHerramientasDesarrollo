# Módulo 5: Sistema de Skills

**Objetivo**: Crear, gestionar y compartir skills en Hermes Agent para automatizar flujos de trabajo repetitivos.

---

## ¿Qué es un Skill?

Un skill es una habilidad procedimental que Hermes Agent crea y reutiliza. A diferencia de las herramientas que son funciones atómicas, un skill es un conjunto de instrucciones que el agente sigue para completar una tarea compleja.

### Ciclo de vida de un skill

1. **Creación**: Hermes identifica un patrón repetitivo y crea un skill automáticamente
2. **Mejora**: Cada vez que se usa, el skill se refina y optimiza
3. **Reutilización**: El skill está disponible para tareas futuras similares
4. **Compartir**: Los skills son portables y compatibles con agentskills.io

## Skills Hub

Hermes Agent es compatible con [agentskills.io](https://agentskills.io), un repositorio comunitario de skills.

```bash
# Instalar un skill del hub
hermes skills install <nombre>

# Listar skills instalados
hermes skills list

# Buscar skills disponibles
hermes skills search "despliegue docker"
```

## Creación de skills

### Creación automática

Hermes crea skills automáticamente cuando detecta patrones repetitivos en tu uso. Por ejemplo, si despliegas una aplicación con Docker varias veces, Hermes creará un skill de despliegue.

### Creación manual

```
hermes: crea un skill para desplegar mi app Node.js con Docker
```

### Estructura de un skill

```yaml
name: deploy-node-app
description: Despliega una aplicación Node.js con Docker
instructions: |
  1. Construir la imagen Docker
  2. Ejecutar tests
  3. Publicar en registry
  4. Desplegar en producción
triggers:
  - "desplegar app"
  - "deploy node"
```

## Skills compatibles con Open Standard

Los skills de Hermes siguen un estándar abierto, lo que significa que son portables entre diferentes agentes y plataformas compatibles con el formato agentskills.io.

### Compartir skills

```bash
# Exportar un skill
hermes skills export deploy-node-app > skill.yaml

# Importar un skill
hermes skills import skill.yaml
```

## Automajoración de skills

Cada vez que Hermes ejecuta un skill, analiza el resultado y lo mejora:

- Identifica pasos ineficientes
- Añade manejo de errores
- Optimiza comandos
- Actualiza dependencias
