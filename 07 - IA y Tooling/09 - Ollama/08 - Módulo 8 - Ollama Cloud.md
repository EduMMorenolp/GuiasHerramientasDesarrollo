# MÃ³dulo 8: Ollama Cloud

**Objetivo**: Conocer Ollama Cloud, su modelo de suscripciÃ³n y cÃ³mo usarlo como alternativa cloud.

---

## Â¿QuÃ© es Ollama Cloud?

Ollama Cloud es el servicio cloud oficial de Ollama que permite ejecutar modelos sin necesidad de hardware local. Ofrece acceso a los mismos modelos de Ollama pero gestionados en infraestructura cloud.

### CaracterÃ­sticas
- Acceso a modelos populares (Llama 3.2, Mistral, etc.)
- API compatible con la API local de Ollama
- Sin necesidad de GPU/instalaciÃ³n local
- FacturaciÃ³n por suscripciÃ³n mensual

---

## Planes y Precios

| Plan | Precio | Modelos | LÃ­mites |
|------|--------|---------|---------|
| **Free** | $0/mes | Modelos pequeÃ±os (3B-8B) | 100 solicitudes/dÃ­a |
| **Pro** | $20/mes | Todos los modelos | Solicitudes ilimitadas |
| **Max** | $100/mes | Todos los modelos | Prioridad mÃ¡xima, sin lÃ­mites |

### Comparativa de planes

| CaracterÃ­stica | Free | Pro | Max |
|----------------|------|-----|-----|
| Modelos bÃ¡sicos | âœ“ | âœ“ | âœ“ |
| Modelos grandes (34B+) | âœ— | âœ“ | âœ“ |
| Llamadas por dÃ­a | 100 | Ilimitado | Ilimitado |
| Velocidad | EstÃ¡ndar | RÃ¡pida | Prioritaria |
| Soporte | Comunidad | Email | Prioritario |
| Uso comercial | No | SÃ­ | SÃ­ |

---

## ConfiguraciÃ³n

### Obtener API Key
1. Crear cuenta en [ollama.ai/cloud](https://ollama.ai/cloud)
2. Ir a Settings > API Keys
3. Generar nueva API key

### Usar con cURL
```powershell
curl -X POST https://api.ollama.ai/v1/chat `
  -H "Authorization: Bearer tu-api-key" `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"messages\": [{\"role\": \"user\", \"content\": \"Hola, Â¿quÃ© tal?\"}]}'
```

### Usar con Python
```python
import requests

headers = {
    "Authorization": "Bearer tu-api-key",
    "Content-Type": "application/json"
}

data = {
    "model": "llama3.2",
    "messages": [{"role": "user", "content": "Â¿QuÃ© tiempo hace?"}]
}

response = requests.post(
    "https://api.ollama.ai/v1/chat",
    headers=headers,
    json=data
)

print(response.json()["message"]["content"])
```

---

## Privacidad y Seguridad

### PolÃ­tica de datos
- **No se entrenan modelos con tus datos**: las consultas no se usan para mejorar o entrenar modelos
- **Datos en trÃ¡nsito**: cifrados con TLS/SSL
- **Datos en reposo**: cifrados en servidores
- **Cumplimiento**: GDPR, SOC 2

### Diferencias con otras APIs
| Aspecto | Ollama Cloud | OpenAI | Google AI |
|---------|-------------|--------|-----------|
| Entrenamiento con datos | No | SÃ­ (opt-out) | SÃ­ |
| Modelos | Open source | Propietarios | Propietarios |
| Precios | SuscripciÃ³n | Por token | Por token |
| Local alternativo | Ollama local | No | No |

---

## CuÃ¡ndo Usar Cloud vs Local

### Usar Cloud cuando
- No tienes GPU o RAM suficiente
- Necesitas escalar horizontalmente
- Quieres evitar gestiÃ³n de infraestructura
- Usas modelos grandes (>34B) sin hardware adecuado

### Usar Local cuando
- La privacidad es crÃ­tica (datos sensibles)
- Trabajas sin conexiÃ³n a internet
- Quieres evitar costos recurrentes
- Tienes hardware suficiente (16 GB+ RAM)
- Necesitas baja latencia

---

## Migrar de Local a Cloud

```python
import os
import ollama

# Modo local
client_local = ollama.Client(host="http://localhost:11434")

# Modo cloud
client_cloud = ollama.Client(
    host="https://api.ollama.ai",
    headers={"Authorization": f"Bearer {os.getenv('OLLAMA_API_KEY')}"}
)

# Misma interfaz para ambos
response = client_cloud.chat(
    model="llama3.2",
    messages=[{"role": "user", "content": "Â¿Cloud o local?"}]
)
```

---

## Resumen

| Aspecto | Detalle |
|---------|---------|
| **Plan Free** | $0, modelos bÃ¡sicos, 100 req/dÃ­a |
| **Plan Pro** | $20/mes, todos los modelos, ilimitado |
| **Plan Max** | $100/mes, prioridad mÃ¡xima |
| **Privacidad** | Datos no se usan para entrenar |
| **API** | Compatible con la API local |

---
**Documentación oficial**: https://github.com/ollama/ollama

**Siguiente**: [[09 - MÃ³dulo 9 - Avanzado y Troubleshooting|MÃ³dulo 9: Avanzado y Troubleshooting]]
**Inicio herramienta**: [[ollama|Ollama]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



