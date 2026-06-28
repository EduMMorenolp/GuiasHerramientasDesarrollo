# MÃ³dulo 2: Collections

**Objetivo**: Aprender y dominar: Collections.

## Que es una Collection

Una **collection** es un grupo de requests organizadas que pueden compartir variables, scripts y configuracion. Permite ejecutar pruebas en serie, automatizar flujos y generar documentacion.

---

## Crear Collection

1. Click `New` > `Collection`
2. Nombre: `API Usuarios`
3. Opcional: Descripcion, autorizacion global, pre-request scripts

### Agregar requests

1. Click derecho sobre la collection > `Add Request`
2. Nombrar: `Obtener usuarios`, `Crear usuario`, etc.

---

## Folders (Carpetas)

Organizacion recomendada:

```
API Usuarios/
  â”œâ”€â”€ Usuarios/
  â”‚   â”œâ”€â”€ GET - Listar usuarios
  â”‚   â”œâ”€â”€ GET - Obtener usuario por ID
  â”‚   â”œâ”€â”€ POST - Crear usuario
  â”‚   â”œâ”€â”€ PUT - Actualizar usuario
  â”‚   â””â”€â”€ DELETE - Eliminar usuario
  â””â”€â”€ Autenticacion/
      â”œâ”€â”€ POST - Login
      â””â”€â”€ POST - Registro
```

---

## Variables de Collection

### Definir variable {{base_url}}

1. Seleccionar collection > pestaÃ±a `Variables`
2. Agregar variable:
   - Variable: `base_url`
   - Initial value: `https://jsonplaceholder.typicode.com`
   - Current value: `https://jsonplaceholder.typicode.com`

### Uso en requests

```
URL: {{base_url}}/posts
URL: {{base_url}}/posts/1
```

---

## Authorization

Niveles de autorizacion:

### A nivel de Collection

1. Seleccionar collection > pestaÃ±a `Authorization`
2. Elegir tipo: `API Key`, `Bearer Token`, `Basic Auth`, `OAuth 2.0`

### A nivel de Request

Cada request puede heredar o sobrescribir la autorizacion de la collection.

---

### API Key

```http
Key: X-API-Key
Value: tu-api-key-123
Add to: Header
```

### Bearer Token

```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
```

Configuracion:
- Tipo: `Bearer Token`
- Token: `eyJhbGciOiJIUzI1NiIs...`

### Basic Auth

```http
Authorization: Basic dXNlcjpwYXNz
```

Postman codifica automaticamente `usuario:password` en Base64.

### OAuth 2.0

Flujo tipico: `Authorization Code`

1. Callback URL: `https://oauth.pstmn.io/v1/callback`
2. Auth URL: `https://provider.com/oauth/authorize`
3. Access Token URL: `https://provider.com/oauth/token`
4. Client ID y Client Secret
5. Scope: `read write`
6. Click `Get New Access Token`

---

## CRUD Completo

### Variables de Collection

| Variable    | Initial Value                        |
|-------------|--------------------------------------|
| base_url    | https://jsonplaceholder.typicode.com |
| user_id     | 1                                    |

### GET - Listar

```
GET {{base_url}}/users
```

### GET - Obtener por ID

```
GET {{base_url}}/users/{{user_id}}
```

### POST - Crear

```
POST {{base_url}}/users
```

Body:
```json
{
    "name": "Juan Perez",
    "username": "juanperez",
    "email": "juan@example.com"
}
```

### PUT - Actualizar

```
PUT {{base_url}}/users/{{user_id}}
```

Body:
```json
{
    "name": "Juan Perez Actualizado",
    "username": "juanperez",
    "email": "juan_nuevo@example.com"
}
```

### DELETE - Eliminar

```
DELETE {{base_url}}/users/{{user_id}}
```

---

**DocumentaciÃ³n oficial**: https://learning.postman.com

**Siguiente**: [[03 - MÃ³dulo 3 - Entornos y Variables|MÃ³dulo 3: Entornos y Variables]]

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
