# Módulo 6: Mobile y Visual

**Objetivo**: Aprender y dominar: Mobile y Visual.

## Emulacion mobile

```ts
import { devices } from '@playwright/test';

const iPhone = devices['iPhone 14'];

const context = await browser.newContext({
  ...iPhone,
});
```

## Pruebas visuales

```ts
await expect(page).toHaveScreenshot('home.png', {
  maxDiffPixels: 200,
});
```

## Accesibilidad

```ts
const snapshot = await page.accessibility.snapshot();
console.log(snapshot);

// Con axe-core
import AxeBuilder from '@axe-core/playwright';
const results = await new AxeBuilder({ page }).analyze();
expect(results.violations).toEqual([]);
```

## Geolocalizacion, permisos y dark mode

```ts
const context = await browser.newContext({
  geolocation: { latitude: 19.4326, longitude: -99.1332 },
  permissions: ['geolocation'],
  colorScheme: 'dark',
});
```

| Dispositivo | Viewport | User Agent |
|-------------|----------|------------|
| `iPhone 14` | 390x844 | Mobile Safari |
| `Pixel 7` | 412x915 | Chrome Android |
| `iPad Pro 11` | 834x1194 | Mobile Safari |
| `Galaxy S8` | 360x740 | Chrome Android |

---

**Documentación oficial**: https://playwright.dev/docs/intro
**Siguiente**: [[Módulo 7: CI/CD y Avanzado]]
**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]
