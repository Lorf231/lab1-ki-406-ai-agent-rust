---
name: build-and-test
description: 'Creates the library, test, and local CI scripts for the Rust hello project and validates the build.'
---

# build-and-test

## Purpose
Create and validate the Cargo build/test configuration for the Rust project. This skill adds a simple addition function, a `BasicAddition` test, and the local CI scripts required to build and test the project.

## When to use
- When the Rust project already exists and requires build/test configuration.
- When the project needs a library function and a `BasicAddition` test.
- When local CI scripts are required to validate `cargo build --release`, `cargo test`, and the final executable.

## Inputs
- project name: `hello`
- build system: `Cargo`
- test requirement: `BasicAddition`
- executable requirement: `hello`

## Outputs
- `Cargo.toml`
- `src/lib.rs`
- `tests/basic_addition.rs`
- `ci.sh`
- `ci.bat`

## Actions
1. Confirm the project exists and is valid.
2. Create or update `src/lib.rs` with a public function:
   ```rust
   pub fn add(a: i32, b: i32) -> i32 {
       a + b
   }
   ```
3. Create or update `tests/basic_addition.rs` with `BasicAddition` and assert `2 + 2 == 4`.
4. Create or update `ci.sh` to run:
   - `cargo build --release`
   - `cargo test`
   - executable validation for `target/release/hello`
5. Create or update `ci.bat` to do the equivalent Windows validation for `target\release\hello.exe`.
6. Run the required verification commands and fail with a non-zero exit status if any step fails.

## Verification
- Confirm `cargo build --release` succeeds.
- Confirm `cargo test` succeeds.
- Confirm the executable path is correct for the host OS.
- Confirm `BasicAddition` passes the expected arithmetic check.
- Confirm the local scripts exit non-zero on failure.

## Success Criteria
- `src/lib.rs` contains the addition function.
- `tests/basic_addition.rs` contains `BasicAddition` and passes.
- `ci.sh` and `ci.bat` run the build/test flow and validate the executable.
- The release build succeeds and the executable is present.

## Example Input
```text
Create the Cargo library function, unit test, and CI scripts for the hello project.
```

## Expected Result
The project builds with `cargo build --release`, tests with `cargo test`, and validates the correct executable output path on both Unix and Windows systems.

## Failure Scenario
The function is missing, the test fails, or the script does not check the correct executable path or exit status.

## Failure Handling
- Report the failing step.
- Stop before continuing to dependent stages.
- Require a valid fix before completion.

## Idempotency
- Re-running must not duplicate build steps or scripts.
- Preserve valid file content and update only the required sections.
- Re-running must not break a valid project.
