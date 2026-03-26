---
name: bounded-execution
description: Guide Implementer in executing tasks within strict scope boundaries. Load this skill before starting any implementation work.
---

## Purpose

Ensure Implementer stays within assigned scope and follows contract from Kai.

---

## When to Load

Load this skill at the start of every implementation task.

---

## Bounded Execution Rules

### Rule 1: Parse Contract First

Before writing any code:
- Read the Subagent Contract from Kai
- Identify assigned scope (exact files)
- Identify boundary (what is out of scope)
- Note acceptance criteria

### Rule 2: Read Standards

Always read before coding:
- `context/standards/code-quality.md`
- `context/standards/testing.md` (if applicable)

### Rule 3: Implement Within Scope

- Modify ONLY files in assigned scope
- Implement ONLY what was specified
- Do NOT refactor unrelated code
- Do NOT add "while I'm here" improvements

### Rule 4: No Scope Creep

Watch for these thoughts:
- "While I'm here, I should also..." → STOP
- "This related code could be better..." → IGNORE
- "The user might want..." → NOT YOUR DECISION

### Rule 5: Reversibility Check

If action is hard to reverse:
- Flag to Kai before doing it
- Document the risk
- Wait for confirmation

---

## Execution Checklist

- [ ] Contract parsed and understood
- [ ] Assigned scope identified
- [ ] Boundary acknowledged
- [ ] Standards read
- [ ] Implementation within scope only
- [ ] No unrelated refactoring
- [ ] Self-review completed
- [ ] Report format followed

---

## Anti-Patterns

**Bad:** Refactor related code "while I'm here"
**Good:** Only modify files in assigned scope

**Bad:** Add extra features "that might be useful"
**Good:** Implement exactly what was specified

**Bad:** Skip reading standards to save time
**Good:** Read standards first, code second

**Bad:** Make irreversible changes without flagging
**Good:** Flag irreversible actions to Kai

---

## Report Format

```markdown
## Implementation Report

**Contract Compliance:**
- Scope: ✅ Only modified assigned files
- Boundary: ✅ Did not touch out-of-scope files
- Criteria: ✅ All acceptance criteria met

**Files Modified:**
- {path/to/file1} - {what changed}

**Standards Applied:**
✅ code-quality.md
✅ testing.md (if applicable)

**Self-Review:**
- Types: ✅
- Imports: ✅
- No artifacts: ✅
- Criteria met: ✅

**Scope Integrity:**
✅ No scope creep detected
```
