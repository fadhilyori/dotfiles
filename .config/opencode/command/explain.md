---
description: "Explain code, concepts, or features in clear terms"
---

# Explain

**Purpose**: Explain code, concepts, or features in clear, understandable terms.

**Arguments**: `$ARGUMENTS` (file path, code snippet, or concept)

---

## Usage

```bash
# Explain file
/explain src/auth/login.ts

# Explain concept
/explain "How does OAuth2 work?"

# Explain with depth
/explain src/utils/parser.ts --depth=detailed

# Explain for audience
/explain "React hooks" --audience=beginner
```

---

## Explanation Levels

### Brief (Default)
- One paragraph summary
- Key points only
- For quick understanding

### Standard
- What it does
- How it works
- Key components
- Usage examples

### Detailed
- Full explanation
- Code walkthrough
- Edge cases
- Related concepts
- Best practices

---

## Explanation Format

### For Code Files

```markdown
## {File Name}

### Purpose
{What this file does in one sentence}

### Key Components
- **Function1**: {description}
- **Function2**: {description}
- **Class1**: {description}

### How It Works
{Step-by-step explanation}

### Usage
```typescript
// Example usage
import { Function1 } from './file';
const result = Function1(input);
```

### Dependencies
- {dependency1}
- {dependency2}

### Related Files
- {related file 1}
- {related file 2}
```

### For Concepts

```markdown
## {Concept Name}

### Definition
{Clear, concise definition}

### Why It Matters
{Business/technical value}

### How It Works
{Explanation with examples}

### Code Example
```typescript
// Example demonstrating the concept
```

### Common Patterns
- {pattern 1}
- {pattern 2}

### Pitfalls
- {common mistake 1}
- {common mistake 2}

### Further Reading
- {resource 1}
- {resource 2}
```

---

## Audience Adaptation

### Beginner
- Avoid jargon
- Explain terms inline
- Use simple examples
- Focus on "what" and "why"

### Intermediate
- Use standard terminology
- Show practical examples
- Discuss trade-offs
- Focus on "how" and "when"

### Advanced
- Use technical terms freely
- Discuss edge cases
- Compare alternatives
- Focus on "why" and "optimization"

---

## Explanation Process

### 1. Identify Audience
- What's their experience level?
- What do they already know?
- What do they need to understand?

### 2. Determine Scope
- Brief overview?
- Detailed walkthrough?
- Deep dive?

### 3. Structure Explanation
- Start with high-level summary
- Break down into components
- Use examples
- Address common questions

### 4. Verify Understanding
- Check for jargon
- Ensure clarity
- Provide examples
- Suggest further reading

---

## Best Practices

1. **Start simple** - High-level first, details later
2. **Use examples** - Code speaks louder than words
3. **Define terms** - Don't assume knowledge
4. **Show context** - Where does this fit?
5. **Address "why"** - Explain motivation
6. **Provide references** - Link to documentation