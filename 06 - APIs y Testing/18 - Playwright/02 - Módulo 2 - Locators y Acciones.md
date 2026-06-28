# Módulo 2: Locators y Acciones

**Objetivo**: Aprender y dominar: Locators y Acciones.

## Locators

| Locator | Uso |
|---------|-----|
| `page.getByRole('button', { name: 'Enviar' })` | Por rol ARIA |
| `page.getByText('Bienvenido')` | Por texto visible |
| `page.getByLabel('Email')` | Por label asociado |
| `page.getByTestId('submit')` | Por data-testid |
| `page.locator('css-selector')` | Selector CSS |

## Acciones

```ts
await page.click('#btn');
await page.fill('#email', 'user@example.com');
await page.selectOption('#pais', 'MX');
await page.check('#aceptar');
await page.hover('#menu');
```

## Navegacion

```ts
await page.goto('https://example.com');
await page.goBack();
await page.reload();
```

## Auto-waiting

Playwright espera automaticamente a que los elementos sean visibles, estables y habilitados antes de interactuar. No es necesario `waitFor` explicito en la mayoria de los casos.

---

**Documentación oficial**: https://playwright.dev/docs/intro
**Siguiente**: [[Módulo 3: Intercepciones y Mocks]]
**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
