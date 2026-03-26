<!-- Context: README | Priority: critical | Version: 5.0 | Updated: 2026-03-26 -->

# Context Directory

**Purpose**: Language-agnostic standards and reference materials for the Kai Agent System

---

## Quick Navigation

**Start here, then read only what you need.**

| Task | Read These |
|------|------------|
| **Write code** | `standards/code-quality.md` |
| **Write tests** | `standards/testing.md` + `standards/code-quality.md` |
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

## Standards Detail

| File | Purpose | Read When |
|------|---------|-----------|
| `standards/code-quality.md` | Coding patterns, naming conventions, error handling | Writing/editing code |
| `standards/testing.md` | Test coverage, AAA pattern, mocking | Writing tests |
| `standards/security.md` | Input validation, auth, injection prevention | Security work |
| `standards/documentation.md` | README, API docs format | Writing docs |
| `standards/design-principles.md` | Architecture, modularity | System design |

---

## Reference Detail

| File | Purpose | Read When |
|------|---------|-----------|
| `reference/ui-ux.md` | UI/UX guidelines | UI/UX work |
| `reference/development.md` | Dev best practices | General dev |

---

## Skills (Use `skill` tool)

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

## MANDATORY Context Loading

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

## For Agents: Mandatory Reading

### Before Coding (NON-NEGOTIABLE)
```
MUST READ: ~/.config/opencode/context/standards/code-quality.md
Then proceed with implementation.
```

### Before Writing Tests (NON-NEGOTIABLE)
```
MUST READ: ~/.config/opencode/context/standards/testing.md
Then proceed with test implementation.
```

### Before Writing Docs (NON-NEGOTIABLE)
```
MUST READ: ~/.config/opencode/context/standards/documentation.md
Then proceed with documentation.
```

### Before Reviewing Code (NON-NEGOTIABLE)
```
LOAD SKILL: skill({ name: "code-review" })
MUST READ: ~/.config/opencode/context/standards/security.md
Then proceed with review.
```

---

## Navigation Rules

1. **Read this README first** - Understand what's available
2. **Open only relevant files** - Based on task type
3. **Follow cross-references** - Files link to each other
4. **Lazy load** - Don't preload everything

---

## Key Principles

1. **MANDATORY Context Loading** - Read required standards BEFORE any work
2. **Language-Agnostic** - All patterns apply to any programming language
3. **Token Economy** - Concise, no redundancy
4. **Use Skills for Workflows** - Skills for processes, context for reference

---

## Language-Agnostic Approach

All standards in this directory are **language-agnostic**:
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
