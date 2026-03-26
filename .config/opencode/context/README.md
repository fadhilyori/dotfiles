<!-- Context: README | Priority: critical | Version: 5.0 | Updated: 2026-03-26 -->

# Context Directory

**Purpose**: Language-agnostic standards and reference materials for the Kai Agent System

---

## Quick Navigation

**Start here, then read only what you need.**

| Task | Read These |
|------|------------|
| **Write code** | `standards/code-quality.md` |
| **Write tests** | `standards/testing.md` |
| **Security work** | `standards/security.md` |
| **Write docs** | `standards/documentation.md` |
| **Review code** | Use `skill({ name: "code-review" })` |
| **System design** | `standards/design-principles.md` |
| **UI/UX work** | `reference/ui-ux.md` |
| **General dev** | `reference/development.md` |

---

## Structure

```
context/
├── standards/          # Coding standards (read before work)
│   ├── code-quality.md
│   ├── testing.md
│   ├── documentation.md
│   ├── design-principles.md
│   └── security.md
└── reference/          # Domain knowledge
    ├── development.md
    └── ui-ux.md
```

---

## Skills

For workflows and patterns, use skills instead of reading files directly:

| Task | Skill Name |
|------|------------|
| Code review | `code-review` |
| Complex task management | `session-management` |
| Input validation | `input-validation` |
| Retry logic | `retry-mechanism` |
| Circuit breaker | `circuit-breaker` |
| Parallel execution | `parallel-execution` |
| Rate limiting | `rate-limiting` |
| Event coordination | `event-coordination` |

---

## Mandatory Context Loading

**ALL agents MUST read required standards BEFORE starting any work:**

| Task Type | Required Context Files |
|-----------|------------------------|
| **Code Implementation** | `standards/code-quality.md` |
| **Test Writing** | `standards/testing.md` |
| **Code Review** | Use `skill({ name: "code-review" })` |
| **Documentation** | `standards/documentation.md` |
| **Security Review** | `standards/security.md` |
| **System Design** | `standards/design-principles.md` |

---

## Key Principles

1. **MANDATORY Context Loading** - Read required standards BEFORE any work
2. **Language-Agnostic** - All patterns apply to any programming language
3. **Token Economy** - Concise, no redundancy
4. **Use Skills for Workflows** - Skills for processes, context for reference

---

## Language-Agnostic Approach

All standards are **language-agnostic**:
- No language-specific syntax
- Generic pseudocode examples
- Principles apply to any stack
- Focus on universal best practices

When implementing:
1. Read the language-agnostic standards first
2. Apply principles to your specific language/stack
3. Follow your project's existing conventions
4. Be consistent within the codebase

---

**Version**: 5.0  
**Updated**: 2026-03-26
