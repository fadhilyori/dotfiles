---
name: event-coordination
description: Coordinate work between components using events. Trigger immediately when user mentions event-driven, event emitter, message queue, pub/sub, or loose coupling. Also activate when multiple components need to react to the same event, or when decoupling producers from consumers.
---

## Purpose
Enable loose coupling between components via event-based communication.

## Workflow

### Step 1: Identify Events
Find:
- Actions that multiple components care about
- State changes that trigger other actions
- Cross-cutting concerns (logging, notifications)
- Workflow steps that need coordination

### Step 2: Define Event Contract
For each event:
- Event name (past tense: userCreated, orderPlaced)
- Payload structure (what data to include)
- Event sources (who emits)
- Event handlers (who listens)

### Step 3: Implement Event Bus
Core functionality:
1. **Subscribe**: Register handler for event type
2. **Emit**: Broadcast event to all handlers
3. **Unsubscribe**: Remove handler
4. **Error handling**: Catch and log handler errors

### Step 4: Add Reliability
For production:
- Persist events (don't lose on crash)
- Handle handler failures gracefully
- Support event ordering if needed
- Monitor event queue depth

## Output Format
Provide the event coordinator implementation with example events and handlers.
