# Módulo 4: Monitoreo y Logs

**Objetivo**: Monitoreo en tiempo real y gestion de logs de las aplicaciones gestionadas por PM2.

## Dashboard interactivo

El comando `pm2 monit` abre un dashboard en terminal con informacion en tiempo real:

```bash
pm2 monit
```

Muestra:
- Uso de CPU y memoria por proceso
- Logs en vivo
- Estado de cada aplicacion

## Visualizacion de logs

### Ver logs en tiempo real

```bash
pm2 logs
```

### Logs de una app especifica

```bash
pm2 logs api
```

### Ver ultimas N lineas

```bash
pm2 logs --lines 100
```

### Logs con marcas de tiempo

```bash
pm2 logs --timestamp
```

### Limpiar logs

```bash
pm2 flush
```

Elimina todos los archivos de log acumulados.

## Informacion detallada de procesos

### Mostrar metadatos de una app

```bash
pm2 show api
```

Proporciona:
- Estado de ejecucion
- Ruta del script
- Argumentos pasados
- Variables de entorno
- Uso de recursos
- Logs paths
- Tiempo de actividad

### Listado con metadatos

```bash
pm2 list
```

Muestra: id, name, mode, status, cpu, memory, uptime, restarts.

### Descripcion detallada

```bash
pm2 describe api
```

Similar a `pm2 show`, con informacion extendida del proceso.

## Metricas avanzadas

### Listado en formato JSON

```bash
pm2 prettylist
```

Devuelve toda la informacion de los procesos en JSON formateado, util para integracion con herramientas externas.

### Monitoreo personalizado

```bash
pm2 start app.js --name "api" --log-date-format "YYYY-MM-DD HH:mm:ss"
```

## Rotacion de logs

El Módulo `pm2-logrotate` automatiza la rotacion de logs para evitar que crezcan indefinidamente:

```bash
pm2 install pm2-logrotate
```

Configuracion recomendada:

```bash
pm2 set pm2-logrotate:max_size 10M
pm2 set pm2-logrotate:retain 7
pm2 set pm2-logrotate:compress true
pm2 set pm2-logrotate:dateFormat YYYY-MM-DD
```

| Variable | Defecto | Descripcion |
|----------|---------|-------------|
| `max_size` | `10M` | Tamano maximo antes de rotar |
| `retain` | `30` | Numero de archivos rotados a conservar |
| `compress` | `false` | Comprimir logs rotados (gzip) |
| `dateFormat` | `YYYY-MM-DD` | Formato de fecha en el nombre |
| `workerInterval` | `30` | Segundos entre verificaciones |
| `rotateInterval` | `0 0 * * *` | Cron para rotacion programada |

## Tabla de comandos de monitoreo

| Comando | Descripcion |
|---------|-------------|
| `pm2 monit` | Dashboard interactivo en terminal |
| `pm2 logs` | Logs en tiempo real |
| `pm2 logs --lines 100` | Muestra las ultimas 100 lineas |
| `pm2 logs --timestamp` | Logs con marca de tiempo |
| `pm2 flush` | Limpia todos los logs acumulados |
| `pm2 show <app>` | Metadatos detallados de una app |
| `pm2 describe <app>` | Descripcion extendida del proceso |
| `pm2 list` | Listado basico con estado y recursos |
| `pm2 prettylist` | Listado en formato JSON |
| `pm2 install pm2-logrotate` | Instala Módulo de rotacion de logs |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/15 - PM2/03 - Módulo 3 - Cluster Mode\|Módulo 3 - Cluster Mode]] |
| **Siguiente →** | [[02 - Lenguajes y Runtimes/15 - PM2/05 - Módulo 5 - Deploy y CI-CD\|Módulo 5]] |
| **Inicio herramienta** | [[pm2\|PM2]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [PM2 Docs](https://pm2.keymetrics.io/docs/) |

---
