---
description: "Research-backed prompt optimizer applying Stanford/Anthropic patterns"
---

# Prompt Enhancer

Optimize prompts using research-backed patterns: critical rules early, reduced nesting, modular design.

---

## Critical Rules

- **Position sensitivity**: Critical instructions in first 15% of prompt
- **Nesting limit**: Maximum 4 levels deep
- **Instruction ratio**: 40-50% of total prompt
- **Single source**: Define critical rules once, reference with @rule_id

---

## Execution Priority

**Tier 1 - Research Patterns (Non-negotiable)**:
- Position sensitivity (first 15%)
- Nesting depth (≤4 levels)
- Instruction ratio (40-50%)
- Single source with @references

**Tier 2 - Structure**:
- Component ordering (context→role→task→instructions)
- Explicit prioritization
- Modular design
- Consistent attributes

**Tier 3 - Enhancements**:
- Workflow optimization
- Routing intelligence
- Validation gates

**Conflict Resolution**: Tier 1 always overrides Tier 2/3

---

## 10-Stage Optimization Workflow

### Stage 1: Analyze Structure
1. Read target prompt file
2. Assess prompt type (command, agent, subagent, workflow)
3. Check research patterns:
   - Critical rules position (<15%?)
   - Max nesting depth (≤4?)
   - Instruction ratio (40-50%?)
   - Rule repetition (1x + refs?)
4. Calculate component ratios
5. Identify violations

**Scoring (10 points)**:
- Critical position: 3 points
- Nesting depth: 2 points
- Instruction ratio: 2 points
- Single source: 1 point
- Explicit priority: 1 point
- Modular design: 1 point

### Stage 2: Elevate Critical Rules
- Extract all critical/safety rules
- Create `<critical_rules>` block after `<role>`
- Assign unique IDs to each rule
- Replace later occurrences with @rule_id
- Verify position <15%

### Stage 3: Flatten Nesting
- Identify sections >4 levels deep
- Convert metadata to attributes
- Extract verbose sections to external references
- Verify max depth ≤4

### Stage 4: Optimize Instruction Ratio
- Calculate current percentage
- If >60%, extract verbose sections:
  - Session management → `context/core/session-management.md`
  - Context discovery → `context/core/context-discovery.md`
  - Detailed examples → `context/core/examples.md`
  - Implementation specs → `context/core/specifications.md`
- Target 40-50%

### Stage 5: Consolidate Repetition
- Find all repeated rules/instructions
- Keep single definition
- Replace with @rule_id or @section_id
- Verify references work

### Stage 6: Add Explicit Priority
- Create `<execution_priority>` section
- Define 3 tiers: Safety → Core → Optimization
- Add conflict_resolution rules
- Document edge cases

### Stage 7: Standardize Formatting
- Convert metadata to attributes (id, name, when, required)
- Standardize attribute order: id → name → type → when → required → enforce
- Verify XML validity

### Stage 8: Enhance Workflow
Based on complexity:
- **Simple**: Basic numbered steps with checkpoints
- **Moderate**: Multi-step with decision points
- **Complex**: Full stage-based with routing intelligence

### Stage 9: Validate Optimization
Checklist:
- [ ] Critical rules in first 15%
- [ ] Max depth ≤4 levels
- [ ] Instructions 40-50%
- [ ] No rule repeated >2x
- [ ] 3-tier priority system exists
- [ ] Attributes used consistently
- [ ] External references for verbose sections

Target score: 8+/10

### Stage 10: Deliver Optimized

Provide:
1. **Analysis**: Before/after metrics table
2. **Scores**: Original vs Optimized
3. **Key Optimizations**: 6 major improvements
4. **Files Created**: External references
5. **Optimized Prompt**: Full XML
6. **Testing Recommendations**: 4 validation steps

---

## Output Format

```markdown
## Optimization Analysis

### Pattern Compliance
| Pattern | Before | After | Status |
|---------|--------|-------|--------|
| Critical position | X% | Y% | ✅ |
| Max nesting | X | Y | ✅ |
| Instruction ratio | X% | Y% | ✅ |

### Scores
**Original**: X/10
**Optimized**: Y/10
**Improvement**: +Z points

### Key Optimizations
1. Critical Rules: X% → Y%
2. Nesting: X → Y levels
3. Instruction Ratio: X% → Y%
4. Repetition: Z consolidations
5. Priority System: 3-tier added
6. Modular: N extractions

---

## Optimized Prompt

[Full XML]

---

## Implementation Notes

**Status**: Ready | Needs Testing

**Testing**:
1. Verify @references work
2. Test edge cases
3. Validate external files
4. A/B test effectiveness
```

---

## Component Ratios

- **Context**: 15-25%
- **Role**: 5-10%
- **Task**: 5-10%
- **Instructions**: 40-50%
- **Examples**: 10-20%
- **Principles**: 5-10%

---

## Research Basis

**Position Sensitivity**: Early placement improves adherence (effect varies by task/model)

**Nesting Depth**: Excessive nesting reduces clarity (magnitude is task-dependent)

**Instruction Ratio**: 40-50% optimal balance

**Single Source**: Repetition causes ambiguity

**Explicit Priority**: Conflict resolution improves decision clarity

---

## XML Advantages

- Improved response quality (varies by model/task)
- Reduced token overhead (task-dependent)
- Universal compatibility
- Explicit boundaries prevent context bleeding
