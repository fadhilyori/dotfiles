---
name: input-validation
description: Add input validation to functions and API endpoints. Implementer loads this skill when implementing validation logic.
---

## Purpose

Implement validation at system boundaries to fail fast and provide clear error messages.

---

## When to Load

Load this skill when:
- Implementing function parameters that accept external input
- Creating API endpoint handlers
- Processing form data
- Implementing data transformation functions

---

## Validation Rules

### Step 1: Identify Validation Points

Scan code for:
- Function parameters accepting external input
- API endpoint handlers
- Form processing logic
- Data transformation functions

### Step 2: Define Validation Rules

For each input, determine:
- Required vs optional fields
- Data type constraints
- Format requirements (email, phone, etc.)
- Range limits (min/max)
- Allowed values (enums, whitelists)

### Step 3: Implement Guard Clauses

Add at function entry:
1. Check required fields first
2. Validate data types
3. Check format with regex if needed
4. Verify range constraints
5. Return early with specific error on failure

### Step 4: Test Validation

Verify:
- Valid inputs pass through
- Each invalid case returns appropriate error
- Error messages are user-friendly
- Edge cases handled (null, empty, whitespace)

---

## Output

Return the validated function with guard clauses at the top.
