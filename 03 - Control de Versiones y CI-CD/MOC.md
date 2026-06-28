# MOC - Control de Versiones y CI/CD

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### Git ↔ GitLab ↔ GitHub Actions
- GitLab y GitHub Actions son plataformas que extienden Git con CI/CD
- Ambos usan repositorios Git como base
- Estrategias de branching (Git Flow, trunk-based) aplican en ambas

### GitLab CI/CD ↔ GitHub Actions
- Conceptos equivalentes: Jobs ↔ Jobs, Stages ↔ Matrices, Runners ↔ Runners
- GitLab usa `.gitlab-ci.yml`, GitHub usa `.github/workflows/*.yml`
- Ambos soportan artefactos, caché, variables de entorno

### Docker ↔ CI/CD
- GitLab CI/CD y GitHub Actions usan Docker para entornos consistentes
- Ambos pueden buildear y pushear imágenes Docker
- Docker Compose se usa en pipelines para tests de integración

## Estrategias de CI/CD

| Aspecto | GitLab CI/CD | GitHub Actions |
|---------|-------------|----------------|
| Config | `.gitlab-ci.yml` | `.github/workflows/*.yml` |
| Triggers | push, MR, schedule | push, PR, schedule, workflow_dispatch |
| Runners | Shared, specific, group | GitHub-hosted, self-hosted |
| Matriz | `parallel:matrix` | `strategy.matrix` |
| Entornos | `environment` | `environment` con approvals |

---
**Inicio herramienta**: [[Índice General]]
