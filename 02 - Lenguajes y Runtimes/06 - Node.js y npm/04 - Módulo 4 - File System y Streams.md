# Módulo 4: File System y Streams

**Objetivo**: Operaciones avanzadas de sistema de archivos, streams, buffers y pipelines eficientes.

---

## Módulo fs

```javascript
const fs = require('fs');
const fsp = require('fs/promises');

// Síncrono vs Asíncrono
fs.mkdirSync('./dir', { recursive: true });
const content = fs.readFileSync('file.txt', 'utf8');

// Promises API (recomendado)
await fsp.mkdir('./dir', { recursive: true });
await fsp.writeFile('file.txt', 'content');
const data = await fsp.readFile('file.txt', 'utf8');
await fsp.appendFile('log.txt', `[${new Date()}] log entry\n`);

// File info
const stat = await fsp.stat('file.txt');
console.log(stat.size, stat.mtime, stat.isDirectory());

// Watch
const watcher = fs.watch('./', { recursive: true });
for await (const event of watcher) {
    console.log(event.eventType, event.filename);
}
```

### Operaciones avanzadas
```javascript
// Copy
await fsp.cp('source', 'dest', { recursive: true });

// Rename / Move
await fsp.rename('old.txt', 'new.txt');

// Delete
await fsp.rm('dir', { recursive: true, force: true });

// Permissions
await fsp.chmod('script.sh', 0o755);
await fsp.chown('file.txt', 1000, 1000);

// Temp files
const tmp = await fsp.mkdtemp('prefix-');
```

---

## Buffers

```javascript
// Crear buffers
const buf1 = Buffer.alloc(10, 0); // 10 bytes llenos de 0
const buf2 = Buffer.from('Hello');
const buf3 = Buffer.from([0x48, 0x65, 0x6c, 0x6c, 0x6f]);

// Operaciones
console.log(buf2.toString());      // 'Hello'
console.log(buf2.length);          // 5
console.log(buf2[0]);              // 72 (0x48)

// Slicing (no copia, comparte memoria)
const slice = buf2.subarray(0, 2);
slice[0] = 0x48; // modifica buffer original también

// Concatenar
const combined = Buffer.concat([buf2, Buffer.from(' World')]);

// Comparar
Buffer.compare(buf1, buf2);
buf1.equals(buf2);

// JSON
const json = buf2.toJSON();
```

---

## Streams

Streams permiten procesar datos por partes, sin cargar todo en memoria.

### Tipos de streams
```javascript
const { Readable, Writable, Transform, Duplex, pipeline } = require('stream');

// Readable
const readable = new Readable({
    objectMode: true,
    read(size) {
        this.push(Math.random().toString()); // push null para finalizar
    }
});

// Writable
const writable = new Writable({
    write(chunk, encoding, callback) {
        console.log(chunk.toString());
        callback();
    }
});

// Transform (Readable + Writable)
const transform = new Transform({
    transform(chunk, encoding, callback) {
        this.push(chunk.toString().toUpperCase());
        callback();
    }
});

// Duplex (ambos sentidos)
const duplex = new Duplex({
    read(size) { /* ... */ },
    write(chunk, encoding, callback) { /* ... */ }
});
```

### Streams del sistema de archivos
```javascript
const readStream = fs.createReadStream('large-file.log', {
    highWaterMark: 64 * 1024, // 64KB chunks
    encoding: 'utf8'
});

const writeStream = fs.createWriteStream('output.log');

// Pipe
readStream.pipe(writeStream);

// Pipeline (mejor, maneja errores automáticamente)
const { pipeline } = require('stream/promises');

await pipeline(
    fs.createReadStream('input.gz'),
    require('zlib').createGunzip(),
    fs.createWriteStream('output.txt')
);
```

### Streams con iteradores
```javascript
// Readable.from (array a stream)
const stream = Readable.from(['line1\n', 'line2\n', 'line3\n']);

// for-await-of con streams
const readline = require('readline');
const rl = readline.createInterface({
    input: fs.createReadStream('file.txt'),
    crlfDelay: Infinity
});

for await (const line of rl) {
    console.log('Line:', line);
}
```

### Backpressure
```javascript
// El stream maneja backpressure automáticamente
// readable.push(null) cuando no hay más datos
// writable.write() retorna false cuando el buffer está lleno
// pipe() y pipeline() manejan backpressure

const slowWritable = new Writable({
    highWaterMark: 1024, // buffer máximo
    write(chunk, encoding, callback) {
        setTimeout(callback, 100); // procesamiento lento
    }
});
```

---

## Módulo path

```javascript
const path = require('path');

// Normalizar
path.normalize('foo/bar//baz/..'); // 'foo/bar'

// Unir
path.join('/base', 'dir', 'file.txt'); // '/base/dir/file.txt'

// Resolver (absoluto)
path.resolve('dir', 'file.txt'); // 'C:\...\dir\file.txt'

// Parsear
path.parse('/dir/file.txt');
// { root: '/', dir: '/dir', base: 'file.txt', ext: '.txt', name: 'file' }

// Relativo
path.relative('/data/orig', '/data/dest/file.txt'); // '../dest/file.txt'
```

---

## Resumen del Módulo

| API | Descripción |
|-----|-------------|
| fs/promises | API asíncrona moderna |
| Streams | pipe, pipeline, Transform |
| Buffers | Buffer.alloc, Buffer.from, subarray |
| path | join, resolve, parse, relative |

---

**Documentación oficial**: https://nodejs.org/docs/latest/api/

**Siguiente**: [[05 - Módulo 5 - HTTP y Web Servers|Módulo 5: HTTP y Web Servers]]

**Inicio herramienta**: [[nodejs|Node.js y npm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
