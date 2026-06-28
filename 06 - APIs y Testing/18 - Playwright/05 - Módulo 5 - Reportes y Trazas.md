# Módulo 5: Reportes y Trazas

**Objetivo**: Aprender y dominar: Reportes y Trazas.

## Reporte HTML

```bash
npx playwright show-report
```

El reporte incluye tests pasados, fallidos, duracion, capturas de pantalla y trazas.

## Trace Viewer

Habilitar trazas en `playwright.config.ts`:

```ts
export default defineConfig({
  use: {
    trace: 'on', // 'on', 'on-first-retry', 'retain-on-failure', 'off'
  },
});
```

Ejecutar y ver:

```bash
npx playwright test --trace on
npx playwright show-trace trace.zip
```

## Screenshots

```ts
await page.screenshot({ path: 'screenshot.png', fullPage: true });
await expect(page).toHaveScreenshot('homepage.png');
```

## Video

```ts
export default defineConfig({
  use: {
    recordVideo: { dir: 'videos/' },
  },
});
```

| Reporte | Descripcion |
|---------|-------------|
| HTML | Reporte visual completo |
| Trace Viewer | Depuracion paso a paso |
| Screenshot | Captura de pantalla |
| Video | Grabacion del test |
| List (default) | Salida en consola |

---

**Documentación oficial**: https://playwright.dev/docs/intro
**Siguiente**: [[Módulo 6: Mobile y Visual]]
**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
