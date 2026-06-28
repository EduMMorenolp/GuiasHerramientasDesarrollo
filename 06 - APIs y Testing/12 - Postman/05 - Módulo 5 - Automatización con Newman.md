# MÃ³dulo 5: Automatizacion con Newman

## Que es Newman

Newman es la herramienta de linea de comandos para ejecutar collections de Postman. Permite integrar pruebas de API en pipelines CI/CD.

---

## Instalacion

```bash
npm install -g newman
```

Verificar instalacion:

```bash
newman --version
```

---

## Ejecutar una Collection

### Exportar collection desde Postman

1. Click derecho sobre la collection > `Export`
2. Formato: `Collection v2.1`
3. Guardar: `collection.json`

### Comando basico

```bash
newman run collection.json
```

### Con environment

```bash
newman run collection.json -e environment.json
```

### Con data file

```bash
newman run collection.json -d data.csv
```

### Parametros comunes

| Parametro        | Descripcion                      | Ejemplo                  |
|-----------------|----------------------------------|--------------------------|
| -e              | Archivo de entorno               | -e staging.json          |
| -d              | Archivo de datos (CSV/JSON)      | -d usuarios.csv          |
| -g              | Variables globales               | -g globals.json          |
| -n              | Numero de iteraciones            | -n 5                     |
| --delay-request | Delay entre requests (ms)        | --delay-request 1000     |
| --timeout       | Timeout global (ms)              | --timeout 10000          |
| --bail          | Detener en primer fallo          | --bail                   |
| --silent        | Sin output                       | --silent                 |
| --color         | Color output (on/off)            | --color off              |

---

## Reporters

### CLI (default)

```bash
newman run collection.json
```

### JSON

```bash
newman run collection.json -r json
newman run collection.json -r json --reporter-json-export reporte.json
```

### JUnit (XML)

```bash
newman run collection.json -r junit
newman run collection.json -r junit --reporter-junit-export reporte.xml
```

### htmlextra (recomendado)

Requiere instalacion adicional:

```bash
npm install -g newman-reporter-htmlextra
```

```bash
newman run collection.json -r htmlextra
newman run collection.json -r htmlextra --reporter-htmlextra-export reporte.html
```

### Multiples reporters

```bash
newman run collection.json -r cli,json,junit,htmlextra
```

---

## Data Files

### CSV

```csv
email,password,role
admin@test.com,admin123,admin
user@test.com,user123,user
guest@test.com,guest123,guest
```

```bash
newman run collection.json -d usuarios.csv
```

En scripts:

```javascript
let email = pm.iterationData.get("email");
let password = pm.iterationData.get("password");
```

### JSON

```json
[
    {
        "email": "admin@test.com",
        "password": "admin123",
        "role": "admin"
    },
    {
        "email": "user@test.com",
        "password": "user123",
        "role": "user"
    }
]
```

```bash
newman run collection.json -d usuarios.json
```

---

## Con Environment

### Exportar Environment

1. Sidebar > `Environments` > Exportar el deseado
2. Guardar: `staging.json`

### Ejecutar

```bash
newman run collection.json \
    -e staging.json \
    -d data.csv \
    -n 3 \
    --delay-request 500 \
    -r cli,htmlextra
```

---

## Integracion CI/CD

### GitHub Actions

```yaml
name: API Tests

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4

      - name: Instalar Newman
        run: npm install -g newman newman-reporter-htmlextra

      - name: Ejecutar tests
        run: newman run collection.json -e staging.json -r cli,htmlextra
```

### GitLab CI

```yaml
stages:
  - test

api-tests:
  stage: test
  image: node:18
  script:
    - npm install -g newman newman-reporter-htmlextra
    - newman run collection.json -e staging.json -r cli,junit
  artifacts:
    reports:
      junit: newman-*.xml
```

### Jenkins Pipeline

```groovy
pipeline {
    agent any
    stages {
        stage('API Tests') {
            steps {
                sh 'npm install -g newman newman-reporter-htmlextra'
                sh 'newman run collection.json -e staging.json -r cli,htmlextra'
            }
            post {
                always {
                    publishHTML(target: [
                        reportName: 'Newman Report',
                        reportDir: '.',
                        reportFiles: 'newman-*.html'
                    ])
                }
            }
        }
    }
}
```

---

**DocumentaciÃ³n oficial**: https://learning.postman.com

**Documentación oficial**: https://learning.postman.com

**Siguiente**: [[06 - MÃ³dulo 6 - DocumentaciÃ³n|MÃ³dulo 6: Documentacion]]
**Documentación oficial**: https://learning.postman.com

**Inicio herramienta**: [[postman|Postman]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]




