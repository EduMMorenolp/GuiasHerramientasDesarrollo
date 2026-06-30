# Módulo 1: Fundamentos e Instalación

**Objetivo**: Comprender qué es Ollama, instalarlo y ejecutar tu primer modelo local.

---

## ¿Qué es Ollama?

Ollama es una herramienta open source que permite ejecutar modelos de lenguaje grandes (LLMs) de forma local, sin depender de servicios cloud. Proporciona una interfaz sencilla para descargar, gestionar y ejecutar modelos como Llama 3.2, Mistral, CodeLlama y cientos más.

### Ventajas
- **Privacidad**: tus datos nunca salen de tu máquina
- **Sin costos**: no hay tarifas por uso de API
- **Offline**: funciona sin conexión a internet
- **Open source**: auditado por la comunidad

---

## Instalación

### Windows (PowerShell)
```powershell
# Descargar e instalar automáticamente
irm https://ollama.com/install.ps1 | iex

# Verificar instalación
ollama --version
```

### macOS
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

### Linux
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

---

## Ejecutar tu Primer Modelo

```powershell
# Descargar y ejecutar Llama 3.2 (modelo por defecto)
ollama run llama3.2

# Una vez dentro del prompt interactivo:
# - Escribe tu consulta y presiona Enter
# - /bye para salir
# - /? para ver todos los comandos disponibles
```

Comandos dentro del prompt:
| Comando | Descripción |
|---------|-------------|
| `/bye` | Salir del prompt |
| `/help` | Ayuda general |
| `/?` | Lista de comandos |
| `/clear` | Limpiar contexto |
| `/show` | Info del modelo actual |

---

## Variables de Entorno

Ollama se configura mediante variables de entorno:

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| `OLLAMA_HOST` | Dirección y puerto del servidor | `127.0.0.1:11434` |
| `OLLAMA_MODELS` | Ruta donde se almacenan los modelos | `~/.ollama/models/` |
| `OLLAMA_ORIGINS` | Orígenes CORS permitidos | `*` |
| `OLLAMA_NUM_PARALLEL` | Solicitudes paralelas máximas | `1` |

```powershell
# Configurar en PowerShell
$env:OLLAMA_HOST = "0.0.0.0:11434"

# O hacerlo persistente
[System.Environment]::SetEnvironmentVariable("OLLAMA_HOST","0.0.0.0:11434","User")
```

---

## Almacenamiento de Modelos

Los modelos se descargan en:
```
~/.ollama/models/
```

Cada modelo se compone de:
- **Blobs**: archivos binarios con los pesos del modelo
- **Manifests**: metadatos del modelo (template, parámetros)
- **Config**: configuración del Modelfile

```powershell
# Ver dónde se almacenan los modelos
ollama show llama3.2

# Ruta por defecto en Windows
C:\Users\TuUsuario\.ollama\models\
```

---

## Resumen

| Concepto | Descripción |
|----------|-------------|
| **Ollama** | Herramienta open source para LLMs locales |
| **Instalación** | `irm https://ollama.com/install.ps1 | iex` |
| **Ejecutar modelo** | `ollama run llama3.2` |
| **Salir** | `/bye` |
| **Variables** | `OLLAMA_HOST`, `OLLAMA_MODELS` |
| **Modelos** | Almacenados en `~/.ollama/models/` |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[02 - Módulo 2 - Gestión de Modelos\|Módulo 2: Gestión de Modelos]] |
| **Inicio herramienta** | [[ollama\|Ollama]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Ollama Docs](https://github.com/ollama/ollama) |

---
