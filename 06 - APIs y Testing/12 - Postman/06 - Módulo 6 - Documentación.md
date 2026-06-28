# Módulo 6: Documentacion

**Objetivo**: Aprender y dominar: Documentacion.

## Auto-generar Docs desde Collection

Postman genera documentacion automaticamente a partir de las collections.

### Pasos

1. Seleccionar collection en el sidebar
2. Click en `View Documentation` (icono de libro o pestaña `Docs`)
3. Postman genera documentacion con:
   - Metodo HTTP y URL
   - Headers configurados
   - Body de ejemplo
   - Status codes de respuesta
   - Tests definidos

---

## Descripciones

Agregar descripciones en formato Markdown a cada request:

```
### Descripcion de la request

Este endpoint obtiene todos los usuarios del sistema.

**Permisos requeridos**: `admin:read`
**Rate limit**: 100 requests/minuto
**Cache**: 60 segundos
```

### En parametros

```json
{
    "name": "Nombre del usuario",
    "email": "Email del usuario (debe ser unico)",
    "role": "Rol del usuario: admin | user | guest"
}
```

### En headers

```
X-API-Key: API Key del cliente (requerido)
X-Request-Id: ID unico para tracking (opcional)
```

---

## Ejemplos

Agregar ejemplos de respuesta en Postman:

1. Ejecutar la request
2. Click `Save Response` > `Save as Example`
3. Editar el ejemplo con distintos escenarios

### Ejemplos utiles

| Ejemplo              | Status | Descripcion                  |
|---------------------|--------|------------------------------|
| 200 - Usuario encontrado | 200 | Respuesta exitosa          |
| 201 - Creado        | 201    | Recurso creado               |
| 400 - Bad Request   | 400    | Datos invalidos              |
| 401 - No autorizado | 401    | Token faltante o invalido    |
| 404 - No encontrado | 404    | Recurso inexistente          |
| 500 - Error interno | 500    | Error del servidor           |

---

## Code Snippets

Postman genera automaticamente codigo para consumir la API en distintos lenguajes.

1. En una request, click `Code` (</>)
2. Seleccionar lenguaje:

| Lenguaje          | Libreria               |
|-------------------|------------------------|
| JavaScript        | fetch, axios, jQuery   |
| Python            | requests, http.client  |
| Python (Requests) | requests               |
| Node.js           | axios, native HTTP     |
| Java              | OkHttp, Unirest        |
| C#                | HttpClient, RestSharp  |
| Go                | native http            |
| PHP               | cURL, Guzzle           |
| Ruby              | Net::HTTP              |
| cURL              | curl                   |

### Ejemplo generado (JavaScript fetch)

```javascript
fetch("https://jsonplaceholder.typicode.com/posts/1", {
    method: "GET",
    headers: {
        "Content-Type": "application/json"
    }
})
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error("Error:", error));
```

### Ejemplo generado (Python requests)

```python
import requests

url = "https://jsonplaceholder.typicode.com/posts/1"
headers = {"Content-Type": "application/json"}

response = requests.get(url, headers=headers)
print(response.json())
```

### Ejemplo generado (cURL)

```bash
curl --location 'https://jsonplaceholder.typicode.com/posts/1' \
--header 'Content-Type: application/json'
```

---

## Public Docs URL

### Publicar documentacion

1. En la collection, click `...` > `View Documentation`
2. Click `Publish Docs`
3. Opcional: Configurar dominio personalizado

Los docs publicos quedan accesibles via URL:

```
https://documenter.getpostman.com/view/{workspace_id}/{collection_id}
```

### Caracteristicas de docs publicos

- Interfaz similar a Swagger/OpenAPI
- Ejecucion interactiva (Postman Web)
- Ejemplos de respuesta visibles
- Code snippets incluidos
- Sin necesidad de iniciar sesion

---

## Collection Format v2.1

Postman usa un formato JSON estandar para collections.

### Estructura basica

```json
{
    "info": {
        "name": "API Usuarios",
        "description": "Documentacion de la API de Usuarios",
        "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
    },
    "item": [
        {
            "name": "Listar usuarios",
            "request": {
                "method": "GET",
                "header": [
                    {
                        "key": "Content-Type",
                        "value": "application/json"
                    }
                ],
                "url": {
                    "raw": "{{base_url}}/users",
                    "host": ["{{base_url}}"],
                    "path": ["users"]
                }
            },
            "response": []
        }
    ],
    "variable": [
        {
            "key": "base_url",
            "value": "https://jsonplaceholder.typicode.com"
        }
    ]
}
```

### Componentes del formato

| Componente   | Descripcion                          |
|-------------|--------------------------------------|
| info        | Metadatos de la collection           |
| item        | Arreglo de requests o folders        |
| request     | Configuracion de la request          |
| response    | Ejemplos de respuesta guardados      |
| variable    | Variables de la collection           |
| auth        | Configuracion de autorizacion        |
| event       | Scripts (pre-request y test)         |

### Exportar en v2.1

`Collection > ... > Export > Collection v2.1`

Este es el formato recomendado para compartir collections y usar con Newman.

---

**Documentación oficial**: https://learning.postman.com

**Siguiente**: [[07 - Módulo 7 - Avanzado|Módulo 7: Avanzado]]

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
