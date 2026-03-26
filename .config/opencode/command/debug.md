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

Based on evidence, form a hypothesis:
- "The error occurs because X is undefined when Y happens"
- "The race condition happens when Z and W execute concurrently"

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

### Null/Undefined Errors
```typescript
// Problem
user.profile.name.toUpperCase(); // Error if profile is null

// Solution
user.profile?.name?.toUpperCase() ?? 'Unknown';
```

### Race Conditions
```typescript
// Problem
let data;
fetchData().then(result => data = result);
console.log(data); // undefined

// Solution
const data = await fetchData();
console.log(data);
```

### Off-by-One Errors
```typescript
// Problem
for (let i = 0; i <= arr.length; i++) // <= should be <

// Solution
for (let i = 0; i < arr.length; i++)
```

### State Management Issues
```typescript
// Problem - mutating state
state.items.push(newItem);

// Solution - immutable update
state = { ...state, items: [...state.items, newItem] };
```

---

## Debugging Tools

### Console Debugging
```typescript
console.log('Value:', value);
console.table(arrayOfObjects);
console.time('operation');
// ... operation
console.timeEnd('operation');
```

### Debugger Statements
```typescript
function problematicFunction() {
  debugger; // Breaks here in dev tools
  // ...
}
```

### Error Boundaries
```typescript
try {
  riskyOperation();
} catch (error) {
  console.error('Error:', error);
  // Handle or rethrow
}
```

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