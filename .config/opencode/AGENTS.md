# AGENTS.md

## Tools

- Before answering from memory, check whether a tool can return more accurate or current information — and call it.
- Do not skip tools because the task feels small. A quick file read, search, or bash command beats guessing.
- When one tool's output informs the next step, call the next tool immediately without asking for permission.
- When exploring before modifying, prefer this order:
  'Read → Grep/Glob → Bash → Edit/Write'
- If you are unsure how to do something, use `gh_grep` to search code examples from GitHub.

---

## Subagents

Dispatch a subagent when **any** of the following applies:

| Condition                                         | Dispatch type              |
| ------------------------------------------------- | -------------------------- |
| 3+ independent sub-tasks                          | Parallel                   |
| Task B depends on Task A output                   | Sequential                 |
| Reading many files (exploration, audit, analysis) | Background                 |
| Scope is unclear before acting                    | Background (explore first) |
| Research or docs lookup not blocking current work | Background (Ctrl+B)        |

**Parallel dispatch** — all of these must hold:

- Tasks are independent with no shared state
- No file overlap risk between dispatched agents

**Sequential dispatch** — any of these triggers it:

- Task B depends on output or side-effects from Task A
- Shared files or shared state (risk of merge conflict)

**Background dispatch** — use for:

- Codebase exploration, research, docs lookup
- Security audits, performance profiling
- Any analysis that does not write files

### Subagent Prompt Requirements

Every subagent dispatch must specify:

1. **Scope** — which files, modules, or directories are in scope
2. **Goal** — what to return or produce
3. **Constraints** — what must not be modified or touched
4. **Done condition** — how to know the task is complete

Example:

```text
Read src/auth/*.ts and return:
  (1) how token refresh is implemented
  (2) whether existing OAuth utilities are present
Do not modify any files.
Done when both questions are answered.
```

---

## Skills

Before writing logic from scratch:

1. Check `.opencode/skills/` for project-level skills
2. Check `~/.config/opencode/skills/` for user-level skills
3. If a matching skill exists — use it, do not reimplement
4. If a skill partially matches — invoke it, then extend only what's missing
5. Build from scratch only when no relevant skill exists

When invoking a skill through a subagent, pass the `SKILL.md` path explicitly
in the subagent prompt if auto-loading is not configured.

---

## Context Window

- Do not read large numbers of files inline — delegate to a subagent
- Do not run open-ended `grep` or `find` without scoping or delegating
- Prefer receiving summaries from subagents, not raw file dumps
- If a task spans 10+ files of content, it belongs in a subagent

---

## Pre-Response Checklist

Before every response, check each item. If any is true — act on it first.

```text
[ ] A tool exists that can answer this more accurately than memory
[ ] A skill exists that covers this workflow
[ ] A subagent would keep the main context cleaner
[ ] Sub-tasks can run in parallel
[ ] This requires reading many files → delegate
[ ] This is research or analysis with no writes → background subagent
```

---

## Anti-Patterns

- Answering from memory when a tool is available
- Reading 10+ files inline instead of delegating
- Running tasks sequentially when they could be parallel
- Reimplementing logic that a skill already covers
- Dispatching subagents with vague or underspecified prompts
- Spawning excessive agents for simple tasks
- Filling the main context with raw exploration output
