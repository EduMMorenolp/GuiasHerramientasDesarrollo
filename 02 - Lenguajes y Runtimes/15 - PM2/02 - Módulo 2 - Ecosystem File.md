# Módulo 2: Ecosystem File

**Objetivo**: Configuracion declarativa multi-app mediante el archivo ecosystem.

## Generar el archivo ecosystem

PM2 ofrece un generador automatico:

```bash
pm2 init
```

o bien:

```bash
pm2 ecosystem
```

Esto crea un archivo `ecosystem.config.js` en el directorio actual.

## Estructura basica

```javascript
module.exports = {
  apps: [
    {
      name: 'mi-app',
      script: 'app.js',
      instances: 1,
      exec_mode: 'fork',
      env: {
        NODE_ENV: 'development',
        PORT: 3000
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 8080
      }
    }
  ]
};
```

## Propiedades principales

| Propiedad | Descripcion |
|-----------|-------------|
| `name` | Nombre del proceso |
| `script` | Ruta al archivo de entrada |
| `instances` | Numero de instancias (o `max`) |
| `exec_mode` | `fork` (defecto) o `cluster` |
| `env` | Variables de entorno para todos los entornos |
| `env_production` | Variables de entorno para produccion |
| `env_staging` | Variables de entorno para staging |
| `error_file` | Ruta del archivo de log de errores |
| `out_file` | Ruta del archivo de log de salida |
| `log_date_format` | Formato de fecha en los logs |
| `merge_logs` | Fusiona logs de cluster en un solo archivo |
| `max_memory_restart` | Limite de memoria para reinicio |
| `watch` | Habilita el modo watch |
| `ignore_watch` | Patrones a ignorar en watch |

## Variables de entorno

Se definen por bloque `env` y se activan con el flag `--env`:

```bash
pm2 start ecosystem.config.js --env production
```

```javascript
apps: [
  {
    name: 'api',
    script: 'server.js',
    env: {
      PORT: 3000,
      DB_URL: 'localhost/dev'
    },
    env_production: {
      PORT: 80,
      DB_URL: 'produccion/cluster'
    }
  }
]
```

## Logs

Configuración avanzada de logs:

```javascript
apps: [
  {
    name: 'mi-app',
    script: 'app.js',
    error_file: './logs/err.log',
    out_file: './logs/out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
    merge_logs: true
  }
]
```

## Ejemplo completo multi-app

```javascript
// ecosystem.config.js
module.exports = {
  apps: [
    {
      name: 'api',
      script: 'api/server.js',
      instances: 2,
      exec_mode: 'cluster',
      env: {
        PORT: 4000
      },
      env_production: {
        PORT: 80
      },
      error_file: './logs/api-error.log',
      out_file: './logs/api-out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss'
    },
    {
      name: 'worker',
      script: 'worker/index.js',
      instances: 1,
      exec_mode: 'fork',
      env: {
        QUEUE_URL: 'redis://localhost:6379'
      },
      env_production: {
        QUEUE_URL: 'redis://cluster:6379'
      }
    }
  ]
};
```

Iniciar ambas aplicaciones:

```bash
pm2 start ecosystem.config.js --env production
pm2 list
```

---

**Documentación oficial**: https://pm2.keymetrics.io/docs/
**Siguiente**: [[Módulo 3]]
**Inicio herramienta**: [[pm2|PM2]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
