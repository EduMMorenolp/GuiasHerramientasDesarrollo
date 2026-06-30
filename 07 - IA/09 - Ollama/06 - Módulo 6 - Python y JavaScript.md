# Módulo 6: Python y JavaScript

**Objetivo**: Usar las librerías oficiales de Ollama para Python y JavaScript.

---

## Python (ollama-python)

### Instalación
```powershell
pip install ollama
```

### Chat básico
```python
import ollama

response = ollama.chat(
    model="llama3.2",
    messages=[
        {"role": "user", "content": "¿Qué es un LLM?"}
    ]
)

print(response["message"]["content"])
```

### Chat con historial
```python
import ollama

messages = [
    {"role": "system", "content": "Eres un experto en Python"},
    {"role": "user", "content": "¿Qué es un decorador?"}
]

response = ollama.chat(model="llama3.2", messages=messages)
print(response["message"]["content"])
```

### Streaming
```python
import ollama

stream = ollama.chat(
    model="llama3.2",
    messages=[{"role": "user", "content": "Cuenta una historia corta"}],
    stream=True
)

for chunk in stream:
    print(chunk["message"]["content"], end="", flush=True)
```

### Generate (completado simple)
```python
import ollama

response = ollama.generate(
    model="llama3.2",
    prompt="Python es un lenguaje",
    options={"temperature": 0.7, "num_predict": 100}
)

print(response["response"])
```

### Embeddings
```python
import ollama

response = ollama.embeddings(
    model="nomic-embed-text",
    prompt="El cielo es azul y las nubes son blancas"
)

embedding = response["embedding"]
print(f"Dimensión del embedding: {len(embedding)}")
print(f"Primeros 5 valores: {embedding[:5]}")
```

### Cliente personalizado
```python
import ollama

client = ollama.Client(host="http://localhost:11434")

# Listar modelos
models = client.list()
for model in models["models"]:
    print(model["name"])

# Pull modelo
client.pull("llama3.2")

# Chat con cliente
response = client.chat(
    model="llama3.2",
    messages=[{"role": "user", "content": "Hola"}]
)
```

### AsyncIO
```python
import asyncio
import ollama

async def chat():
    client = ollama.AsyncClient()
    response = await client.chat(
        model="llama3.2",
        messages=[{"role": "user", "content": "Dime un dato curioso"}]
    )
    print(response["message"]["content"])

asyncio.run(chat())
```

---

## JavaScript (ollama-js)

### Instalación
```powershell
npm install ollama
```

### Chat básico
```javascript
import ollama from "ollama";

const response = await ollama.chat({
    model: "llama3.2",
    messages: [{ role: "user", content: "¿Qué es un LLM?" }]
});

console.log(response.message.content);
```

### Streaming
```javascript
import ollama from "ollama";

const stream = await ollama.chat({
    model: "llama3.2",
    messages: [{ role: "user", content: "Explica la IA en 3 párrafos" }],
    stream: true
});

for await (const chunk of stream) {
    process.stdout.write(chunk.message.content);
}
```

### Generate
```javascript
import ollama from "ollama";

const response = await ollama.generate({
    model: "llama3.2",
    prompt: "El futuro de la IA",
    options: { temperature: 0.8 }
});

console.log(response.response);
```

### Embeddings
```javascript
import ollama from "ollama";

const response = await ollama.embeddings({
    model: "nomic-embed-text",
    prompt: "Machine learning es fascinante"
});

console.log(response.embedding);
```

### Cliente con configuración
```javascript
import ollama from "ollama";

const client = new ollama.Ollama({
    host: "http://localhost:11434"
});

const response = await client.chat({
    model: "llama3.2",
    messages: [{ role: "user", content: "Hola" }]
});
```

### Listar modelos
```javascript
import ollama from "ollama";

const list = await ollama.list();
list.models.forEach(m => console.log(m.name));
```

---

## Comparativa Python vs JavaScript

| Característica | Python | JavaScript |
|----------------|--------|------------|
| Chat | `ollama.chat()` | `ollama.chat()` |
| Streaming | `stream=True` | `stream: true` |
| Generate | `ollama.generate()` | `ollama.generate()` |
| Embeddings | `ollama.embeddings()` | `ollama.embeddings()` |
| Async | `AsyncClient` | Nativo (Promise) |
| Cliente | `ollama.Client(host)` | `new ollama.Ollama({host})` |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/09 - Ollama/05 - Módulo 5 - Integraciones\|Módulo 5 - Integraciones]] |
| **Siguiente →** | [[07 - Módulo 7 - Modelfile y Modelos Custom\|Módulo 7: Modelfile y Modelos Custom]] |
| **Inicio herramienta** | [[ollama\|Ollama]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Ollama Docs](https://github.com/ollama/ollama) |

---
