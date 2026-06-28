# MÃ³dulo 4: Tests y Scripts

## Pre-request Scripts

Ejecutados **antes** de enviar la request. Utiles para:

- Generar valores dinamicos
- Calcular hashes o firmas
- Establecer headers de autenticacion
- Loggear datos para debugging

### Ejemplos

```javascript
// Generar timestamp antes de cada request
pm.variables.set("requestTimestamp", Date.now());

// Firmar request con HMAC
const crypto = require('crypto-js');
const secret = pm.environment.get("api_secret");
const signature = crypto.HmacSHA256(
    pm.request.url.toString(),
    secret
).toString();
pm.request.headers.add({
    key: "X-Signature",
    value: signature
});

// Token dinamico antes de cada request
let token = pm.globals.get("access_token");
pm.request.headers.add({
    key: "Authorization",
    value: "Bearer " + token
});
```

---

## Test Scripts

Ejecutados **despues** de recibir la respuesta. Permiten validar resultados automaticamente.

### pm.test()

```javascript
pm.test("Nombre del test", function () {
    // Logica de asercion
});
```

### pm.expect()

```javascript
pm.test("Status code es 200", function () {
    pm.expect(pm.response.code).to.eql(200);
});
```

### pm.response

```javascript
// Propiedades principales
pm.response.code        // Status code (200, 404, etc.)
pm.response.status      // Texto del status ("OK")
pm.response.headers     // Headers de respuesta
pm.response.json()      // Body parseado como JSON
pm.response.text()      // Body como texto plano
pm.responseTime         // Tiempo de respuesta en ms
```

---

## Tests Basicos

### Status Code

```javascript
// Status 200
pm.test("Status code es 200", function () {
    pm.response.to.have.status(200);
});

// Status 201
pm.test("Status code es 201", function () {
    pm.response.to.have.status(201);
});

// Status 404
pm.test("Status code es 404", function () {
    pm.response.to.have.status(404);
});
```

### Response Time

```javascript
pm.test("Response time menor a 200ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(200);
});

pm.test("Response time entre 100 y 500ms", function () {
    pm.expect(pm.response.responseTime).to.be.within(100, 500);
});
```

### Body Contains

```javascript
// Verificar campo en JSON
pm.test("Body contiene userId", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property("userId");
});

// Verificar valor exacto
pm.test("userId es 1", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.userId).to.eql(1);
});

// Verificar tipo de dato
pm.test("title es string", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.title).to.be.a("string");
});

// Verificar arreglo
pm.test("Lista no esta vacia", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData).to.be.an("array").that.is.not.empty;
});
```

### Headers

```javascript
pm.test("Content-Type es application/json", function () {
    pm.response.to.have.header("Content-Type");
    pm.expect(pm.response.headers.get("Content-Type"))
      .to.include("application/json");
});
```

---

## Chai Assertions

Postman usa la libreria **Chai** con el plugin `pm.expect()`.

### Comparacion

```javascript
pm.expect(valor).to.eql(esperado);      // Igualdad estricta
pm.expect(valor).to.equal(esperado);    // Igualdad (===)
pm.expect(valor).to.not.eql(otro);      // Desigualdad
pm.expect(valor).to.be.above(10);       // Mayor que
pm.expect(valor).to.be.below(100);      // Menor que
pm.expect(valor).to.be.within(1, 10);   // Rango
```

### Tipo

```javascript
pm.expect(valor).to.be.a("string");
pm.expect(valor).to.be.a("number");
pm.expect(valor).to.be.a("boolean");
pm.expect(valor).to.be.an("array");
pm.expect(valor).to.be.an("object");
pm.expect(valor).to.be.null;
pm.expect(valor).to.be.undefined;
```

### Arreglos y Objetos

```javascript
pm.expect(array).to.have.lengthOf(3);
pm.expect(array).to.include("item");
pm.expect(array).to.deep.include({ id: 1 });
pm.expect(obj).to.have.property("name");
pm.expect(obj).to.have.all.keys(["id", "name", "email"]);
```

### Combinado

```javascript
pm.test("Validacion completa de usuario", function () {
    const user = pm.response.json();

    pm.expect(pm.response.code).to.eql(200);
    pm.expect(user).to.be.an("object");
    pm.expect(user).to.have.all.keys(["id", "name", "username", "email"]);
    pm.expect(user.name).to.be.a("string").that.is.not.empty;
    pm.expect(user.email).to.include("@");
    pm.expect(pm.response.responseTime).to.be.below(500);
});
```

---

## Flujo Completo: Pre-request + Test

### Pre-request Script

```javascript
// Generar datos dinamicos
pm.variables.set("randomEmail", pm.variables.replaceIn("{{$randomEmail}}"));
pm.variables.set("randomName", pm.variables.replaceIn("{{$randomFullName}}"));
```

### Test Script

```javascript
// Validar creacion exitosa
pm.test("Usuario creado correctamente", function () {
    const response = pm.response.json();

    pm.expect(pm.response.code).to.eql(201);
    pm.expect(response).to.have.property("id");
    pm.expect(response).to.have.property("email");
    pm.expect(response.email).to.include("@");

    // Guardar ID para proximas requests
    pm.collectionVariables.set("new_user_id", response.id);
});

pm.test("Response time aceptable", function () {
    pm.expect(pm.response.responseTime).to.be.below(1000);
});
```

---

**DocumentaciÃ³n oficial**: https://learning.postman.com

**Documentación oficial**: https://learning.postman.com

**Siguiente**: [[05 - MÃ³dulo 5 - AutomatizaciÃ³n con Newman|MÃ³dulo 5: Automatizacion con Newman]]
**Documentación oficial**: https://learning.postman.com

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




