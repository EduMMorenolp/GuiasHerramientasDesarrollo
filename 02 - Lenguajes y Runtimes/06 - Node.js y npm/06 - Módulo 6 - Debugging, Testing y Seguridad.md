# Módulo 6: Debugging, Testing y Seguridad

**Objetivo**: Depurar aplicaciones, escribir tests y aplicar seguridad en Node.js.

---

## Debugging

### Inspector de Node.js
```javascript
// node --inspect app.js
// node --inspect-brk app.js (pausa al inicio)

// En código:
debugger;
console.log('Punto de depuración');

// Abrir en Chrome: chrome://inspect
```

### Depuración en VS Code
```json
// .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "skipFiles": ["<node_internals>/**"],
            "program": "${workspaceFolder}/app.js",
            "env": { "NODE_ENV": "development" },
            "outFiles": ["${workspaceFolder}/dist/**/*.js"]
        },
        {
            "type": "node",
            "request": "attach",
            "name": "Attach to Process",
            "port": 9229,
            "restart": true
        }
    ]
}
```

### Depuración en terminal
```bash
# node --inspect app.js
# Luego abrir en Chrome DevTools

# Debug mode con pausa inicial
node --inspect-brk app.js

# Heap snapshot
node --heapsnapshot-signal=SIGUSR2 app.js
# kill -USR2 <pid> genera un heap snapshot
```

### Performance
```javascript
const { performance } = require('perf_hooks');

const start = performance.now();
// código a medir
const duration = performance.now() - start;
console.log(`Took ${duration}ms`);

// Profiling
// node --prof app.js
// node --prof-process isolate-*.log > processed.txt
```

### Console avanzado
```javascript
console.assert(1 === 2, 'Unexpected');
console.count('label');     // contador
console.countReset('label');
console.table([{ a: 1 }, { a: 2 }]);
console.time('label');
console.timeEnd('label');
console.trace('Stack trace');
console.dir(obj, { depth: 3, colors: true });
console.group('Section');
console.groupEnd();
```

---

## Testing

### Node Test Runner (Node 20+)
```javascript
const { describe, it, before, after, mock } = require('node:test');
const assert = require('node:assert');

describe('User Service', () => {
    let users;
    
    before(() => {
        users = [{ id: 1, name: 'Alice' }];
    });
    
    after(() => {
        // cleanup
    });
    
    it('should find user by id', () => {
        const result = users.find(u => u.id === 1);
        assert.strictEqual(result.id, 1);
        assert.strictEqual(result.name, 'Alice');
    });
    
    it('should throw for missing user', () => {
        assert.throws(() => {
            findUser(999);
        }, /User not found/);
    });
    
    it('should handle async operations', async () => {
        const data = await fetchData();
        assert.ok(data.length > 0);
    });
});

// Mock functions
function fetchUser(id) {
    return { id, name: 'Alice' };
}

const mockFn = mock.fn(fetchUser);
mockFn.mock.mockImplementation(() => ({ id: 1, name: 'Mocked' }));

const result = mockFn(1);
assert.strictEqual(mockFn.mock.calls.length, 1);
```

### Jest
```javascript
const jest = require('jest');

// math.js
function add(a, b) { return a + b; }
module.exports = { add };

// math.test.js
const { add } = require('./math');

describe('Math', () => {
    it('adds 1 + 2 = 3', () => {
        expect(add(1, 2)).toBe(3);
    });
    
    it('handles negative numbers', () => {
        expect(add(-1, -2)).toBe(-3);
    });
});

// Mocks
jest.mock('./api');
const api = require('./api');
api.fetch.mockResolvedValue({ data: 'test' });
```

### Supertest (API testing)
```javascript
const request = require('supertest');
const app = require('../app');

describe('GET /api/users', () => {
    it('responds with json', async () => {
        const res = await request(app)
            .get('/api/users')
            .expect('Content-Type', /json/)
            .expect(200);
        
        expect(res.body).toBeInstanceOf(Array);
    });
});
```

---

## Seguridad

### Helmet (cabeceras HTTP seguras)
```javascript
const helmet = require('helmet');
app.use(helmet());

// Configura cabeceras:
// Content-Security-Policy
// X-Frame-Options -> DENY
// X-Content-Type-Options -> nosniff
// Strict-Transport-Security
```

### Rate limiting
```javascript
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutos
    max: 100,                  // límite por IP
    message: 'Too many requests'
});

app.use('/api/', limiter);
```

### Validación y sanitización
```javascript
const { body, validationResult } = require('express-validator');

app.post('/api/users',
    body('email').isEmail().normalizeEmail(),
    body('password').isLength({ min: 8 }),
    (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        // procesar...
    }
);
```

### Protección contra SQL Injection
```javascript
// Usar parametrización (NUNCA concatenar)
// Mal:
db.query(`SELECT * FROM users WHERE id = ${req.params.id}`);

// Bien:
db.query('SELECT * FROM users WHERE id = ?', [req.params.id]);
db.query('SELECT * FROM users WHERE id = $1', [req.params.id]);
```

### Environment variables
```javascript
require('dotenv').config();

const config = {
    port: process.env.PORT || 3000,
    dbUrl: process.env.DATABASE_URL,
    jwtSecret: process.env.JWT_SECRET // ¡Nunca hardcodear!
};
```

---

## Child Process

```javascript
const { exec, spawn, fork } = require('child_process');
const { promisify } = require('util');

// exec (sencillo, buffer en memoria)
const execAsync = promisify(exec);
const { stdout, stderr } = await execAsync('ls -la');
console.log(stdout);

// spawn (streaming, recomendado)
const child = spawn('find', ['.', '-name', '*.js']);
child.stdout.on('data', data => console.log(data.toString()));
child.stderr.on('data', data => console.error(data.toString()));
child.on('exit', code => console.log(`Exit code: ${code}`));

// fork (nuevo proceso Node.js)
// child.js
process.on('message', msg => {
    process.send({ result: msg.data * 2 });
});

// parent.js
const child = fork('./child.js');
child.send({ data: 5 });
child.on('message', msg => console.log(msg.result)); // 10
```

---

## Resumen del Módulo

| Tema | Herramienta |
|------|-------------|
| Debugging | node --inspect, Chrome DevTools, perf_hooks |
| Testing | node:test, Jest, Supertest |
| Seguridad | Helmet, express-rate-limit, dotenv |
| Child Process | spawn, exec, fork |

---

**Documentación oficial**: https://nodejs.org/docs/latest/api/

**Siguiente**: [[07 - Módulo 7 - TypeScript, Cluster y Temas Avanzados|Módulo 7: TypeScript, Cluster y Temas Avanzados]]

**Inicio herramienta**: [[nodejs|Node.js y npm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
