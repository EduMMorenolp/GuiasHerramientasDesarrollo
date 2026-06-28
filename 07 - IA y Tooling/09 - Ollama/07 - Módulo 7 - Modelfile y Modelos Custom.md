# MÃ³dulo 7: Modelfile y Modelos Custom

**Objetivo**: Crear modelos personalizados con Modelfile y entender las cuantizaciones.

---

## Â¿QuÃ© es un Modelfile?

Es un archivo de configuraciÃ³n que define cÃ³mo se comporta un modelo en Ollama. Similar a un Dockerfile, permite personalizar prompts, parÃ¡metros, system messages y mÃ¡s.

### Estructura bÃ¡sica
```dockerfile
FROM llama3.2

PARAMETER temperature 0.7
PARAMETER top_p 0.9

SYSTEM "Eres un asistente experto en programaciÃ³n que responde en espaÃ±ol."

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

# Modelo con tag especÃ­fico
FROM llama3.2:1b

# Modelo local
FROM mi-modelo:latest
```

### PARAMETER
Configura parÃ¡metros de inferencia:
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
Siempre respondes en espaÃ±ol con ejemplos de cÃ³digo.
Usas markdown para formatear tus respuestas.
"""
```

### MESSAGE
AÃ±ade mensajes predefinidos al historial:
```dockerfile
MESSAGE user "Â¿QuÃ© puedes hacer?"
MESSAGE assistant "Soy un asistente experto en programaciÃ³n."
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

## Ejemplos PrÃ¡cticos

### Asistente de cÃ³digo en espaÃ±ol
```dockerfile
FROM codellama:7b

PARAMETER temperature 0.2
PARAMETER num_predict 1024

SYSTEM """
Eres un experto programador que responde en espaÃ±ol.
Proporciona cÃ³digo limpio y bien comentado.
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

SYSTEM "Eres un poeta creativo que escribe en espaÃ±ol."

TEMPLATE """
{{ .System }}

Tema: {{ .Prompt }}

Poema:
"""
```

### Asistente tÃ©cnico conciso
```dockerfile
FROM mistral:7b

PARAMETER temperature 0.3
PARAMETER num_predict 500
PARAMETER repeat_penalty 1.2

SYSTEM "Responde de forma clara, concisa y tÃ©cnica en espaÃ±ol. MÃ¡ximo 3 pÃ¡rrafos."
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

SYSTEM "Eres un asistente Ãºtil."
```

---

## Cuantizaciones

Las cuantizaciones reducen el tamaÃ±o del modelo a costa de precisiÃ³n:

| Tipo | Bits | TamaÃ±o relativo | Calidad | Uso recomendado |
|------|------|-----------------|---------|-----------------|
| `q4_0` | 4 bits | 25% | BÃ¡sica | MÃ¡ximo ahorro de RAM |
| `q4_K_M` | 4 bits | 27% | Buena | Balance calidad/tamaÃ±o |
| `q5_K_M` | 5 bits | 33% | Muy buena | Calidad alta |
| `q8_0` | 8 bits | 50% | Excelente | MÃ¡xima calidad |
| `f16` | 16 bits | 100% | Original | Hardware potente |

### Ejemplo con diferentes cuantizaciones
```powershell
# Descargar cuantizaciones especÃ­ficas
ollama pull llama3.2:q4_0
ollama pull llama3.2:q4_K_M
ollama pull llama3.2:q5_K_M
ollama pull llama3.2:q8_0
```

### Regla prÃ¡ctica
```powershell
# RAM necesaria â‰ˆ TamaÃ±o del modelo en GB
# q4_K_M: modelo 7B â‰ˆ 4 GB RAM
# q8_0: modelo 7B â‰ˆ 7 GB RAM
# f16: modelo 7B â‰ˆ 14 GB RAM
```

---

## Resumen

| InstrucciÃ³n | PropÃ³sito |
|-------------|-----------|
| `FROM` | Modelo base |
| `PARAMETER` | ConfiguraciÃ³n de inferencia |
| `TEMPLATE` | Plantilla de prompt |
| `SYSTEM` | Mensaje del sistema |
| `MESSAGE` | Historial predefinido |

| CuantizaciÃ³n | Uso |
|-------------|-----|
| `q4_K_M` | Balance calidad/tamaÃ±o (recomendado) |
| `q8_0` | MÃ¡xima calidad con ahorro moderado |
| `ollama create` | Crear modelo desde Modelfile |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[08 - MÃ³dulo 8 - Ollama Cloud|MÃ³dulo 8: Ollama Cloud]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
