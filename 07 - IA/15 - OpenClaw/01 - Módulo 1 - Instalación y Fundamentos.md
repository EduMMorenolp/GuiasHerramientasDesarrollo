# Módulo 1: Instalación y Fundamentos

**Objetivo**: Instalar OpenClaw, ejecutar el onboarding y realizar la primera conversación.

---

## ¿Qué es OpenClaw?

OpenClaw es un gateway auto-gestionado de código abierto (MIT) que conecta aplicaciones de mensajería con asistentes de IA. Un solo proceso Gateway sirve como puente entre tus apps de mensajería y un asistente de IA siempre disponible. Está construido principalmente en TypeScript.

Características clave:
- Multi-canal: un Gateway sirve múltiples plataformas simultáneamente
- Auto-gestionado: se ejecuta en tu propio hardware
- Nativo para agentes: construido para agentes de codificación con herramientas, sesiones, memoria y enrutamiento multi-agente
- Sistema de plugins extensible
- Automatización con cron, heartbeat y tareas programadas

## Instalación

### macOS / Linux

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
```

### Windows (PowerShell)

```powershell
iwr -useb https://openclaw.ai/install.ps1 | iex
```

### npm

```bash
npm install -g openclaw@latest
```

### Docker

```bash
docker run openclaw/openclaw
```

## Onboarding

```bash
openclaw onboard --install-daemon
```

El asistente guía en:
1. Elección del proveedor de modelos (Anthropic, OpenAI, Google, etc.)
2. Configuración de la API key
3. Configuración del Gateway
4. Instalación como servicio del sistema

## Primera conversación

### Verificar que el Gateway está activo

```bash
openclaw gateway status
```

Debería mostrar el Gateway escuchando en el puerto 18789.

### Abrir el panel de control

```bash
openclaw dashboard
```

Abre la interfaz web del Control UI en el navegador.

### Enviar el primer mensaje

Escribe un mensaje en el Control UI. El agente debería responder usando el modelo configurado.

## Requisitos del sistema

- Node.js 22.19+ (Node 24 recomendado)
- macOS, Linux o Windows
- API key de un proveedor de modelos

## Arquitectura general

OpenClaw se compone de:
- **Gateway**: proceso central que gestiona canales, herramientas y sesiones
- **Control UI**: interfaz web para administración
- **Harnesses**: adaptadores para diferentes modelos (Claude, Codex, Genérico)
- **Plugins**: extensiones que añaden herramientas, canales y proveedores
- **Workspace**: directorio de trabajo con skills, configuración y archivos
