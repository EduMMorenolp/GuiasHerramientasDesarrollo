# Módulo 1: Fundamentos de Python

**Objetivo**: Instalar Python y dominar los fundamentos del lenguaje.

---

## Instalación

### Gestionar versiones
```powershell
# pyenv para Windows (o instalador oficial)
scoop install pyenv

# Gestionar versiones
pyenv install 3.12.0
pyenv global 3.12.0

# Verificar
python --version
pip --version
```

---

## Sintaxis Básica

```python
# Variables y tipos
nombre: str = "Mundo"
edad: int = 25
precio: float = 99.99
activo: bool = True

# F-strings (Python 3.6+)
print(f"Hola, {nombre}! Tienes {edad} años.")

# Listas
numeros = [1, 2, 3, 4, 5]
numeros.append(6)
numeros[0]  # 1
numeros[-1]  # 6

# Diccionarios
usuario = {"nombre": "Juan", "edad": 30}
usuario["email"] = "juan@email.com"

# Tuplas (inmutables)
coordenadas = (10, 20)

# Sets
unique = {1, 2, 3, 3, 3}  # {1, 2, 3}
```

---

## Control de Flujo

```python
# If/elif/else
if edad >= 18:
    print("Adulto")
elif edad >= 13:
    print("Adolescente")
else:
    print("Niño")

# For
for i in range(5):
    print(i)

for nombre in ["Ana", "Juan", "María"]:
    print(f"Hola, {nombre}")

for clave, valor in usuario.items():
    print(f"{clave}: {valor}")

# While
contador = 0
while contador < 5:
    print(contador)
    contador += 1

# List comprehension
cuadrados = [x**2 for x in range(10)]
pares = [x for x in range(20) if x % 2 == 0]
```

---

## Funciones

```python
# Función básica
def saludar(nombre: str) -> str:
    return f"Hola, {nombre}!"

# Parámetros opcionales
def conectar(host: str = "localhost", port: int = 5432):
    print(f"Conectando a {host}:{port}")

# Args y kwargs
def log(*args, **kwargs):
    print("args:", args)
    print("kwargs:", kwargs)

log("error", "usuario no encontrado", codigo=404)

# Lambda
cuadrado = lambda x: x ** 2
numeros_pares = list(filter(lambda x: x % 2 == 0, [1, 2, 3, 4, 5]))

# Decorador básico
def timer(func):
    def wrapper(*args, **kwargs):
        import time
        inicio = time.time()
        resultado = func(*args, **kwargs)
        print(f"{func.__name__}: {time.time() - inicio:.2f}s")
        return resultado
    return wrapper

@timer
def proceso_lento():
    import time
    time.sleep(1)
```

---

## Módulos y Paquetes

```python
# Importar módulo
import math
print(math.pi)

# Importar específico
from datetime import datetime, timedelta
print(datetime.now())

# Módulo propio: mi_modulo.py
# def saludar(): ...
# from mi_modulo import saludar

# Paquete: directorio con __init__.py
# mi_paquete/
#   __init__.py
#   modulo1.py
#   modulo2.py
```

---

## Manejo de Errores

```python
try:
    resultado = 10 / 0
except ZeroDivisionError:
    print("No se puede dividir por cero")
except Exception as e:
    print(f"Error: {e}")
else:
    print(f"Resultado: {resultado}")
finally:
    print("Siempre se ejecuta")

# Excepciones personalizadas
class MiError(Exception):
    pass

raise MiError("Algo salió mal")
```

---

## Archivos

```python
# Leer archivo
with open("datos.txt", "r", encoding="utf-8") as f:
    contenido = f.read()

# Leer línea por línea
with open("datos.txt", "r") as f:
    for linea in f:
        print(linea.strip())

# Escribir
with open("output.txt", "w") as f:
    f.write("Hola mundo\n")

# Añadir
with open("log.txt", "a") as f:
    f.write("Nueva entrada\n")
```

---

| Navegación | Enlace |
|------------|--------|
| **← Anterior** | — |
| **Siguiente →** | [[02 - Módulo 2 - Entornos Virtuales y Paquetes\|Módulo 2: Entornos Virtuales y Paquetes]] |
| **Inicio herramienta** | [[python\|Python]] |
| **Inicio principal** | [[../../00 - Índice/Índice General\|IÍndice General]] |
| **Documentación oficial** | [Python Docs](https://docs.python.org/3/) |

---
