---
agent: build-engineer
description: 'Create the GitHub Actions CI workflow for the Rust project using the github-actions skill.'
---

# create-actions

Use skill: [github-actions](../skills/github-actions/SKILL.md)

## Prerequisites
- The Rust project and its build/test scripts already exist.
- The repository is valid and the required branch policy is known.
- The agent is allowed to create the workflow file.

## Actions
1. Use the `github-actions` skill to create `.github/workflows/ci.yml`.
2. Add triggers for:
   - `push` on `develop` and `master`
   - `pull_request` on `develop` and `master`
3. Add a single matrix job over:
   - `ubuntu-latest`
   - `windows-latest`
   - `macos-latest`
4. Run `bash ci.sh` for Linux and macOS.
5. Run `ci.bat` for Windows using the correct shell.
6. Upload artifacts named:
   - `hello-ubuntu`
   - `hello-windows`
   - `hello-macos`
7. Ensure the YAML does not duplicate `cargo build` or `cargo test` commands.

## Expected Files
- `.github/workflows/ci.yml`

## Verification
- Confirm workflow triggers are correct.
- Confirm matrix includes the required OS values.
- Confirm Linux/macOS use `ci.sh` and Windows uses `ci.bat`.
- Confirm no secrets or credentials are included.
- Confirm no direct `cargo build` or `cargo test` logic is duplicated in YAML.

## Failure Message
`create-actions failed: workflow configuration is missing required triggers, script execution, or artifact rules.`

## Idempotency
- If the workflow already exists and is valid, do not duplicate it.
- Preserve valid YAML without repeated blocks.
- Keep changes minimal and correct.
