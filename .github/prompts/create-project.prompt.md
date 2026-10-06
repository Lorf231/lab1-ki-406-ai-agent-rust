---
agent: build-engineer
description: 'Create the minimal Rust hello project using the project-scaffold skill.'
---

# create-project

Use skill: [project-scaffold](../skills/project-scaffold/SKILL.md)

## Prerequisites
- The repository is valid and Git is initialized.
- `.gitignore` is present and contains the required ignore rules.
- The command is run in the branch where the actual project is meant to be created, such as a feature branch after the definitions are inherited.

## Actions
1. Use the `project-scaffold` skill to create the minimal Rust project.
2. Create the package and executable for the project named `hello`.
3. Create the minimal `Cargo.toml` with the appropriate package metadata.
4. Create `src/main.rs` with the output `Hello, World!`.
5. Ensure the project can run with `cargo run`.
6. Do not create or modify project files without this command.

## Expected Files
- `Cargo.toml`
- `src/main.rs`
- optional `src/lib.rs` if needed by the later stages

## Verification
- Confirm `Cargo.toml` exists.
- Confirm `src/main.rs` exists and prints `Hello, World!`.
- Confirm `cargo run` succeeds.
- Confirm the repository remains valid and idempotent.

## Failure Message
`create-project failed: the project could not be created or validated.`

## Idempotency
- If the project already exists and is valid, do not duplicate or rewrite it.
- Re-running must not break existing valid project files.
- Keep file creation minimal and consistent.
