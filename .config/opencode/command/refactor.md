---
description: "Refactor code for improved quality, maintainability, and performance"
---

# Refactor

**Purpose**: Analyze and refactor code for improved quality, maintainability, and performance.

**Arguments**: `$ARGUMENTS` (file path or pattern)

**Note**: Examples in this document use JavaScript/TypeScript syntax. Adapt patterns to your language's conventions.

---

## Usage

```bash
# Refactor specific file
/refactor src/utils/helpers.ts

# Refactor with focus
/refactor src/auth/ --focus=performance

# Refactor with pattern
/refactor "src/**/*.ts" --pattern=extract-method
```

---

## Before You Start

1. **Detect Language & Framework** - Check for config files to identify conventions
2. **Read Existing Patterns** - Follow codebase's current naming and style
3. **Language-Specific Style Guides**:
   - Python: PEP 8
   - Go: Effective Go
   - Java: Google Java Style
   - JavaScript/TypeScript: Airbnb/StandardJS
   - C#: Microsoft C# Coding Conventions
   - Rust: The Rust Style Guide
   - Kotlin: Kotlin Coding Conventions
   - Swift: Swift API Design Guidelines

## Refactoring Patterns

### Extract Method
When a method is too long or does multiple things:
```typescript
// Before
function processOrder(order) {
  // validate
  // calculate
  // save
  // notify
}

// After
function processOrder(order) {
  validateOrder(order);
  const total = calculateTotal(order);
  saveOrder(order);
  notifyCustomer(order);
}
```

### Extract Variable
When an expression is complex:
```typescript
// Before
if (user.age >= 18 && user.verified && user.subscription === 'premium')

// After
const isAdultPremiumUser = user.age >= 18 && user.verified && user.subscription === 'premium';
if (isAdultPremiumUser)
```

### Replace Conditional with Polymorphism
When switch/if statements are complex:
```typescript
// Before
function getPrice(type) {
  switch(type) {
    case 'premium': return 100;
    case 'basic': return 50;
    default: return 0;
  }
}

// After
class Pricing {
  getPrice() { return 0; }
}
class PremiumPricing extends Pricing {
  getPrice() { return 100; }
}
class BasicPricing extends Pricing {
  getPrice() { return 50; }
}
```

### Remove Dead Code
- Unused functions
- Unreachable code
- Commented-out code
- Unused imports

---

## Refactoring Process

### 1. Analyze
- Identify code smells
- Find duplication
- Check complexity
- Review dependencies

### 2. Plan
- Choose refactoring pattern
- Identify affected code
- Plan test coverage
- Estimate impact

### 3. Execute
- Make small, incremental changes
- Run tests after each change
- Commit frequently
- Document changes

### 4. Verify
- All tests pass
- No regression
- Performance improved
- Code cleaner

---

## Code Smells to Address

| Smell | Refactoring |
|-------|-------------|
| Long method | Extract Method |
| Large class | Extract Class |
| Long parameter list | Introduce Parameter Object |
| Duplicated code | Extract Method, Pull Up |
| Dead code | Remove |
| Complex conditional | Replace with Polymorphism |
| Magic numbers | Replace with Constant |
| Inappropriate intimacy | Move Method, Hide Delegate |

---

## Safety Rules

1. **Always have tests** before refactoring
2. **Small commits** - one refactoring at a time
3. **Run tests** after each change
4. **Don't mix** refactoring with feature changes
5. **Document** significant changes
6. **Respect language conventions** - Don't force one naming style across all languages