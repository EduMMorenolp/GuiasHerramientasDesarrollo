# Módulo 2: Gateway y Canales

**Objetivo**: Configurar el Gateway de OpenClaw y conectar canales de mensajería.

---

## El proceso Gateway

El Gateway es el proceso central de OpenClaw. Gestiona la autenticación, el enrutamiento de mensajes, las herramientas y las sesiones.

### Comandos del Gateway

```bash
# Ver estado
openclaw gateway status

# Iniciar Gateway
openclaw gateway start

# Detener Gateway
openclaw gateway stop

# Reiniciar Gateway
openclaw gateway restart

# Ver logs
openclaw gateway logs

# Abrir dashboard
openclaw dashboard
```

## Canales disponibles

| Canal | Tipo | Funcionalidades |
|-------|------|-----------------|
| Telegram | Bot | DMs, grupos, canales |
| Discord | Bot | DMs, servidores |
| WhatsApp | Business API | DMs, grupos |
| Slack | App | Canales, DMs |
| Signal | Bridge | DMs, grupos |
| iMessage | Native | DMs |
| Matrix | Bridge | Salas |
| Microsoft Teams | App | Canales, chats |
| Google Chat | App | Espacios |
| Zalo | Bridge | DMs, grupos |
| WebChat | Integrado | Chat en navegador |

## Configuración de Telegram

```bash
openclaw channel add telegram
```

Obtén un token de [@BotFather](https://t.me/botfather) e ingrésalo cuando el asistente lo solicite.

## Configuración de Discord

```bash
openclaw channel add discord
```

Crea una aplicación en el [Portal de Desarrolladores de Discord](https://discord.com/developers/applications) y configura el token del bot.

## Pairing y seguridad

El sistema de pairing controla quién puede enviar mensajes al agente:

```bash
# Generar código de pairing
openclaw pairing generate

# Listar dispositivos vinculados
openclaw pairing list

# Revocar un dispositivo
openclaw pairing revoke <id>
```

## Configuración por canal

```yaml
# Ejemplo de configuración de canales
channels:
  telegram:
    enabled: true
    bot_token: "token"
    allowed_users:
      - "username1"
  discord:
    enabled: true
    bot_token: "token"
    servers:
      - "server_id"
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[07 - IA/15 - OpenClaw/01 - Módulo 1 - Instalación y Fundamentos\|Módulo 1 - Instalación y Fundamentos]] |
| **Siguiente →** | [[07 - IA/15 - OpenClaw/03 - Módulo 3 - Herramientas y Skills\|Módulo 3 - Herramientas y Skills]] |
| **Inicio herramienta** | [[07 - IA/15 - OpenClaw/openclaw\|OpenClaw]] |
| **Inicio principal** | [[../../00 - Índice/Índice General|Índice General]] |
| **Documentación oficial** | [OpenClaw Docs](https://openclaw.ai) |

---
