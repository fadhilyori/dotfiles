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
Break systems into small, focused, composable units.

**Guidelines**:
- Single responsibility per unit
- Clear, explicit interfaces
- Independent and composable
- < 100 lines per unit (ideally < 50)

### 2. Functional Approach
Prefer pure functions and immutable data.

**Pure Functions**:
```
// Pure: Same input always produces same output
function add(a, b) -> return a + b

// Pure: Returns new data, doesn't modify input
function formatUser(user) -> return new User with fullName

// Impure: Avoid side effects in business logic
function addToTotal(value) // Modifies external state - AVOID
```

**Immutability**:
```
// Good: Create new data
function addItem(items, item) -> return items + [item]
function updateUser(user, changes) -> return merge(user, changes)

// Bad: Modify in place
function addItem(items, item) // items.add(item) - AVOID
```

### 3. Composition
Build complex behavior from simple units.

```
// Compose small functions
processUser = compose(validate, enrich, save)
isValidEmail = compose(normalize, validateFormat)

// Avoid deep inheritance hierarchies
// Prefer composition over inheritance
```

### 4. Declarative Style
Describe *what*, not *how*.

```
// Declarative: Clear intent
activeUsers = users.filter(isActive).map(getName)

// Imperative: Verbose, harder to follow
result = []
for each user in users:
    if user.isActive:
        result.add(user.name)
```

---

## Naming Conventions

**Priority (from highest to lowest):**
1. Existing project configuration files (`.eslintrc`, `pyproject.toml`, `.golangci.yml`, `rustfmt.toml`, etc.)
2. Official style guide for language/framework (see table below)
3. Existing patterns in codebase (consistency > external style guide)

### Language-Specific Style Guides

| Language | Official Style Guide |
|----------|---------------------|
| Python | [PEP 8](https://peps.python.org/pep-0008/) |
| Go | [Effective Go](https://go.dev/doc/effective_go), [Go Code Review Comments](https://go.dev/wiki/CodeReviewComments) |
| Java | [Google Java Style](https://google.github.io/styleguide/javaguide.html), [Oracle Conventions](https://www.oracle.com/java/technologies/javase/codeconventions-contents.html) |
| JavaScript | [Airbnb](https://airbnb.io/javascript/), [StandardJS](https://standardjs.com/), [Google](https://google.github.io/styleguide/jsguide.html) |
| TypeScript | [Microsoft Style Guide](https://ts.dev/style/) |
| C# | [Microsoft C# Coding Conventions](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions) |
| Rust | [The Rust Style Guide](https://doc.rust-lang.org/style-guide/), [rustfmt](https://github.com/rust-lang/rustfmt) |
| Kotlin | [Kotlin Coding Conventions](https://kotlinlang.org/docs/coding-conventions.html) |
| Swift | [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) |
| Ruby | [Ruby Style Guide](https://rubystyle.guide/) |
| PHP | [PSR-12](https://www.php-fig.org/psr/psr-12/) |

### General Naming Principles

**Universal principles that apply across all languages:**

| Type | Principle | Examples |
|------|-----------|----------|
| Files | Follow language conventions | Java: `UserService.java`, Python: `user_service.py`, Go: `user_service.go` |
| Functions | Verb phrases, casing per language conventions | Python: `get_user()`, Java: `getUser()`, Go: `GetUser()` |
| Predicates | is/has/can prefix | `isValid`, `hasPermission`, `canWrite` |
| Variables | Descriptive, avoid cryptic names | `userCount` not `uc` |
| Constants | Casing per language conventions | Python: `MAX_RETRY_COUNT`, Go: `MaxRetryCount`, Java: `MAX_RETRY_COUNT` |

**Note**: The examples above show casing variations between languages. Prioritize consistency with existing codebase patterns.

---

## Error Handling

### Explicit Error Returns
Return results that indicate success or failure explicitly.

```
function parseData(input) -> Result:
    try:
        data = parse(input)
        return Success(data)
    catch error:
        return Failure(error.message)
```

### Validate at Boundaries
Check inputs at system entry points.

```
function createUser(userData) -> Result:
    validation = validateUserData(userData)
    if not validation.isValid:
        return Failure(validation.errors)
    
    return Success(saveUser(userData))
```

### Guard Clauses
Fail fast with clear preconditions.

```
function processOrder(order) -> Result:
    if order is null: return Failure("Order required")
    if order.items is empty: return Failure("Order empty")
    if order.total <= 0: return Failure("Invalid total")
    
    // Main logic - safe to proceed
    return processPayment(order)
```

---

## Dependency Management

### Explicit Dependencies
Pass dependencies as parameters, don't reach for globals.

```
// Good: Dependencies explicit
function createUserService(database, logger):
    return {
        createUser: function(userData):
            logger.log("Creating user")
            return database.insert("users", userData)
    }

// Bad: Hidden dependencies
function createUser(userData):
    return globalDatabase.insert("users", userData) // AVOID
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

Before considering work complete:

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
