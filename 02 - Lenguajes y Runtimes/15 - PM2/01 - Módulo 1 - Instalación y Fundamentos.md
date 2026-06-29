# Módulo 1: Instalación y Fundamentos

**Objetivo**: Instalar PM2, iniciar/detener procesos y gestionar el estado de las aplicaciones.

## Instalacion global

PM2 se instala via npm como paquete global:

```bash
npm install -g pm2
```

Verificar la instalacion:

```bash
pm2 --version
```

## Comandos basicos

### Iniciar una aplicacion

```bash
pm2 start app.js
```

### Listar procesos

```bash
pm2 list
```

Alias: `pm2 status`

### Detener un proceso

```bash
pm2 stop app.js
pm2 stop <id>
pm2 stop all
```

### Reiniciar un proceso

```bash
pm2 restart app.js
pm2 restart all
```

### Eliminar un proceso

```bash
pm2 delete app.js
pm2 delete <id>
pm2 delete all
```

## Flags comunes

| Flag | Descripcion |
|------|-------------|
| `--name` | Asigna un nombre personalizado al proceso |
| `--watch` | Vigila cambios en archivos y reinicia automaticamente |
| `--max-memory-restart` | Reinicia el proceso si supera el limite de memoria (ej. `200M`) |

### Ejemplos con flags

```bash
pm2 start app.js --name "mi-app" --watch --max-memory-restart 200M
```

## Ejemplo practico

```javascript
// app.js
const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hola desde PM2\n');
});

server.listen(3000, () => {
  console.log('Servidor corriendo en el puerto 3000');
});
```

Ejecutar:

```bash
pm2 start app.js --name "http-server"
pm2 list
pm2 stop http-server
pm2 delete http-server
```

## Tabla resumen de comandos

| Comando | Descripcion |
|---------|-------------|
| `pm2 start <script>` | Inicia un proceso |
| `pm2 list` | Lista todos los procesos |
| `pm2 status` | Muestra el estado de los procesos |
| `pm2 stop <id|name|all>` | Detiene uno o todos los procesos |
| `pm2 restart <id|name|all>` | Reinicia procesos |
| `pm2 delete <id|name|all>` | Elimina procesos del registro |
| `pm2 start app.js --name "x"` | Inicia con nombre personalizado |
| `pm2 start app.js --watch` | Inicia con modo watch |
| `pm2 start app.js --max-memory-restart 200M` | Limite de memoria |

---

**Documentación oficial**: https://pm2.keymetrics.io/docs/
**Siguiente**: [[02 - Lenguajes y Runtimes/15 - PM2/02 - Módulo 2 - Ecosystem File|Módulo 2]]
**Inicio herramienta**: [[pm2|PM2]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
