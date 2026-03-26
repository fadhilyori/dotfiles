---
description: "Code review against standards with actionable feedback"
---

# Code Review

**Purpose**: Review code against project standards and provide actionable feedback.

**Arguments**: `$ARGUMENTS` (file path or directory)

---

## Usage

```bash
# Review specific file
/review src/auth/login.ts

# Review directory
/review src/components/

# Review current changes
/review
```

---

## Review Process

### 1. Load Standards

Before reviewing:
1. Load code-review skill: `skill({ name: "code-review" })`
2. Read`~/.config/opencode/context/standards/security.md`
3. Read `~/.config/opencode/context/standards/code-quality.md`

### 2. Analyze Code

Review for:
- **Functionality**: Does it work as intended?
- **Code Quality**: Clean, readable, maintainable?
- **Security**: Vulnerabilities, input validation, secrets?
- **Performance**: Inefficient patterns, memory leaks?
- **Testing**: Test coverage, edge cases?

### 3. Report Format

```markdown
## Code Review: {File/Feature}

**Summary**: {Brief overview}
**Assessment**: ✅ Approve / ⚠️ Needs Work / ❌ Requires Changes

### Issues

#### 🔴 Critical (Must Fix)
- **File**: `path:line`
  **Issue**: {description}
  **Fix**: {suggested fix}

#### 🟡 Warning (Should Fix)
- **File**: `path:line`
  **Issue**: {description}
  **Fix**: {suggested fix}

#### 🔵 Suggestion (Nice to Have)
- **File**: `path:line`
  **Issue**: {description}
  **Fix**: {suggested fix}

### Positive Observations
- ✅ {good practice observed}

### Recommendations
{Next steps}
```

---

## Severity Levels

| Level | Action Required | Example |
|-------|-----------------|---------|
| 🔴 Critical | Must fix before merge | Security vulnerability, bug |
| 🟡 Warning | Should fix | Missing validation, code smell |
| 🔵 Suggestion | Nice to have | Style improvement, optimization |

---

## Best Practices

- Review within 24 hours
- Provide specific, actionable feedback
- Explain WHY, not just WHAT
- Suggest alternatives
- Acknowledge good work
- Check security first
