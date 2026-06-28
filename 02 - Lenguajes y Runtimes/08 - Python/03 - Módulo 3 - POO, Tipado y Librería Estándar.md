# Módulo 3: POO, Tipado y Librería Estándar

**Objetivo**: Programación orientada a objetos avanzada, type hints y módulos esenciales de la stdlib.

---

## POO Avanzada

### Clases y herencia
```python
class Animal:
    def __init__(self, nombre: str):
        self.nombre = nombre

    def hacer_sonido(self) -> str:
        raise NotImplementedError

class Perro(Animal):
    def __init__(self, nombre: str, raza: str):
        super().__init__(nombre)
        self.raza = raza

    def hacer_sonido(self) -> str:
        return "Guau!"

    @classmethod
    def desde_dict(cls, data: dict) -> "Perro":
        return cls(data["nombre"], data["raza"])

    @staticmethod
    def es_mamifero() -> bool:
        return True
```

### Propiedades y atributos privados
```python
class Usuario:
    def __init__(self, nombre: str, email: str):
        self.nombre = nombre
        self._email = email  # "protegido" (convención)
        self.__password_hash = None  # name mangling

    @property
    def email(self) -> str:
        return self._email

    @email.setter
    def email(self, value: str):
        if "@" not in value:
            raise ValueError("Email inválido")
        self._email = value

    @email.deleter
    def email(self):
        self._email = None

    @property
    def iniciales(self) -> str:
        return "".join(p[0].upper() for p in self.nombre.split())
```

### Dataclasses
```python
from dataclasses import dataclass, field, asdict
from typing import List, Optional

@dataclass
class Producto:
    nombre: str
    precio: float
    categoria: str = "General"
    tags: List[str] = field(default_factory=list)
    descuento: Optional[float] = None

    @property
    def precio_final(self) -> float:
        if self.descuento:
            return self.precio * (1 - self.descuento)
        return self.precio

    def __post_init__(self):
        if self.precio < 0:
            raise ValueError("Precio no puede ser negativo")

p = Producto("Laptop", 1200, tags=["electronica"])
print(asdict(p))  # dict serializable
```

### Abstract Base Classes
```python
from abc import ABC, abstractmethod

class Repositorio(ABC):
    @abstractmethod
    def guardar(self, entidad: dict) -> None: ...

    @abstractmethod
    def obtener(self, id: int) -> dict: ...

class RepositorioPostgres(Repositorio):
    def guardar(self, entidad: dict) -> None:
        print(f"Guardando en Postgres: {entidad}")

    def obtener(self, id: int) -> dict:
        return {"id": id, "nombre": "Ejemplo"}
```

---

## Type Hints

```python
from typing import (
    Optional, Union, Any, List, Tuple, Dict, Set,
    Callable, TypeVar, Generic, Literal, Protocol
)

# Tipos básicos
def procesar(items: List[str]) -> Dict[str, int]:
    return {item: len(item) for item in items}

# Optional / Union
def buscar(id: int) -> Optional[dict]:
    return None  # o dict

# Callable
def ejecutar(fn: Callable[[int, str], bool]) -> None:
    fn(1, "test")

# Genéricos
T = TypeVar("T")
U = TypeVar("U", int, float)  # restringido

class Caja(Generic[T]):
    def __init__(self, contenido: T):
        self.contenido = contenido

    def obtener(self) -> T:
        return self.contenido

# Protocol (duck typing)
class Nadador(Protocol):
    def nadar(self) -> str: ...

class Pez:
    def nadar(self) -> str:
        return "El pez nada"

def mover(animal: Nadador) -> None:
    print(animal.nadar())
```

---

## Librería Estándar

### collections
```python
from collections import defaultdict, Counter, deque, OrderedDict

# defaultdict: valor por defecto
contador = defaultdict(int)
contador["a"] += 1  # no KeyError

# Counter: contar elementos
frecuencias = Counter("abbcccdddd")
print(frecuencias.most_common(2))  # [('d', 4), ('c', 3)]

# deque: cola bidireccional eficiente
cola = deque(maxlen=100)
cola.append("derecha")
cola.appendleft("izquierda")
cola.popleft()
```

### itertools
```python
from itertools import chain, cycle, count, permutations, groupby

# chain: concatenar iterables
list(chain([1, 2], [3, 4]))  # [1, 2, 3, 4]

# cycle: ciclo infinito
for item in cycle(["A", "B", "C"]):
    break  # usar con cuidado

# count: contador infinito
for i in zip(count(1), ["a", "b", "c"]):
    print(i)  # (1, 'a'), (2, 'b'), (3, 'c')

# permutations: permutaciones
list(permutations([1, 2, 3], 2))

# groupby: agrupar (requiere datos ordenados)
datos = [("A", 1), ("A", 2), ("B", 3)]
for key, group in groupby(datos, key=lambda x: x[0]):
    print(key, list(group))
```

### datetime
```python
from datetime import datetime, date, timedelta, timezone

ahora = datetime.now()
utc = datetime.now(timezone.utc)
hoy = date.today()

# Formateo
ahora.strftime("%Y-%m-%d %H:%M:%S")
datetime.strptime("2024-12-25", "%Y-%m-%d")

# Zona horaria
from zoneinfo import ZoneInfo
mx = datetime.now(ZoneInfo("America/Mexico_City"))

# Cálculos
ayer = hoy - timedelta(days=1)
diferencia = (datetime(2025, 1, 1) - ahora).days
```

### functools
```python
from functools import lru_cache, partial, wraps

# Cache
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

# Partial
def potencia(base: float, exp: float) -> float:
    return base ** exp

cuadrado = partial(potencia, exp=2)
print(cuadrado(5))  # 25

# wraps (preservar metadatos)
def log(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print(f"Llamando a {func.__name__}")
        return func(*args, **kwargs)
    return wrapper
```

---

## Resumen del Módulo

| Tema | Módulo |
|------|--------|
| POO | classes, ABC, dataclass, property |
| Type Hints | typing.Generic, Protocol, TypeVar |
| Stdlib | collections, itertools, datetime, functools |

---

**Documentación oficial**: https://docs.python.org/3/

**Siguiente**: [[04 - Módulo 4 - Generadores, Decoradores y Context Managers|Módulo 4: Generadores, Decoradores y Context Managers]]

**Inicio herramienta**: [[python|Python]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
