# Módulo 1: Fundamentos y Primeros Pasos

**Objetivo**: Comprender qué es OpenCode, instalarlo y realizar la configuración inicial.

---

## ¿Qué es OpenCode?

### Definición
OpenCode es un **agente de codificación de IA de código abierto** que opera directamente en tu terminal. A diferencia de los asistentes basados en chat tradicionales, OpenCode es un agente con capacidad de ejecutar acciones reales en tu entorno de desarrollo.

### Diferencias clave: Chat vs. Agente
| Asistente de Chat | Agente de IA (OpenCode) |
|------------------|------------------------|
| Solo sugiere código | Lee, escribe y ejecuta código |
| No interactúa con el sistema | Ejecuta comandos en tu terminal |
| Requiere copiar/pegar manualmente | Aplica cambios directamente |
| Contexto limitado a la conversación | Puede explorar todo tu proyecto |

### Filosofía "local-first"
Tu código permanece en tu máquina. OpenCode se ejecuta localmente y se conecta a APIs de IA externas o modelos locales, pero **nunca envía tu código a servidores de OpenCode**. Todo el procesamiento se realiza en tu entorno.

---

## Instalación

### Métodos principales

```powershell
# Script (Windows PowerShell)
irm https://opencode.ai/install.ps1 | iex

# npm
npm install -g @anthropic-ai/opencode

# Homebrew (macOS/Linux)
brew install opencode

# Scoop (Windows)
scoop bucket add opencode https://github.com/anthropics/opencode
scoop install opencode
```

### Verificación
```powershell
opencode --version
```

---

## Configuración Inicial de Proveedores de IA

### Opciones disponibles
- **OpenCode Zen** (recomendado) - Experiencia optimizada sin configuración manual
- **Claude** (Anthropic) - Modelo por defecto
- **GPT** (OpenAI) - Alternativa popular
- **Gemini** (Google) - Opción gratuita
- **Modelos locales** - Ollama, LM Studio, etc.

### Proceso de autenticación
```powershell
# Configurar API Key
opencode config set ANTHROPIC_API_KEY=sk-...

# O usar variables de entorno
$env:ANTHROPIC_API_KEY = "sk-..."
```

### Solución alternativa tras bloqueo de Anthropic
Si encuentras bloqueos regionales, puedes usar:
- OpenCode Zen (ruta recomendada)
- Proveedores alternativos (GPT, Gemini)
- Modelos locales vía Ollama

---

## Primeros Pasos con un Proyecto

```powershell
# Navegar a tu proyecto
cd D:\Proyectos\MiProyecto

# Lanzar OpenCode
opencode

# Inicializar configuración del proyecto
# Esto crea el archivo opencode.json y AGENTS.md
```

### El archivo AGENTS.md
Es un archivo que le dice a OpenCode cómo comportarse en tu proyecto. Puedes definir:
- Contexto del proyecto
- Convenciones de código
- Stack tecnológico
- Instrucciones específicas

---

## Conceptos Fundamentales de la TUI

### Interfaz de Usuario de Terminal
La TUI de OpenCode está dividida en:
- **Panel de chat**: Área principal de interacción
- **Panel de herramientas**: Muestra acciones ejecutadas
- **Barra de estado**: Modo actual, modelo, proveedor

### Atajos de teclado esenciales
| Atajo | Acción |
|-------|--------|
| `Tab` | Cambiar entre modo Plan y Build |
| `Ctrl+C` | Cancelar operación actual |
| `Ctrl+L` | Limpiar pantalla |
| `Ctrl+P` | Abrir paleta de comandos |
| `Ctrl+Z` | Deshacer último cambio |

### Comandos esenciales
- `/undo` - Deshacer último cambio
- `/redo` - Rehacer cambio deshecho
- `@agente` - Mencionar un agente específico
- `/help` - Mostrar ayuda

---

## Resumen del Módulo

Al completar este módulo deberías poder:
- [ ] Explicar qué es OpenCode y su filosofía
- [ ] Instalar OpenCode en tu sistema
- [ ] Configurar un proveedor de IA
- [ ] Lanzar OpenCode en un proyecto
- [ ] Navegar la interfaz de terminal básica

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[02 - Módulo 2 - Flujo de Trabajo Básico y Modos de Operación\|Módulo 2: Flujo de Trabajo Básico y Modos de Operación]] |
| **Inicio herramienta** | [[opencode\|OpenCode]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [OpenCode Docs](https://opencode.ai) |

---
