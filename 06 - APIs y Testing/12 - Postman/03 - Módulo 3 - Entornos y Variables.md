# MÃ³dulo 3: Entornos y Variables

## Environments (Entornos)

Un **environment** es un conjunto de variables agrupadas que permite cambiar la configuracion entre diferentes ambitos sin modificar las requests.

### Crear Environment

1. Sidebar > `Environments` > `New Environment`
2. Nombre: `Desarrollo`, `Staging` o `Produccion`
3. Agregar variables con valores especificos

---

### Entorno: desarrollo

| Variable     | Valor                              |
|-------------|--------------------------------------|
| base_url    | http://localhost:3000/api            |
| api_key     | dev-key-123                         |
| timeout     | 5000                                |

### Entorno: staging

| Variable     | Valor                              |
|-------------|--------------------------------------|
| base_url    | https://staging.api.example.com      |
| api_key     | staging-key-456                     |
| timeout     | 3000                                |

### Entorno: produccion

| Variable     | Valor                              |
|-------------|--------------------------------------|
| base_url    | https://api.example.com              |
| api_key     | prod-key-789                        |
| timeout     | 10000                               |

### Seleccionar Environment

Dropdown en la esquina superior derecha de Postman.

---

## Niveles de Variables

Jerarquia de precedencia (de menor a mayor prioridad):

1. **Global**: Disponible en todo Postman
2. **Collection**: Disponible dentro de la collection
3. **Environment**: Activo segun el entorno seleccionado
4. **Data**: Variables de archivos de datos (Newman)
5. **Local**: Solo en scripts (pm.variables.set)

### Global

Accesible desde cualquier collection, entorno o workspace.

```javascript
pm.globals.set("api_version", "v2");
let version = pm.globals.get("api_version");
```

### Collection

Definidas en la pestana Variables de la collection.

```javascript
pm.collectionVariables.set("token", "abc123");
let token = pm.collectionVariables.get("token");
```

### Environment

Definidas en el entorno activo.

```javascript
pm.environment.set("base_url", "https://api.example.com");
let url = pm.environment.get("base_url");
```

### Data

Variables de archivos CSV/JSON para data-driven testing.

```javascript
let email = pm.iterationData.get("email");
```

### Local

Variables temporales dentro de un script.

```javascript
pm.variables.set("tempValue", "solo en este script");
```

---

## Variables Dinamicas

Postman provee variables pre-definidas que generan valores aleatorios en cada ejecucion:

### Texto

| Variable            | Ejemplo                         |
|--------------------|---------------------------------|
| {{$randomFullName}}  | Juan Perez                     |
| {{$randomEmail}}     | juan.perez123@example.com      |
| {{$randomPassword}}  | s3cUr3P@ss!                    |
| {{$randomPhone}}     | +1-555-555-5555                |
| {{$randomStreet}}    | 123 Main St                    |
| {{$randomCity}}      | Springfield                     |
| {{$randomCountry}}   | United States                   |

### Numeros

| Variable            | Ejemplo                         |
|--------------------|---------------------------------|
| {{$randomInt}}       | 42                             |
| {{$randomPrice}}     | 29.99                          |

### Fechas

| Variable            | Ejemplo                         |
|--------------------|---------------------------------|
| {{$timestamp}}       | 1719000000                     |
| {{$isoTimestamp}}    | 2025-06-21T10:00:00.000Z       |
| {{$randomDateFuture}} | 2026-03-15                    |
| {{$randomDatePast}}   | 2024-01-10                    |

### IDs

| Variable            | Ejemplo                         |
|--------------------|---------------------------------|
| {{$guid}}           | 550e8400-e29b-41d4-a716-446655440000 |

### Ejemplo Uso

```json
{
    "name": "{{$randomFullName}}",
    "email": "{{$randomEmail}}",
    "password": "{{$randomPassword}}",
    "createdAt": "{{$isoTimestamp}}"
}
```

---

## Workspaces

### Tipos de Workspace

| Tipo       | Descripcion                        | Ideal para             |
|-----------|-----------------------------------|------------------------|
| Personal  | Solo visible para ti              | Proyectos personales   |
| Team      | Colaborativo, visible al equipo   | Equipos de trabajo     |
| Public    | Visible para todos                | APIs publicas, docs    |
| Partner   | Compartido con partners especificos | Integraciones externas |

### Crear Workspace

1. Dropdown de workspace (esquina superior izquierda)
2. `Create Workspace`
3. Tipo: `Personal`, `Team`, `Public` o `Partner`
4. Invitar miembros (si corresponde)

---

**DocumentaciÃ³n oficial**: https://learning.postman.com

**Documentación oficial**: https://learning.postman.com

**Siguiente**: [[04 - MÃ³dulo 4 - Tests y Scripts|MÃ³dulo 4: Tests y Scripts]]
**Documentación oficial**: https://learning.postman.com

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




