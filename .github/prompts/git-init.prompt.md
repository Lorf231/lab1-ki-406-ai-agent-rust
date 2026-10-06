---
agent: build-engineer
description: 'Initialize repository state and ensure the Git ignore rules are safe and idempotent before creating a Rust project.'
---

# git-init

## Prerequisites
- The working directory is a Git repository.
- The current branch is known and valid.
- The user intends to prepare the repository before running the project creation flow.

## Actions
1. Check whether the current directory is a Git repository.
2. Show the current Git status.
3. Ensure `.gitignore` exists and is safe to update.
4. Add or update ignore rules for:
   - `target/`
   - `.env`
   - `*.log`
   - common editor and OS artifacts
5. Confirm that `target/` is ignored.
6. Do not commit, push, merge, rebase, or rewrite Git history.
7. Keep the repository in a valid state for later project creation.

## Expected Result
- Git repository is confirmed.
- Git status is visible.
- `.gitignore` contains the required patterns.
- `target/` is ignored.
- No repository history is rewritten.

## Verification
- Confirm repository exists.
- Confirm `git status` output is reviewed.
- Confirm `.gitignore` includes `target/`.
- Confirm `.github/`, `docs/`, and `Cargo.lock` are not ignored by mistake.
- Confirm no commit or push was made.

## Failure Message
`git-init failed: repository state or ignore rules are invalid.`

## Idempotency
- If `.gitignore` already exists and is valid, update only the missing required entries.
- Do not duplicate ignore rules.
- Do not create extraneous Git state.
