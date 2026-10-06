---
agent: build-engineer
description: 'Perform a strict read-only verification of the repository, Cargo project, and CI definitions.'
---

# check

This command is read-only with respect to tracked source and configuration files. It must not edit tracked project files or auto-fix issues.

## Forbidden actions
- Edit tracked project files
- Auto-correct errors
- Conceal failure
- Claim success before validation passes

## Allowed actions
- Run `git status`
- Run `cargo build --release`
- Run `cargo test`
- Run `git check-ignore target/`
- Run `git ls-files -- 'target/**'`
- Check file existence and repository state using shell/file-system tools

The build and test commands may create ignored build artifacts under `target/` as a normal result of validation. This is allowed because those artifacts are not tracked source/configuration files.

## Mandatory checks
For each validation, print `PASS` or `FAIL`.

1. Agent manifest exists and is valid.
2. The manifest defines the `build-engineer` role correctly.
3. The role includes restrictions and safety rules.
4. The role includes completion criteria and workflow steps.
5. All 3 skills exist: `project-scaffold`, `build-and-test`, and `github-actions`.
6. Each skill includes all required sections: Purpose, When to use, Inputs, Outputs, Actions, Verification, Success Criteria, Example Input, Expected Result, Failure Scenario, Failure Handling, Idempotency.
7. All commands exist: `git-init`, `create-project`, `create-build`, `create-actions`, `check`, and `init`.
8. The orchestrator order is correct: `git-init` → `create-project` → `create-build` → `create-actions` → `check`.
9. `Cargo.toml` exists.
10. `Cargo.lock` exists.
11. `src/main.rs` exists.
12. `src/lib.rs` exists.
13. `tests/basic_addition.rs` exists.
14. `BasicAddition` exists in the test file.
15. `ci.sh` exists.
16. `ci.bat` exists.
17. `.github/workflows/ci.yml` exists.
18. The workflow matrix includes `ubuntu-latest`.
19. The workflow matrix includes `windows-latest`.
20. The workflow matrix includes `macos-latest`.
21. The workflow triggers on push and pull_request for `develop` and `master`.
22. The workflow runs `bash ci.sh` on Linux/macOS.
23. The workflow runs `ci.bat` on Windows.
24. The YAML does not directly run `cargo build` or `cargo test`.
25. The release build command succeeds.
26. The test command succeeds.
27. The final executable `hello` exists after build.
28. `git status` is reviewed.
29. `git check-ignore target/` confirms `target/` is ignored.
30. `git ls-files -- 'target/**'` returns no tracked files under `target/`.
31. Build/test do not modify tracked source or configuration files.
32. No obvious secrets or credentials are present in the repository or workflow.

## Output requirement
- For every check above, output `PASS` or `FAIL`.
- `Overall SUCCESS` is allowed only if all mandatory checks are `PASS`.
- If any item is `FAIL`, the result must be `Overall FAILURE` and the workflow must stop.

## Failure message
`check failed: one or more required validations are not satisfied.`

## Idempotency
- Re-running the check must not modify repository files.
- Re-running must return the same PASS/FAIL evaluation for valid content.
- The check must remain read-only and non-destructive regarding tracked files.
