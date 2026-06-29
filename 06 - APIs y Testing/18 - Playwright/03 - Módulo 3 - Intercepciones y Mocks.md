# Módulo 3: Intercepciones y Mocks

**Objetivo**: Aprender y dominar: Intercepciones y Mocks.

## Interceptar requests

```ts
await page.route('**/api/users', route => {
  console.log('Request intercepted:', route.request().url());
  route.continue();
});
```

## Mock de API

```ts
await page.route('**/api/**', route => {
  route.fulfill({
    status: 200,
    contentType: 'application/json',
    body: JSON.stringify({ users: [] })
  });
});
```

## Estado de autenticacion

```ts
// Guardar estado
await page.context().storageState({ path: 'auth.json' });

// Reutilizar en otros tests
const context = await browser.newContext({ storageState: 'auth.json' });
```

## Esperar requests/responses

| Metodo | Descripcion |
|--------|-------------|
| `page.waitForRequest(url)` | Espera a que se haga un request |
| `page.waitForResponse(url)` | Espera a que se reciba una respuesta |

```ts
const response = await page.waitForResponse('**/api/data');
```

---

**Documentación oficial**: https://playwright.dev/docs/intro
**Siguiente**: [[06 - APIs y Testing/18 - Playwright/04 - Módulo 4 - Testing y Fixtures|Módulo 4: Testing y Fixtures]]
**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
