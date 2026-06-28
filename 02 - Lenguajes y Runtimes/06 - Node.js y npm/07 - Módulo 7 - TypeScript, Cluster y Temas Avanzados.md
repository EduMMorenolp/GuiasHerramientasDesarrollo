# MÃ³dulo 7: TypeScript, Cluster y Temas Avanzados

**Objetivo**: Integrar TypeScript, escalar con cluster/worker threads y patrones avanzados.

---

## TypeScript en Node.js

### ConfiguraciÃ³n
```json
// tsconfig.json
{
    "compilerOptions": {
        "target": "ES2022",
        "module": "NodeNext",
        "moduleResolution": "NodeNext",
        "outDir": "./dist",
        "rootDir": "./src",
        "strict": true,
        "esModuleInterop": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true,
        "resolveJsonModule": true,
        "declaration": true,
        "sourceMap": true
    },
    "include": ["src/**/*"],
    "exclude": ["node_modules", "dist"]
}
```

### Tipado avanzado
```typescript
// Utility types
type User = {
    id: number;
    name: string;
    email: string;
    password: string;
};

type PublicUser = Omit<User, 'password'>;
type PartialUser = Partial<User>;
type ReadonlyUser = Readonly<User>;
type UserName = Pick<User, 'id' | 'name'>;

// GenÃ©ricos
async function fetchData<T>(url: string): Promise<T> {
    const response = await fetch(url);
    return response.json() as T;
}

const user = await fetchData<User>('/api/users/1');

// Type guards
function isError(err: unknown): err is Error {
    return err instanceof Error;
}

// Discriminated unions
type Result<T> =
    | { success: true; data: T }
    | { success: false; error: string };

function processResult<T>(result: Result<T>) {
    if (result.success) {
        console.log(result.data);
    } else {
        console.error(result.error);
    }
}
```

### Express con TypeScript
```typescript
import express, { Request, Response, NextFunction, Router } from 'express';

interface User {
    id: number;
    name: string;
}

interface CreateUserRequest extends Request {
    body: {
        name: string;
        email: string;
    };
}

const router = Router();

router.get('/users', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const users: User[] = await db.findAll();
        res.json(users);
    } catch (err) {
        next(err);
    }
});

router.post('/users', async (req: CreateUserRequest, res: Response) => {
    const { name, email } = req.body;
    const user = await db.create({ name, email });
    res.status(201).json(user);
});
```

---

## Cluster Module

```javascript
const cluster = require('cluster');
const http = require('http');
const os = require('os');

if (cluster.isPrimary) {
    const numCPUs = os.cpus().length;
    console.log(`Primary ${process.pid} is running`);
    
    // Fork workers
    for (let i = 0; i < numCPUs; i++) {
        cluster.fork();
    }
    
    cluster.on('exit', (worker, code, signal) => {
        console.log(`Worker ${worker.process.pid} died`);
        cluster.fork(); // reemplazar worker caÃ­do
    });
    
} else {
    // Workers comparten puerto 3000
    http.createServer((req, res) => {
        res.writeHead(200);
        res.end(`Worker ${process.pid} handled request\n`);
    }).listen(3000);
    
    console.log(`Worker ${process.pid} started`);
}
```

### Graceful shutdown
```javascript
if (!cluster.isPrimary) {
    process.on('SIGTERM', () => {
        console.log('Worker shutting down...');
        server.close(() => {
            process.exit(0);
        });
        // Timeout for forceful shutdown
        setTimeout(() => process.exit(1), 10000);
    });
}
```

---

## Worker Threads

Para tareas intensivas de CPU (no bloquea el Event Loop).

```javascript
// worker.js
const { parentPort } = require('worker_threads');

parentPort.on('message', (data) => {
    // CÃ¡lculo intensivo
    const result = heavyComputation(data);
    parentPort.postMessage(result);
});

// main.js
const { Worker } = require('worker_threads');

function runWorker(data) {
    return new Promise((resolve, reject) => {
        const worker = new Worker('./worker.js');
        worker.postMessage(data);
        worker.on('message', resolve);
        worker.on('error', reject);
        worker.on('exit', code => {
            if (code !== 0) reject(new Error(`Worker stopped with ${code}`));
        });
    });
}

const results = await Promise.all(
    tasks.map(task => runWorker(task))
);
```

### Thread pool
```javascript
const { Worker } = require('worker_threads');

class ThreadPool {
    constructor(workerPath, numThreads = os.cpus().length) {
        this.workers = [];
        this.queue = [];
        
        for (let i = 0; i < numThreads; i++) {
            const worker = new Worker(workerPath);
            worker.idle = true;
            worker.on('message', result => {
                worker.idle = true;
                worker.resolve(result);
                this.processQueue();
            });
            this.workers.push(worker);
        }
    }
    
    processQueue() {
        if (this.queue.length === 0) return;
        const worker = this.workers.find(w => w.idle);
        if (!worker) return;
        
        const { data, resolve } = this.queue.shift();
        worker.idle = false;
        worker.resolve = resolve;
        worker.postMessage(data);
    }
    
    execute(data) {
        return new Promise(resolve => {
            this.queue.push({ data, resolve });
            this.processQueue();
        });
    }
}
```

---

## Patrones Avanzados

### Singleton
```javascript
class Database {
    static #instance;
    
    static getInstance() {
        if (!Database.#instance) {
            Database.#instance = new Database();
        }
        return Database.#instance;
    }
    
    #connection;
    
    async connect(url) {
        this.#connection = await createConnection(url);
    }
}
```

### Observer / Event Emitter
```javascript
const EventEmitter = require('events');

class OrderService extends EventEmitter {
    createOrder(order) {
        // lÃ³gica
        this.emit('order:created', order);
    }
}

const orders = new OrderService();
orders.on('order:created', order => {
    sendEmail(order);
});
orders.on('order:created', order => {
    updateInventory(order);
});
```

### Middleware pattern
```javascript
class MiddlewarePipeline {
    constructor() {
        this.middlewares = [];
    }
    
    use(fn) {
        this.middlewares.push(fn);
    }
    
    async execute(context) {
        let index = 0;
        const next = async () => {
            if (index < this.middlewares.length) {
                await this.middlewares[index++](context, next);
            }
        };
        await next();
    }
}
```

---

## Resumen del MÃ³dulo

| Herramienta | PropÃ³sito |
|---|---|
| TypeScript | Tipado estÃ¡tico, seguridad en tiempo de compilaciÃ³n |
| Cluster | Escalar a mÃºltiples procesos CPU |
| Worker Threads | Tareas intensivas de CPU sin bloquear Event Loop |
| EventEmitter | PatrÃ³n observer |
| ThreadPool | Pool de workers reutilizables |

---
**Documentación oficial**: https://nodejs.org/docs/latest/api/

**Inicio herramienta**: [[nodejs|Node.js y npm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



