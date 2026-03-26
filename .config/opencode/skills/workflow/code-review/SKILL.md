---
name: code-review
description: Conduct thorough code reviews before merging. Trigger immediately when user asks to review code, review PR, check changes, or before merge. Also activate when user mentions code quality, security check, or wants feedback on implementation.
---

## Purpose
Systematically review code for quality, security, and maintainability.

## Workflow

### Step 1: Understand Changes
- Read PR description or change summary
- Identify files modified
- **Detect language/framework** - Check for config files (`.eslintrc`, `pyproject.toml`, etc.) to identify style guide
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
- **Language-specific naming conventions** - Follow official style guides (PEP 8, Effective Go, Google Java Style, etc.)
- Clear naming (functions, variables)
- Functions are focused
- No code duplication
- No deep nesting
- **Existing codebase patterns** - Prioritize consistency with current codebase

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

## Output Format
Provide structured review report with severity levels and specific file references.
