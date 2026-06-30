# Módulo 4: Runners


**Objetivo**: Aprender y dominar: Runners.

## Runners alojados (GitHub-hosted)

GitHub proporciona máquinas virtuales gestionadas para cada sistema operativo.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
  test-windows:
    runs-on: windows-latest
  test-macos:
    runs-on: macos-latest
```

## Self-hosted runners

Ejecutas el runner en tu propia infraestructura. Tienes control total sobre el hardware, sistema operativo y paquetes instalados.

### Instalacion y registro

```bash
# Descargar el runner
curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/latest/download/actions-runner-win-x64-2.317.0.zip

# Extraer y configurar
./config.cmd --url https://github.com/tu-org/tu-repo --token TU_TOKEN

# Iniciar el runner
./run.cmd
```

### Uso con etiquetas (labels)

```yaml
jobs:
  build:
    runs-on: [self-hosted, linux, x64, gpu]
    steps:
      - run: echo "Corriendo en runner self-hosted con GPU"
```

## Escalado con scale sets

Los scale sets auto-escalan runners self-hosted segun la demanda usando grupos de maquinas virtuales en Azure, AWS o GCP.

```bash
# Ejemplo con Azure VM scale set
gh actions-runner set create \
  --name mi-scale-set \
  --runners-max 10 \
  --runners-min 1 \
  --image ubuntu-22.04
```

## Seguridad en self-hosted

- No ejecutes workflows no confiables en runners self-hosted sin proteccion.
- Usa etiquetas para restringir que jobs se ejecuten en cada runner.
- Aplica parches de seguridad regularmente.
- Considera runners efimeros que se destruyen tras cada ejecucion.

## Tabla de runners

| Runner | SO | Mantenimiento | Costo | Caso de uso |
|---|---|---|---|---|
| `ubuntu-latest` | Linux | GitHub | Minutos incluidos | La mayoria de workflows |
| `windows-latest` | Windows | GitHub | Minutos x2 | Compilacion .NET, WinUI |
| `macos-latest` | macOS | GitHub | Minutos x10 | Builds iOS, macOS |
| `self-hosted` | Cualquiera | Tu equipo | Infraestructura propia | Hardware especial, costos predecibles |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[03 - Control de Versiones y CI-CD/21 - GitHub Actions/03 - Módulo 3 - Actions\|Módulo 3 - Actions]] |
| **Siguiente →** | [[05 - Módulo 5 - Artefactos y Caché\|Módulo 5 - Artefactos y Caché]] |
| **Inicio herramienta** | [[github-actions\|GitHub Actions]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [GitHub Actions Docs](https://docs.github.com/en/actions) |

---
