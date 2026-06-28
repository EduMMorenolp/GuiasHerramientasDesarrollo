# MÃ³dulo 4: GitLab CI/CD

**Objetivo**: Automatizar build, test y deploy con GitLab CI/CD.

---

## .gitlab-ci.yml

Archivo en la raÃ­z del repositorio que define el pipeline.

### Estructura BÃ¡sica

```yaml
stages:
  - build
  - test
  - deploy

build-job:
  stage: build
  script:
    - echo "Compilando..."
    - npm install
    - npm run build
  artifacts:
    paths:
      - dist/

test-job:
  stage: test
  script:
    - echo "Ejecutando tests..."
    - npm test
  dependencies:
    - build-job

deploy-job:
  stage: deploy
  script:
    - echo "Desplegando..."
    - npm run deploy
  only:
    - main
```

### Keywords Esenciales

| Keyword | DescripciÃ³n |
|---------|-------------|
| `stages` | Define el orden de ejecuciÃ³n |
| `stage` | Asigna job a una etapa |
| `script` | Comandos a ejecutar |
| `only`/`except` | Condiciones de ejecuciÃ³n |
| `rules` | Reglas avanzadas (reemplaza only/except) |
| `artifacts` | Archivos generados que pasan entre jobs |
| `cache` | Archivos reutilizables entre ejecuciones |
| `variables` | Variables de entorno |
| `before_script` | Comandos antes de cada job |
| `after_script` | Comandos despuÃ©s de cada job |

---

## Runners

Agentes que ejecutan los jobs del pipeline.

### Tipos de Runners

| Runner | DescripciÃ³n |
|--------|-------------|
| **Shared** | Proporcionados por GitLab SaaS |
| **Group** | Compartido en un grupo |
| **Specific** | Dedicado a un proyecto |
| **Docker** | Ejecuta jobs en contenedores |
| **Shell** | Ejecuta directamente en el SO |
| **Kubernetes** | Ejecuta en pods de K8s |

### Registrar un Runner

```powershell
# Registrar runner (Linux)
sudo gitlab-runner register \
  --url https://gitlab.com/ \
  --registration-token <token> \
  --executor docker \
  --docker-image alpine:latest
```

---

## Variables

### Tipos de Variables

| Tipo | Ãmbito |
|------|--------|
| **Project** | Solo un proyecto |
| **Group** | Todos los proyectos del grupo |
| **Instance** | Toda la instancia GitLab |
| **Pipeline** | Variables predefinidas |

### Variables Predefinidas

```yaml
# Variables Ãºtiles
CI_COMMIT_BRANCH: main
CI_COMMIT_SHA: abc123
CI_PIPELINE_ID: 12345
CI_JOB_ID: 67890
CI_REGISTRY: registry.gitlab.com
CI_REGISTRY_IMAGE: registry.gitlab.com/usuario/repo
```

### MÃ¡scara y ProtecciÃ³n

```yaml
variables:
  DB_PASSWORD: "super-secreto"  # Masked
  DEPLOY_KEY: "clave-protegida"  # Protected (solo main)
```

---

## Artifacts y Cache

### Artifacts

```yaml
build:
  artifacts:
    paths:
      - dist/
      - build/*.dll
    expire_in: 7 days
    reports:
      junit: report.xml
      coverage_report:
        coverage_format: cobertura
        path: coverage.xml
```

### Cache

```yaml
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
    - .npm/
  policy: pull-push  # pull, push, pull-push
```

---

## Ejemplo Completo

```yaml
image: node:20

stages:
  - lint
  - build
  - test
  - deploy

cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/

before_script:
  - npm ci

lint:
  stage: lint
  script:
    - npm run lint

build:
  stage: build
  script:
    - npm run build
  artifacts:
    paths:
      - dist/
    expire_in: 1 hour

test:
  stage: test
  script:
    - npm run test:ci
  coverage: /All files[^|]*\|[^|]*\s+([\d\.]+)/
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: coverage/cobertura-coverage.xml

deploy-staging:
  stage: deploy
  script:
    - npm run deploy:staging
  rules:
    - if: $CI_COMMIT_BRANCH == "develop"

deploy-production:
  stage: deploy
  script:
    - npm run deploy:prod
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
  when: manual
```

---

## Resumen del MÃ³dulo

| Concepto | DescripciÃ³n |
|----------|-------------|
| **Pipeline** | EjecuciÃ³n completa de CI/CD |
| **Job** | Unidad de trabajo individual |
| **Stage** | Fase del pipeline |
| **Runner** | Ejecutor de jobs |
| **Variables** | ConfiguraciÃ³n parametrizada |
| **Artifacts** | Archivos entre jobs |
| **Cache** | Archivos reutilizables |

---

**Documentación oficial**: https://docs.gitlab.com
**Siguiente**: [[05 - MÃ³dulo 5 - Registro y Deploy|MÃ³dulo 5: Registro y Deploy]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
