# Módulo 6: Web, Data Science y Herramientas CLI

**Objetivo**: Aplicaciones web con FastAPI, análisis de datos con pandas/numpy, y herramientas CLI profesionales.

---

## FastAPI

`python
from fastapi import FastAPI, HTTPException, Depends, Query
from pydantic import BaseModel, Field
from typing import List, Optional

app = FastAPI(title="API", version="1.0.0")

class UsuarioCreate(BaseModel):
    nombre: str = Field(..., min_length=2)
    email: str = Field(..., pattern=r"^\S+@\S+\.\S+$")
    edad: int = Field(ge=0, le=150)

class UsuarioResponse(UsuarioCreate):
    id: int

db: List[dict] = []
contador = 0

@app.get("/")
def root():
    return {"message": "API v1.0.0"}

@app.get("/usuarios", response_model=List[UsuarioResponse])
def listar_usuarios(skip: int = Query(0, ge=0), limit: int = Query(10, ge=1)):
    return db[skip:skip + limit]

@app.get("/usuarios/{usuario_id}", response_model=UsuarioResponse)
def obtener_usuario(usuario_id: int):
    for u in db:
        if u["id"] == usuario_id:
            return u
    raise HTTPException(404, "Usuario no encontrado")

@app.post("/usuarios", response_model=UsuarioResponse, status_code=201)
def crear_usuario(usuario: UsuarioCreate):
    global contador
    contador += 1
    nuevo = usuario.model_dump()
    nuevo["id"] = contador
    db.append(nuevo)
    return nuevo

def get_db():
    return db

@app.get("/stats")
def stats(db=Depends(get_db)):
    return {"total": len(db)}
`

### SQLAlchemy + Alembic
`python
from sqlalchemy import Column, Integer, String, create_engine
from sqlalchemy.orm import DeclarativeBase

class Base(DeclarativeBase):
    pass

class UsuarioDB(Base):
    __tablename__ = "usuarios"
    id = Column(Integer, primary_key=True)
    nombre = Column(String(100), nullable=False)
    email = Column(String(255), unique=True, nullable=False)

engine = create_engine("postgresql://user:pass@localhost/db")
Base.metadata.create_all(engine)
`

---

## Click / Typer (CLI)

### Click
`python
import click

@click.command()
@click.argument("nombre")
@click.option("--count", default=1, help="Numero de veces")
@click.option("--verbose", is_flag=True, help="Modo verboso")
def saludar(nombre: str, count: int, verbose: bool):
    \"\"\"Saluda a NOMBRE varias veces.\"\"\"
    for _ in range(count):
        msg = f"Hola {nombre}!"
        click.echo(msg)

if __name__ == "__main__":
    saludar()
`

### Typer
`python
import typer

app = typer.Typer()

@app.command()
def hello(name: str, count: int = 1):
    for _ in range(count):
        typer.echo(f"Hola {name}!")

@app.command()
def goodbye(name: str, formal: bool = False):
    if formal:
        typer.echo(f"Adios {name}")
    else:
        typer.echo(f"Chao {name}")

if __name__ == "__main__":
    app()
`

### Rich (CLI con colores)
`python
from rich.console import Console
from rich.table import Table
from rich.progress import track
import time

console = Console()

console.print("Hello", style="bold green")

table = Table(title="Usuarios")
table.add_column("ID", style="cyan")
table.add_column("Nombre", style="magenta")
table.add_column("Email")
table.add_row("1", "Alice", "alice@email.com")
table.add_row("2", "Bob", "bob@email.com")
console.print(table)

for _ in track(range(100), description="Procesando..."):
    time.sleep(0.01)
`

---

## Data Science

### pandas
`python
import pandas as pd

df = pd.read_csv("datos.csv")

df.head()
df.info()
df.describe()

df_filtrado = df[df["edad"] > 25]
df_grouped = df.groupby("categoria")["valor"].agg(["mean", "sum", "count"])
df["fecha"] = pd.to_datetime(df["fecha"])
df.set_index("fecha", inplace=True)

# Merge
df_merged = pd.merge(df_clientes, df_pedidos, on="cliente_id", how="left")

# Pivot
pivot = df.pivot_table(values="monto", index="region", columns="mes", aggfunc="sum")
`

### numpy
`python
import numpy as np

arr = np.array([1, 2, 3, 4, 5])
matrix = np.random.randn(3, 4)

arr.mean()
arr.std()
arr.sum()

matrix[0, :]
matrix[:, 1]

np.where(arr > 3, arr, 0)
np.linspace(0, 1, 100)
np.eye(3)
`

### Visualización
`python
import matplotlib.pyplot as plt
import seaborn as sns

plt.figure(figsize=(10, 6))
sns.lineplot(data=df, x="fecha", y="ventas")
sns.barplot(data=df, x="categoria", y="monto")
sns.heatmap(df.corr(), annot=True)

plt.savefig("grafico.png", dpi=300, bbox_inches="tight")
`

---

## Empaquetado

### pyproject.toml
`	oml
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.backends._legacy:_Backend"

[project]
name = "mi-paquete"
version = "0.1.0"
description = "Descripcion breve"
authors = [{ name = "Tu Nombre", email = "email@example.com" }]
license = { text = "MIT" }
readme = "README.md"
requires-python = ">=3.10"
dependencies = [
    "requests>=2.28",
    "click>=8.0",
]

[project.optional-dependencies]
dev = ["pytest", "black", "ruff"]
web = ["fastapi", "uvicorn"]

[project.scripts]
mi-cli = "mi_paquete.cli:main"
`

### Publicar en PyPI
`ash
pip install build twine
python -m build
twine check dist/*
twine upload dist/*
`

---

## Resumen del Modulo

| Tema | Libreria |
|------|----------|
| Web API | FastAPI, Pydantic, SQLAlchemy |
| CLI | Click, Typer, Rich |
| Data Science | pandas, numpy, matplotlib, seaborn |
| Packaging | pyproject.toml, build, twine |

---
**Documentación oficial**: https://docs.python.org/3/

**Inicio herramienta**: [[python|Python]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]






