# Módulo 3: Modelos Populares

**Objetivo**: Conocer los modelos más populares disponibles en Ollama y cómo elegir según tu hardware.

---

## Principales Modelos

| Modelo | Parámetros | Tamaño | RAM/VRAM mínima | Ideal para |
|--------|------------|--------|-----------------|------------|
| **Llama 3.2** | 1B / 3B | 0.7 GB / 2.0 GB | 4 GB | Uso general, rápido |
| **Mistral** | 7B | 4.1 GB | 8 GB | Texto general, instructivo |
| **CodeLlama** | 7B / 34B | 3.8 GB / 19 GB | 8 GB / 24 GB | Generación de código |
| **DeepSeek Coder** | 6.7B / 33B | 3.9 GB / 20 GB | 8 GB / 24 GB | Programación avanzada |
| **Qwen 2.5** | 7B / 32B | 4.2 GB / 19 GB | 8 GB / 24 GB | Multilingüe, razonamiento |
| **Phi-3** | 3.8B | 2.3 GB | 4 GB | Edge, dispositivos limitados |
| **Gemma 2** | 2B / 9B | 1.6 GB / 5.5 GB | 4 GB / 8 GB | Texto, investigación |
| **Llama 3.2 Vision** | 11B | 7.2 GB | 12 GB | Imagen + texto |
| **Nomic Embed Text** | 137M | 0.1 GB | 2 GB | Embeddings/texto |

### Detalles por modelo

**Llama 3.2** (Meta)
```powershell
ollama pull llama3.2          # 3B (por defecto)
ollama pull llama3.2:1b       # 1B, ultra rápido
ollama pull llama3.2:3b       # 3B, balance calidad/velocidad
```
Modelo más versátil. Excelente relación calidad-rendimiento.

**Mistral** (Mistral AI)
```powershell
ollama pull mistral           # 7B
ollama pull mistral:7b        # Explícito
```
Rápido y preciso. Muy popular para asistentes conversacionales.

**CodeLlama** (Meta)
```powershell
ollama pull codellama         # 7B
ollama pull codellama:34b     # 34B, más preciso
```
Especializado en generación y comprensión de código.

**DeepSeek Coder** (DeepSeek)
```powershell
ollama pull deepseek-coder    # 6.7B
ollama pull deepseek-coder:33b
```
Excelente para programación, soporta múltiples lenguajes.

**Qwen 2.5** (Alibaba)
```powershell
ollama pull qwen2.5:7b
ollama pull qwen2.5:32b
```
Muy bueno en tareas multilingüe, incluyendo español.

**Phi-3** (Microsoft)
```powershell
ollama pull phi3
```
Modelo pequeño pero potente. Ideal para dispositivos con recursos limitados.

**Gemma 2** (Google)
```powershell
ollama pull gemma2:2b
ollama pull gemma2:9b
```
Modelo de investigación de Google. Buen rendimiento en tareas generales.

**Llama 3.2 Vision** (Meta)
```powershell
ollama pull llama3.2-vision:11b
```
Procesa imágenes además de texto. Ideal para descripción de imágenes.

**Nomic Embed Text** (Nomic)
```powershell
ollama pull nomic-embed-text  # 137M
```
Modelo de embeddings para búsqueda semántica y RAG.

---

## Cómo Elegir según tu Hardware

### 4 GB RAM (equipos básicos)
- Llama 3.2 1B
- Phi-3 3.8B
- Gemma 2 2B
- Nomic Embed Text

### 8 GB RAM (equipo estándar)
- Llama 3.2 3B
- Mistral 7B
- CodeLlama 7B
- Qwen 2.5 7B
- Gemma 2 9B

### 16 GB RAM (buen equipo)
- DeepSeek Coder 16B
- Llama 3.2 Vision 11B
- Qwen 2.5 14B

### 24+ GB RAM (workstation/servidor)
- CodeLlama 34B
- DeepSeek Coder 33B
- Qwen 2.5 32B

### Regla general
```powershell
# Los modelos ocupan aproximadamente:
# Parámetros Ã— 2 = GB en RAM/VRAM (FP16)
# Ej: 7B Ã— 2 = ~14 GB (sin cuantizar)
# Con cuantización Q4: Ã· 4 â‰ˆ 3.5 GB
```

---

## Resumen

| Criterio | Recomendación |
|----------|---------------|
| **Rápido y ligero** | Llama 3.2 1B, Phi-3 |
| **Mejor calidad general** | Mistral 7B, Llama 3.2 3B |
| **Programación** | CodeLlama 7B, DeepSeek Coder |
| **Multilingüe** | Qwen 2.5 7B |
| **Visión** | Llama 3.2 Vision 11B |
| **Embeddings** | Nomic Embed Text |

---

**Documentación oficial**: https://github.com/ollama/ollama
**Siguiente**: [[04 - Módulo 4 - API REST|Módulo 4: API REST]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
