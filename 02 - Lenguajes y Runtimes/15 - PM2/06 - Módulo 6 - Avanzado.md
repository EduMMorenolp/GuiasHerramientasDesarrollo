# Módulo 6: Avanzado

**Objetivo**: Funcionalidades avanzadas: Keymetrics, API programatica, Docker y soporte multi-lenguaje.

## Keymetrics / PM2 Plus

PM2 Plus (anteriormente Keymetrics) es una plataforma de monitorizacion remota:

```bash
pm2 plus
```

o vinculando manualmente:

```bash
pm2 link <secret-key> <public-key>
```

### Caracteristicas de PM2 Plus

| Funcionalidad | Descripcion |
|---------------|-------------|
| Dashboard web | Monitorizacion en tiempo real desde el navegador |
| Alertas | Notificaciones por email, Slack, webhook |
| Historial de metricas | CPU, memoria, request/min, latencia |
| Gestion remota | Reiniciar, detener, recargar desde la web |
| Transpilacion | Dashboard personalizable por equipo |

## PM2 API

PM2 expone una API JavaScript para controlar procesos programaticamente:

```javascript
const pm2 = require('pm2');

pm2.connect((err) => {
  if (err) {
    console.error(err);
    process.exit(2);
  }

  // Iniciar un proceso
  pm2.start({
    name: 'api-programatica',
    script: 'server.js',
    instances: 2,
    exec_mode: 'cluster',
    env: {
      NODE_ENV: 'production',
      PORT: 3000
    }
  }, (err, apps) => {
    if (err) throw err;
    console.log('App iniciada:', apps);
  });

  // Listar procesos
  pm2.list((err, list) => {
    if (err) throw err;
    console.log(list);
  });

  // Detener un proceso
  pm2.stop('api-programatica', (err) => {
    if (err) throw err;
    console.log('App detenida');
  });

  // Desconectar
  pm2.disconnect();
});
```

### Metodos principales de la API

| Metodo | Descripcion |
|--------|-------------|
| `pm2.connect(callback)` | Conecta al demonio PM2 |
| `pm2.start(options, callback)` | Inicia un proceso |
| `pm2.stop(process, callback)` | Detiene un proceso |
| `pm2.restart(process, callback)` | Reinicia un proceso |
| `pm2.delete(process, callback)` | Elimina un proceso |
| `pm2.list(callback)` | Lista procesos |
| `pm2.describe(process, callback)` | Detalles de un proceso |
| `pm2.disconnect()` | Desconecta del demonio |

## PM2 en Docker

### Dockerfile con PM2

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

RUN npm install -g pm2

EXPOSE 3000

CMD ["pm2-runtime", "start", "ecosystem.config.js", "--env", "production"]
```

Nota: En Docker se usa `pm2-runtime` en lugar de `pm2` para que el proceso se ejecute en primer plano y responda correctamente a las senales de Docker.

### docker-compose.yml

```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    restart: unless-stopped
```

### Diferencias pm2 vs pm2-runtime

| Aspecto | pm2 | pm2-runtime |
|---------|-----|-------------|
| Foreground | No | Si |
| Senales Docker | No gestionadas | Gestiona SIGTERM, SIGINT |
| Recomendado | Entornos nativos | Contenedores Docker |

## PM2 para otros lenguajes

PM2 puede gestionar procesos escritos en cualquier lenguaje:

```bash
pm2 start python app.py --name "script-python"
pm2 start ruby server.rb --name "ruby-app"
pm2 start php artisan serve --name "laravel"
pm2 start go run main.go --name "go-app"
```

Usar el interprete adecuado con la flag `--interpreter`:

```bash
pm2 start app.py --interpreter python3 --name "ml-worker"
```

## Startup script

Para que PM2 inicie automaticamente al arrancar el sistema:

```bash
pm2 startup
```

Este comando genera y configura un script de inicio (systemd, init.d, etc.) segun el SO detectado.

Guardar la lista actual de procesos para que se restauren en el proximo reinicio:

```bash
pm2 save
```

Comandos relacionados:

| Comando | Descripcion |
|---------|-------------|
| `pm2 startup` | Configura inicio automatico del sistema |
| `pm2 save` | Guarda la lista de procesos actual |
| `pm2 resurrect` | Restaura procesos guardados |
| `pm2 unstartup` | Elimina la configuracion de inicio |
| `pm2 startup systemd` | Fuerza el tipo de init system |

## Tabla resumen de caracteristicas avanzadas

| Caracteristica | Comando / Uso |
|----------------|---------------|
| Monitorizacion remota | `pm2 plus` o `pm2 link` |
| API programatica | `pm2.start()`, `pm2.list()`, etc. |
| Docker | Usar `pm2-runtime` en CMD |
| Multi-lenguaje | `pm2 start script.py --interpreter python3` |
| Startup | `pm2 startup && pm2 save` |
| Rollback deploy | `pm2 deploy production revert 1` |

---

**Documentación oficial**: https://pm2.keymetrics.io/docs/

**Inicio herramienta**: [[pm2|PM2]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
