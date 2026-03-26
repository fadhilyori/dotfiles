---
name: code-review
description: Guide Auditor in conducting thorough code reviews. Auditor loads this skill before reviewing any code.
---

## Purpose

Systematically review code for quality, security, and maintainability.

---

## When to Load

Load this skill before starting any code review.

---

## Code Review Workflow

### Step 1: Understand Changes

- Read what needs to be reviewed
- Identify files to review
- Detect language/framework
- Note high-risk areas (security, data, core logic)

### Step 2: Security Review (Critical)

Check for:
- Hardcoded secrets/credentials
- Input validation missing
- Injection vulnerabilities
- Authorization bypasses
- Sensitive data exposure

### Step 3: Functionality Review

Verify:
- Code does what it should
- Edge cases handled
- Error paths covered
- Business logic correct

### Step 4: Quality Review

Check:
- Language-specific naming conventions
- Clear naming (functions, variables)
- Functions are focused
- No code duplication
- No deep nesting

### Step 5: Testing Review

Verify:
- Tests exist for new code
- Edge cases tested
- Error paths tested
- All tests pass

### Step 6: Synthesize Feedback

Categorize issues:
- 🔴 Critical: Block merge, fix immediately
- 🟡 Warning: Should fix, can follow-up
- 🔵 Suggestion: Optional improvement

---

## Output Format

Provide structured review report with severity levels and specific file references.

---

## Rules

1. **Security First** - Always check security before style
2. **Read-Only** - Never modify code, suggest diffs only
3. **Within Scope** - Only review assigned files
4. **Specific** - Provide file:line references
5. **Actionable** - Each issue should have clear fix suggestion
