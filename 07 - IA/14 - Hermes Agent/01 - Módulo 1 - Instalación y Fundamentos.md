# Módulo 1: Instalación y Fundamentos

**Objetivo**: Instalar Hermes Agent, comprender su arquitectura y mantener la primera conversación.

---

## ¿Qué es Hermes Agent?

Hermes Agent es un agente autónomo de IA de código abierto creado por Nous Research. A diferencia de un copiloto atado a un IDE o un chatbot envoltorio de una API, Hermes es un agente que vive en tu servidor, recuerda lo que aprende y se vuelve más capaz con el tiempo. Está licenciado bajo MIT y soporta Linux, macOS y WSL2.

Características clave:
- Bucle de aprendizaje cerrado con creación autónoma de skills
- Memoria persistente con búsqueda FTS5 y resúmenes LLM
- Más de 60 herramientas incorporadas
- Gateway de mensajería para 20+ plataformas
- Seis backends de terminal: local, Docker, SSH, Daytona, Singularity, Modal
- Integración MCP

## Instalación

### Linux / macOS / WSL2

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

El instalador detecta el sistema operativo, instala las dependencias necesarias y configura el agente.

### Windows (PowerShell)

```powershell
iex (irm https://hermes-agent.nousresearch.com/install.ps1)
```

### Hermes Desktop

Descarga el instalador desde la web oficial para una experiencia GUI que incluye tanto la CLI como la aplicación de escritorio.

## Primeros pasos

### Configuración inicial

```bash
hermes setup --portal
```

Este comando inicia un asistente interactivo que guía en la configuración del proveedor de modelos. La opción `--portal` usa Nous Portal (OAuth) que cubre un modelo más las herramientas del Tool Gateway.

### Iniciar una conversación

```bash
hermes chat
```

Abre una sesión interactiva en la CLI con acceso completo a herramientas, memoria y skills.

### Verificar el estado

```bash
hermes status
```

Muestra el estado del agente, versión, proveedor activo y herramientas disponibles.

## Arquitectura general

Hermes Agent se compone de varias capas:
- **CLI**: interfaz de línea de comandos para interacción directa
- **Gateway**: puente hacia plataformas de mensajería
- **Tool System**: registro de más de 60 herramientas organizadas en toolsets
- **Memory System**: memoria persistente con búsqueda y resúmenes
- **Skills System**: habilidades procedimentales que el agente crea y mejora
- **Terminal Backends**: ejecución local, Docker, SSH o serverless

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[07 - IA/14 - Hermes Agent/02 - Módulo 2 - Configuración del Agente\|Módulo 2 - Configuración del Agente]] |
| **Inicio herramienta** | [[07 - IA/14 - Hermes Agent/hermes-agent\|Hermes Agent]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [Hermes Agent Docs](https://hermes-agent.ai) |

---
