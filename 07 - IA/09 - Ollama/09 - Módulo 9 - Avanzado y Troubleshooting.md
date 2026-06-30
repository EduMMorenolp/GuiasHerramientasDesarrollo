# Módulo 9: Avanzado y Troubleshooting

**Objetivo**: Configuración avanzada, aceleración GPU y resolución de problemas comunes.

---

## Aceleración por GPU

### NVIDIA CUDA
Ollama usa CUDA automáticamente si detecta una GPU NVIDIA compatible.

```powershell
# Verificar GPU NVIDIA
nvidia-smi

# Variables para GPU
$env:CUDA_VISIBLE_DEVICES = "0"  # Usar GPU específica
$env:OLLAMA_CUDA = "1"           # Forzar CUDA

# Ejecutar con GPU explícita
ollama serve
```

Requisitos:
- CUDA Toolkit 11.8+
- GPU con 6 GB+ VRAM (para modelos 7B)
- Drivers NVIDIA actualizados

### AMD ROCm
```powershell
# Verificar GPU AMD
rocm-smi

# Variables para ROCm
$env:HSA_OVERRIDE_GFX_VERSION = "10.3.0"  # Según GPU
$env:OLLAMA_ROCM = "1"                    # Forzar ROCm
```

Requisitos:
- ROCm 5.7+
- GPU AMD RX 6000+ o MI series
- Linux recomendado (soporte limitado en Windows)

### Apple Metal (macOS)
```bash
# Ollama usa Metal automáticamente en Mac
# Verificar Metal
system_profiler SPDisplaysDataType | grep Metal

# Forzar CPU (si hay problemas de memoria)
OLLAMA_METAL=0 ollama serve
```

---

## Docker en Producción

### Con GPU NVIDIA
```powershell
# Instalar NVIDIA Container Toolkit
winget install Nvidia.NvidiaContainerToolkit

# Ejecutar con GPU
docker run -d --gpus all `
  -v ollama:/root/.ollama `
  -p 11434:11434 `
  --restart always `
  --name ollama `
  ollama/ollama
```

### Docker Compose producción
```yaml
services:
  ollama:
    image: ollama/ollama
    container_name: ollama
    volumes:
      - ollama_data:/root/.ollama
    ports:
      - "11434:11434"
    restart: always
    environment:
      - OLLAMA_NUM_PARALLEL=4
      - OLLAMA_MAX_LOADED_MODELS=2
      - OLLAMA_HOST=0.0.0.0:11434
    deploy:
      resources:
        limits:
          memory: 32G
        reservations:
          memory: 16G
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]

volumes:
  ollama_data:
```

---

## Variables de Entorno Avanzadas

| Variable | Descripción | Valor recomendado |
|----------|-------------|-------------------|
| `OLLAMA_NUM_PARALLEL` | Solicitudes paralelas simultáneas | `2-4` |
| `OLLAMA_MAX_LOADED_MODELS` | Modelos máximos en memoria | `1-3` |
| `OLLAMA_KEEP_ALIVE` | Tiempo que el modelo permanece cargado | `5m` o `-1` (siempre) |
| `OLLAMA_FLASH_ATTENTION` | Flash Attention (modelos compatibles) | `1` |
| `OLLAMA_LLM_LIBRARY` | Backend de inferencia | `auto`, `cuda`, `rocm` |
| `OLLAMA_DEBUG` | Modo depuración | `1` |
| `OLLAMA_VERBOSE` | Logs detallados | `1` |

```powershell
# Ejemplo configuración para servidor
$env:OLLAMA_NUM_PARALLEL = "4"
$env:OLLAMA_MAX_LOADED_MODELS = "2"
$env:OLLAMA_KEEP_ALIVE = "10m"
$env:OLLAMA_FLASH_ATTENTION = "1"
ollama serve
```

---

## Logs y Monitoreo

### Windows
```powershell
# Ver logs en tiempo real
ollama serve

# Redirigir logs a archivo
ollama serve > ollama.log 2>&1

# Ver logs del servicio (si instalado como servicio)
Get-Content "$env:USERPROFILE\.ollama\logs\server.log" -Tail 50
```

### Linux/macOS
```bash
# Logs del servicio systemd
journalctl -u ollama -f

# Logs directos
tail -f ~/.ollama/logs/server.log

# Con docker
docker logs -f ollama
```

---

## Troubleshooting Común

### Error: "model requires more system memory"
```powershell
# Causa: No hay suficiente RAM
# Solución: Usar modelo más pequeño o cuantización

# Verificar memoria disponible
systeminfo | findstr "Memoria"

# Probar con cuantización
ollama pull llama3.2:1b  # En lugar de 3B
```

### Error: "CUDA error: out of memory"
```powershell
# Causa: VRAM insuficiente
# Solución: Usar cuantización más agresiva

ollama pull llama3.2:q4_K_M  # En lugar de f16
ollama run llama3.2:q4_K_M
```

### Error: "connection refused"
```powershell
# Causa: Servidor no iniciado
# Solución: Iniciar servidor

# Iniciar servidor explícitamente
ollama serve

# Verificar que está corriendo
curl http://localhost:11434
```

### Error: "context deadline exceeded"
```powershell
# Causa: Timeout en inferencia
# Solución: Aumentar timeout

curl -X POST http://localhost:11434/api/generate `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"prompt\": \"...\", \"options\": {\"num_predict\": 2048}}' `
  --timeout 120
```

### Slow inference
```powershell
# Causas posibles:
# 1. Sin GPU
# 2. Modelo muy grande para el hardware
# 3. Muchos modelos cargados

# Soluciones:
# - Usar modelo más pequeño
# - Cerrar otros modelos
# - Verificar uso de GPU
nvidia-smi -l 1

# - Reducir num_predict
ollama run llama3.2 --num-predict 512
```

### Error: "invalid model name"
```powershell
# Causa: Modelo no existe
# Solución: Verificar nombre exacto

# Listar modelos disponibles
ollama list

# Buscar modelo en biblioteca
ollama pull llama3.2  # Usar nombre exacto
```

---

## Mejores Prácticas

### Producción
- Usar Docker con restart always
- Configurar OLLAMA_NUM_PARALLEL según hardware
- Monitorear uso de RAM/VRAM
- Usar volúmenes persistentes
- Configurar health checks

### Rendimiento
- Preferir q4_K_M sobre q4_0
- Mantener un solo modelo cargado a la vez
- Usar GPU dedicada cuando sea posible
- Ajustar keep_alive según patrón de uso

---

## Resumen

| Problema | Solución |
|----------|----------|
| **Sin GPU** | Usar modelos pequeños o cloud |
| **Out of memory** | Cuantización q4_K_M |
| **Slow** | Reducir num_predict, cerrar modelos |
| **Connection refused** | Iniciar `ollama serve` |
| **Timeout** | Aumentar --timeout en curl |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/09 - Ollama/08 - Módulo 8 - Ollama Cloud\|Módulo 8 - Ollama Cloud]] |
| **Siguiente →** | — |
| **Inicio herramienta** | [[ollama\|Ollama]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Ollama Docs](https://github.com/ollama/ollama) |

---
