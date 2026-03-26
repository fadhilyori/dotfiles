---
description: Manage git worktrees for parallel development workflows
---

# Git Worktree Management

Manage git worktrees to enable parallel development on multiple branches.

---

## Worktree Management Process

### Step 1: Assess Current State
- Check if git worktrees are already in use with `git worktree list`
- Verify GitHub CLI is available and authenticated
- Identify the main repository directory structure
- Check for existing `./tree` directory

### Step 2: Execute Worktree Operations

#### Create Worktrees for All Open PRs
When arguments includes "prs" or "all":
1. Run `gh pr list --json headRefName,title,number` to get open PRs
2. For each PR branch:
   - Create directory: `./tree/[branch-name]`
   - Execute `git worktree add ./tree/[branch-name] [branch-name]`
3. Report successful worktree creation

#### Create Worktree for Specific Branch
When arguments specifies a branch name:
1. Check if branch exists locally or remotely
2. Create worktree at `./tree/[branch-name]`
3. If branch doesn't exist, offer to create it

#### Create New Branch with Worktree
When arguments includes "new" and a branch name:
1. Prompt for base branch (default: main/master)
2. Create new branch and worktree simultaneously

#### List and Status Check
When arguments includes "list" or "status":
1. Show all current worktrees
2. Check status of each worktree
3. Identify stale worktrees

#### Cleanup Operations
When arguments includes "cleanup":
1. Identify branches that no longer exist remotely
2. Remove corresponding worktrees
3. Clean up empty directories in `./tree`

### Step 3: Present Worktree Report

## 📋 Worktree Management Results

### 🎯 Operation Summary
- **Command**: [What operation was performed]
- **Target**: [Specific branches or "all open PRs"]

### 🌳 Active Worktrees
```
/path/to/main/repo          [main branch]
/path/to/tree/feature-123   [feature-123]
/path/to/tree/bugfix-456    [bugfix-456]
```

### ✅ Actions Completed
- **Created**: [Number of new worktrees]
- **Removed**: [Number of stale worktrees]
- **Skipped**: [Worktrees that already existed]

### 📁 Directory Structure
```
project/
├── main repository files
└── tree/
    ├── feature-branch-1/
    └── feature-branch-2/
```

### 🔧 Next Steps
- **To work on a branch**: `cd tree/[branch-name]`
- **To clean up later**: Use `/worktrees cleanup` command

## Worktree Best Practices

- **Parallel Development**: Work on multiple branches simultaneously
- **Clean Organization**: Structured directory layout in `./tree`
- **Safe Cleanup**: Only remove worktrees for deleted branches
