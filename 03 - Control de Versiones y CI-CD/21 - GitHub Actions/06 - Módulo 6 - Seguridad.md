# Módulo 6: Seguridad

**Objetivo**: Aprender y dominar: Seguridad.

## Secretos

Los secretos almacenan informacion sensible (tokens, claves) encriptada a nivel de repositorio u organizacion.

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando con token"
        env:
          API_TOKEN: ${{ secrets.API_TOKEN }}
```

## OIDC (OpenID Connect)

OIDC permite autenticarse contra proveedores cloud (AWS, Azure, GCP) sin almacenar credenciales permanentes.

```yaml
jobs:
  deploy:
    permissions:
      id-token: write
      contents: read
    runs-on: ubuntu-latest
    steps:
      - uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::123456789:role/GitHubActions
          aws-region: us-east-1
```

## Permissions

Controla los permisos del `GITHUB_TOKEN` para seguir el principio de minimo privilegio.

```yaml
permissions:
  contents: read
  issues: write
  pull-requests: write
```

## GITHUB_TOKEN

GitHub genera automaticamente un token unico por workflow. Se usa sin configuracion explicita.

```yaml
jobs:
  comment:
    runs-on: ubuntu-latest
    permissions:
      issues: write
    steps:
      - run: gh issue comment ${{ github.event.issue.number }} --body "Revisado"
        env:
          GH_TOKEN: ${{ github.token }}
```

## Entornos protegidos

Los entornos permiten agregar revisores obligatorios y variables de entorno segregadas.

```yaml
jobs:
  deploy:
    environment:
      name: production
      url: https://mi-app.com
    runs-on: ubuntu-latest
    steps:
      - run: echo "Desplegando con aprobacion manual"
```

## Tabla de seguridad

| Concepto | Descripcion | Ejemplo |
|---|---|---|
| `secrets.MY_SECRET` | Valor encriptado | `${{ secrets.DEPLOY_KEY }}` |
| OIDC | Autenticacion sin credenciales | `aws-actions/configure-aws-credentials` |
| `permissions` | Permisos minimos del token | `permissions: contents: read` |
| `GITHUB_TOKEN` | Token automatico de GitHub | `${{ github.token }}` |
| Entornos protegidos | Approvals + variables | `environment: production` |

---

**Documentación oficial**: https://docs.github.com/en/actions
**Siguiente**: [[07 - Módulo 7 - Deploy y Avanzado|Módulo 7 - Deploy y Avanzado]]
**Inicio herramienta**: [[github-actions|GitHub Actions]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
