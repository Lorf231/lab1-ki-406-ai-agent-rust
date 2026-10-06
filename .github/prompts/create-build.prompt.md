---
agent: build-engineer
description: 'Create the Cargo build and test configuration for the Rust project using the build-and-test skill.'
---

# create-build

Use skill: [build-and-test](../skills/build-and-test/SKILL.md)

## Prerequisites
- The Rust project has already been created by `create-project` or equivalent process.
- The repository is in a valid state and the project exists.
- The agent is allowed to create or update the build/test files for the project.

## Actions
1. Use the `build-and-test` skill to create or update the Cargo build configuration.
2. Create or update `src/lib.rs` with a simple addition function.
3. Create or update `tests/basic_addition.rs` with a `BasicAddition` test that checks `2 + 2 == 4`.
4. Create or update `ci.sh` to run:
   - `cargo build --release`
   - `cargo test`
   - executable validation for the built binary
5. Create or update `ci.bat` to perform the equivalent Windows validation.
6. Run the build/test verification commands after the files are created.

## Expected Files
- `Cargo.toml`
- `src/lib.rs`
- `tests/basic_addition.rs`
- `ci.sh`
- `ci.bat`

## Verification
- Confirm `cargo build --release` succeeds.
- Confirm `cargo test` succeeds.
- Confirm the executable exists after release build.
- Confirm `BasicAddition` is present and passes.
- Confirm `ci.sh` and `ci.bat` fail with a non-zero status if a step fails.

## Failure Message
`create-build failed: the build and validation flow is incomplete or inconsistent.`

## Idempotency
- Re-running must not duplicate configuration or scripts.
- If files already exist and are valid, update them minimally.
- Keep the valid project intact.
