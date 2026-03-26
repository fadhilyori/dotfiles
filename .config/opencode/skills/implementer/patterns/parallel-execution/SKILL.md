---
name: parallel-execution
description: Execute multiple independent operations simultaneously. Implementer loads this skill when operations are independent and can benefit from concurrency.
---

## Purpose

Run independent operations concurrently to improve performance.

---

## When to Load

Load this skill when:
- Operations don't depend on each other's results
- Operations use different resources
- Operations can fail independently
- Execution time can benefit from parallelism

---

## Parallel Execution Rules

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

Default strategy: **Collect all results** (Promise.allSettled equivalent)
- Get results from all operations
- Process successes
- Log/report failures separately

If one failure should stop everything: Use **Fail fast** (Promise.all)

### Step 4: Add Safeguards

Add:
- Timeout per operation (5-30 seconds)
- Error boundaries per operation
- Resource limits
- Result aggregation

---

## Output

Provide the parallel execution wrapper with chosen failure strategy.
