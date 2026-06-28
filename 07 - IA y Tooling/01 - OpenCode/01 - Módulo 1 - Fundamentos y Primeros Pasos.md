# MÃ³dulo 1: Fundamentos y Primeros Pasos

**Objetivo**: Comprender quÃ© es OpenCode, instalarlo y realizar la configuraciÃ³n inicial.

---

## Â¿QuÃ© es OpenCode?

### DefiniciÃ³n
OpenCode es un **agente de codificaciÃ³n de IA de cÃ³digo abierto** que opera directamente en tu terminal. A diferencia de los asistentes basados en chat tradicionales, OpenCode es un agente con capacidad de ejecutar acciones reales en tu entorno de desarrollo.

### Diferencias clave: Chat vs. Agente
| Asistente de Chat | Agente de IA (OpenCode) |
|------------------|------------------------|
| Solo sugiere cÃ³digo | Lee, escribe y ejecuta cÃ³digo |
| No interactÃºa con el sistema | Ejecuta comandos en tu terminal |
| Requiere copiar/pegar manualmente | Aplica cambios directamente |
| Contexto limitado a la conversaciÃ³n | Puede explorar todo tu proyecto |

### FilosofÃ­a "local-first"
Tu cÃ³digo permanece en tu mÃ¡quina. OpenCode se ejecuta localmente y se conecta a APIs de IA externas o modelos locales, pero **nunca envÃ­a tu cÃ³digo a servidores de OpenCode**. Todo el procesamiento se realiza en tu entorno.

---

## InstalaciÃ³n

### MÃ©todos principales

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

### VerificaciÃ³n
```powershell
opencode --version
```

---

## ConfiguraciÃ³n Inicial de Proveedores de IA

### Opciones disponibles
- **OpenCode Zen** (recomendado) - Experiencia optimizada sin configuraciÃ³n manual
- **Claude** (Anthropic) - Modelo por defecto
- **GPT** (OpenAI) - Alternativa popular
- **Gemini** (Google) - OpciÃ³n gratuita
- **Modelos locales** - Ollama, LM Studio, etc.

### Proceso de autenticaciÃ³n
```powershell
# Configurar API Key
opencode config set ANTHROPIC_API_KEY=sk-...

# O usar variables de entorno
$env:ANTHROPIC_API_KEY = "sk-..."
```

### SoluciÃ³n alternativa tras bloqueo de Anthropic
Si encuentras bloqueos regionales, puedes usar:
- OpenCode Zen (ruta recomendada)
- Proveedores alternativos (GPT, Gemini)
- Modelos locales vÃ­a Ollama

---

## Primeros Pasos con un Proyecto

```powershell
# Navegar a tu proyecto
cd D:\Proyectos\MiProyecto

# Lanzar OpenCode
opencode

# Inicializar configuraciÃ³n del proyecto
# Esto crea el archivo opencode.json y AGENTS.md
```

### El archivo AGENTS.md
Es un archivo que le dice a OpenCode cÃ³mo comportarse en tu proyecto. Puedes definir:
- Contexto del proyecto
- Convenciones de cÃ³digo
- Stack tecnolÃ³gico
- Instrucciones especÃ­ficas

---

## Conceptos Fundamentales de la TUI

### Interfaz de Usuario de Terminal
La TUI de OpenCode estÃ¡ dividida en:
- **Panel de chat**: Ãrea principal de interacciÃ³n
- **Panel de herramientas**: Muestra acciones ejecutadas
- **Barra de estado**: Modo actual, modelo, proveedor

### Atajos de teclado esenciales
| Atajo | AcciÃ³n |
|-------|--------|
| `Tab` | Cambiar entre modo Plan y Build |
| `Ctrl+C` | Cancelar operaciÃ³n actual |
| `Ctrl+L` | Limpiar pantalla |
| `Ctrl+P` | Abrir paleta de comandos |
| `Ctrl+Z` | Deshacer Ãºltimo cambio |

### Comandos esenciales
- `/undo` - Deshacer Ãºltimo cambio
- `/redo` - Rehacer cambio deshecho
- `@agente` - Mencionar un agente especÃ­fico
- `/help` - Mostrar ayuda

---

## Resumen del MÃ³dulo

Al completar este mÃ³dulo deberÃ­as poder:
- [ ] Explicar quÃ© es OpenCode y su filosofÃ­a
- [ ] Instalar OpenCode en tu sistema
- [ ] Configurar un proveedor de IA
- [ ] Lanzar OpenCode en un proyecto
- [ ] Navegar la interfaz de terminal bÃ¡sica

---

**Documentación oficial**: https://opencode.ai
**Siguiente**: [[02 - MÃ³dulo 2 - Flujo de Trabajo BÃ¡sico y Modos de OperaciÃ³n|MÃ³dulo 2: Flujo de Trabajo BÃ¡sico y Modos de OperaciÃ³n]]
**Inicio herramienta**: [[opencode|OpenCode]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
