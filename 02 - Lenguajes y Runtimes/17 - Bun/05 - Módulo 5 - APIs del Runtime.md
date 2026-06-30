# Módulo 5: APIs del Runtime

**Objetivo**: Aprender y dominar: APIs del Runtime.

## Archivos

```ts
// Leer archivo
const file = Bun.file("datos.json");
const contenido = await file.text();
const json = await file.json();

// Escribir archivo
await Bun.write("salida.txt", "contenido");
```

## SQLite nativo

```ts
const db = new Bun.SQLite("db.sqlite");
db.run("CREATE TABLE IF NOT EXISTS usuarios (id INTEGER PRIMARY KEY, nombre TEXT)");
db.run("INSERT INTO usuarios (nombre) VALUES (?)", ["Juan"]);

const rows = db.query("SELECT * FROM usuarios").all();
console.log(rows);
```

## Password hashing

```ts
const hash = await Bun.password.hash("mi-contrasena");
const esValido = await Bun.password.verify("mi-contrasena", hash);
```

## Criptografia y hashing

```ts
import { randomBytes, sha256 } from "bun:crypto";

const random = randomBytes(32);
const hash = sha256(Buffer.from("mensaje"), "hex");

// Hash rapido no criptografico
const hashRapido = Bun.hash("datos");
```

## APIs web nativas

Bun implementa las APIs web directamente sin necesidad de instalar paquetes:

```ts
const res = await fetch("https://api.example.com");
const ws = new WebSocket("wss://echo.example.com");
setTimeout(() => console.log("paso 1s"), 1000);
```

## APIs integradas

| API | Descripcion |
|---|---|
| `Bun.file(path)` | Referencia a un archivo |
| `Bun.write(path, data)` | Escritura de archivos |
| `Bun.SQLite(path)` | Base de datos SQLite integrada |
| `Bun.password.hash()` | Hash de contrasenas (bcrypt/argon2) |
| `Bun.password.verify()` | Verifica contrasena contra hash |
| `Bun.crypto` | Operaciones criptograficas |
| `Bun.hash()` | Hash no criptografico rapido |
| `fetch()` | HTTP client nativo |
| `WebSocket` | Cliente WebSocket nativo |
| `setTimeout` / `setInterval` | Temporizadores nativos |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/17 - Bun/04 - Módulo 4 - Test Runner\|Módulo 4 - Test Runner]] |
| **Siguiente →** | [[02 - Lenguajes y Runtimes/17 - Bun/06 - Módulo 6 - Servidor HTTP\|Módulo 6: Servidor HTTP]] |
| **Inicio herramienta** | [[bun\|Bun]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Bun Docs](https://bun.sh/docs) |

---
