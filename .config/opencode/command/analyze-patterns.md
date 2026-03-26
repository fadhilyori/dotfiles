---
id: analyze-patterns
name: analyze-patterns
description: "Analyze codebase for patterns and similar implementations"
type: command
category: analysis
version: 1.0.0
---

# Command: analyze-patterns

Analyze codebase for recurring patterns, similar implementations, and refactoring opportunities.

---

## Usage

```bash
/analyze-patterns [--pattern=<pattern>] [--language=<lang>] [--depth=<level>]
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `--pattern` | string | No | Pattern name or regex (e.g., "singleton", "factory") |
| `--language` | string | No | Filter by language: js, ts, py, go, rust, java |
| `--depth` | string | No | shallow (current dir) | medium (src/) | deep (entire repo) |
| `--output` | string | No | Output format: text (default) | json | markdown |

---

## Behavior

### Pattern Search
- Searches codebase for pattern matches
- Identifies similar implementations
- Groups results by pattern type
- Suggests refactoring opportunities

### Analysis Output
- Pattern occurrences with locations
- Similarity metrics
- Refactoring suggestions
- Code quality insights

---

## Result Format

```
Pattern Analysis Report
=======================

Pattern: [pattern_name]
Occurrences: [count]
Files: [file_list]

Implementations:
  1. [file:line] - [description] (similarity: X%)
  2. [file:line] - [description] (similarity: Y%)

Refactoring Suggestions:
  - [suggestion 1]
  - [suggestion 2]

Quality Insights:
  - [insight 1]
```

---

## Examples

### Find error handling patterns
```bash
/analyze-patterns --pattern="error-handling" --language=ts
```

### Analyze factory patterns
```bash
/analyze-patterns --pattern="factory" --depth=deep
```

### Find API endpoint implementations
```bash
/analyze-patterns --pattern="api-endpoint" --language=js
```

---

## Predefined Patterns

### JavaScript/TypeScript
- `singleton`, `factory`, `observer`
- `error-handling`, `async-patterns`
- `api-endpoint`, `middleware`

### Python
- `decorator`, `context-manager`
- `error-handling`, `async-patterns`

### Go
- `interface-patterns`, `error-handling`
- `goroutine-patterns`, `middleware`

Users can provide custom regex patterns for domain-specific analysis.

---

## Processing Steps

1. Parse command parameters
2. Validate pattern syntax
3. Search codebase using glob + grep
4. Analyze semantic similarity
5. Group results by pattern
6. Generate suggestions
7. Format output
8. Return analysis report
