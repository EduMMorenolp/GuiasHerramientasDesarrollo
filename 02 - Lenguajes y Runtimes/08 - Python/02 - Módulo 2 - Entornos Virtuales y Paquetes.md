# Módulo 2: Entornos Virtuales y Paquetes

**Objetivo**: Gestionar dependencias y entornos en Python.

---

## Entornos Virtuales

### Creación y activación
```powershell
# Crear entorno virtual
python -m venv .venv

# Activar (Windows PowerShell)
.\.venv\Scripts\Activate.ps1

# Activar (CMD)
.\.venv\Scripts\activate.bat

# Verificar
where python

# Desactivar
deactivate
```

### ¿Por qué usar entornos virtuales?
- Aíslan dependencias por proyecto
- Evitan conflictos entre versiones
- Reproducibles: requirements.txt
- Diferentes proyectos pueden usar diferentes versiones

---

## pip

```powershell
# Instalar paquetes
pip install requests
pip install flask==2.3.0
pip install "fastapi>=0.100,<1.0"

# Instalar desde requirements
pip install -r requirements.txt

# Listar paquetes
pip list
pip freeze

# Generar requirements
pip freeze > requirements.txt

# Actualizar
pip install --upgrade requests

# Eliminar
pip uninstall requests
```

---

## Poetry

```powershell
# Instalar
scoop install poetry
# O
pip install poetry

# Inicializar proyecto
poetry new mi-proyecto
poetry init

# Añadir dependencias
poetry add requests
poetry add --dev pytest black

# Instalar
poetry install

# Scripts
poetry run python main.py
poetry shell  # Activar entorno
```

### pyproject.toml
```toml
[tool.poetry]
name = "mi-proyecto"
version = "0.1.0"
description = ""
authors = ["Tu Nombre <tu@email.com>"]

[tool.poetry.dependencies]
python = "^3.11"
fastapi = "^0.104"
pydantic = "^2.0"

[tool.poetry.group.dev.dependencies]
pytest = "^7.4"
black = "^23.0"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"

[tool.black]
line-length = 100
```

---

## uv (Alternativa rápida)

```powershell
# Instalar
scoop install uv

# Crear entorno y sync
uv init
uv add requests fastapi
uv sync

# Ejecutar
uv run python main.py

# Instalar tool
uv tool install ruff
uvx ruff check .
```

---

## Formatteo y Linting

### Black (formateo)
```powershell
pip install black
black .  # Formatear todo
black --check .  # Solo verificar
```

### Ruff (linter rápido)
```powershell
pip install ruff
ruff check .
ruff check --fix .
ruff format .
```

### Configuración (pyproject.toml)
```toml
[tool.ruff]
line-length = 100
target-version = "py311"

[tool.ruff.lint]
select = ["E", "F", "I", "W"]
ignore = ["E501"]

[tool.ruff.format]
quote-style = "double"
```

---

## pytest

```python
# test_math.py
import pytest

def test_suma():
    assert 1 + 1 == 2

def test_division():
    with pytest.raises(ZeroDivisionError):
        1 / 0

@pytest.mark.parametrize("a, b, esperado", [
    (1, 2, 3),
    (0, 0, 0),
    (-1, 1, 0),
])
def test_suma_parametrizada(a, b, esperado):
    assert a + b == esperado
```

```powershell
pytest
pytest -v
pytest --coverage
```

---

## Gestor de Dependencias: Comparativa

| Herramienta | Lock file | Velocidad | Reproducible |
|------------|-----------|-----------|--------------|
| pip + venv | requirements.txt | Lenta | Parcial |
| Poetry | poetry.lock | Media | Sí |
| pipenv | Pipfile.lock | Media | Sí |
| uv | uv.lock | Muy rápida | Sí |

---

## Buenas Prácticas

1. **Entorno virtual** siempre activado
2. **requirements.txt** o **pyproject.toml** versionado
3. **`.venv/`** en .gitignore
4. **Python 3.11+** (3.12+ para proyectos nuevos)
5. **Type hints** para mejor mantenibilidad
6. **Black + Ruff** para formato/linting consistentes
7. **pytest** para testing
8. **Pre-commit hooks** para automatizar calidad

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/08 - Python/01 - Módulo 1 - Fundamentos de Python\|Módulo 1 - Fundamentos de Python]] |
| **Siguiente →** | [[03 - Módulo 3 - POO, Tipado y Librería Estándar\|Módulo 3: POO, Tipado y Librería Estándar]] |
| **Inicio herramienta** | [[python\|Python]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Python Docs](https://docs.python.org/3/) |

---
