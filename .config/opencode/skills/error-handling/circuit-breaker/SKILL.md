---
name: circuit-breaker
description: Implement circuit breaker pattern to prevent cascading failures. Trigger immediately when user mentions circuit breaker, circuit pattern, or stop cascading failures. Use when service is flaky or frequently unavailable - NOT for occasional transient failures (use retry instead).
---

## Purpose
Stop requests to failing services to prevent system overload and allow recovery.

## Workflow

### Step 1: Identify Protected Operations
Find:
- External API calls
- Database connections
- Third-party service integrations
- Operations with failure thresholds

### Step 2: Configure Circuit Breaker
Parameters:
- Failure threshold: 5 errors
- Timeout duration: 60 seconds
- Half-open max requests: 1-3

### Step 3: Implement States
Three states to manage:
1. **CLOSED**: Normal operation, count failures
2. **OPEN**: Threshold reached, reject fast
3. **HALF_OPEN**: Test if recovered

State transitions:
- CLOSED → OPEN: Failures ≥ threshold
- OPEN → HALF_OPEN: Timeout elapsed
- HALF_OPEN → CLOSED: Success
- HALF_OPEN → OPEN: Failure

### Step 4: Integrate with Retry
Combine with retry mechanism:
- Circuit breaker wraps retry logic
- Fast fail when circuit open
- Reset counter on success

## Output Format
Provide the circuit breaker class/state machine with execute method.
