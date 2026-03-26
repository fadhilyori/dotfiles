# Global Rules

Aturan ini berlaku untuk semua agent dalam sistem.

## Token Economy
- Optimize token efficiency
- Compact prompts, no redundancy
- One tool call > Multiple manual reads
- Use tools proactively

## Research Before Execution
- Confidence threshold: 80% before acting
- If uncertain: Researcher → DocFetcher → Clarify
- Never assume external library behavior

## Lazy Context Loading
- Read `context/README.md` first
- Load only relevant standards
- Don't preload everything

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

## Orchestration Rules

| Condition | Action |
|-----------|--------|
| Simple question | Answer directly |
| 3+ independent subtasks | Planner (parallel batches) |
| Specialized expertise | Route to specialist |
| Uncertain | Research first (Confidence <80%) |

## Coordination Files

- Sessions: `.tmp/sessions/{session-id}/`
- Tasks: `.tmp/tasks/{feature}/`
- Context: `.tmp/context/`
- External: `.tmp/external/{package}/`

## Documentation Policy

- Default: No documentation unless requested
- Override: Project guidelines can require docs
- When needed: Use Documenter subagent

## Context Navigation

**Entry Point**: `context/README.md`

### Skills by Agent

Skills are organized by which agent loads them:

#### Kai Skills (Orchestration)

| Task | Load Skill |
|------|------------|
| Checkpoint handling | `skill({ name: "checkpoint-handling" })` |
| Delegation contracts | `skill({ name: "delegation-contracts" })` |
| Error containment | `skill({ name: "error-containment" })` |

#### Researcher Skills

| Task | Load Skill |
|------|------------|
| Context discovery | `skill({ name: "context-discovery" })` |

#### Implementer Skills

| Task | Load Skill |
|------|------------|
| Bounded execution | `skill({ name: "bounded-execution" })` |
| Input validation | `skill({ name: "input-validation" })` |
| Retry mechanism | `skill({ name: "retry-mechanism" })` |
| Circuit breaker | `skill({ name: "circuit-breaker" })` |
| Parallel execution | `skill({ name: "parallel-execution" })` |
| Rate limiting | `skill({ name: "rate-limiting" })` |
| Event coordination | `skill({ name: "event-coordination" })` |

#### Auditor Skills

| Task | Load Skill |
|------|------------|
| Code review | `skill({ name: "code-review" })` |

### Context Files

| Task | Read These |
|------|------------|
| Implement code | `standards/code-quality.md` |
| Write tests | `standards/testing.md` |
| Security work | `standards/security.md` |
| Write docs | `standards/documentation.md` |
| System design | `standards/design-principles.md` |

---

**Last Updated**: 2026-03-26
