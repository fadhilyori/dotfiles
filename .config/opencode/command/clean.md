---
description: Clean the codebase or current working task via Prettier, Import Sorter, ESLint, and TypeScript Compiler
---

# Code Quality Cleanup

Clean and optimize code for production readiness.

---

## Cleanup Process

### Step 1: Analyze Target Scope
- If arguments provided: Focus on specified files/directories
- If no arguments: Check git status for modified files

### Step 2: Execute Cleanup Pipeline

1. **Remove Debug Code**
   - Strip console.log, debugger statements
   - Remove commented-out code blocks
   - Clean up development-only imports

2. **Format Code Structure**
   - Run Prettier or apply consistent formatting
   - Ensure proper indentation and spacing
   - Standardize quote usage

3. **Optimize Imports**
   - Sort imports alphabetically
   - Remove unused imports
   - Group imports by type

4. **Fix Linting Issues**
   - Resolve ESLint/TSLint errors
   - Apply auto-fixable rules
   - Report manual fixes needed

5. **Type Safety Validation**
   - Run TypeScript compiler checks
   - Fix obvious type issues
   - Add missing type annotations

6. **Comment Optimization**
   - Remove redundant comments
   - Improve unclear comments
   - Ensure JSDoc completeness for public APIs

### Step 3: Present Cleanup Report

## 📋 Cleanup Results

### 🎯 Files Processed
- [List of files cleaned]

### 🔧 Actions Taken
- **Debug Code Removed**: [Count]
- **Formatting Applied**: [Files formatted]
- **Imports Optimized**: [Unused imports removed]
- **Linting Issues Fixed**: [Auto-fixed count]
- **Type Issues Resolved**: [TypeScript errors fixed]
- **Comments Improved**: [Redundant comments removed]

### 🚨 Manual Actions Needed
- [Issues requiring manual intervention]

### ✅ Quality Improvements
- [Summary of overall improvements]

## Quality Standards Applied

- **Production Ready**: Remove all debugging artifacts
- **Consistent Style**: Apply project formatting standards
- **Type Safety**: Ensure strong typing
- **Clean Imports**: Optimize dependency management
- **Clear Documentation**: Improve code readability
