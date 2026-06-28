# Módulo 6: Seguridad

**Objetivo**: Proteger el código y la infraestructura con herramientas de seguridad integradas.

---

## SAST (Static Application Security Testing)

Análisis estático de código fuente.

```yaml
include:
  - template: Jobs/SAST.gitlab-ci.yml

sast:
  stage: test
  variables:
    SAST_EXCLUDED_ANALYZERS: "eslint"
  artifacts:
    reports:
      sast: gl-sast-report.json
```

### Analizadores por Lenguaje

| Lenguaje | Analizador |
|----------|------------|
| JavaScript/TypeScript | Semgrep, ESLint |
| Python | Bandit, Semgrep |
| Java | SpotBugs, Semgrep |
| C# | .NET Security |
| Go | Gosec |
| Ruby | Brakeman |
| PHP | Psalm |

---

## DAST (Dynamic Application Security Testing)

Análisis dinámico de aplicaciones en ejecución.

```yaml
include:
  - template: Jobs/DAST.gitlab-ci.yml

dast:
  stage: test
  variables:
    DAST_WEBSITE: https://staging.misitio.com
    DAST_FULL_SCAN: "true"
  artifacts:
    reports:
      dast: gl-dast-report.json
```

---

## Secret Detection

Detección de secretos y credenciales en el código.

```yaml
include:
  - template: Jobs/Secret-Detection.gitlab-ci.yml

secret_detection:
  stage: test
  variables:
    SECRET_DETECTION_EXCLUDED_PATHS: "tests/, docs/"
```

Detecta:
- API keys (AWS, Google, GitHub)
- Tokens JWT
- Private SSH keys
- Passwords en texto plano
- Conexiones a base de datos

---

## Dependency Scanning

Escaneo de dependencias con vulnerabilidades conocidas.

```yaml
include:
  - template: Jobs/Dependency-Scanning.gitlab-ci.yml

dependency_scanning:
  stage: test
  variables:
    DS_REMEDIATE: "true"
  artifacts:
    reports:
      dependency_scanning: gl-dependency-scanning-report.json
```

Compatibilidad:
- npm/yarn/pnpm
- pip/poetry
- Maven/Gradle
- NuGet
- Go modules
- Bundler

---

## Container Scanning

Escaneo de imágenes Docker.

```yaml
include:
  - template: Jobs/Container-Scanning.gitlab-ci.yml

container_scanning:
  stage: test
  variables:
    CS_IMAGE: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
    CS_DISABLE_DEPENDENCY_LIST: "false"
  artifacts:
    reports:
      container_scanning: gl-container-scanning-report.json
```

---

## License Compliance

Control de licencias de dependencias.

```yaml
include:
  - template: Jobs/License-Scanning.gitlab-ci.yml

license_scanning:
  stage: test
  variables:
    LICENSE_FINDER_CLI_OPTS: "--decisions-file=license_decisions.yml"
  artifacts:
    licenses: gl-license-scanning-report.json
```

```yaml
# license_decisions.yml
decisions:
  - name: "MIT"
    decision: allow
  - name: "GPL-3.0"
    decision: deny
  - name: "Apache-2.0"
    decision: allow
```

---

## Security Dashboard

Vista centralizada de vulnerabilidades.

- **Por proyecto**: Vulnerabilidades del proyecto actual
- **Por grupo**: Vista agregada del grupo
- **Pipeline Security**: Resultados del último pipeline
- **Tendencias**: Evolución de vulnerabilidades en el tiempo
- **Resolución**: Asignar, confirmar, descartar o resolver

---

## Security Policies

Políticas de seguridad automatizadas (Premium+).

```yaml
# .gitlab/security-policies/policy.yml
scan_execution_policies:
  - name: Escaneo obligatorio en MR
    rules:
      - type: pipeline
        branch: main
        agents:
          - sast
          - secret_detection
          - dependency_scanning
    actions:
      - type: require_approval

approval_policies:
  - name: Aprobación de seguridad
    rules:
      - type: any_merge_request
        vulnerabilities:
          - critical
          - high
    actions:
      - type: require_approval
        approvers:
          - security-team
```

---

## Resumen del Módulo

| Concepto | Descripción |
|----------|-------------|
| **SAST** | Análisis estático de código |
| **DAST** | Análisis dinámico en ejecución |
| **Secret Detection** | Detección de credenciales |
| **Dependency Scanning** | Vulnerabilidades en dependencias |
| **Container Scanning** | Escaneo de imágenes Docker |
| **License Compliance** | Control de licencias |
| **Security Dashboard** | Panel central de seguridad |
| **Security Policies** | Políticas automatizadas |

---

**Documentación oficial**: https://docs.gitlab.com
**Siguiente**: [[07 - Módulo 7 - Administración|Módulo 7: Administración]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
