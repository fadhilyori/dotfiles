---
name: rate-limiting
description: Limit concurrent operations and control resource usage. Implementer loads this skill when dealing with API rate limits or resource constraints.
---

## Purpose

Control resource usage and prevent system overload.

---

## When to Load

Load this skill when:
- Dealing with API rate limits
- Managing database connection pools
- Processing large datasets
- Controlling resource usage

---

## Rate Limiting Rules

### Step 1: Determine Limiting Strategy

Based on constraints:
- **API rate limits** → Use rate limiting (token bucket)
- **Connection pool limits** → Use concurrency limit (semaphore)
- **Large dataset processing** → Use batch processing

Default: Start with concurrency limit

### Step 2: Set Limits

Based on:
- External API rate limits (requests/second)
- Database connection pool size
- Memory constraints
- Target throughput

### Step 3: Implement Control

For **concurrency limit**:
1. Acquire slot before operation
2. Execute operation
3. Release slot after (success or failure)
4. Queue or reject when at limit

For **batch processing**:
1. Split items into batches (size: 10-100)
2. Process batch with limited parallelism
3. Collect results
4. Continue to next batch

### Step 4: Handle Overflow

When limit reached:
- Queue requests (if space available)
- Reject with clear error (if no queue)
- Return retry-after header/info

---

## Output

Provide the rate limiter implementation with chosen strategy.
