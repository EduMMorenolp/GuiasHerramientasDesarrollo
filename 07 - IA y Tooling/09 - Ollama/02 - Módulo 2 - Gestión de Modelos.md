# MÃ³dulo 2: GestiÃ³n de Modelos

**Objetivo**: Aprender a gestionar, parametrizar y versionar modelos en Ollama.

---

## Comandos BÃ¡sicos

### Pull (Descargar)
```powershell
# Descargar un modelo
ollama pull llama3.2

# Descargar una versiÃ³n especÃ­fica
ollama pull llama3.2:1b
ollama pull llama3.2:3b

# Descargar desde otro registro
ollama pull registry.ollama.ai/library/mistral:7b
```

### List
```powershell
# Listar modelos descargados
ollama list

# Salida tÃ­pica:
# NAME               ID            SIZE      MODIFIED
# llama3.2:latest    abc123...     2.0 GB    2 days ago
# mistral:7b         def456...     4.1 GB    5 days ago
```

### Remove
```powershell
# Eliminar un modelo
ollama rm llama3.2:1b

# Eliminar todos los modelos (no recomendado)
ollama rm -a
```

### Copy
```powershell
# Clonar un modelo con otro nombre
ollama cp llama3.2:latest mi-modelo:test
```

### Show
```powershell
# Ver detalles del modelo
ollama show llama3.2

# Ver solo el Modelfile
ollama show llama3.2 --modelfile

# Ver parÃ¡metros
ollama show llama3.2 --parameters

# Ver template
ollama show llama3.2 --template

# Ver system prompt
ollama show llama3.2 --system
```

### Run
```powershell
# Ejecutar con parÃ¡metros inline
ollama run llama3.2 "Explica quÃ© es un LLM"

# Con parÃ¡metros avanzados
ollama run llama3.2 --temperature 0.7 --top-p 0.9
```

---

## ParÃ¡metros de Inferencia

| ParÃ¡metro | DescripciÃ³n | Rango | Valor por defecto |
|-----------|-------------|-------|-------------------|
| `temperature` | Creatividad de la respuesta | 0.0 - 2.0 | 0.8 |
| `top_p` | Muestreo nÃºcleo (cumulative) | 0.0 - 1.0 | 0.9 |
| `top_k` | Top K sampling | 0 - 100 | 40 |
| `num_predict` | MÃ¡ximo de tokens a generar | 1 - 2048+ | 128 |
| `stop` | Secuencias de parada | lista | `[]` |
| `repeat_penalty` | PenalizaciÃ³n por repeticiÃ³n | 0.0 - 2.0 | 1.1 |
| `seed` | Semilla para reproducibilidad | int | 0 |

### Ejemplos prÃ¡cticos
```powershell
# Respuesta creativa (temperatura alta)
ollama run llama3.2 --temperature 1.5 "Inventa un cuento corto"

# Respuesta precisa (temperatura baja)
ollama run llama3.2 --temperature 0.1 "Â¿CuÃ¡l es la capital de Francia?"

# CÃ³digo mÃ¡s determinista
ollama run codellama:7b --temperature 0.2 --seed 42 "FunciÃ³n para ordenar array"
```

---

## Tags y Versiones

Los modelos se organizan con tags, similar a Docker:

```powershell
# Formato: nombre:tag
ollama pull llama3.2:1b       # 1B parÃ¡metros
ollama pull llama3.2:3b       # 3B parÃ¡metros
ollama pull llama3.2:latest   # Ãšltima versiÃ³n disponible

# Ver modelos disponibles con tags
ollama list
```

### Tags comunes
| Tag | Significado |
|-----|-------------|
| `latest` | Ãšltima versiÃ³n estable |
| `:1b`, `:3b`, `:7b` | TamaÃ±o del modelo (parÃ¡metros) |
| `:q4_0`, `:q8_0` | CuantizaciÃ³n |
| `:text` | Solo texto (sin visiÃ³n) |
| `:instruct` | Optimizado para instrucciones |

---

## Resumen

| Comando | DescripciÃ³n |
|---------|-------------|
| `ollama pull` | Descargar modelo |
| `ollama list` | Listar modelos locales |
| `ollama rm` | Eliminar modelo |
| `ollama cp` | Copiar modelo |
| `ollama show` | Mostrar detalles |
| `ollama run` | Ejecutar modelo |

| ParÃ¡metro | Uso |
|-----------|-----|
| `--temperature` | Control de creatividad |
| `--top-p` | Muestreo acumulativo |
| `--seed` | Reproducibilidad |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[03 - MÃ³dulo 3 - Modelos Populares|MÃ³dulo 3: Modelos Populares]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
