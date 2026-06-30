# Módulo 1: Fundamentos de GitLab

**Objetivo**: Conocer GitLab, diferenciarlo de GitHub y configurar el entorno de trabajo.

---

## ¿Qué es GitLab?

GitLab es una plataforma DevOps completa que cubre todo el ciclo de vida del desarrollo: planificar, crear, verificar, empaquetar, liberar, configurar y monitorizar.

### GitLab SaaS vs Self-Hosted

| Característica | GitLab SaaS (gitlab.com) | GitLab Self-Hosted |
|----------------|--------------------------|---------------------|
| Mantenimiento | GitLab Inc. lo gestiona | Tu equipo lo administra |
| Disponibilidad | 99.9% SLA | Depende de tu infraestructura |
| Personalización | Limitada | Total (gitlab.rb) |
| Seguridad | Certificaciones estándar | Control total de datos |
| Precio | Gratis + planes pagos | Licencia por usuario |
| Ideal para | Equipos pequeños/medianos | Empresas conåˆè§„éœ€æ±‚ |

### Comparativa con GitHub

| Aspecto | GitLab | GitHub |
|---------|--------|--------|
| CI/CD integrado | Nativo (GitLab CI/CD) | GitHub Actions (adquirido) |
| Self-hosted | Sí (código abierto) | Sí (GitHub Enterprise) |
| Registro contenedores | Container Registry | GitHub Packages (GHCR) |
| Seguridad integrada | SAST/DAST nativos | Depende de terceros |
| Métricas DevOps | DORA metrics nativas | Requiere GitHub Insights |
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

## Autenticación

### SSH Keys

```powershell
# Generar clave SSH
ssh-keygen -t ed25519 -C "tu@email.com"

# Copiar clave pública
Get-Content $env:USERPROFILE\.ssh\id_ed25519.pub | Set-Clipboard
```

Añadir en GitLab: Settings > SSH Keys

### Personal Access Tokens

1. Settings > Access Tokens
2. Crear token con scopes:
   - `api` - Acceso completo a la API
   - `read_repository` - Clonar repositorios
   - `write_repository` - Hacer push
   - `read_registry` - Leer imágenes del registro

```powershell
# Usar token en CLI
git clone https://oauth2:<token>@gitlab.com/usuario/repo.git
```

---

## Navegación por la Sidebar

| Elemento | Descripción |
|----------|-------------|
| **Projects** | Lista de tus proyectos |
| **Groups** | Grupos y subgrupos |
| **Issues** | Issues asignados a ti |
| **Merge Requests** | MR pendientes de revisión |
| **To-Do List** | Tareas pendientes |
| **Milestones** | Hitos del proyecto |
| **Snippets** | Fragmentos de código |
| **Help** | Documentación y atajos |

---

## Resumen del Módulo

| Concepto | Descripción |
|----------|-------------|
| **GitLab SaaS** | Versión cloud gestionada por GitLab |
| **Self-Hosted** | Instalación en tu infraestructura |
| **Grupos/Subgrupos** | Jerarquía organizativa |
| **SSH** | Autenticación por clave pública |
| **PAT** | Token personal de acceso |
| **Sidebar** | Navegación principal de GitLab |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[02 - Módulo 2 - Repositorios y Merge Requests\|Módulo 2: Repositorios y Merge Requests]] |
| **Inicio herramienta** | [[gitlab\|GitLab]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [GitLab Docs](https://docs.gitlab.com) |

---
