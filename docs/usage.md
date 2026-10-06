---
title: Usage
description: 'How to run the build-engineer custom agent and the future Rust project workflow.'
---

# Usage

## Choice of the `build-engineer` agent
In GitHub Copilot Chat or the agent selector in VS Code, choose the custom agent named `build-engineer`.

It is intended for:

- repository-aware work;
- safe command execution;
- skill-driven workflows;
- validation before completion;
- real Rust project generation in a feature branch.

## Running `git-init`
Use the `git-init` prompt from the `.github/prompts/` directory or select it in the Copilot prompt menu if available.

Expected behavior:

- verify the repository exists;
- show `git status`;
- create or update `.gitignore` safely;
- ensure `target/` is ignored;
- do not commit or push;
- do not change Git history.

## Running `create-project`
Use the `create-project` prompt to invoke the `project-scaffold` skill.

This command creates the actual Cargo-based Rust project in the target branch with:

- `Cargo.toml`
- `src/main.rs`
- `README.md`
- `.gitignore`
- required project directories

## Running `create-build`
Use the `create-build` prompt to invoke the `build-and-test` skill.

This command creates or updates the build/test configuration for:

- `Cargo.toml`
- `src/lib.rs`
- `tests/basic_addition.rs`
- `ci.sh`
- `ci.bat`

It then runs `cargo build --release` and `cargo test` as verification.

## Running `create-actions`
Use the `create-actions` prompt to invoke the `github-actions` skill.

This command creates the actual workflow in `.github/workflows/ci.yml` for:

- `push` on `develop` and `master`
- `pull_request` on `develop` and `master`
- matrix OS: `ubuntu-latest`, `windows-latest`, `macos-latest`
- Linux/macOS script: `ci.sh`
- Windows script: `ci.bat`
- artifact upload for `hello-ubuntu`, `hello-windows`, and `hello-macos`

## Running `check`
Use the `check` prompt as a read-only validation step.

It is allowed to run `cargo build --release`, `cargo test`, `git status`, `git check-ignore target/`, and other repository checks, but it must not edit tracked project files or auto-fix issues.

## Running `init`
Use the `init` prompt as the orchestrator.

It runs in strict order:

1. `git-init`
2. `create-project`
3. `create-build`
4. `create-actions`
5. `check`

If a critical failure occurs, processing stops and the failed stage is reported.

## Rust project commands
When the actual project is created in the feature branch, the expected commands are:

- `cargo run`
- `cargo build --release`
- `cargo test`

## Local CI commands
Linux/macOS:

```bash
bash ci.sh
```

Windows:

```bat
ci.bat
```

## Git flow
Recommended repository flow:

```text
master
→ develop
→ feature/lab1-rust
→ Pull Request feature/lab1-rust -> develop
→ verification
→ master
```

Pull Request title:

```text
lab1/finish
```
