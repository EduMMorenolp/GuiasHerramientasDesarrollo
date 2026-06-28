# Módulo 3: MySQL y Workbench

**Objetivo**: Instalar, configurar y operar MySQL usando CLI y MySQL Workbench.

---

## Instalación

### MySQL Installer
Descargar desde: https://dev.mysql.com/downloads/installer/

Incluye:
- MySQL Server
- MySQL Workbench (GUI)
- MySQL Shell
- Connectors (Python, Node.js, .NET, ODBC)

```powershell
# Verificar instalación
mysql --version

# Iniciar servicio (Windows)
net start MySQL80
```

---

## CLI de MySQL

### Conexión y bases de datos
```powershell
# Conectar
mysql -u root -p

# Mostrar bases de datos
SHOW DATABASES;

# Seleccionar base
USE mi_base;

# Mostrar tablas
SHOW TABLES;

# Ver estructura
DESCRIBE usuarios;
SHOW CREATE TABLE usuarios;
```

### Usuarios y privilegios
```sql
CREATE USER 'app'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON mi_base.* TO 'app'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'app'@'localhost';
```

---

## MySQL Workbench

### Pestañas principales
- **Connection**: Configurar conexión (host, puerto 3306, usuario)
- **SQL Editor**: Escribir y ejecutar consultas con autocompletado
- **Result Grid**: Ver resultados en tabla editable
- **Schema Browser**: Navegar estructura de la base

### EER Diagrams
- `Database > Reverse Engineer`: Generar diagrama desde base existente
- `Database > Forward Engineer`: Generar SQL desde diagrama
- Exportar a PNG, PDF

### Administración
- **Server Status**: Estado, conexiones activas, variables
- **Users and Privileges**: Gestión de usuarios gráfica
- **Data Export/Restore**: Exportar bases con `mysqldump` integrado
- **Performance Dashboard**: Monitoreo de queries lentas

---

## mysqldump

```powershell
# Exportar base completa
mysqldump -u root -p mi_base > backup.sql

# Exportar solo estructura
mysqldump -u root -p --no-data mi_base > esquema.sql

# Exportar solo datos
mysqldump -u root -p --no-create-info mi_base > datos.sql

# Exportar múltiples bases
mysqldump -u root -p --databases db1 db2 > multi.sql

# Importar
mysql -u root -p mi_base < backup.sql
```

---

## Diferencias MySQL vs PostgreSQL

| Aspecto | MySQL | PostgreSQL |
|---------|-------|------------|
| Licencia | GPL (dual) | PostgreSQL License |
| Cumplimiento SQL | Parcial | Alto |
| Índices | B-Tree, Hash (MEMORY), Full-text | B-Tree, Hash, GiST, GIN, BRIN |
| JSON | JSON (simple) | JSONB (binario, indexable) |
| Concurrencia | MVCC + gap locks | MVCC (sin locks) |
| Replicación | Asíncrona, Group Replication | Síncrona, Streaming, Lógica |
| Extensiones | Limitado | Rico (PostGIS, TimescaleDB) |

---

## Resumen

| Comando | Propósito |
|---------|-----------|
| `mysql -u root -p` | Conectar a MySQL |
| `SHOW DATABASES` | Listar bases |
| `USE db` | Seleccionar base |
| `DESCRIBE tabla` | Ver estructura |
| `mysqldump` | Exportar/importar |
| `GRANT` | Asignar permisos |

---

**Documentación oficial**: https://www.w3schools.com/sql/

**Siguiente**: [[04 - Módulo 4 - PostgreSQL y pgAdmin|Módulo 4: PostgreSQL y pgAdmin]]

**Inicio herramienta**: [[bd|Bases de Datos]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
