<!-- Context: standards/code | Priority: critical | Version: 3.0 | Updated: 2026-03-25 -->

# Code Quality Standards

## Quick Reference

**Core Philosophy**: Modular, Functional, Maintainable  
**Golden Rule**: If you can't easily test it, refactor it

**ALWAYS**:
- Pure functions (same input = same output, no side effects)
- Immutability (create new data, don't modify)
- Small, focused units (< 50 lines)
- Explicit dependencies (injection over global state)

**NEVER**:
- Mutation of shared state
- Deep nesting (> 3 levels)
- Hidden dependencies
- Large, monolithic units

---

## Core Principles

### 1. Modularity
- Single responsibility per unit
- Clear, explicit interfaces
- Independent and composable
- < 100 lines per unit (ideally < 50)

### 2. Functional Approach
Prefer pure functions and immutable data.

### 3. Composition
Build complex behavior from simple units:
- Compose small functions: `processUser = compose(validate, enrich, save)`
- Prefer composition over inheritance

### 4. Declarative Style
Describe *what*, not *how*:
```
activeUsers = users.filter(isActive).map(getName)
```

---

## Naming Conventions

**Priority**:
1. Existing project configuration files
2. Official style guide for language/framework
3. Existing patterns in codebase

### Language-Specific Style Guides

| Language | Official Style Guide |
|----------|---------------------|
| Python | [PEP 8](https://peps.python.org/pep-0008/) |
| Go | [Effective Go](https://go.dev/doc/effective_go) |
| Java | [Google Java Style](https://google.github.io/styleguide/javaguide.html) |
| JavaScript | [Airbnb](https://airbnb.io/javascript/), [StandardJS](https://standardjs.com/) |
| TypeScript | [Microsoft Style Guide](https://ts.dev/style/) |
| C# | [Microsoft C# Coding Conventions](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions) |
| Rust | [The Rust Style Guide](https://doc.rust-lang.org/style-guide/) |
| Kotlin | [Kotlin Coding Conventions](https://kotlinlang.org/docs/coding-conventions.html) |
| Swift | [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) |
| Ruby | [Ruby Style Guide](https://rubystyle.guide/) |
| PHP | [PSR-12](https://www.php-fig.org/psr/psr-12/) |

### General Naming Principles

| Type | Principle | Examples |
|------|-----------|----------|
| Files | Follow language conventions | `UserService.java`, `user_service.py` |
| Functions | Verb phrases, casing per language | `get_user()`, `getUser()`, `GetUser()` |
| Predicates | is/has/can prefix | `isValid`, `hasPermission`, `canWrite` |
| Variables | Descriptive | `userCount` not `uc` |
| Constants | Casing per language | `MAX_RETRY_COUNT`, `MaxRetryCount` |

---

## Error Handling

- **Explicit Error Returns**: Return results that indicate success or failure explicitly
- **Validate at Boundaries**: Check inputs at system entry points
- **Guard Clauses**: Fail fast with clear preconditions

---

## Dependency Management

Pass dependencies as parameters, don't use globals:
```
function createUserService(database, logger):
    return {
        createUser: function(userData):
            return database.insert("users", userData)
    }
```

---

## Anti-Patterns to Avoid

❌ **Global State**: Shared mutable state across units  
❌ **Deep Nesting**: Use early returns instead  
❌ **God Units**: Split large units into focused ones  
❌ **Hidden Side Effects**: Unexpected mutations or I/O  
❌ **Duplication**: Repeated logic (DRY principle)  
❌ **Tight Coupling**: Units know too much about each other

---

## Quality Checklist

Before completing work:

- [ ] Can this be easily tested?
- [ ] Are dependencies explicit?
- [ ] Is data immutable?
- [ ] Are functions small and focused?
- [ ] Is naming clear and descriptive?
- [ ] Are errors handled explicitly?
- [ ] Is there no duplication?
- [ ] Are there no hidden side effects?

---

## Golden Rule

**If you can't easily test it, refactor it.**
