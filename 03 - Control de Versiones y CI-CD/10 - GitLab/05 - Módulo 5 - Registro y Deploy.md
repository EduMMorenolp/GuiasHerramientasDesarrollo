# Módulo 5: Registro y Deploy

**Objetivo**: Gestionar imágenes de contenedor, despliegues y releases.

---

## Container Registry

Registro de imágenes Docker integrado en GitLab.

### Publicar Imagen

```yaml
docker-build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker build -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
    - docker tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA $CI_REGISTRY_IMAGE:latest
    - docker push $CI_REGISTRY_IMAGE:latest
```

### Descargar Imagen

```powershell
docker pull registry.gitlab.com/usuario/repo:latest
```

### Limpieza Automática

```yaml
# En Settings > CI/CD > Container Registry
delete_tags:
  - regex: .*-alpha
  - keep: 5  # Mantener últimas 5
```

---

## GitLab Pages

Hosting estático integrado.

### Configuración

```yaml
pages:
  stage: deploy
  script:
    - npm run build
    - mv public/ public/
  artifacts:
    paths:
      - public/
  only:
    - main
```

```yaml
# Ejemplo con Hugo (SSG)
image: registry.gitlab.com/pages/hugo:latest

variables:
  HUGO_ENV: production

pages:
  script:
    - hugo
  artifacts:
    paths:
      - public/
```

Dominio: `https://usuario.gitlab.io/repo/`

### Dominio Personalizado

1. Settings > Pages > New Domain
2. Añadir registro DNS tipo CNAME
3. Verificar con certificado SSL automático (Let's Encrypt)

---

## Environments

Entornos de despliegue con seguimiento.

```yaml
deploy-staging:
  stage: deploy
  script:
    - npm run deploy:staging
  environment:
    name: staging
    url: https://staging.misitio.com
  only:
    - develop

deploy-production:
  stage: deploy
  script:
    - npm run deploy:prod
  environment:
    name: production
    url: https://misitio.com
  only:
    - main
  when: manual
```

### Review Apps

Entornos dinámicos por Merge Request:

```yaml
review:
  stage: deploy
  script:
    - npm run deploy:review
  environment:
    name: review/$CI_MERGE_REQUEST_IID
    url: https://review-$CI_MERGE_REQUEST_IID.misitio.com
    auto_stop_in: 7 days
  only:
    - merge_requests
```

---

## Releases

Crear releases desde el pipeline:

```yaml
release:
  stage: deploy
  script:
    - echo "Creando release $CI_COMMIT_TAG..."
  release:
    tag_name: $CI_COMMIT_TAG
    name: "Release $CI_COMMIT_TAG"
    description: |
      ## Cambios en esta versión

      - Corrección de bugs
      - Nuevas funcionalidades
    assets:
      links:
        - name: "Binario Windows"
          url: "https://gitlab.com/usuario/repo/-/jobs/artifacts/$CI_COMMIT_TAG/raw/app.exe?job=build"
          type: other
  only:
    - tags
```

---

## Auto DevOps

Pipeline preconfigurado para proyectos típicos:

```yaml
# Activar en Settings > CI/CD > Auto DevOps
# O incluir en .gitlab-ci.yml:
include:
  - template: Auto-DevOps.gitlab-ci.yml
```

### Componentes de Auto DevOps

| Componente | Descripción |
|------------|-------------|
| **Build** | Compila y genera imagen Docker |
| **Test** | Tests unitarios, SAST, DAST |
| **Code Quality** | Análisis estático de código |
| **Review** | Review App por MR |
| **Deploy** | Despliegue a staging/producción |
| **Performance** | Pruebas de rendimiento |
| **Browser Testing** | Tests de navegador |

---

## Resumen del Módulo

| Concepto | Descripción |
|----------|-------------|
| **Container Registry** | Almacén de imágenes Docker |
| **GitLab Pages** | Hosting estático |
| **Environments** | Entornos de despliegue |
| **Review Apps** | Entornos dinámicos por MR |
| **Releases** | Versionado y publicación |
| **Auto DevOps** | Pipeline preconfigurado |

---

**Documentación oficial**: https://docs.gitlab.com
**Siguiente**: [[06 - Módulo 6 - Seguridad|Módulo 6: Seguridad]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
