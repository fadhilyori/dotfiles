<!-- Context: reference/development | Priority: medium | Version: 2.0 | Updated: 2026-03-25 -->

# Development Best Practices

General software development principles applicable to any language or stack.

---

## Development Workflow

- Understand requirements before coding
- Small, incremental changes
- Test-Driven Development (optional but recommended)
- Continuous validation

---

## Code Organization

### Project Structure
```
project/
├── src/              # Source code
├── tests/            # Test files
├── docs/             # Documentation
├── config/           # Configuration
└── scripts/          # Build/deploy scripts
```

### Module Organization
- Group by feature/domain, not type
- Keep related files together
- Clear public API boundaries
- Minimize cross-module dependencies

### File Organization
```
1. Imports/dependencies
2. Constants/configuration
3. Types/interfaces
4. Public functions
5. Private helpers
6. Exports
```

---

## Version Control

### Commit Messages
Use imperative mood, descriptive:
- `create user authentication module`
- `fix null pointer in payment processing`
- `update documentation for API changes`

Avoid vague messages like `fix`, `update`, `wip`.

### Branching Strategy
- Main branch is always deployable
- Feature branches for development
- Short-lived branches preferred
- Code review before merge

---

## Performance

### Optimization Principles
1. **Profile first** - Don't guess, measure
2. **Optimize hot paths** - Focus on frequently executed code
3. **Readability first** - Clever code that's hard to understand is worse
4. **Consider trade-offs** - Memory vs CPU, complexity vs speed

### Performance Checklist
- [ ] Measure before optimizing
- [ ] Consider algorithmic complexity
- [ ] Minimize I/O operations
- [ ] Use appropriate data structures
- [ ] Cache expensive computations
- [ ] Profile memory usage

---

## Maintainability

### Readable Code
- Clear, descriptive names
- Consistent formatting
- Logical organization
- Comments explain why, not what

### Avoid Technical Debt
- Fix issues as you find them
- Refactor when needed
- Keep dependencies updated
- Document workarounds

### Code Reviews
- Review for understanding
- Check against standards
- Verify tests exist
- Confirm error handling
- Security considerations

---

## Common Pitfalls

❌ **Premature Optimization** - Optimize when needed, not speculatively  
❌ **Over-Engineering** - Simple solutions are better  
❌ **Copy-Paste Programming** - Understand before reusing  
❌ **Ignoring Edge Cases** - Handle errors gracefully  
❌ **Skipping Tests** - Tests are documentation and safety net  
❌ **Magic Numbers/Strings** - Use named constants  
❌ **Tight Coupling** - Keep components independent
