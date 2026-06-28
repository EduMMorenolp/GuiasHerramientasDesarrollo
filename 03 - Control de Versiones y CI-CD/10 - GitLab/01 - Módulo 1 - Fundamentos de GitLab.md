# MÃ³dulo 1: Fundamentos de GitLab

**Objetivo**: Conocer GitLab, diferenciarlo de GitHub y configurar el entorno de trabajo.

---

## Â¿QuÃ© es GitLab?

GitLab es una plataforma DevOps completa que cubre todo el ciclo de vida del desarrollo: planificar, crear, verificar, empaquetar, liberar, configurar y monitorizar.

### GitLab SaaS vs Self-Hosted

| CaracterÃ­stica | GitLab SaaS (gitlab.com) | GitLab Self-Hosted |
|----------------|--------------------------|---------------------|
| Mantenimiento | GitLab Inc. lo gestiona | Tu equipo lo administra |
| Disponibilidad | 99.9% SLA | Depende de tu infraestructura |
| PersonalizaciÃ³n | Limitada | Total (gitlab.rb) |
| Seguridad | Certificaciones estÃ¡ndar | Control total de datos |
| Precio | Gratis + planes pagos | Licencia por usuario |
| Ideal para | Equipos pequeÃ±os/medianos | Empresas conåˆè§„éœ€æ±‚ |

### Comparativa con GitHub

| Aspecto | GitLab | GitHub |
|---------|--------|--------|
| CI/CD integrado | Nativo (GitLab CI/CD) | GitHub Actions (adquirido) |
| Self-hosted | SÃ­ (cÃ³digo abierto) | SÃ­ (GitHub Enterprise) |
| Registro contenedores | Container Registry | GitHub Packages (GHCR) |
| Seguridad integrada | SAST/DAST nativos | Depende de terceros |
| MÃ©tricas DevOps | DORA metrics nativas | Requiere GitHub Insights |
| Modelo de precios | Basado en usuarios | Basado en usuarios |
| Licencia | MIT (CE) / Propietaria (EE) | Propietaria |

---

## Crear Cuenta

1. Ir a https://gitlab.com
2. Registrarse con email, GitHub o Google
3. Confirmar email
4. Configurar perfil (avatar, nombre, bio)

### Grupos, Subgrupos y Proyectos

```yaml
Grupo: mi-empresa
  â”œâ”€â”€ Subgrupo: backend
  â”‚   â”œâ”€â”€ Proyecto: api-rest
  â”‚   â””â”€â”€ Proyecto: workers
  â””â”€â”€ Subgrupo: frontend
      â”œâ”€â”€ Proyecto: web-app
      â””â”€â”€ Proyecto: mobile-app
```

```powershell
# Crear proyecto desde CLI (requiere token)
curl --header "PRIVATE-TOKEN: <token>" \
  -X POST "https://gitlab.com/api/v4/projects" \
  -d "name=mi-proyecto&namespace_id=<group_id>"
```

---

## AutenticaciÃ³n

### SSH Keys

```powershell
# Generar clave SSH
ssh-keygen -t ed25519 -C "tu@email.com"

# Copiar clave pÃºblica
Get-Content $env:USERPROFILE\.ssh\id_ed25519.pub | Set-Clipboard
```

AÃ±adir en GitLab: Settings > SSH Keys

### Personal Access Tokens

1. Settings > Access Tokens
2. Crear token con scopes:
   - `api` - Acceso completo a la API
   - `read_repository` - Clonar repositorios
   - `write_repository` - Hacer push
   - `read_registry` - Leer imÃ¡genes del registro

```powershell
# Usar token en CLI
git clone https://oauth2:<token>@gitlab.com/usuario/repo.git
```

---

## NavegaciÃ³n por la Sidebar

| Elemento | DescripciÃ³n |
|----------|-------------|
| **Projects** | Lista de tus proyectos |
| **Groups** | Grupos y subgrupos |
| **Issues** | Issues asignados a ti |
| **Merge Requests** | MR pendientes de revisiÃ³n |
| **To-Do List** | Tareas pendientes |
| **Milestones** | Hitos del proyecto |
| **Snippets** | Fragmentos de cÃ³digo |
| **Help** | DocumentaciÃ³n y atajos |

---

## Resumen del MÃ³dulo

| Concepto | DescripciÃ³n |
|----------|-------------|
| **GitLab SaaS** | VersiÃ³n cloud gestionada por GitLab |
| **Self-Hosted** | InstalaciÃ³n en tu infraestructura |
| **Grupos/Subgrupos** | JerarquÃ­a organizativa |
| **SSH** | AutenticaciÃ³n por clave pÃºblica |
| **PAT** | Token personal de acceso |
| **Sidebar** | NavegaciÃ³n principal de GitLab |

---

**Documentación oficial**: https://docs.gitlab.com
**Siguiente**: [[02 - MÃ³dulo 2 - Repositorios y Merge Requests|MÃ³dulo 2: Repositorios y Merge Requests]]
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
