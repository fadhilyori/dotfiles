---
name: error-containment
description: Handle errors and validation failures in Step 8. Trigger when Validator or Auditor reports errors that need fixing.
---

## Purpose

Contain errors within original scope and limit fix attempts to prevent scope creep.

---

## Error Handling Rules

### When to Attempt Fix

✅ **Proceed with fix if:**
- Error is within confirmed plan scope
- Fix is reversible
- Fix attempt count < 2

❌ **STOP and report to user if:**
- Error is outside confirmed scope
- Fix requires expanding scope
- 2 consecutive fix attempts failed
- Error is irreversible

---

## Fix Attempt Process

### Attempt 1

1. **Analyze Error**
   - Validator/Auditor report
   - File and line number
   - Error type

2. **Check Scope**
   - Is the file in assigned scope?
   - Is the fix within original plan?

3. **Delegate to Implementer**
   ```json
   {
     "mode": "fix",
     "assigned_scope": {
       "files": ["specific/file.js"],
       "lines": "45-67"
     },
     "error": "Type mismatch in function parameter",
     "constraint": "Fix attempt 1/2",
     "boundary": "Do not refactor unrelated code"
   }
   ```

4. **Validate Fix**
   - Run Validator again
   - Check if error resolved

### Attempt 2 (if Attempt 1 failed)

1. **Re-analyze**
   - Why did first attempt fail?
   - Is the error different than expected?

2. **Delegate Alternative Fix**
   ```json
   {
     "mode": "fix",
     "attempt": 2,
     "note": "Final attempt - if this fails, stop and report"
   }
   ```

3. **Validate Again**
   - Run Validator
   - Check results

### After 2 Failed Attempts

**STOP immediately**

Report to user:
```markdown
## Error Fix Failed After 2 Attempts

### Original Error
{error description}

### Fix Attempts
1. {what was tried} → {result}
2. {what was tried} → {result}

### Why It Failed
{analysis}

### Recommendation
{options}

**Hard stop - manual intervention required**
```

---

## Scope Expansion Detection

**Watch for these signals:**
- "While I'm here, I should also..."
- "The error is caused by X in another file..."
- "This requires refactoring Y..."
- "To fix this properly, we need to..."

**Action:** STOP and report to user

---

## Irreversible Action Detection

**Flag as irreversible:**
- Database migrations
- API contract changes
- Breaking changes to public interfaces
- Deletion of data/files

**Action:** 
1. Flag to user before attempting
2. Get explicit approval
3. Document rollback procedure

---

## Output Format

```markdown
## Error Containment Report

### Error
{type}: {description}

### Scope Check
✅ Within scope / ❌ Out of scope

### Fix Attempts
- Attempt 1: {result}
- Attempt 2: {result} (if applicable)

### Final Status
✅ Resolved / ❌ Failed (reported to user)

### Scope Integrity
✅ No expansion / ⚠️ Flagged to user
```
