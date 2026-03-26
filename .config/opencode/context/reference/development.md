<!-- Context: reference/development | Priority: medium | Version: 2.0 | Updated: 2026-03-25 -->

# Development Best Practices

General software development principles applicable to any language or stack.

---

## Development Workflow

### 1. Understand Before Coding
- Read requirements thoroughly
- Ask clarifying questions
- Identify constraints and edge cases
- Plan approach before implementing

### 2. Small, Incremental Changes
- One logical change per commit
- Easy to review and revert
- Clear commit messages
- Test each increment

### 3. Test-Driven Development (Optional but Recommended)
- Write test first
- Watch it fail
- Implement to make it pass
- Refactor while keeping tests green

### 4. Continuous Validation
- Run tests frequently
- Check code quality
- Verify no regressions
- Validate against requirements

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
// Good organization within files
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
```
// Good
create user authentication module
fix null pointer in payment processing
update documentation for API changes
refactor database connection pooling

// Bad
fix
update
changes
wip
```

### Branching Strategy
- Main branch is always deployable
- Feature branches for development
- Short-lived branches preferred
- Code review before merge

---

## Debugging

### Systematic Approach
1. Reproduce the issue consistently
2. Isolate the problem area
3. Form hypothesis about cause
4. Test hypothesis
5. Fix and verify

### Debugging Tools
- Use appropriate debugging tools
- Add strategic logging
- Check assumptions
- Test in isolation

### Common Issues
- Off-by-one errors
- Null/nil reference
- Race conditions
- Resource leaks
- Configuration errors

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

---

## Golden Rules

1. **Understand the problem before solving it**
2. **Write code for humans, not computers**
3. **Test early, test often**
4. **Simple is better than complex**
5. **Explicit is better than implicit**
