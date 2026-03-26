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

```
// Test the behavior
Test: "calculateTotal returns sum of prices"
    // Arrange
    items = [Item(10), Item(20), Item(30)]
    
    // Act
    result = calculateTotal(items)
    
    // Assert
    assert result equals 60
```

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
    // ARRANGE: Set up test data and environment
    input = createValidInput()
    expected = createExpectedOutput()
    
    // ACT: Execute the code under test
    result = functionUnderTest(input)
    
    // ASSERT: Verify the result
    assert result equals expected
```

---

## What to Test

### Test These

**Happy Path**:
- Normal, expected usage
- Typical inputs
- Standard flows

**Edge Cases**:
- Empty collections
- Null/None values
- Boundary values (min/max)
- Very large inputs

**Error Cases**:
- Invalid input formats
- Missing required fields
- Failure scenarios
- Exception conditions

**Business Logic**:
- Core algorithms
- Business rules
- Calculations
- State transitions

### Don't Test These

❌ Third-party library internals  
❌ Framework code  
❌ Language built-ins  
❌ Simple getters/setters  
❌ Private implementation details

---

## Test Naming

```
// Good: Clear, descriptive, includes expectation
Test: "calculateDiscount returns 10% off for premium users"
Test: "validateEmail returns false for invalid format"
Test: "createUser throws error when email exists"

// Bad: Vague, unclear intent
Test: "it works"
Test: "test user"
Test: "function test"
```

---

## Testing with Dependencies

### Mock External Dependencies

```
Test: "getUser retrieves from database"
    // Arrange
    mockDatabase = createMock()
    mockDatabase.when("findById").calledWith("users", 1)
        .thenReturn(User(id: 1, name: "John"))
    
    service = createUserService(mockDatabase)
    
    // Act
    user = service.getUser(1)
    
    // Assert
    assert mockDatabase.wasCalledWith("findById", "users", 1)
    assert user equals User(id: 1, name: "John")
```

### Test Pure Functions Directly

```
Test: "add returns sum"
    assert add(2, 3) equals 5
    assert add(-1, 1) equals 0
    assert add(0, 0) equals 0
```

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
✅ Use descriptive names that explain the scenario  
✅ Keep tests independent (no shared state)  
✅ Mock external dependencies  
✅ Test edge cases and errors  
✅ Make tests readable as documentation  
✅ Run tests frequently during development  
✅ Fix failing tests immediately

❌ Don't test implementation details  
❌ Don't create interdependent tests  
❌ Don't mock what you don't own (carefully)  
❌ Don't write tests that pass when they should fail

---

## Golden Rule

**If you can't test it easily, refactor it.**
