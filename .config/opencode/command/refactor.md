---
description: "Refactor code for improved quality, maintainability, and performance"
---

# Refactor

**Purpose**: Analyze and refactor code for improved quality, maintainability, and performance.

**Arguments**: `$ARGUMENTS` (file path or pattern)

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

1. **Detect Language & Framework** - Check for config files
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

---

## Refactoring Patterns

| Pattern | When to Use |
|---------|-------------|
| **Extract Method** | Method too long or does multiple things |
| **Extract Variable** | Expression is complex |
| **Extract Class** | Class too large |
| **Introduce Parameter Object** | Long parameter list |
| **Pull Up Method** | Duplicated code in subclasses |
| **Replace Conditional with Polymorphism** | Complex switch/if statements |
| **Replace Magic Number with Constant** | Hardcoded values |
| **Remove Dead Code** | Unused functions, unreachable code |

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

### 4. Verify
- All tests pass
- No regression
- Performance improved
- Code cleaner

---

## Safety Rules

1. **Always have tests** before refactoring
2. **Small commits** - one refactoring at a time
3. **Run tests** after each change
4. **Don't mix** refactoring with feature changes
5. **Document** significant changes
6. **Respect language conventions**
