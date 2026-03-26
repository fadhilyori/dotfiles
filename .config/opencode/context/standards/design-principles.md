# Software Development Principles

## Selection Guide

| Context | Primary Principles | Reason |
|---------|-------------------|--------|
| New project | KISS, YAGNI | Don't over-engineer |
| Growing codebase | DRY, SOLID | Maintainability |
| Framework/library | CoC, SOLID | Extensibility |
| Performance-critical | KISS | Simplicity = Speed |
| Team project | SOLID, LoD | Collaboration |

---

## Principles

### SOLID
- **S**ingle Responsibility: One reason to change
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Subtypes interchangeable
- **I**nterface Segregation: Specific interfaces over general
- **D**ependency Inversion: Depend on abstractions

### DRY (Don't Repeat Yourself)
- Extract common logic to single location
- Single source of truth
- Avoid duplication at all costs

### KISS (Keep It Simple, Stupid)
- Prefer simple solutions
- Avoid premature optimization
- Readability over cleverness

### YAGNI (You Aren't Gonna Need It)
- Don't implement features until needed
- Defer complexity
- Build for current requirements only

### Composition over Inheritance
- Favor object composition
- Avoid deep inheritance hierarchies
- Mix behaviors through composition

### Law of Demeter (LoD)
- Talk only to immediate friends
- Don't chain method calls (obj.getX().getY().getZ())
- Reduce coupling between modules

### Convention over Configuration (CoC)
- Sensible defaults over explicit configuration
- Follow established project conventions
- Reduce decision fatigue

---

## Quick Reference

```
New + Simple → KISS, YAGNI
Growing + Complex → SOLID, DRY
Library/Framework → SOLID, CoC
Performance-critical → KISS
Team collaboration → SOLID, LoD
```

---

## Anti-Patterns to Avoid

- Premature optimization
- Over-engineering for hypothetical future needs
- Deep inheritance chains
- Duplicated logic across modules
- Tight coupling between unrelated modules
- Magic strings/numbers without constants
