# Módulo 6: Plataformas de Mensajería

**Objetivo**: Configurar el Gateway de mensajería para interactuar con Hermes Agent desde cualquier plataforma.

---

## Messaging Gateway

El Gateway de mensajería permite que Hermes Agent esté disponible en más de 20 plataformas simultáneamente.

### Plataformas soportadas

| Plataforma | Estado | Funcionalidades |
|------------|--------|-----------------|
| Telegram | Completo | DMs, grupos, voz |
| Discord | Completo | DMs, servidores, canales de voz |
| Slack | Completo | Canales, DMs |
| WhatsApp | Completo | DMs, grupos |
| Signal | Completo | DMs, grupos |
| Matrix | Completo | Salas |
| Mattermost | Completo | Canales |
| Microsoft Teams | Beta | Canales, chats |
| Google Chat | Beta | Espacios |
| Email | Completo | Recepción y envío |
| SMS | Completo | Twilio |

### Instalación del Gateway

```bash
# Asistente interactivo de configuración
hermes gateway setup

# Iniciar el gateway
hermes gateway

# Instalar como servicio del sistema
hermes gateway install
```

## Configuración de Telegram

```bash
hermes gateway setup
```

Seleccionar Telegram e ingresar el token del bot obtenido de [@BotFather](https://t.me/botfather).

## Configuración de Discord

```bash
hermes gateway setup
```

Seleccionar Discord y seguir el asistente para configurar el bot.

## Configuración WhatsApp

```bash
hermes gateway setup --platform whatsapp
```

Requiere una cuenta de negocio de WhatsApp y configurar el webhook.

## Comandos del Gateway

```bash
# Ver estado del gateway
hermes gateway status

# Reiniciar gateway
hermes gateway restart

# Ver logs
hermes gateway logs

# Añadir plataforma
hermes gateway add slack
```

## Uso diario

Una vez configurado, puedes enviar mensajes a Hermes desde cualquier plataforma conectada:

```
@hermes ¿qué tareas tengo pendientes hoy?
```

El agente responde en la misma plataforma y puede ejecutar herramientas, buscar en su memoria o delegar tareas.

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/14 - Hermes Agent/05 - Módulo 5 - Sistema de Skills\|Módulo 5 - Sistema de Skills]] |
| **Siguiente →** | [[07 - IA/14 - Hermes Agent/07 - Módulo 7 - Seguridad y Producción\|Módulo 7 - Seguridad y Producción]] |
| **Inicio herramienta** | [[07 - IA/14 - Hermes Agent/hermes-agent\|Hermes Agent]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [Hermes Agent Docs](https://hermes-agent.ai) |

---
