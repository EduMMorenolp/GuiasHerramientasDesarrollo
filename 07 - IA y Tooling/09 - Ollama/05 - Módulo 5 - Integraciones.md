# Módulo 5: Integraciones

**Objetivo**: Integrar Ollama con herramientas de desarrollo y entornos populares.

---

## OpenCode

OpenCode permite usar Ollama como proveedor de modelos local.

### Configuración en `opencode.json`
```json
{
  "provider": "ollama",
  "model": "llama3.2",
  "ollama": {
    "baseUrl": "http://localhost:11434",
    "model": "llama3.2"
  }
}
```

### Configuración con parámetros
```json
{
  "provider": "ollama",
  "model": "llama3.2",
  "customCommands": [
    {
      "name": "chat",
      "prompt": "Eres un asistente útil y respondes en español.",
      "model": "llama3.2"
    }
  ],
  "ollama": {
    "baseUrl": "http://localhost:11434",
    "model": "llama3.2",
    "options": {
      "temperature": 0.7,
      "top_p": 0.9,
      "num_predict": 2048
    }
  }
}
```

### Variables de entorno
```powershell
$env:OPENCODE_PROVIDER = "ollama"
$env:OPENCODE_MODEL = "llama3.2"
$env:OLLAMA_HOST = "http://localhost:11434"
```

---

## Open WebUI

Interfaz web similar a ChatGPT, auto-gestionada con Ollama.

### Instalación con Docker
```powershell
docker run -d -p 3000:8080 `
  --add-host=host.docker.internal:host-gateway `
  -v open-webui:/app/backend/data `
  --name open-webui `
  --restart always `
  ghcr.io/open-webui/open-webui:main
```

Acceder en `http://localhost:3000`. Detecta automáticamente Ollama en el host.

### Instalación directa (Python)
```powershell
# Clonar repositorio
git clone https://github.com/open-webui/open-webui.git
cd open-webui

# Ejecutar
pip install -r requirements.txt
python app.py
```

---

## Continue.dev

Extensión para VS Code y JetBrains que usa Ollama como backend.

### Configuración en VS Code (`config.json`)
```json
{
  "models": [
    {
      "title": "Llama 3.2",
      "provider": "ollama",
      "model": "llama3.2"
    },
    {
      "title": "CodeLlama",
      "provider": "ollama",
      "model": "codellama:7b"
    }
  ],
  "tabAutocompleteModel": {
    "title": "CodeLlama",
    "provider": "ollama",
    "model": "codellama:7b"
  }
}
```

### Características
- Chat contextual sobre el código
- Autocompletado de código
- Edición inline
- Soporte multi-modelo

---

## LangChain

Framework para aplicaciones con LLMs. Integración nativa con Ollama.

```python
from langchain_community.llms import Ollama

# Configurar modelo
llm = Ollama(
    model="llama3.2",
    temperature=0.7,
    base_url="http://localhost:11434"
)

# Generar texto
response = llm.invoke("¿Qué es LangChain?")
print(response)
```

### Con cadenas
```python
from langchain_core.prompts import ChatPromptTemplate
from langchain_community.llms import Ollama

llm = Ollama(model="llama3.2")
prompt = ChatPromptTemplate.from_messages([
    ("system", "Eres un experto en Python"),
    ("user", "{input}")
])

chain = prompt | llm
result = chain.invoke({"input": "Explica list comprehensions"})
```

---

## Docker

### Ejecutar Ollama en contenedor
```powershell
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

### Con modelo precargado
```dockerfile
FROM ollama/ollama

# Descargar modelo al iniciar
RUN ollama pull llama3.2

# Entrypoint por defecto
ENTRYPOINT ["ollama", "serve"]
```

### Docker Compose
```yaml
services:
  ollama:
    image: ollama/ollama
    container_name: ollama
    volumes:
      - ollama_data:/root/.ollama
    ports:
      - "11434:11434"
    restart: unless-stopped
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]

  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    ports:
      - "3000:8080"
    volumes:
      - open-webui_data:/app/backend/data
    extra_hosts:
      - "host.docker.internal:host-gateway"
    restart: unless-stopped

volumes:
  ollama_data:
  open-webui_data:
```

---

## Resumen

| Herramienta | Uso |
|-------------|-----|
| OpenCode | Asistente de código local |
| Open WebUI | Interfaz web tipo ChatGPT |
| Continue.dev | Extensión VS Code |
| LangChain | Framework para LLMs |
| Docker | Contenedor aislado |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[06 - Módulo 6 - Python y JavaScript|Módulo 6: Python y JavaScript]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
