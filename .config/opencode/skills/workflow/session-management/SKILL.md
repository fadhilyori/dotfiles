---
name: session-management
description: Create and manage task sessions for complex work. Trigger immediately when task involves 4+ files, estimated >60 minutes, or complex multi-step implementation. Also activate when user mentions create session, track progress, or coordinate complex task.
---

## Purpose
Organize large tasks into manageable sessions with clear progress tracking.

## Workflow

### Step 1: Assess Need
Check if session needed:
- 4+ files to modify?
- Multiple domains involved?
- Estimated >60 minutes?
- Requires coordination?

If no → proceed without session
If yes → continue to Step 2

### Step 2: Create Session
Setup:
1. Create directory: sessions/YYYY-MM-DD-task-name/
2. Create context.md with:
   - Task description
   - Scope (in/out)
   - Exit criteria checklist
   - Constraints

### Step 3: Execute Work
While working:
- Update context.md status regularly
- Mark completed criteria
- Document decisions
- Stay within scope

### Step 4: Track Progress
Update status:
- in_progress: working
- in_review: awaiting feedback
- blocked: external dependency
- completed: all criteria met

### Step 5: Complete & Cleanup
1. Verify all exit criteria
2. Summarize accomplishments
3. Ask user before deleting
4. Remove session files after confirmation

## Output Format
Provide session context.md template and directory structure.
