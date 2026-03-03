---
name: git-commit
description: Guide for writing git commit messages following the type(topic): description convention. Use when writing, reviewing, or formatting commit messages.
---

Always write commit messages in this format:

```
<type>(<topic>): <short description>
```

## Types

| Type | When to use |
|------|-------------|
| `feat` | New feature or capability |
| `enh` | Enhancement to existing feature |
| `fix` | Bug fix |
| `hotfix` | Urgent production fix |
| `refactor` | Code restructure, no behavior change |
| `chore` | Maintenance, deps, tooling, configs |
| `docs` | Documentation only |
| `test` | Adding or updating tests |
| `perf` | Performance improvement |
| `revert` | Reverting a previous commit |

## Rules

- **topic**: the affected module, file, or area (e.g. `auth`, `api`, `ui`, `parser`) — use lowercase, no spaces
- **description**: imperative mood, lowercase, no period — describe *what* changes, not *why*
- Keep the whole first line under 72 characters
- If more context is needed, add a blank line then a body paragraph

## Examples

```
feat(auth): add OAuth2 login with Google
fix(parser): handle empty input without crashing
hotfix(api): correct rate limit header calculation
enh(ui): improve table row hover contrast
chore(deps): bump lodash to 4.17.21
refactor(cache): extract TTL logic into helper
docs(readme): add installation steps for Windows
test(auth): add unit tests for token refresh
```

## Bad vs Good

| Bad | Good |
|-----|------|
| `fixed stuff` | `fix(cart): prevent duplicate item add` |
| `WIP` | `feat(search): add fuzzy matching` |
| `Updated README.` | `docs(readme): document env variables` |
| `Auth changes` | `enh(auth): support remember-me option` |
