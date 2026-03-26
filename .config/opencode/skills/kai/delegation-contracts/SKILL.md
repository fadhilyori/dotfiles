---
name: delegation-contracts
description: Create and validate Subagent Contracts for bounded execution. Trigger when Kai delegates to any specialist in Step 7.
---

## Purpose

Ensure every specialist receives clear, bounded instructions that prevent scope creep and autonomous decisions.

---

## Subagent Contract Structure

Every specialist MUST receive:

```json
{
  "contract": {
    "assigned_scope": {
      "files": ["exact/file/paths"],
      "description": "what to work on"
    },
    "mode": "implement | test | review | validate | design",
    "boundary": {
      "explicitly_out_of_scope": ["what not to touch"],
      "limitations": ["constraints"]
    },
    "standards": {
      "must_read": ["standards/files.md"],
      "conventions": "language/framework specific"
    },
    "input_context": {
      "research_findings": "summary",
      "user_requirements": "specifics",
      "technical_constraints": "limitations"
    },
    "expected_output": {
      "format": "structured report",
      "deliverables": ["file/paths"],
      "success_criteria": ["checklist"]
    },
    "reporting": {
      "to": "Kai only",
      "format": "see Report Format below",
      "no_delegation": true
    }
  }
}
```

---

## Contract by Specialist

### Implementer Contract

```json
{
  "mode": "implement",
  "assigned_scope": {
    "files": ["src/feature.js"],
    "description": "Implement user authentication"
  },
  "boundary": {
    "explicitly_out_of_scope": [
      "Database schema changes",
      "Frontend UI components"
    ],
    "limitations": "Backend logic only"
  },
  "standards": {
    "must_read": [
      "context/standards/code-quality.md",
      "context/standards/testing.md"
    ]
  },
  "expected_output": {
    "deliverables": ["src/feature.js"],
    "success_criteria": [
      "Authentication works",
      "No hardcoded secrets",
      "Tests pass"
    ]
  }
}
```

### Researcher Contract

```json
{
  "mode": "research",
  "assigned_scope": {
    "question": "Find authentication patterns",
    "scope": "Internal context only",
    "boundary": "Do not search implementation files"
  },
  "expected_output": {
    "format": "Ranked findings (Critical/High/Medium)",
    "include": "File paths and summaries only"
  }
}
```

### TestAuthor Contract

```json
{
  "mode": "test",
  "assigned_scope": {
    "target": "src/feature.js",
    "test_types": ["positive", "negative", "edge"]
  },
  "boundary": {
    "explicitly_out_of_scope": "Fixing implementation code"
  },
  "expected_output": {
    "deliverables": ["tests/feature.test.js"],
    "report_failures": true,
    "do_not_fix": true
  }
}
```

### Auditor Contract

```json
{
  "mode": "review",
  "assigned_scope": {
    "files": ["src/feature.js", "tests/feature.test.js"]
  },
  "boundary": {
    "read_only": true,
    "no_modifications": true
  },
  "expected_output": {
    "format": "Issues by severity (Critical/Warning/Suggestion)",
    "include_line_numbers": true
  }
}
```

---

## Contract Validation Checklist

Before delegating, verify:

- [ ] Scope is explicit (exact files/functions)
- [ ] Boundary is clear (what is NOT included)
- [ ] Mode is specific (implement/test/review/design)
- [ ] Standards are listed (which files to read)
- [ ] Output format is defined
- [ ] No delegation allowed flag is set
- [ ] Reporting target is Kai only

---

## Anti-Patterns to Avoid

**Bad:** "Implement authentication feature"
**Good:** "Implement login function in src/auth.js, validate email/password, return JWT token"

**Bad:** "Write tests"
**Good:** "Write tests for src/auth.js login function: positive (valid creds), negative (invalid creds), edge (null inputs)"

**Bad:** "Review the code"
**Good:** "Review src/auth.js for security issues (input validation, secrets), report issues with file:line references"

---

## Output Format

Validated contract ready for delegation to {specialist}.
