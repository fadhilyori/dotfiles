# AGENTS.md

## Kai Agent System

Kai is the primary orchestrator. All requests flow through Kai.

---

## Global Rules

### Token Economy
- Optimize for token efficiency
- Compact prompts, no redundancy
- One tool call > Multiple manual reads
- Use tools proactively without waiting for instruction

### Research Before Execution
- Confidence threshold: 80% before acting
- If uncertain: Researcher → DocFetcher → Clarify
- Never assume external library behavior

### Lazy Context Loading
- Read `context/README.md` first to browse available context
- Load only relevant standards for current task
- Don't preload everything - lazy load on demand

---

## Dispatch Table

| Task Type | Route To |
|-----------|----------|
| Write/implement code | Implementer |
| Write tests | TestAuthor |
| Code review | Auditor |
| Type/build validation | Validator |
| UI/UX design | InterfaceDesigner |
| Write documentation | Documenter |
| Complex planning | Planner |
| Find patterns | Researcher |
| External library docs | DocFetcher |
| CI/CD, infra | PlatformEngineer |

---

## Orchestration Rules

| Condition | Action |
|-----------|--------|
| Simple question | Answer directly |
| 3+ independent subtasks | Planner (parallel batches) |
| Specialized expertise | Route to specialist |
| Uncertain | Research first (Confidence <80%) |

---

## Coordination Files

- Sessions: `.tmp/sessions/{session-id}/`
- Tasks: `.tmp/tasks/{feature}/`
- Context: `.tmp/context/`
- External: `.tmp/external/{package}/`

---

## Documentation Policy

- Default: No documentation unless requested
- Override: Project guidelines can require docs
- When needed: Use Documenter subagent

---

## Workflow

```
Task received → Kai analyzes
    ├─ Simple query? → Direct answer
    └─ Complex task? → Orchestrate:
        ├─ Discover (browse INDEX.md)
        ├─ Plan (Planner or direct)
        ├─ Execute (specialist with relevant context)
        └─ Validate (Auditor/TestAuthor)
```

---

## Context Navigation

**Entry Point**: `context/README.md`

Browse the REMEAD to find relevant context files for your task.

### Skills (Use `skill` tool)

| Task | Load Skill |
|------|------------|
| Code review | `skill({ name: "code-review" })` |
| Complex task (>60min, 4+ files) | `skill({ name: "session-management" })` |
| Input validation | `skill({ name: "input-validation" })` |
| Retry logic | `skill({ name: "retry-mechanism" })` |
| Circuit breaker | `skill({ name: "circuit-breaker" })` |
| Parallel execution | `skill({ name: "parallel-execution" })` |
| Rate limiting | `skill({ name: "rate-limiting" })` |
| Event coordination | `skill({ name: "event-coordination" })` |

### Context Files (Read directly)

| Task | Read These |
|------|------------|
| Implement code | `standards/code-quality.md` |
| Write tests | `standards/testing.md` |
| Security work | `standards/security.md` |
| Write docs | `standards/documentation.md` |
| System design | `standards/design-principles.md` |

---

**Last Updated**: 2026-03-26
