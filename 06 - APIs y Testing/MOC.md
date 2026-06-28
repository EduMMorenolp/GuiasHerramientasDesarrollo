# MOC - APIs y Testing

Relaciones y conceptos compartidos entre herramientas de esta categoría.

## Conexiones

### Postman ↔ Playwright
- Postman prueba APIs manual/automáticamente, Playwright prueba la UI que consume esas APIs
- Ambos soportan mocking: Postman mock servers, Playwright route interception
- Tests de API en Postman + tests E2E en Playwright cubren frontend y backend

### Postman ↔ Lenguajes Backend
- Colecciones de Postman se exportan a código (Node.js, Python, etc.)
- Variables de entorno en Postman equivalen a `.env` en Node.js/Python
- Newman (CLI de Postman) se integra en pipelines CI/CD

### Playwright ↔ CI/CD
- Tests de Playwright corren en GitHub Actions y GitLab CI/CD
- Playwright soporta sharding para paralelizar tests en CI
- Trazas, screenshots y videos se suben como artefactos

## Pirámide de Testing

```
    /\
   /E2E\  ← Playwright
  /_____\
 /Integr.\  ← Postman (API tests)
/_________\  ← Bun (unit tests)
```

---
**Inicio herramienta**: [[Índice General]]
