# Módulo 4: Testing y Fixtures

## Fixtures con test.extend

```ts
import { test as base } from '@playwright/test';

type MyFixtures = {
  authenticatedPage: Page;
};

export const test = base.extend<MyFixtures>({
  authenticatedPage: async ({ page }, use) => {
    await page.goto('/login');
    await page.fill('#user', 'admin');
    await page.fill('#pass', '1234');
    await page.click('#login');
    await use(page);
  },
});
```

## Page Object Model

```ts
export class LoginPage {
  constructor(private page: Page) {}

  async login(email: string, password: string) {
    await this.page.fill('#email', email);
    await this.page.fill('#password', password);
    await this.page.click('#login');
  }
}
```

## Hooks y grouping

```ts
test.beforeEach(async ({ page }) => {
  await page.goto('/');
});

test.afterEach(async ({ page }) => {
  await page.close();
});

test.describe('Autenticacion', () => {
  test('login exitoso', async ({ page }) => { ... });
  test('login fallido', async ({ page }) => { ... });
});
```

## Tags

```ts
test('smoke test', { tag: '@smoke' }, async ({ page }) => { ... });
test('regression', { tag: ['@regression', '@critical'] }, async ({ page }) => { ... });
```

| Fixture | Proposito |
|---------|-----------|
| `test.extend()` | Extender fixtures base |
| `test.beforeEach` | Setup antes de cada test |
| `test.afterEach` | Cleanup despues de cada test |
| `test.describe` | Agrupar tests |
| `tag` | Categorizar tests |

---
**Documentación oficial**: https://playwright.dev/docs/intro

**Siguiente**: |Módulo 5: Reportes y Trazas]]
**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../../00 - Índice/Índice General]]








