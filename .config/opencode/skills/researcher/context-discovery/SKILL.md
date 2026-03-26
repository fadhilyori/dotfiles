---
name: context-discovery
description: Guide Researcher in finding and ranking context files. Trigger when Researcher needs to discover project standards, conventions, or relevant files.
---

## Purpose

Systematically discover project context files and rank them by relevance to the specific question.

---

## Discovery Workflow

### Step 1: Start at Navigation

Always begin with:
```
{context_root}/README.md
```

This file contains the navigation structure.

### Step 2: Follow Relevant Paths

From README.md, identify:
- Standards directory
- Reference files
- Domain-specific documentation

### Step 3: Search Within Scope

Use glob and grep to find:
- Configuration files (indicate tech stack)
- Standards files (coding conventions)
- Reference documentation

**Constraint:** Only search within scope boundary from Kai

### Step 4: Rank by Relevance

**Critical Priority**
- Files directly answering Kai's question
- Must be loaded before any work
- Example: code-quality.md for Implementer

**High Priority**
- Strongly relevant to the task
- Provide important context
- Example: testing.md for TestAuthor

**Medium Priority**
- Related but not essential
- Can be referenced if needed
- Example: design-principles.md for implementation

**Out of Scope**
- Not relevant to specific question
- Do not include in report
- Example: ui-ux.md for backend task

---

## Search Patterns

### For Implementer Tasks

```
Search for:
- context/standards/code-quality.md
- context/standards/testing.md
- context/standards/security.md
- Language config files (package.json, go.mod, etc.)
```

### For UI Tasks

```
Search for:
- context/reference/ui-ux.md
- context/standards/design-principles.md
- Frontend config files
```

### For Security Tasks

```
Search for:
- context/standards/security.md
- Authentication patterns
- Environment configuration
```

---

## Response Format

```markdown
## Context Discovery Report

### Question from Kai
{specific question}

### Critical Priority (Must Load)
- **File**: {path}
  **Contains**: {summary}
  **Why Critical**: {relevance to question}

### High Priority (Should Load)
- **File**: {path}
  **Contains**: {summary}

### Medium Priority (Reference If Needed)
- **File**: {path}
  **Contains**: {summary}

### Out of Scope (Excluded)
- **File**: {path}
  **Reason**: {why excluded}

### DocFetcher Recommendation (if applicable)
Framework **[Name]** has no internal context.
→ Use DocFetcher for [Name]: [question]

### Summary
Files to load: {N}
- Critical: {N}
- High: {N}
- Medium: {N}
```

---

## Rules

1. **Read navigation first** - Start at README.md
2. **Verify exists** - Never recommend unverified paths
3. **Rank by relevance** - Not all files are equal
4. **Stay in scope** - Respect boundary from Kai
5. **DocFetcher trigger** - Only if no internal context

---

## Anti-Patterns

**Bad:** Return all files found
**Good:** Rank by relevance to specific question

**Bad:** Search beyond scope boundary
**Good:** Respect Kai's explicit boundaries

**Bad:** Recommend external docs first
**Good:** Search internal context first, DocFetcher only if needed
