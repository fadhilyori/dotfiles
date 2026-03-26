---
description: Create well-formatted commits with conventional commit messages and emoji
---

# Commit Command

Create well-formatted git commits with conventional commit messages and emoji.

---

## Instructions

### Workflow

1. **Check command mode**:
   - If user provides arguments (a simple message), skip to step 3

2. **Run pre-commit validation**:
   - Execute `pnpm lint` and report issues
   - Execute `pnpm build` and ensure it succeeds
   - If either fails, ask user if they want to proceed

3. **Analyze git status**:
   - Run `git status --porcelain` to check for changes
   - If no files staged, run `git add .`
   - If files already staged, proceed with those

4. **Analyze the changes**:
   - Run `git diff --cached` to see what will be committed
   - Determine the primary change type (feat, fix, docs, etc.)

5. **Generate commit message**:
   - Choose appropriate emoji and type
   - Format: `<emoji> <type>: <description>`
   - Keep description concise, imperative mood

6. **Execute the commit**:
   - Run `git commit -m "<message>"`
   - Display commit hash and confirm success

---

## Commit Message Guidelines

- **Atomic commits**: Related changes, single purpose
- **Imperative mood**: "add feature" not "added feature"
- **Concise first line**: Keep under 72 characters
- **Format**: `<emoji> <type>: <description>`

### Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code changes that neither fix bugs nor add features
- `perf`: Performance improvements
- `test`: Adding or fixing tests
- `chore`: Changes to build process, tools

### Emoji Reference

| Emoji | Type | Use For |
|-------|------|---------|
| ✨ | feat | New feature |
| 🐛 | fix | Bug fix |
| 📝 | docs | Documentation |
| 💄 | style | Formatting/style |
| ♻️ | refactor | Code refactoring |
| ⚡️ | perf | Performance |
| ✅ | test | Tests |
| 🔧 | chore | Tooling |
| 🚀 | ci | CI/CD |
| 🔒️ | fix | Security fix |
| 🎨 | style | Code structure |
| 💥 | feat | Breaking changes |

---

## Good Commit Examples

- ✨ feat: add user authentication system
- 🐛 fix: resolve memory leak in rendering process
- 📝 docs: update API documentation
- ♻️ refactor: simplify error handling logic
- 🚨 fix: resolve linter warnings
- 🔒️ fix: strengthen password requirements
- ♿️ feat: improve form accessibility

---

## Agent Behavior

- **Error handling**: If validation fails, give user option to proceed or fix
- **Auto-staging**: If no files staged, automatically stage all changes
- **Always commit**: Run and push the commit unless there's a big issue
- **Message quality**: Ensure clear, concise, conventional format
