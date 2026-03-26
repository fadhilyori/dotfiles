---
name: parallel-execution
description: Execute multiple independent operations simultaneously. Trigger immediately when user mentions parallel execution, run simultaneously, concurrent operations, or Promise.all. Also activate when needing to fetch multiple resources, process independent tasks, or reduce total execution time.
---

## Purpose
Run independent operations concurrently to improve performance.

## Workflow

### Step 1: Identify Independent Operations
Find tasks that:
- Don't depend on each other's results
- Use different resources
- Can fail independently
- Benefit from parallel execution

### Step 2: Group Operations
Organize into:
- Batch 1: Truly independent (run parallel)
- Batch 2: Dependent on Batch 1 (run sequential)
- Continue grouping by dependency chain

### Step 3: Implement Execution
Default strategy: **Collect all results** (use Promise.allSettled equivalent)
- Get results from all operations
- Process successes
- Log/report failures separately

If one failure should stop everything: Use **Fail fast** (Promise.all equivalent)

### Step 4: Add Safeguards
Add:
- Timeout per operation (5-30 seconds)
- Error boundaries per operation
- Resource limits (don't exceed capacity)
- Result aggregation

## Output Format
Provide the parallel execution wrapper with chosen failure strategy.
