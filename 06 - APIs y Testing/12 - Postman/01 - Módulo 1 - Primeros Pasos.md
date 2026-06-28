# Módulo 1: Primeros Pasos

**Objetivo**: Aprender y dominar: Primeros Pasos.

## Que es Postman

Postman es una plataforma de API (Interfaz de Programacion de Aplicaciones) que permite diseñar, construir, probar, documentar y monitorear APIs de manera visual e interactiva.

### Caracteristicas principales

- Cliente HTTP con interfaz grafica
- Gestion de colecciones y entornos
- Tests automatizados (JavaScript)
- Documentacion auto-generada
- Monitores y mock servers
- Integracion CI/CD via Newman

### Instalacion

```powershell
winget install Postman.Postman
```

O descargar desde [postman.com/downloads](https://postman.com/downloads).

---

## Interfaz de Postman

Al abrir Postman por primera vez:

- **Sidebar** (izquierda): Colecciones, entornos, historial
- **Workspace** (centro): Pestaña de request con metodo, URL, headers, body
- **Response** (abajo): Body, cookies, headers, status code, test results
- **Barra superior**: Busqueda, workspaces, importar, configuracion

---

## Primer GET a jsonplaceholder

### Request basica

1. Crear una nueva request (Ctrl + N o `New`)
2. Metodo: `GET`
3. URL: `https://jsonplaceholder.typicode.com/posts/1`
4. Click `Send`

```javascript
// Respuesta esperada (200 OK)
{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit..."
}
```

---

## Metodos HTTP

| Metodo  | Descripcion         | CRUD     |
|---------|---------------------|----------|
| GET     | Obtener recursos    | Read     |
| POST    | Crear recursos      | Create   |
| PUT     | Reemplazar recurso  | Update   |
| PATCH   | Actualizar parcial  | Update   |
| DELETE  | Eliminar recurso    | Delete   |

---

## Headers

Headers comunes en Postman:

```json
{
    "Content-Type": "application/json",
    "Authorization": "Bearer <token>",
    "Accept": "application/json",
    "User-Agent": "PostmanRuntime/7.x"
}
```

- **Content-Type**: Tipo de contenido enviado
- **Authorization**: Credenciales de autenticacion
- **Accept**: Tipo de contenido aceptado en respuesta

---

## Body

Tipos de body en Postman:

| Tipo               | Uso                      |
|--------------------|--------------------------|
| none               | GET, DELETE              |
| form-data          | Formularios + archivos   |
| x-www-form-urlencoded | Formularios simples   |
| raw                | JSON, XML, Texto, HTML   |
| binary             | Archivos binarios        |
| GraphQL            | Consultas GraphQL        |

Ejemplo body JSON:

```json
{
    "title": "Nuevo Post",
    "body": "Contenido del post",
    "userId": 1
}
```

---

## Response

La respuesta en Postman muestra:

### Body
- Pretty: Formateado con colores
- Raw: Texto plano
- Preview: Renderizado HTML

### Headers
```http
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Response-Time: 45ms
```

### Status Code

| Codigo | Categoria       | Significado            |
|--------|-----------------|------------------------|
| 200    | OK              | Exito                  |
| 201    | Created         | Recurso creado         |
| 204    | No Content      | Sin contenido          |
| 400    | Bad Request     | Error del cliente      |
| 401    | Unauthorized    | No autenticado         |
| 403    | Forbidden       | Sin permisos           |
| 404    | Not Found       | No encontrado          |
| 500    | Internal Server Error | Error del servidor |

---

**Documentación oficial**: https://learning.postman.com

**Siguiente**: [[02 - Módulo 2 - Collections|Módulo 2: Collections]]

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
