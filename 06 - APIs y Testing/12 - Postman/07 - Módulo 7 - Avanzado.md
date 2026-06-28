# MÃ³dulo 7: Avanzado

## Postman Flows

Flows es una herramienta visual de Postman para conectar APIs sin codigo, creando flujos de trabajo automatizados mediante nodos conectables.

### Componentes

| Componente    | Descripcion                             |
|---------------|-----------------------------------------|
| Trigger       | Inicia el flujo (schedule, webhook)     |
| Send Request  | Ejecuta una request de una collection   |
| Evaluate      | Transforma datos con expresiones        |
| Condition     | Rama condicional (if/else)              |
| Loop          | Itera sobre arreglos                    |
| Query         | Consulta y filtra datos                 |
| Aggregate     | Combina multiples resultados            |

### Ejemplo: Obtener usuarios y enviar notificacion

1. Trigger manual
2. Send Request: GET /users
3. Evaluate: Filtrar usuarios activos
4. Loop: Para cada usuario activo
5. Send Request: POST /notifications

---

## Mock Servers

Un **Mock Server** simula una API real sin necesidad de tener el backend funcionando.

### Crear Mock Server

1. Collection con ejemplos de respuesta
2. Click `...` > `Mock Server`
3. Configurar:
   - Nombre: `Mock API Usuarios`
   - Environment (opcional)
   - Delay opcional
4. Obtener URL: `https://{mock-id}.mock.pstmn.io`

### Uso

```bash
curl https://{mock-id}.mock.pstmn.io/users
```

### Caracteristicas

- Responde con ejemplos guardados en la collection
- Simula latencia de red
- Ideal para desarrollo frontend
- No requiere backend real

---

## Monitors

Los **Monitors** ejecutan collections periodicamente para verificar disponibilidad y rendimiento de APIs.

### Crear Monitor

1. Collection > `...` > `Monitor`
2. Configurar:
   - Nombre: `Monitor Produccion`
   - Entorno: Produccion
   - Frecuencia: Cada 5 minutos, 1 hora, 1 dia, etc.
   - Region: US, EU, Asia
3. Recibir alertas por email o Slack

### Casos de uso

- Verificar uptime de API
- Probar flujos criticos periodicamente
- Detectar regresiones
- Medir rendimiento en el tiempo

---

## Postman API

La **Postman API** permite gestionar recursos de Postman programaticamente.

### Autenticacion

```bash
X-API-Key: PMAK-xxxxxxxxxxxx
```

### Endpoints principales

| Recurso       | Metodo | Endpoint                          |
|--------------|--------|-----------------------------------|
| Collections  | GET    | /collections                      |
| Collections  | POST   | /collections                      |
| Collection   | GET    | /collections/{id}                 |
| Collection   | PUT    | /collections/{id}                 |
| Environments | GET    | /environments                     |
| Environment  | GET    | /environments/{id}                |
| Monitors     | GET    | /monitors                         |
| Mock Servers | GET    | /mocks                            |

### Ejemplo: Listar collections

```bash
curl --location 'https://api.getpostman.com/collections' \
--header 'X-API-Key: PMAK-xxxxxxxxxxxx'
```

### Ejemplo: Actualizar collection (CI/CD)

```javascript
const response = await fetch(
    `https://api.getpostman.com/collections/${collectionId}`,
    {
        method: "PUT",
        headers: {
            "X-API-Key": apiKey,
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ collection: updatedCollection })
    }
);
```

---

## Postman AI (Postbot)

**Postbot** es el asistente AI integrado en Postman que ayuda a:

### Funcionalidades

- **Generar tests**: Describe el test y Postbot lo escribe
- **Explicar respuestas**: Analiza respuestas de API
- **Depurar errores**: Sugiere correcciones
- **Escribir pre-request scripts**: Genera scripts automaticamente
- **Documentar**: Crea descripciones para endpoints

### Ejemplos de prompts

```
"Escribe un test que verifique que la respuesta tiene status 200
 y que el body contiene el campo 'id' como numero"

"Explica por que esta request devuelve 401"

"Genera un pre-request script que agregue un header
 Authorization con un token dinamico"

"Crea documentacion para este endpoint en espanol"
```

### Habilitar Postbot

1. Icono de Postbot (robot) en la barra lateral
2. Iniciar sesion con cuenta Postman
3. Comenzar a escribir prompts en lenguaje natural

---

**DocumentaciÃ³n oficial**: https://learning.postman.com

**Documentación oficial**: https://learning.postman.com

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




