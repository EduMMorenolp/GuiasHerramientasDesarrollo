# Módulo 4: API REST

**Objetivo**: Conocer y utilizar la API REST de Ollama para integrar modelos en aplicaciones.

---

## Endpoints Principales

Ollama expone una API REST en `http://localhost:11434`:

| Endpoint | Método | Descripción |
|----------|--------|-------------|
| `/api/generate` | POST | Generar respuesta (completado) |
| `/api/chat` | POST | Chat con historial de mensajes |
| `/api/embeddings` | POST | Generar embeddings vectoriales |
| `/api/tags` | GET | Listar modelos disponibles |
| `/api/ps` | GET | Modelos cargados actualmente |
| `/api/pull` | POST | Descargar un modelo |
| `/api/push` | POST | Subir un modelo |
| `/api/copy` | POST | Copiar un modelo |
| `/api/delete` | DELETE | Eliminar un modelo |
| `/api/show` | POST | Mostrar detalles del modelo |

---

## /api/generate

```powershell
curl -X POST http://localhost:11434/api/generate `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"prompt\": \"¿Qué es un LLM?\", \"stream\": false}'
```

```json
{
  "model": "llama3.2",
  "response": "Un LLM (Large Language Model) es un modelo...",
  "done": true,
  "context": [1, 2, 3, ...],
  "total_duration": 1234567890,
  "load_duration": 123456,
  "prompt_eval_count": 5,
  "eval_count": 100,
  "eval_duration": 987654321
}
```

### Stream (respuesta en tiempo real)
```powershell
curl -X POST http://localhost:11434/api/generate `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"prompt\": \"Cuenta un chiste\", \"stream\": true}'
```

### Parámetros adicionales
```powershell
curl -X POST http://localhost:11434/api/generate `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"prompt\": \"Explica la IA\", \"temperature\": 0.7, \"top_p\": 0.9, \"seed\": 42, \"num_predict\": 500}'
```

---

## /api/chat

```powershell
curl -X POST http://localhost:11434/api/chat `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"messages\": [{\"role\": \"user\", \"content\": \"Hola, ¿cómo estás?\"}], \"stream\": false}'
```

```json
{
  "model": "llama3.2",
  "message": {
    "role": "assistant",
    "content": "¡Hola! Estoy muy bien, gracias por preguntar."
  },
  "done": true
}
```

### Conversación con historial
```powershell
curl -X POST http://localhost:11434/api/chat `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"messages\": [{\"role\": \"system\", \"content\": \"Eres un experto en Python\"}, {\"role\": \"user\", \"content\": \"Explica decoradores\"}], \"stream\": false}'
```

---

## /api/embeddings

```powershell
curl -X POST http://localhost:11434/api/embeddings `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"nomic-embed-text\", \"prompt\": \"El cielo es azul\"}'
```

```json
{
  "embedding": [0.123, -0.456, 0.789, ...]
}
```

---

## /api/tags

```powershell
# Listar modelos disponibles
curl http://localhost:11434/api/tags
```

```json
{
  "models": [
    {
      "name": "llama3.2:latest",
      "model": "llama3.2",
      "size": 2147483648,
      "modified_at": "2024-01-01T00:00:00Z"
    }
  ]
}
```

---

## /api/ps

```powershell
# Ver modelos cargados en memoria
curl http://localhost:11434/api/ps
```

---

## Verificar el Servidor

```powershell
# Health check simple
curl http://localhost:11434

# Respuesta: "Ollama is running"
```

---

## Resumen

| Endpoint | Uso |
|----------|-----|
| `/api/generate` | Completado de texto |
| `/api/chat` | Chat con historial |
| `/api/embeddings` | Vectores semánticos |
| `/api/tags` | Listar modelos |
| `/api/ps` | Modelos en memoria |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[05 - Módulo 5 - Integraciones|Módulo 5: Integraciones]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
