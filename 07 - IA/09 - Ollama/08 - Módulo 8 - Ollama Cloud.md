# Módulo 8: Ollama Cloud

**Objetivo**: Conocer Ollama Cloud, su modelo de suscripción y cómo usarlo como alternativa cloud.

---

## ¿Qué es Ollama Cloud?

Ollama Cloud es el servicio cloud oficial de Ollama que permite ejecutar modelos sin necesidad de hardware local. Ofrece acceso a los mismos modelos de Ollama pero gestionados en infraestructura cloud.

### Características
- Acceso a modelos populares (Llama 3.2, Mistral, etc.)
- API compatible con la API local de Ollama
- Sin necesidad de GPU/instalación local
- Facturación por suscripción mensual

---

## Planes y Precios

| Plan | Precio | Modelos | Límites |
|------|--------|---------|---------|
| **Free** | $0/mes | Modelos pequeños (3B-8B) | 100 solicitudes/día |
| **Pro** | $20/mes | Todos los modelos | Solicitudes ilimitadas |
| **Max** | $100/mes | Todos los modelos | Prioridad máxima, sin límites |

### Comparativa de planes

| Característica | Free | Pro | Max |
|----------------|------|-----|-----|
| Modelos básicos | âœ“ | âœ“ | âœ“ |
| Modelos grandes (34B+) | âœ— | âœ“ | âœ“ |
| Llamadas por día | 100 | Ilimitado | Ilimitado |
| Velocidad | Estándar | Rápida | Prioritaria |
| Soporte | Comunidad | Email | Prioritario |
| Uso comercial | No | Sí | Sí |

---

## Configuración

### Obtener API Key
1. Crear cuenta en [ollama.ai/cloud](https://ollama.ai/cloud)
2. Ir a Settings > API Keys
3. Generar nueva API key

### Usar con cURL
```powershell
curl -X POST https://api.ollama.ai/v1/chat `
  -H "Authorization: Bearer tu-api-key" `
  -H "Content-Type: application/json" `
  -d '{\"model\": \"llama3.2\", \"messages\": [{\"role\": \"user\", \"content\": \"Hola, ¿qué tal?\"}]}'
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
    "messages": [{"role": "user", "content": "¿Qué tiempo hace?"}]
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

### Política de datos
- **No se entrenan modelos con tus datos**: las consultas no se usan para mejorar o entrenar modelos
- **Datos en tránsito**: cifrados con TLS/SSL
- **Datos en reposo**: cifrados en servidores
- **Cumplimiento**: GDPR, SOC 2

### Diferencias con otras APIs
| Aspecto | Ollama Cloud | OpenAI | Google AI |
|---------|-------------|--------|-----------|
| Entrenamiento con datos | No | Sí (opt-out) | Sí |
| Modelos | Open source | Propietarios | Propietarios |
| Precios | Suscripción | Por token | Por token |
| Local alternativo | Ollama local | No | No |

---

## Cuándo Usar Cloud vs Local

### Usar Cloud cuando
- No tienes GPU o RAM suficiente
- Necesitas escalar horizontalmente
- Quieres evitar gestión de infraestructura
- Usas modelos grandes (>34B) sin hardware adecuado

### Usar Local cuando
- La privacidad es crítica (datos sensibles)
- Trabajas sin conexión a internet
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
    messages=[{"role": "user", "content": "¿Cloud o local?"}]
)
```

---

## Resumen

| Aspecto | Detalle |
|---------|---------|
| **Plan Free** | $0, modelos básicos, 100 req/día |
| **Plan Pro** | $20/mes, todos los modelos, ilimitado |
| **Plan Max** | $100/mes, prioridad máxima |
| **Privacidad** | Datos no se usan para entrenar |
| **API** | Compatible con la API local |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/09 - Ollama/07 - Módulo 7 - Modelfile y Modelos Custom\|Módulo 7 - Modelfile y Modelos Custom]] |
| **Siguiente →** | [[09 - Módulo 9 - Avanzado y Troubleshooting\|Módulo 9: Avanzado y Troubleshooting]] |
| **Inicio herramienta** | [[ollama\|Ollama]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Ollama Docs](https://github.com/ollama/ollama) |

---
