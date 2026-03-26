<!-- Context: standards/docs | Priority: critical | Version: 3.0 | Updated: 2026-03-25 -->

# Documentation Standards

## Quick Reference

**Golden Rule**: If users ask the same question twice, document it

**ALWAYS Document**:
- WHY decisions were made
- Complex algorithms or logic
- Public APIs and interfaces
- Setup and installation
- Common use cases

**NEVER Document**:
- Obvious code (what is self-explanatory)
- Implementation details that change often
- Redundant information

---

## Principles

### Audience-Focused
Write for your specific audience:

- **Users**: What it does, how to use it, examples
- **Developers**: Why it works this way, architecture decisions
- **Contributors**: Setup, conventions, how to contribute

### Show, Don't Tell
- Code examples
- Real use cases
- Expected output
- Visual diagrams where helpful

### Keep Current
- Update with code changes
- Remove outdated info
- Mark deprecations clearly
- Version your documentation

---

## README Structure

```markdown
# Project Name
Brief description (1-2 sentences)

## Features
- Key feature 1
- Key feature 2

## Installation
step-by-step installation commands

## Quick Start
minimal example showing basic usage

## Usage
Detailed examples and explanations

## API Reference
If applicable, document all public interfaces

## Contributing
Link to CONTRIBUTING.md or guidelines

## License
License type and link
```

---

## Function/Method Documentation

Document public interfaces with:

```
/*
 * Calculate total price including tax
 *
 * Parameters:
 *   price - Base price (number)
 *   taxRate - Tax rate from 0 to 1 (number)
 *
 * Returns:
 *   Total price with tax applied (number)
 *
 * Example:
 *   calculateTotal(100, 0.1) // Returns: 110
 */
function calculateTotal(price, taxRate) -> number
```

Include:
- Purpose
- Parameter names, types, and descriptions
- Return type and description
- Exceptions/errors that may be thrown
- Usage examples

---

## What to Document

### Document These

**Design Decisions**:
- Why this approach was chosen
- Alternatives considered
- Trade-offs made

**Complex Logic**:
- Algorithms
- Business rules
- Non-obvious behavior

**Public Interfaces**:
- Functions, methods, classes
- APIs (REST, GraphQL, etc.)
- Configuration options

**Setup and Usage**:
- Installation steps
- Configuration
- Common workflows
- Troubleshooting

### Don't Document These

❌ Obvious code (incrementing a counter)  
❌ What code does (should be self-explanatory)  
❌ Implementation details that may change  
❌ Redundant information  
❌ Outdated or incorrect info

---

## Comments

### Good Comments

```
// Calculate discount by tier (Bronze: 5%, Silver: 10%, Gold: 15%)
discount = getDiscountByTier(customer.tier)

// HACK: API returns null instead of [], normalize it
items = response.items ?? []

// TODO: Replace with async API when version 2.0 is minimum
```

### Bad Comments

```
// Increment i (obvious)
i = i + 1

// Get user (what, not why)
user = getUser()
```

---

## API Documentation Format

```markdown
### POST /api/users
Create a new user

**Request:**
```
{
    "name": "John",
    "email": "john@example.com"
}
```

**Response:**
```
{
    "id": "123",
    "name": "John",
    "email": "john@example.com"
}
```

**Errors:**
- 400 - Invalid input
- 409 - Email already exists
- 500 - Server error
```

---

## Best Practices

✅ Explain WHY, not just WHAT  
✅ Include working, tested examples  
✅ Show expected output  
✅ Cover error handling  
✅ Use consistent terminology  
✅ Keep structure predictable  
✅ Update when code changes  
✅ Write for your audience

❌ Don't state the obvious  
❌ Don't document private internals (usually)  
❌ Don't leave outdated docs  
❌ Don't be verbose without purpose

---

## Golden Rule

**If users ask the same question twice, document it.**
