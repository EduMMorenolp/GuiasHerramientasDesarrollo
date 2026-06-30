# Módulo 4: Generadores, Decoradores y Context Managers

**Objetivo**: Patrones avanzados de Python: generadores, decoradores para metaprogramación y administradores de contexto.

---

## Generadores

### Básico
```python
def contador(max: int):
    n = 0
    while n < max:
        yield n
        n += 1

for num in contador(5):
    print(num)  # 0, 1, 2, 3, 4

# Generador como expresión
cuadrados = (x ** 2 for x in range(10))
```

### yield from
```python
def combinar(*iterables):
    for iterable in iterables:
        yield from iterable

resultado = list(combinar([1, 2], "ab"))
# [1, 2, 'a', 'b']
```

### Generadores infinitos
```python
def fibonacci():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

fib = fibonacci()
primeros_10 = [next(fib) for _ in range(10)]

def read_large_file(path: str):
    with open(path, "r") as f:
        for line in f:
            yield line.strip()

# Pipeline con generadores
def parse_logs(lines):
    for line in lines:
        if "ERROR" in line:
            yield line

def extract_timestamps(lines):
    import re
    for line in lines:
        match = re.search(r"\[(.*?)\]", line)
        if match:
            yield match.group(1)
```

### Envío de valores con send
```python
def accumulador():
    total = 0
    while True:
        valor = yield total
        if valor is not None:
            total += valor

acc = accumulador()
next(acc)  # inicializar
print(acc.send(10))  # 10
print(acc.send(5))   # 15
print(acc.send(3))   # 18
```

---

## Decoradores

### Decorador básico
```python
from functools import wraps
import time

def timer(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed = time.perf_counter() - start
        print(f"{func.__name__} tomó {elapsed:.4f}s")
        return result
    return wrapper

@timer
def proceso_lento():
    time.sleep(0.5)

proceso_lento()
```

### Decorador con argumentos
```python
def retry(max_attempts: int = 3, delay: float = 1.0):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(max_attempts):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    if attempt == max_attempts - 1:
                        raise
                    time.sleep(delay)
            return None
        return wrapper
    return decorator

@retry(max_attempts=5, delay=0.5)
def llamar_api():
    # código que puede fallar
    pass
```

### Decorador como clase
```python
class Singleton:
    def __init__(self, cls):
        self.cls = cls
        self.instance = None

    def __call__(self, *args, **kwargs):
        if self.instance is None:
            self.instance = self.cls(*args, **kwargs)
        return self.instance

@Singleton
class Config:
    def __init__(self):
        self.data = {}

# Decorador con estado
class CountCalls:
    def __init__(self, func):
        self.func = func
        self.count = 0

    def __call__(self, *args, **kwargs):
        self.count += 1
        print(f"{self.func.__name__} llamada #{self.count}")
        return self.func(*args, **kwargs)
```

---

## Context Managers

### with statement
```python
# Context manager básico
class ManagedFile:
    def __init__(self, path: str, mode: str = "r"):
        self.path = path
        self.mode = mode

    def __enter__(self):
        self.file = open(self.path, self.mode)
        return self.file

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.file.close()
        # Retornar False para propagar excepciones
        return False

with ManagedFile("data.txt", "w") as f:
    f.write("Hello")
```

### contextlib
```python
from contextlib import contextmanager

@contextmanager
def temporizador(nombre: str):
    start = time.perf_counter()
    try:
        yield
    finally:
        elapsed = time.perf_counter() - start
        print(f"{nombre}: {elapsed:.4f}s")

with temporizador("operacion"):
    time.sleep(0.3)

@contextmanager
def cambiar_directorio(path: str):
    import os
    cwd = os.getcwd()
    try:
        os.chdir(path)
        yield
    finally:
        os.chdir(cwd)

# ExitStack: múltiples context managers dinámicos
from contextlib import ExitStack

def administrar_multiple(archivos):
    with ExitStack() as stack:
        handles = []
        for archivo in archivos:
            f = stack.enter_context(open(archivo, "r"))
            handles.append(f)
        yield handles
```

### Async Context Manager
```python
class AsyncResource:
    async def __aenter__(self):
        await self.conectar()
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        await self.desconectar()

    async def conectar(self):
        print("Conectando...")

    async def desconectar(self):
        print("Desconectando...")

async def usar():
    async with AsyncResource() as res:
        print("Usando recurso")
```

---

## Resumen del Módulo

| Patrón | Uso |
|--------|-----|
| Generadores | yield, yield from, send, pipeline |
| Decoradores | @wraps, argumentos, clases como decoradores |
| Context Managers | __enter__/__exit__, contextlib, ExitStack |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/08 - Python/03 - Módulo 3 - POO, Tipado y Librería Estándar\|Módulo 3 - POO, Tipado y Librería Estándar]] |
| **Siguiente →** | [[05 - Módulo 5 - Testing, Logging y Concurrencia\|Módulo 5: Testing, Logging y Concurrencia]] |
| **Inicio herramienta** | [[python\|Python]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Python Docs](https://docs.python.org/3/) |

---
