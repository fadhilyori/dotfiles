<!-- Context: standards/testing | Priority: critical | Version: 3.1 | Updated: 2026-03-26 -->

# Testing Standards

## Quick Reference

**Golden Rule**: If you can't test it easily, refactor it

**AAA Pattern**: Arrange → Act → Assert

**ALWAYS Test**:
- Happy path (normal usage)
- Edge cases (boundaries, empty, null)
- Error cases (invalid input, failures)
- Business logic (core functionality)

**NEVER Test**:
- Third-party libraries
- Framework internals
- Simple getters/setters
- Private implementation details

**Coverage Goals**:
- Critical: 100%
- High: 90%+
- Medium: 80%+

---

## Principles

### Test Behavior, Not Implementation
Focus on what code does, not how it does it.

### Keep Tests Simple
- One logical assertion per test
- Clear, descriptive names
- Minimal setup
- Independent (no shared state)

### Fast and Reliable
- Quick execution
- Deterministic (same result every run)
- No flaky tests
- No external dependencies

---

## Test Structure (AAA Pattern)

Every test follows this structure:
```
Test: "descriptive test name"
    // ARRANGE
    input = createValidInput()
    expected = createExpectedOutput()
    
    // ACT
    result = functionUnderTest(input)
    
    // ASSERT
    assert result equals expected
```

---

## What to Test

### Test These

**Happy Path**: Normal, expected usage

**Edge Cases**: Empty collections, null values, boundary values, very large inputs

**Error Cases**: Invalid input formats, missing required fields, failure scenarios

**Business Logic**: Core algorithms, business rules, calculations

### Don't Test These

❌ Third-party library internals  
❌ Framework code  
❌ Language built-ins  
❌ Simple getters/setters  
❌ Private implementation details

---

## Test Naming

Good:
```
Test: "calculateDiscount returns 10% off for premium users"
Test: "validateEmail returns false for invalid format"
Test: "createUser throws error when email exists"
```

Bad:
```
Test: "it works"
Test: "test user"
```

---

## Testing with Dependencies

Mock external dependencies. Test pure functions directly.

---

## Coverage Goals

| Component Type | Target Coverage |
|----------------|-----------------|
| Business logic | 100% |
| Public APIs | 90%+ |
| Utilities/Helpers | 80%+ |
| Simple wrappers | Optional |

---

## Best Practices

✅ Test one thing per test  
✅ Use descriptive names  
✅ Keep tests independent  
✅ Mock external dependencies  
✅ Test edge cases and errors  
✅ Make tests readable as documentation  
✅ Run tests frequently  
✅ Fix failing tests immediately

❌ Don't test implementation details  
❌ Don't create interdependent tests  
❌ Don't mock what you don't own (carefully)  
❌ Don't write tests that pass when they should fail

---

## Golden Rule

**If you can't test it easily, refactor it.**
