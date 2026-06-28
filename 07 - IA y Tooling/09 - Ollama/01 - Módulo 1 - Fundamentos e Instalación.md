# MÃ³dulo 1: Fundamentos e InstalaciÃ³n

**Objetivo**: Comprender quÃ© es Ollama, instalarlo y ejecutar tu primer modelo local.

---

## Â¿QuÃ© es Ollama?

Ollama es una herramienta open source que permite ejecutar modelos de lenguaje grandes (LLMs) de forma local, sin depender de servicios cloud. Proporciona una interfaz sencilla para descargar, gestionar y ejecutar modelos como Llama 3.2, Mistral, CodeLlama y cientos mÃ¡s.

### Ventajas
- **Privacidad**: tus datos nunca salen de tu mÃ¡quina
- **Sin costos**: no hay tarifas por uso de API
- **Offline**: funciona sin conexiÃ³n a internet
- **Open source**: auditado por la comunidad

---

## InstalaciÃ³n

### Windows (PowerShell)
```powershell
# Descargar e instalar automÃ¡ticamente
irm https://ollama.com/install.ps1 | iex

# Verificar instalaciÃ³n
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
| Comando | DescripciÃ³n |
|---------|-------------|
| `/bye` | Salir del prompt |
| `/help` | Ayuda general |
| `/?` | Lista de comandos |
| `/clear` | Limpiar contexto |
| `/show` | Info del modelo actual |

---

## Variables de Entorno

Ollama se configura mediante variables de entorno:

| Variable | DescripciÃ³n | Valor por defecto |
|----------|-------------|-------------------|
| `OLLAMA_HOST` | DirecciÃ³n y puerto del servidor | `127.0.0.1:11434` |
| `OLLAMA_MODELS` | Ruta donde se almacenan los modelos | `~/.ollama/models/` |
| `OLLAMA_ORIGINS` | OrÃ­genes CORS permitidos | `*` |
| `OLLAMA_NUM_PARALLEL` | Solicitudes paralelas mÃ¡ximas | `1` |

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
- **Manifests**: metadatos del modelo (template, parÃ¡metros)
- **Config**: configuraciÃ³n del Modelfile

```powershell
# Ver dÃ³nde se almacenan los modelos
ollama show llama3.2

# Ruta por defecto en Windows
C:\Users\TuUsuario\.ollama\models\
```

---

## Resumen

| Concepto | DescripciÃ³n |
|----------|-------------|
| **Ollama** | Herramienta open source para LLMs locales |
| **InstalaciÃ³n** | `irm https://ollama.com/install.ps1 | iex` |
| **Ejecutar modelo** | `ollama run llama3.2` |
| **Salir** | `/bye` |
| **Variables** | `OLLAMA_HOST`, `OLLAMA_MODELS` |
| **Modelos** | Almacenados en `~/.ollama/models/` |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[02 - MÃ³dulo 2 - GestiÃ³n de Modelos|MÃ³dulo 2: GestiÃ³n de Modelos]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
