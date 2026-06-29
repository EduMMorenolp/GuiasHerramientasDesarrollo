# Módulo 5: Catalogo y Seguridad

**Objetivo**: Aprender y dominar: Catalogo y Seguridad.

## Catalogo de versiones

Se pueden centralizar versiones usando `pnpm.catalog` en `package.json`:

```json
{
  "pnpm": {
    "catalog": {
      "typescript": "^5.5.0",
      "vitest": "^2.0.0"
    }
  }
}
```

Luego los paquetes del workspace referencian el catalogo:

```json
{
  "devDependencies": {
    "typescript": "catalog:",
    "vitest": "catalog:"
  }
}
```

## Seguridad

```bash
# Auditar vulnerabilidades
pnpm audit

# Ver licencias de todas las dependencias
pnpm licenses list

# Generar SBOM (Software Bill of Materials)
pnpm sbom
```

## Permisos de build

Controlar que paquetes tienen permitido ejecutar scripts de instalacion:

```json
{
  "pnpm": {
    "onlyBuiltDependencies": ["esbuild", "sharp"]
  }
}
```

## Lockfile

pnpm genera `pnpm-lock.yaml`:

- Formato YAML mas legible que el JSON de npm.
- Incluye informacion de integridad (checksums).
- Se debe commitear siempre.

Diferencias con `package-lock.json`:

| Caracteristica | package-lock.json | pnpm-lock.yaml |
|----------------|-------------------|----------------|
| Formato | JSON | YAML |
| Legibilidad | Baja | Alta |
| Resolucion | Plana | Anidada por paquete |
| Integridad | Si | Si |

## Tabla de seguridad

| Comando | Descripcion |
|---------|-------------|
| `pnpm audit` | Escanea vulnerabilidades en las dependencias |
| `pnpm audit --fix` | Aplica actualizaciones automaticas seguras |
| `pnpm licenses list` | Lista todas las licencias de terceros |
| `pnpm sbom` | Genera un SBOM en formato SPDX |
| `pnpm licenses audit` | Verifica licencias no permitidas |

## Navegacion

---

**Documentación oficial**: https://pnpm.io/motivation
**Siguiente**: [[02 - Lenguajes y Runtimes/16 - pnpm/06 - Módulo 6 - Avanzado|Módulo 6 - Avanzado]]
**Inicio herramienta**: [[pnpm|pnpm]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
