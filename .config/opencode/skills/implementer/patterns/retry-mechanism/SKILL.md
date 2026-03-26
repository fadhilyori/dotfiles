---
name: retry-mechanism
description: Implement retry logic with exponential backoff for transient failures. Implementer loads this skill when dealing with external service calls.
---

## Purpose

Handle temporary failures by retrying operations with increasing delays.

---

## When to Load

Load this skill when:
- Calling external services (APIs, databases)
- Operations may fail due to temporary issues
- Operations are idempotent (safe to retry)
- There are transient failure modes

---

## Retry Rules

### Step 1: Identify Retry Candidates

Find operations that:
- Call external services (APIs, databases)
- May fail due to temporary issues
- Are idempotent (safe to retry)
- Have transient failure modes

### Step 2: Configure Retry Parameters

Set values:
- Max attempts: 3-5
- Initial delay: 1000ms
- Backoff multiplier: 2x
- Max delay: 30000ms (30 seconds)

### Step 3: Implement Retry Logic

Structure:
1. Initialize attempt counter
2. Try operation
3. If success → return result
4. If failure:
   - Check if retryable (network, timeout, 5xx)
   - Calculate delay: initial × 2^(attempt-1)
   - Wait then retry
   - If max attempts reached → return final error

### Step 4: Verify Implementation

Test with:
- Successful operation (no retry needed)
- Retryable failure (network timeout)
- Non-retryable failure (auth error)
- Max attempts reached

---

## Output

Provide the retry wrapper function with configurable parameters.

---

## Troubleshooting

If retries loop infinitely: Consider adding circuit breaker pattern.
