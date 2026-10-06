---
name: project-scaffold
description: 'Creates the minimal Cargo-based Rust hello project and validates that it runs.'
---

# project-scaffold

## Purpose
Create the minimal Rust hello-world project using Cargo and ensure it can run successfully with `cargo run`. This skill is responsible for creating the project structure, the package manifest, a short README, and the repository ignore rules required for a valid Cargo project.

## When to use
- When a new Rust project must be created in the current repository.
- When the repository has already passed repository initialization and is ready for Cargo project creation.
- When the package name is `hello`, the language is Rust, and the build system is Cargo.

## Inputs
- project name: `hello`
- language: `Rust`
- build system: `Cargo`
- repository must be valid and ready for project creation

## Outputs
- `Cargo.toml`
- `Cargo.lock` after `cargo run` completes successfully
- `src/main.rs`
- `README.md`
- `.gitignore`
- required project directories

## Actions
1. Check whether the project already exists and is valid.
2. If missing, create or update `Cargo.toml` with the package metadata for the `hello` binary.
3. Create the `src` directory and write `src/main.rs` with the output `Hello, World!`.
4. Create or update `README.md` with a short project description and the commands to run it.
5. Ensure `.gitignore` exists and at least ignores `target/`.
6. Do not ignore `Cargo.lock`.
7. Validate the project by running `cargo run`.
8. If the project already exists and is valid, do not overwrite it unnecessarily.

## Verification
- Confirm `Cargo.toml` exists.
- Confirm `src/main.rs` exists.
- Confirm `README.md` exists and includes a short description and run commands.
- Confirm `.gitignore` exists and includes `target/`.
- Confirm `Cargo.lock` is created after `cargo run` completes successfully.
- Confirm `cargo run` prints `Hello, World!`.

## Success Criteria
- The minimal Rust project exists and is valid.
- `Cargo.toml`, `src/main.rs`, `README.md`, `.gitignore`, and the project directory structure exist.
- `Cargo.lock` exists after running `cargo run`.
- `target/` is ignored but `Cargo.lock` is not ignored.
- `cargo run` works successfully.

## Example Input
```text
Create a Rust hello project with Cargo.
Project name: hello.
```

## Expected Result
A valid Cargo project is created with a working `hello` binary, a `main` function that prints `Hello, World!`, a short `README.md`, a safe `.gitignore` that ignores `target/`, and a `Cargo.lock` generated after the successful `cargo run` validation.

## Failure Scenario
The project cannot be created, `Cargo.toml` is invalid, the project structure is missing, the README is absent, `.gitignore` is missing `target/`, or `cargo run` fails.

## Failure Handling
- Report the failure clearly.
- Stop before continuing to dependent stages.
- Require a valid fix before completion.

## Idempotency
- If the project already exists and is valid, do not recreate it.
- Preserve valid files and update only when required.
- Re-running the skill must not break the project.
- Keep `.gitignore` valid and keep `Cargo.lock` tracked.
