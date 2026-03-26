---
description: Run the complete testing pipeline
---

# Testing Pipeline

Run the complete testing pipeline for the project.

---

## Usage

```bash
/test
```

---

## Pipeline Steps

1. **Type Check**
   - Run `pnpm type:check`
   - Check for type errors

2. **Lint**
   - Run `pnpm lint`
   - Check for linting errors

3. **Test**
   - Run `pnpm test`
   - Execute test suite

4. **Report**
   - Report any failures
   - Fix failures if possible
   - Repeat until all pass

5. **Success**
   - Report success when all checks pass

---

## What This Command Does

1. Validates TypeScript types
2. Checks code style with linter
3. Runs the test suite
4. Reports any issues found
