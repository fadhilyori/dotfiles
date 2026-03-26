---
description: Analyze and optimize code for performance, security, and potential issues
---

# Code Optimization Analysis

Analyze and optimize code for performance, security, and identifying potential issues.

---

## Optimization Process

### Step 1: Determine Analysis Scope
- If arguments provided: Focus on specified files/directories
- If no arguments: Analyze current context (open files, recent changes)

### Step 2: Performance Analysis

1. **Algorithmic Efficiency**
   - Identify O(n²) or worse patterns
   - Look for unnecessary nested loops
   - Find redundant calculations

2. **Memory Management**
   - Detect memory leaks
   - Find large objects that could be optimized
   - Identify unnecessary data retention

3. **I/O Optimization**
   - Analyze file read/write patterns
   - Check for unnecessary API calls
   - Look for missing caching

4. **Framework-Specific Issues**
   - React: unnecessary re-renders, missing memoization
   - Database: N+1 queries, missing indexes

### Step 3: Security Analysis

Scan for vulnerabilities:
- Missing input validation
- SQL injection
- XSS attack vectors
- Weak authentication
- Secrets in code

### Step 4: Potential Issue Detection

Identify hidden problems:
- Missing error handling
- Edge cases not handled
- Scalability concerns
- Maintainability issues

### Step 5: Present Optimization Report

## 📋 Code Optimization Analysis

### 🎯 Analysis Scope
- **Files Analyzed**: [List]
- **Languages**: [Languages found]
- **Frameworks**: [Frameworks detected]

### ⚡ Performance Issues

#### 🔴 Critical
- **Issue**: [Description]
- **Location**: [File:line]
- **Solution**: [Fix]

#### 🟡 Improvements
- **Optimization**: [Opportunity]
- **Expected Gain**: [Benefit]

### 🔒 Security Vulnerabilities

#### 🚨 Critical
- **Vulnerability**: [Description]
- **Risk**: [Level]
- **Fix**: [Remediation]

### ⚠️ Potential Issues

#### 🔍 Hidden Problems
- **Issue**: [Problem]
- **Prevention**: [How to avoid]

### 💡 Recommendations

#### 🎯 Priority 1 (Critical)
1. [Most important optimization]

#### 🎯 Priority 2 (Important)
1. [Significant improvements]

#### 🎯 Priority 3 (Nice to Have)
1. [Minor optimizations]

### 🔧 Implementation Guide
```
[Code examples showing fixes]
```

## Optimization Focus Areas

- **Performance First**: Fix actual bottlenecks
- **Security by Design**: Build secure patterns
- **Proactive Prevention**: Catch problems early
- **Maintainable Solutions**: Don't sacrifice clarity
