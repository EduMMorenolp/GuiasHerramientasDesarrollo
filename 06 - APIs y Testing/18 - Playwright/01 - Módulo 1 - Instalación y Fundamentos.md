# Módulo 1: Instalacion y Fundamentos

## Instalacion

```bash
npm init playwright@latest
npx playwright install
```

Playwright soporta tres navegadores:

| Navegador | Descripcion |
|-----------|-------------|
| Chromium | Google Chrome, Microsoft Edge, Opera |
| Firefox | Mozilla Firefox |
| WebKit | Safari (macOS, iOS) |

## Comandos principales

```bash
npx playwright test        # Ejecutar tests
npx playwright codegen     # Grabar interacciones
```

## Primer test

```ts
import { test, expect } from '@playwright/test';

test('title', async ({ page }) => {
  await page.goto('https://example.com');
  await expect(page).toHaveTitle(/Example/);
});
```

## Estructura de archivos

```
proyecto/
  tests/
    example.spec.ts
  playwright.config.ts
  package.json
```

---
**Documentación oficial**: https://playwright.dev/docs/intro

**Siguiente**: |Módulo 2: Locators y Acciones]]
**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]








