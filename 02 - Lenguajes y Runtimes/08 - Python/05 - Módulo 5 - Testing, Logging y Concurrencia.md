# Módulo 5: Testing, Logging y Concurrencia

**Objetivo**: Testing con pytest, logging profesional y concurrencia con threading, multiprocessing y asyncio.

---

## Testing con pytest

### Básico
```python
# test_math.py
import pytest

def test_suma():
    assert 1 + 1 == 2

def test_con_tipos():
    resultado = procesar("texto")
    assert isinstance(resultado, str)
    assert len(resultado) > 0

# Fixtures
@pytest.fixture
def usuario_ejemplo():
    return {"nombre": "Alice", "email": "alice@email.com"}

def test_usuario(usuario_ejemplo):
    assert usuario_ejemplo["nombre"] == "Alice"

# Fixtures con scope
@pytest.fixture(scope="module")
def db_conexion():
    conn = crear_conexion()
    yield conn
    conn.close()
```

### Parametrización
```python
@pytest.mark.parametrize("a,b,esperado", [
    (1, 2, 3),
    (0, 0, 0),
    (-1, 1, 0),
    (100, -50, 50),
])
def test_suma_parametrizada(a, b, esperado):
    assert a + b == esperado

# Múltiples parámetros
@pytest.mark.parametrize("input_str", ["hola", "mundo", "test"])
@pytest.mark.parametrize("repetitions", [1, 2, 3])
def test_repetir(input_str, repetitions):
    resultado = input_str * repetitions
    assert len(resultado) == len(input_str) * repetitions
```

### Mock
```python
from unittest.mock import Mock, patch, PropertyMock

# Mock simple
api = Mock()
api.obtener_datos.return_value = {"id": 1}
api.obtener_datos.side_effect = [{"id": 1}, ValueError("Error")]

# Patch
@patch("modulo.externo.llamar_api")
def test_servicio(mock_llamar):
    mock_llamar.return_value = {"status": "ok"}
    resultado = mi_funcion()
    assert resultado == "ok"

# Patch context manager
def test_archivo():
    with patch("builtins.open") as mock_open:
        mock_open.return_value.__enter__.return_value.read.return_value = "contenido"
        data = leer_archivo("test.txt")
        assert data == "contenido"
```

### Pytest avanzado
```python
# Config en pytest.ini
# [pytest]
# testpaths = tests
# python_files = test_*.py
# markers =
#     slow: tests lentos
#     integration: tests de integración

@pytest.mark.slow
def test_proceso_pesado():
    time.sleep(5)
    assert True

@pytest.mark.skip(reason="No implementado")
def test_futuro():
    pass

@pytest.mark.xfail
def test_conocido_fallido():
    assert 1 == 2
```

---

## Logging

```python
import logging

# Configuración básica
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S"
)

logger = logging.getLogger(__name__)
logger.debug("Solo para depuración")
logger.info("Iniciando proceso")
logger.warning("Recurso bajo")
logger.error("Error crítico")
logger.critical("Sistema detenido")

# Logging a archivo
file_handler = logging.FileHandler("app.log")
file_handler.setLevel(logging.DEBUG)
formatter = logging.Formatter(
    "%(asctime)s [%(levelname)s] %(name)s:%(lineno)d: %(message)s"
)
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

# Rotación de logs
from logging.handlers import RotatingFileHandler, TimedRotatingFileHandler

handler = RotatingFileHandler(
    "app.log", maxBytes=10_000_000, backupCount=5
)

time_handler = TimedRotatingFileHandler(
    "app.log", when="midnight", interval=1, backupCount=30
)

# Logging estructurado
import json

class JSONFormatter(logging.Formatter):
    def format(self, record):
        log_data = {
            "timestamp": self.formatTime(record),
            "level": record.levelname,
            "logger": record.name,
            "message": record.getMessage(),
        }
        if record.exc_info:
            log_data["exception"] = self.formatException(record.exc_info)
        return json.dumps(log_data)
```

---

## Concurrencia

### threading
```python
import threading
from concurrent.futures import ThreadPoolExecutor

def tarea(n: int):
    print(f"Tarea {n} iniciada")
    time.sleep(1)
    print(f"Tarea {n} completada")

# ThreadPoolExecutor (recomendado)
with ThreadPoolExecutor(max_workers=4) as executor:
    futures = [executor.submit(tarea, i) for i in range(8)]
    for future in futures:
        future.result()

# Lock
lock = threading.Lock()
contador = 0

def incrementar_seguro():
    global contador
    with lock:
        contador += 1

# Event (sincronización)
event = threading.Event()

def esperar_evento():
    print("Esperando...")
    event.wait()
    print("Evento recibido!")

t = threading.Thread(target=esperar_evento)
t.start()
time.sleep(1)
event.set()  # libera el wait
```

### multiprocessing
```python
from multiprocessing import Pool, Process, Queue
import os

# Pool (fácil)
def trabajo_cpu(x: int) -> int:
    return sum(i * i for i in range(x))

with Pool(processes=os.cpu_count()) as pool:
    resultados = pool.map(trabajo_cpu, range(1000))

# Process + Queue
def productor(queue):
    for i in range(5):
        queue.put(i)
    queue.put(None)  # señal de fin

def consumidor(queue):
    while True:
        item = queue.get()
        if item is None:
            break
        print(f"Procesando: {item}")

q = Queue()
p1 = Process(target=productor, args=(q,))
p2 = Process(target=consumidor, args=(q,))
p1.start(); p2.start()
p1.join(); p2.join()
```

### asyncio
```python
import asyncio
import aiohttp

async def fetch_url(url: str) -> str:
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()

async def main():
    urls = [
        "https://api.example.com/1",
        "https://api.example.com/2",
        "https://api.example.com/3",
    ]

    # Concurrente
    tasks = [fetch_url(url) for url in urls]
    resultados = await asyncio.gather(*tasks)

    # Timeout
    try:
        resultado = await asyncio.wait_for(
            fetch_url("https://slow.com"),
            timeout=5.0
        )
    except asyncio.TimeoutError:
        print("Timeout")

asyncio.run(main())

# Semáforo asíncrono (limitar concurrencia)
sem = asyncio.Semaphore(10)

async def fetch_limitada(url: str):
    async with sem:
        return await fetch_url(url)
```

---

## Resumen del Módulo

| Tema | Herramienta |
|------|-------------|
| Testing | pytest, fixtures, mock, parametrize |
| Logging | logging, RotatingFileHandler, JSONFormatter |
| Threading | ThreadPoolExecutor, Lock, Event |
| Multiprocessing | Pool, Process, Queue |
| asyncio | async/await, gather, Semaphore |

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | [[02 - Lenguajes y Runtimes/08 - Python/04 - Módulo 4 - Generadores, Decoradores y Context Managers\|Módulo 4 - Generadores, Decoradores y Context Managers]] |
| **Siguiente →** | [[06 - Módulo 6 - Web, Data Science y Herramientas CLI\|Módulo 6: Web, Data Science y Herramientas CLI]] |
| **Inicio herramienta** | [[python\|Python]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Python Docs](https://docs.python.org/3/) |

---
