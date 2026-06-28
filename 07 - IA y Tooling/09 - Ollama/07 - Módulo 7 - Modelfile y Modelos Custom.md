# Módulo 7: Modelfile y Modelos Custom

**Objetivo**: Crear modelos personalizados con Modelfile y entender las cuantizaciones.

---

## ¿Qué es un Modelfile?

Es un archivo de configuración que define cómo se comporta un modelo en Ollama. Similar a un Dockerfile, permite personalizar prompts, parámetros, system messages y más.

### Estructura básica
```dockerfile
FROM llama3.2

PARAMETER temperature 0.7
PARAMETER top_p 0.9

SYSTEM "Eres un asistente experto en programación que responde en español."

TEMPLATE """{{ .System }}
{{ .Prompt }}
"""
```

---

## Instrucciones del Modelfile

### FROM (obligatorio)
Define el modelo base:
```dockerfile
# Modelo oficial
FROM llama3.2

# Modelo con tag específico
FROM llama3.2:1b

# Modelo local
FROM mi-modelo:latest
```

### PARAMETER
Configura parámetros de inferencia:
```dockerfile
PARAMETER temperature 0.7
PARAMETER top_p 0.9
PARAMETER top_k 40
PARAMETER num_predict 2048
PARAMETER seed 42
PARAMETER stop "</s>"
PARAMETER repeat_penalty 1.1
```

### TEMPLATE
Define la plantilla de prompt:
```dockerfile
TEMPLATE """
{{- if .System }}
<|system|>
{{ .System }}
<|end|>
{{- end }}
<|user|>
{{ .Prompt }}
<|end|>
<|assistant|>
"""
```

### SYSTEM
Mensaje del sistema (personalidad):
```dockerfile
SYSTEM """
Eres un asistente experto en Python y JavaScript.
Siempre respondes en español con ejemplos de código.
Usas markdown para formatear tus respuestas.
"""
```

### MESSAGE
Añade mensajes predefinidos al historial:
```dockerfile
MESSAGE user "¿Qué puedes hacer?"
MESSAGE assistant "Soy un asistente experto en programación."
```

### LICENSE
Define la licencia del modelo:
```dockerfile
LICENSE """
MIT License
Copyright (c) 2024
"""
```

---

## Ejemplos Prácticos

### Asistente de código en español
```dockerfile
FROM codellama:7b

PARAMETER temperature 0.2
PARAMETER num_predict 1024

SYSTEM """
Eres un experto programador que responde en español.
Proporciona código limpio y bien comentado.
Explica las soluciones paso a paso.
Usa ejemplos concretos.
"""

TEMPLATE """
{{ .System }}

Usuario: {{ .Prompt }}

Asistente:
"""
```

### Chat creativo
```dockerfile
FROM llama3.2

PARAMETER temperature 1.2
PARAMETER top_p 0.95
PARAMETER num_predict 2048

SYSTEM "Eres un poeta creativo que escribe en español."

TEMPLATE """
{{ .System }}

Tema: {{ .Prompt }}

Poema:
"""
```

### Asistente técnico conciso
```dockerfile
FROM mistral:7b

PARAMETER temperature 0.3
PARAMETER num_predict 500
PARAMETER repeat_penalty 1.2

SYSTEM "Responde de forma clara, concisa y técnica en español. Máximo 3 párrafos."
```

---

## Crear un Modelo Custom

```powershell
# Crear el Modelfile (ej: Modelfile)
notepad Modelfile

# Crear el modelo a partir del Modelfile
ollama create mi-asistente -f Modelfile

# Ver el modelo creado
ollama list

# Ejecutarlo
ollama run mi-asistente

# Ver el Modelfile del modelo
ollama show mi-asistente --modelfile
```

### Desde un GGUF
```dockerfile
FROM ./ruta/al/modelo.gguf

PARAMETER temperature 0.7
PARAMETER num_predict 2048

SYSTEM "Eres un asistente útil."
```

---

## Cuantizaciones

Las cuantizaciones reducen el tamaño del modelo a costa de precisión:

| Tipo | Bits | Tamaño relativo | Calidad | Uso recomendado |
|------|------|-----------------|---------|-----------------|
| `q4_0` | 4 bits | 25% | Básica | Máximo ahorro de RAM |
| `q4_K_M` | 4 bits | 27% | Buena | Balance calidad/tamaño |
| `q5_K_M` | 5 bits | 33% | Muy buena | Calidad alta |
| `q8_0` | 8 bits | 50% | Excelente | Máxima calidad |
| `f16` | 16 bits | 100% | Original | Hardware potente |

### Ejemplo con diferentes cuantizaciones
```powershell
# Descargar cuantizaciones específicas
ollama pull llama3.2:q4_0
ollama pull llama3.2:q4_K_M
ollama pull llama3.2:q5_K_M
ollama pull llama3.2:q8_0
```

### Regla práctica
```powershell
# RAM necesaria â‰ˆ Tamaño del modelo en GB
# q4_K_M: modelo 7B â‰ˆ 4 GB RAM
# q8_0: modelo 7B â‰ˆ 7 GB RAM
# f16: modelo 7B â‰ˆ 14 GB RAM
```

---

## Resumen

| Instrucción | Propósito |
|-------------|-----------|
| `FROM` | Modelo base |
| `PARAMETER` | Configuración de inferencia |
| `TEMPLATE` | Plantilla de prompt |
| `SYSTEM` | Mensaje del sistema |
| `MESSAGE` | Historial predefinido |

| Cuantización | Uso |
|-------------|-----|
| `q4_K_M` | Balance calidad/tamaño (recomendado) |
| `q8_0` | Máxima calidad con ahorro moderado |
| `ollama create` | Crear modelo desde Modelfile |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[08 - Módulo 8 - Ollama Cloud|Módulo 8: Ollama Cloud]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
