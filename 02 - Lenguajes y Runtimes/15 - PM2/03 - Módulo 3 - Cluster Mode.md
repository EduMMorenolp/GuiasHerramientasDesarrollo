# Módulo 3: Cluster Mode

**Objetivo**: Escalado horizontal y balanceo de carga con el modo cluster de PM2.

## Configuracion basica

Para activar el modo cluster se usan dos propiedades en el ecosystem file:

```javascript
module.exports = {
  apps: [
    {
      name: 'api-cluster',
      script: 'server.js',
      instances: 'max',   // usa todos los CPUs disponibles
      exec_mode: 'cluster'
    }
  ]
};
```

Tambien se puede especificar un numero fijo:

```javascript
instances: 4   // 4 instancias
```

## Fork vs Cluster

| Caracteristica | Fork | Cluster |
|----------------|------|---------|
| Modelo | Un solo proceso | Multiples procesos (uno por CPU) |
| Aislamiento | Unico proceso | Procesos separados |
| Balanceo de carga | No | Si, round-robin |
| Uso de CPU | 1 solo nucleo | Todos los nucleos |
| Comparticion de puerto | No automatica | Si, puerto compartido |
| Recomendado para | Tareas ligeras, workers | Servidores HTTP, APIs |

## Zero-downtime reload

El comando `pm2 reload` reinicia las instancias de una en una sin interrumpir el servicio:

```bash
pm2 reload api-cluster
```

A diferencia de `pm2 restart` (detiene todas e inicia de nuevo), `reload` garantiza continuidad.

## Graceful shutdown

Para que el reload funcione correctamente, la aplicación debe gestionar la señal de apagado:

```javascript
// server.js
const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200);
  res.end('Cluster PM2\n');
});

server.listen(3000);

process.on('SIGINT', () => {
  console.log('Recibida senal SIGINT. Cerrando gracefully...');
  server.close(() => {
    process.exit(0);
  });
});
```

En el ecosystem se configura `kill_timeout` para dar tiempo a la finalización:

```javascript
module.exports = {
  apps: [
    {
      name: 'graceful-app',
      script: 'server.js',
      instances: 2,
      exec_mode: 'cluster',
      kill_timeout: 5000,        // tiempo max para graceful shutdown (ms)
      listen_timeout: 3000,       // tiempo para que la app escuche
      graceful_shutdown: true     // habilita graceful shutdown
    }
  ]
};
```

## Ejemplo completo: servidor HTTP escalable

```javascript
// server.js
const http = require('http');
const cluster = require('cluster');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    pid: process.pid,
    worker: cluster.worker ? cluster.worker.id : 'master',
    message: 'Servidor clusterizado con PM2'
  }));
});

server.listen(3000);

process.on('SIGINT', () => {
  server.close(() => process.exit(0));
});
```

Ecosystem:

```javascript
// ecosystem.config.js
module.exports = {
  apps: [
    {
      name: 'http-cluster',
      script: 'server.js',
      instances: 'max',
      exec_mode: 'cluster',
      kill_timeout: 5000,
      listen_timeout: 3000
    }
  ]
};
```

Iniciar y recargar:

```bash
pm2 start ecosystem.config.js
pm2 list
pm2 reload http-cluster
```

## Tabla comparativa fork vs cluster

| Aspecto | Fork | Cluster |
|---------|------|---------|
| exec_mode | `'fork'` | `'cluster'` |
| Puertos | No se comparten automaticamente | Se comparte el mismo puerto |
| Escalado | Manual (multiples procesos) | Automatico (round-robin) |
| Memoria | Cada proceso tiene su memoria | Memoria compartida via SO |
| Caso de uso | Workers, scripts batch | APIs REST, servidores web |
| Reinicio sin caida | No soportado nativamente | Si (`pm2 reload`) |

---

**Documentación oficial**: https://pm2.keymetrics.io/docs/
**Siguiente**: [[Módulo 4]]
**Inicio herramienta**: [[pm2|PM2]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
