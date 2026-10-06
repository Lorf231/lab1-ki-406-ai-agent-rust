---
name: github-actions
description: 'Creates the GitHub Actions workflow for the Rust project and uploads the platform-specific executable artifacts.'
---

# github-actions

## Purpose
Create the GitHub Actions workflow for the Cargo-based Rust project and ensure it runs the platform-specific CI scripts without duplicating Cargo build/test commands inside YAML.

## When to use
- When the Cargo project and CI scripts already exist and need validation in GitHub Actions.
- When the workflow must run on `ubuntu-latest`, `windows-latest`, and `macos-latest`.
- When artifacts for the built executable must be uploaded for all required platforms.

## Inputs
- project name: `hello`
- build system: `Cargo`
- required platforms: `ubuntu-latest`, `windows-latest`, `macos-latest`
- scripts: `ci.sh` and `ci.bat`

## Outputs
- `.github/workflows/ci.yml`
- executable artifacts:
  - `hello-ubuntu`
  - `hello-windows`
  - `hello-macos`

## Actions
1. Create the workflow file `.github/workflows/ci.yml`.
2. Add triggers for `push` and `pull_request` on `develop` and `master`.
3. Define a single matrix job over the three required operating systems.
4. For Linux/macOS, run:
   ```bash
   bash ci.sh
   ```
5. For Windows, run:
   ```bat
   ci.bat
   ```
6. Upload the built executable as artifacts after success.
7. Do not duplicate Cargo build/test commands inside YAML.

## Verification
- Confirm the workflow triggers are correct.
- Confirm the matrix includes all required operating systems.
- Confirm the workflow executes the correct script for each OS.
- Confirm the artifact names match the required values.
- Confirm no secrets or credentials are present.

## Success Criteria
- Workflow creation succeeds for all required platforms.
- Scripts perform the actual build/test logic.
- Artifact upload uses the expected names.
- The YAML does not contain direct `cargo build` or `cargo test` commands.

## Example Input
```text
Create the GitHub Actions workflow for the hello project.
Use ci.sh on Linux/macOS and ci.bat on Windows.
```

## Expected Result
A valid `.github/workflows/ci.yml` file is created that runs the local CI scripts across Windows, Linux, and macOS and uploads the built executables as artifacts.

## Failure Scenario
The workflow is missing a trigger, misconfigures the matrix, calls Cargo directly in YAML, or fails to upload the expected artifact names.

## Failure Handling
- Report the workflow issue clearly.
- Stop before continuing to dependent operations.
- Require a valid fix before completion.

## Idempotency
- Re-running must not duplicate YAML blocks.
- Preserve valid workflow content.
- Keep the workflow update minimal and correct.
