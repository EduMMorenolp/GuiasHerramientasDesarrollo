# Módulo 2: Gestión de Modelos

**Objetivo**: Aprender a gestionar, parametrizar y versionar modelos en Ollama.

---

## Comandos Básicos

### Pull (Descargar)
```powershell
# Descargar un modelo
ollama pull llama3.2

# Descargar una versión específica
ollama pull llama3.2:1b
ollama pull llama3.2:3b

# Descargar desde otro registro
ollama pull registry.ollama.ai/library/mistral:7b
```

### List
```powershell
# Listar modelos descargados
ollama list

# Salida típica:
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

# Ver parámetros
ollama show llama3.2 --parameters

# Ver template
ollama show llama3.2 --template

# Ver system prompt
ollama show llama3.2 --system
```

### Run
```powershell
# Ejecutar con parámetros inline
ollama run llama3.2 "Explica qué es un LLM"

# Con parámetros avanzados
ollama run llama3.2 --temperature 0.7 --top-p 0.9
```

---

## Parámetros de Inferencia

| Parámetro | Descripción | Rango | Valor por defecto |
|-----------|-------------|-------|-------------------|
| `temperature` | Creatividad de la respuesta | 0.0 - 2.0 | 0.8 |
| `top_p` | Muestreo núcleo (cumulative) | 0.0 - 1.0 | 0.9 |
| `top_k` | Top K sampling | 0 - 100 | 40 |
| `num_predict` | Máximo de tokens a generar | 1 - 2048+ | 128 |
| `stop` | Secuencias de parada | lista | `[]` |
| `repeat_penalty` | Penalización por repetición | 0.0 - 2.0 | 1.1 |
| `seed` | Semilla para reproducibilidad | int | 0 |

### Ejemplos prácticos
```powershell
# Respuesta creativa (temperatura alta)
ollama run llama3.2 --temperature 1.5 "Inventa un cuento corto"

# Respuesta precisa (temperatura baja)
ollama run llama3.2 --temperature 0.1 "¿Cuál es la capital de Francia?"

# Código más determinista
ollama run codellama:7b --temperature 0.2 --seed 42 "Función para ordenar array"
```

---

## Tags y Versiones

Los modelos se organizan con tags, similar a Docker:

```powershell
# Formato: nombre:tag
ollama pull llama3.2:1b       # 1B parámetros
ollama pull llama3.2:3b       # 3B parámetros
ollama pull llama3.2:latest   # Ãšltima versión disponible

# Ver modelos disponibles con tags
ollama list
```

### Tags comunes
| Tag | Significado |
|-----|-------------|
| `latest` | Ãšltima versión estable |
| `:1b`, `:3b`, `:7b` | Tamaño del modelo (parámetros) |
| `:q4_0`, `:q8_0` | Cuantización |
| `:text` | Solo texto (sin visión) |
| `:instruct` | Optimizado para instrucciones |

---

## Resumen

| Comando | Descripción |
|---------|-------------|
| `ollama pull` | Descargar modelo |
| `ollama list` | Listar modelos locales |
| `ollama rm` | Eliminar modelo |
| `ollama cp` | Copiar modelo |
| `ollama show` | Mostrar detalles |
| `ollama run` | Ejecutar modelo |

| Parámetro | Uso |
|-----------|-----|
| `--temperature` | Control de creatividad |
| `--top-p` | Muestreo acumulativo |
| `--seed` | Reproducibilidad |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[03 - Módulo 3 - Modelos Populares|Módulo 3: Modelos Populares]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
