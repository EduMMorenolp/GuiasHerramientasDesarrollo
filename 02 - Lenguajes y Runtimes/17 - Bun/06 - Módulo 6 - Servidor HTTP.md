# Módulo 6: Servidor HTTP

**Objetivo**: Aprender y dominar: Servidor HTTP.

## Servidor basico

```ts
Bun.serve({
  port: 3000,
  fetch(request) {
    return new Response("Hola desde Bun!");
  },
});

console.log("Servidor en http://localhost:3000");
```

## Routing manual

```ts
Bun.serve({
  port: 3000,
  fetch(request) {
    const url = new URL(request.url);

    switch (url.pathname) {
      case "/":
        return new Response("Inicio");
      case "/api/usuarios":
        return Response.json([{ id: 1, nombre: "Juan" }]);
      default:
        return new Response("No encontrado", { status: 404 });
    }
  },
});
```

## WebSockets

```ts
Bun.serve({
  port: 3000,
  fetch(request, server) {
    if (server.upgrade(request)) return;
    return new Response("No es WebSocket");
  },
  websocket: {
    message(ws, message) {
      ws.send(`Recibido: ${message}`);
    },
  },
});
```

## Middleware simple

```ts
const logger = (req: Request) => {
  console.log(`${req.method} ${req.url}`);
};

Bun.serve({
  port: 3000,
  fetch(request) {
    logger(request);
    return new Response("OK");
  },
});
```

## Ejemplo API REST completa

```ts
interface Usuario {
  id: number;
  nombre: string;
}

const usuarios: Usuario[] = [];

Bun.serve({
  port: 3000,
  async fetch(request) {
    const url = new URL(request.url);

    if (url.pathname === "/api/usuarios" && request.method === "GET") {
      return Response.json(usuarios);
    }

    if (url.pathname === "/api/usuarios" && request.method === "POST") {
      const body = await request.json();
      usuarios.push({ id: usuarios.length + 1, nombre: body.nombre });
      return Response.json({ exito: true }, { status: 201 });
    }

    return new Response("No encontrado", { status: 404 });
  },
});
```

## Opciones de servidor

| Opcion | Descripcion |
|---|---|
| `port` | Puerto del servidor |
| `fetch` | Manejador de peticiones HTTP |
| `websocket` | Configuracion de WebSocket |
| `tls` | Configuracion TLS/SSL |
| `error` | Manejador de errores |
| `hostname` | Host al que vincularse (por defecto 0.0.0.0) |

---

**Documentación oficial**: https://bun.sh/docs
**Siguiente**: [[Módulo 7: Avanzado]]
**Inicio herramienta**: [[bun|Bun]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
