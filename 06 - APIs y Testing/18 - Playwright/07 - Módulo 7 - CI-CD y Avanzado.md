# Módulo 7: CI/CD y Avanzado

**Objetivo**: Aprender y dominar: CI/CD y Avanzado.

## GitHub Actions

```yaml
name: Playwright Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npx playwright test
```

## Sharding (paralelizacion)

```bash
npx playwright test --shard=1/4
npx playwright test --shard=2/4
npx playwright test --shard=3/4
npx playwright test --shard=4/4
```

En GitHub Actions con matrix:

```yaml
strategy:
  matrix:
    shard: [1/4, 2/4, 3/4, 4/4]
steps:
  - run: npx playwright test --shard=${{ matrix.shard }}
```

## Web scraping

```ts
const data = await page.evaluate(() => {
  return Array.from(document.querySelectorAll('.item')).map(el => ({
    title: el.querySelector('.title')?.textContent,
    price: el.querySelector('.price')?.textContent,
  }));
});
```

## Performance

```ts
const metrics = await page.metrics();
console.log(metrics);

// Tracing avanzado
await context.tracing.start({ screenshots: true, snapshots: true });
await page.goto('https://example.com');
await context.tracing.stop({ path: 'trace.zip' });
```

| Tema | Resumen |
|------|---------|
| CI/CD | Integracion continua con GitHub Actions |
| Sharding | Dividir tests en multiples workers |
| Web scraping | Extraer datos con page.evaluate |
| Performance | page.metrics() y tracing |

---
**Documentación oficial**: https://playwright.dev/docs/intro

**Inicio herramienta**: [[playwright|Playwright]]
**Inicio principal**: [[../../00 - Índice/Índice General]]
