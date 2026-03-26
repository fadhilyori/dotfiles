---
description: "Debug code with systematic analysis and problem-solving"
---

# Debug

**Purpose**: Systematically debug code issues with root cause analysis and solutions.

**Arguments**: `$ARGUMENTS` (file path, error message, or description)

---

## Usage

```bash
# Debug specific file
/debug src/auth/login.ts

# Debug error message
/debug "TypeError: Cannot read property 'id' of undefined"

# Debug with context
/debug "Login fails for admin users" --file=src/auth/login.ts
```

---

## Debugging Process

### 1. Understand the Problem
- What is the expected behavior?
- What is the actual behavior?
- When does it occur?
- Is it reproducible?

### 2. Gather Information
```bash
# Check error logs
cat logs/error.log | grep -A5 "error"

# Check recent changes
git log --oneline -10

# Check related files
grep -r "function_name" src/
```

### 3. Form Hypothesis
Based on evidence, form specific hypotheses about root cause.

### 4. Test Hypothesis
- Add logging/debugging statements
- Use debugger breakpoints
- Isolate the problematic code
- Test with different inputs

### 5. Fix and Verify
- Implement fix
- Add test case
- Verify fix works
- Document the issue

---

## Common Bug Patterns

| Pattern | Symptoms | Fix Strategy |
|---------|----------|--------------|
| **Null/Undefined Errors** | Cannot read property of undefined | Add optional chaining (`?.`) or null checks |
| **Race Conditions** | Inconsistent state, timing issues | Use async/await, proper sequencing |
| **Off-by-One Errors** | Loop bounds, array index issues | Review boundary conditions |
| **State Management Issues** | Unexpected mutations | Use immutable updates |

---

## Debug Report Format

```markdown
## Debug Report: {Issue}

### Problem
{Description of the issue}

### Root Cause
{What is causing the problem}

### Evidence
- {Log output}
- {Stack trace}
- {Related code}

### Solution
{How to fix}

### Prevention
{How to prevent in future}

### Test Case
{Test to verify fix}
```

---

## Best Practices

1. **Reproduce first** - Always reproduce before debugging
2. **Change one thing** - Isolate variables
3. **Check assumptions** - Don't assume anything works
4. **Read error messages** - They often tell you the problem
5. **Use version control** - Check recent changes
6. **Add tests** - Prevent regression
