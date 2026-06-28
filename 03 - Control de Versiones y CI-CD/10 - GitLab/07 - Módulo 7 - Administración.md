# MÃ³dulo 7: AdministraciÃ³n

**Objetivo**: Instalar, configurar y mantener una instancia GitLab Self-Hosted.

---

## InstalaciÃ³n

### Docker (Recomendado para pruebas)

```powershell
docker run --detach \
  --hostname gitlab.ejemplo.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $env:USERPROFILE\gitlab\config:/etc/gitlab \
  --volume $env:USERPROFILE\gitlab\logs:/var/log/gitlab \
  --volume $env:USERPROFILE\gitlab\data:/var/opt/gitlab \
  gitlab/gitlab-ee:latest
```

### Linux Package (Omnibus)

```bash
# Ubuntu/Debian
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo EXTERNAL_URL="https://gitlab.ejemplo.com" apt install gitlab-ee

# CentOS/RHEL
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="https://gitlab.ejemplo.com" yum install gitlab-ee
```

### Helm (Kubernetes)

```bash
helm repo add gitlab https://charts.gitlab.io/
helm repo update

helm install gitlab gitlab/gitlab \
  --set global.hosts.domain=ejemplo.com \
  --set certmanager-issuer.email=admin@ejemplo.com \
  --set global.edition=ee
```

---

## ConfiguraciÃ³n con gitlab.rb

Archivo principal de configuraciÃ³n: `/etc/gitlab/gitlab.rb`

```ruby
# URL externa
external_url 'https://gitlab.ejemplo.com'

# Certificados SSL
letsencrypt['enable'] = true

# LÃ­mites de recursos
puma['worker_processes'] = 4
sidekiq['max_concurrency'] = 25

# Almacenamiento
gitlab_rails['uploads_directory'] = '/var/opt/gitlab/uploads'
gitlab_rails['object_store']['enabled'] = true
gitlab_rails['object_store']['connection'] = {
  'provider' => 'AWS',
  'region' => 'us-east-1',
  'aws_access_key_id' => '<key>',
  'aws_secret_access_key' => '<secret>'
}

# LDAP/SSO
gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = {
  'main' => {
    'label' => 'LDAP',
    'host' => 'ldap.ejemplo.com',
    'port' => 389,
    'uid' => 'sAMAccountName',
    'base' => 'dc=ejemplo,dc=com'
  }
}
```

Aplicar cambios:

```bash
sudo gitlab-ctl reconfigure
```

---

## Backup y Restore

### Backup

```bash
# Backup completo
sudo gitlab-backup create

# Backup incluyendo configuraciones
sudo gitlab-ctl backup-etc

# Backup con variables de entorno
# /etc/gitlab/gitlab.rb
gitlab_rails['backup_path'] = '/mnt/backups/gitlab'
gitlab_rails['backup_keep_time'] = 604800  # 7 dÃ­as
```

### Restore

```bash
# Detener servicios conectados
sudo gitlab-ctl stop puma
sudo gitlab-ctl stop sidekiq

# Verificar estado
sudo gitlab-ctl status

# Restaurar
sudo gitlab-backup restore BACKUP=1712345678_2026_06_27_17.0.0

# Reconfigurar y reiniciar
sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart
```

### AutomatizaciÃ³n con cron

```bash
# Backup diario a las 2 AM
0 2 * * * /opt/gitlab/bin/gitlab-backup create CRON=1
```

---

## Escalado

### Arquitectura por TamaÃ±o

| Usuarios | Servidores | RAM mÃ­nima | CPU |
|----------|------------|------------|-----|
| 1.000 | 1 (todo en uno) | 8 GB | 4 vCPU |
| 5.000 | 2 (app + DB) | 16 GB | 8 vCPU |
| 10.000 | 3 (app, sidekiq, DB) | 32 GB | 16 vCPU |
| 25.000 | 5+ (mÃºltiples roles) | 64 GB | 32 vCPU |
| 50.000 | 8+ (HA completo) | 128 GB+ | 64 vCPU |

### Roles separados (por servidor)

```ruby
# Servidor 1: AplicaciÃ³n
roles ['application_role']

# Servidor 2: Sidekiq (background jobs)
roles ['sidekiq_role']

# Servidor 3: Base de datos
roles ['postgres_role']
gitlab_rails['db_host'] = '10.0.0.3'

# Servidor 4: Redis
roles ['redis_role']
redis['bind'] = '10.0.0.4'

# Servidor 5: Gitaly (Git storage)
roles ['gitaly_role']
gitaly['listen_addr'] = '10.0.0.5:8075'
```

### High Availability

- **PostgreSQL**: Cluster con Patroni + repmgr
- **Redis**: Sentinel para alta disponibilidad
- **Gitaly**: Gitaly Cluster con Praefect
- **Load Balancer**: HAProxy o NGINX
- **Object Storage**: S3 compatible para artifacts, LFS, uploads

---

## Mantenimiento

```bash
# Verificar estado general
sudo gitlab-ctl status

# Ver logs
sudo gitlab-ctl tail

# Verificar configuraciÃ³n
sudo gitlab-rake gitlab:check

# Consola Rails
sudo gitlab-rails console

# Actualizar GitLab
sudo apt update && sudo apt install gitlab-ee

# Verificar versiÃ³n
sudo gitlab-rake gitlab:env:info
```

---

## Resumen del MÃ³dulo

| Concepto | DescripciÃ³n |
|----------|-------------|
| **InstalaciÃ³n Docker** | RÃ¡pida para pruebas |
| **Omnibus** | Package todo-en-uno |
| **Helm** | Despliegue en Kubernetes |
| **gitlab.rb** | ConfiguraciÃ³n central |
| **Backup/Restore** | Copias de seguridad |
| **Escalado** | De 1k a 50k usuarios |
| **HA** | Alta disponibilidad |

---

**Documentación oficial**: https://docs.gitlab.com
**Inicio herramienta**: [[gitlab|GitLab]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]



