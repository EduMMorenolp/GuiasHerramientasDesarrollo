# Módulo 3: Asincronía y Event Loop

**Objetivo**: Dominar el modelo asíncrono de Node.js: callbacks, Promesas, async/await y el Event Loop.

---

## El Event Loop

Node.js es monohilo pero no bloqueante gracias al Event Loop.

```javascript
// Ciclo del Event Loop (orden de fases):
// 1. timers: setTimeout, setInterval
// 2. pending callbacks: I/O callbacks diferidos
// 3. idle, prepare: interno
// 4. poll: obtener nuevos eventos I/O
// 5. check: setImmediate
// 6. close callbacks: eventos close

console.log('1. Sync');

setTimeout(() => console.log('2. Timer (macrotask)'), 0);

Promise.resolve().then(() => console.log('3. Promise (microtask)'));

process.nextTick(() => console.log('4. nextTick (microtask)'));

setImmediate(() => console.log('5. setImmediate (check phase)'));

console.log('6. Sync');

// Output: 1, 6, 4, 3, 2, 5
```

### Microtasks vs Macrotasks
```javascript
// Microtasks (se ejecutan antes de la siguiente macrotask):
// - process.nextTick (prioridad máxima)
// - Promise.then/catch/finally
// - queueMicrotask
// - MutationObserver (browser)

// Macrotasks:
// - setTimeout/setInterval
// - setImmediate
// - I/O callbacks
```

---

## Callbacks

```javascript
const fs = require('fs');

// Callback hell (evitar)
fs.readFile('file1.txt', 'utf8', (err, data) => {
    if (err) throw err;
    fs.readFile('file2.txt', 'utf8', (err2, data2) => {
        if (err2) throw err2;
        fs.writeFile('combined.txt', data + data2, (err3) => {
            if (err3) throw err3;
            console.log('Done');
        });
    });
});

// Callback con error-first pattern
function readFileCallback(path, callback) {
    fs.readFile(path, 'utf8', (err, data) => {
        if (err) return callback(err);
        callback(null, data.toUpperCase());
    });
}
```

---

## Promesas

```javascript
const fs = require('fs/promises');

// Crear promesa
const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

const promise = new Promise((resolve, reject) => {
    const success = true;
    if (success) {
        resolve('OK');
    } else {
        reject(new Error('Failed'));
    }
});

// Encadenamiento
fs.readFile('file1.txt', 'utf8')
    .then(data => data.toUpperCase())
    .then(transformed => fs.writeFile('output.txt', transformed))
    .then(() => console.log('Success'))
    .catch(err => console.error('Error:', err))
    .finally(() => console.log('Cleanup'));

// Promise combinators
const p1 = Promise.resolve(1);
const p2 = delay(100).then(() => 2);
const p3 = Promise.resolve(3);

Promise.all([p1, p2, p3]).then(results => console.log(results));
// [1, 2, 3] - todas deben resolver

Promise.allSettled([p1, Promise.reject('err'), p3]).then(results =>
    results.forEach(r => console.log(r.status, r.value || r.reason))
);

Promise.race([p1, delay(50).then(() => 'fast')]).then(console.log);
// Resuelve con la primera que complete

Promise.any([Promise.reject(1), delay(10).then(() => 'ok')])
    .then(console.log);
// Resuelve con la primera que resuelva exitosamente
```

---

## Async / Await

```javascript
const fs = require('fs/promises');

async function processFiles() {
    try {
        const data1 = await fs.readFile('file1.txt', 'utf8');
        const data2 = await fs.readFile('file2.txt', 'utf8');
        
        await fs.writeFile('combined.txt', data1 + data2);
        console.log('Files combined');
    } catch (err) {
        console.error('Error:', err.message);
    } finally {
        console.log('Cleanup');
    }
}

// Paralelismo con async/await
async function parallelRead() {
    const [data1, data2] = await Promise.all([
        fs.readFile('file1.txt', 'utf8'),
        fs.readFile('file2.txt', 'utf8')
    ]);
    return data1 + data2;
}

// Async iterator
async function* asyncGenerator() {
    let i = 0;
    while (i < 3) {
        await delay(100);
        yield i++;
    }
}

async function consume() {
    for await (const value of asyncGenerator()) {
        console.log(value); // 0, 1, 2
    }
}
```

---

## process.nextTick vs setImmediate

```javascript
// nextTick: antes de la siguiente fase del Event Loop
// setImmediate: en la fase check (después de poll)

function apiCall(callback) {
    // Usar nextTick para garantizar callback asíncrono
    process.nextTick(() => {
        callback(null, 'result');
    });
}

// setImmediate es útil para I/O diferido
const fs = require('fs');
fs.readFile('file.txt', () => {
    setTimeout(() => console.log('timer'));
    setImmediate(() => console.log('immediate')); // se ejecuta primero
});
```

---

## Resumen del Módulo

| Concepto | Uso |
|----------|-----|
| Event Loop | Fases: timers â†’ pending â†’ poll â†’ check â†’ close |
| Microtasks | nextTick > Promise.then > queueMicrotask |
| Promesas | async/await, Promise.all, Promise.allSettled |
| Async iterators | for-await-of, async generators |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/06 - Node.js y npm/02 - Módulo 2 - npm Scripts y Publicación\|Módulo 2 - npm Scripts y Publicación]] |
| **Siguiente →** | [[04 - Módulo 4 - File System y Streams\|Módulo 4: File System y Streams]] |
| **Inicio herramienta** | [[nodejs\|Node.js y npm]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Node.js y npm Docs](https://nodejs.org/docs/latest/api/) |

---
