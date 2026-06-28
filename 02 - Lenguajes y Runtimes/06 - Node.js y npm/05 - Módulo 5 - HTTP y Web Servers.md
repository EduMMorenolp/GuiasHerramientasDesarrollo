# MÃ³dulo 5: HTTP y Web Servers

**Objetivo**: Crear servidores HTTP, APIs REST, WebSockets y consumir servicios web.

---

## MÃ³dulo http/https

```javascript
const http = require('http');

// Servidor bÃ¡sico
const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello World\n');
});

server.listen(3000, () => {
    console.log('Server running on port 3000');
});

// Parsear request
const server = http.createServer((req, res) => {
    const { method, url, headers } = req;
    
    // Body
    let body = '';
    req.on('data', chunk => body += chunk);
    req.on('end', () => {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ method, url, headers, body }));
    });
});

// Hacer peticiones HTTP
const options = {
    hostname: 'api.example.com',
    port: 443,
    path: '/data',
    method: 'GET',
    headers: { 'Authorization': 'Bearer token' }
};

const req = http.request(options, res => {
    let data = '';
    res.on('data', chunk => data += chunk);
    res.on('end', () => console.log(JSON.parse(data)));
});
req.end();
```

---

## Express.js

```javascript
const express = require('express');
const app = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(require('cors')());

// Logging middleware
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

// Routes
app.get('/api/users', async (req, res) => {
    try {
        const users = await db.find();
        res.json(users);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get('/api/users/:id', (req, res) => {
    res.json({ id: req.params.id, query: req.query });
});

app.post('/api/users', (req, res) => {
    res.status(201).json(req.body);
});

app.put('/api/users/:id', (req, res) => {
    res.json({ updated: req.params.id, ...req.body });
});

app.delete('/api/users/:id', (req, res) => {
    res.status(204).send();
});

// Router modular
const router = express.Router();
router.get('/posts', (req, res) => res.json([]));
router.post('/posts', (req, res) => res.status(201).json(req.body));
app.use('/api', router);

// Error handling
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: 'Internal Server Error' });
});

app.listen(3000);
```

### API REST completa (patrones)
```javascript
// CRUD con validaciÃ³n
const Joi = require('joi');
const userSchema = Joi.object({
    name: Joi.string().min(2).required(),
    email: Joi.string().email().required()
});

app.post('/api/users', async (req, res, next) => {
    const { error, value } = userSchema.validate(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    try {
        const user = await db.create(value);
        res.status(201).json(user);
    } catch (err) {
        next(err);
    }
});
```

---

## WebSockets

```javascript
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', ws => {
    console.log('Client connected');
    
    ws.on('message', message => {
        console.log('Received:', message.toString());
        // Broadcast a todos los clientes
        wss.clients.forEach(client => {
            if (client.readyState === WebSocket.OPEN) {
                client.send(`Echo: ${message}`);
            }
        });
    });
    
    ws.on('close', () => console.log('Client disconnected'));
    
    ws.send('Welcome!');
});

// Cliente
const ws = new WebSocket('ws://localhost:8080');
ws.on('open', () => ws.send('Hello'));
ws.on('message', data => console.log(data.toString()));
```

---

## Peticiones HTTP (cliente moderno)

```javascript
// fetch nativo (Node 18+)
const response = await fetch('https://api.github.com/users/octocat');
const data = await response.json();
console.log(data.login);

// POST
await fetch('https://api.example.com/data', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ key: 'value' })
});

// axios
const axios = require('axios');
const { data } = await axios.get('https://api.example.com/data', {
    params: { limit: 10 },
    headers: { 'Authorization': 'Bearer token' }
});

// got
const got = require('got');
const { body } = await got('https://api.example.com').json();
```

---

## HTTPS

```javascript
const https = require('https');
const fs = require('fs');

const options = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
};

https.createServer(options, (req, res) => {
    res.writeHead(200);
    res.end('Secure server\n');
}).listen(443);
```

---

## Resumen del MÃ³dulo

| Herramienta | Uso |
|---|---|
| http.createServer | Servidor HTTP nativo |
| Express | Framework web con middleware |
| WebSocket | ComunicaciÃ³n bidireccional |
| fetch / axios | Peticiones HTTP |

---

**DocumentaciÃ³n oficial**: https://nodejs.org/docs/latest/api/

**Siguiente**: [[06 - MÃ³dulo 6 - Debugging, Testing y Seguridad|MÃ³dulo 6: Debugging, Testing y Seguridad]]

**Inicio herramienta**: [[nodejs|Node.js y npm]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
