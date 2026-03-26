---
name: checkpoint-handling
description: Handle Checkpoint 1 and Checkpoint 2 in Kai's workflow. Trigger when Kai reaches Step 4 (Confirm Understanding) or Step 6 (Confirm Plan).
---

## Purpose

Guide Kai through presenting information to user and waiting for explicit confirmation before proceeding.

---

## When to Use

- **Checkpoint 1**: After Focused Analysis, before any planning
- **Checkpoint 2**: After Planning, before any execution

---

## Checkpoint 1: Confirm Understanding

### What to Present

```markdown
## Understanding Confirmation Required

### My Understanding of Your Request
{bounded problem statement}

### Authorization Boundary
- **In Scope**: {what is included}
- **Out of Scope**: {what is explicitly excluded}

### Specialists Involved
- {specialist 1} - {role}
- {specialist 2} - {role}

### Out-of-Scope Findings (Noted, Not Urgent)
- {finding}: {why excluded}

### Ambiguities Requiring Clarification
- {question}: {impact if not clarified}

---

**WAITING FOR YOUR CONFIRMATION**

Please reply with:
- ✅ "Proceed" or "Confirmed" to continue
- 📝 Corrections if my understanding is wrong
- ❓ Answers to ambiguities above

Do not proceed until you confirm.
```

### Handling User Response

**If user confirms:**
1. Proceed to Step 5 (Planning)
2. Pass confirmed understanding to Planner

**If user corrects:**
1. Return to Step 1 (Parse & Bound)
2. Update understanding based on correction
3. Re-present at Checkpoint 1

**If user asks questions:**
1. Answer directly
2. Ask again for confirmation
3. Do not proceed until confirmed

---

## Checkpoint 2: Confirm Plan

### What to Present

```markdown
## Plan Confirmation Required

### Overview
{plan summary}

### Subtasks
{numbered list with specialist assignments}

### Execution Order
- **Sequential**: {dependent tasks}
- **Parallel**: {independent tasks}

### Irreversible Actions Flagged
- {action}: {subtask} - {consequence}

### Scope Validation
✅ All subtasks within confirmed scope
✅ No scope expansion
✅ Explicit boundaries set

---

**WAITING FOR YOUR CONFIRMATION**

Please reply with:
- ✅ "Proceed" or "Approved" to execute
- 📝 Modifications if needed
- ❌ "Cancel" to abort

Do not execute until you approve.
```

### Handling User Response

**If user approves:**
1. Proceed to Step 7 (Bounded Execution)
2. Delegate to specialists with confirmed plan

**If user modifies:**
1. Revise plan
2. Re-present at Checkpoint 2
3. Do not execute until re-confirmed

**If user cancels:**
1. Report cancellation
2. Clean up any temporary files
3. Close task

---

## Critical Rules

1. **NEVER proceed without explicit user confirmation**
2. **WAIT is mandatory** - no autonomous continuation
3. **Document corrections** - track what user changed
4. **Re-present after modification** - new checkpoint required

---

## Output Format

Confirmation status: CONFIRMED / MODIFIED / CANCELLED
Next action: {proceed/revise/abort}
