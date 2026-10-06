---
agent: build-engineer
description: 'Execute the complete Rust project setup workflow in the current repository.'
---

EXECUTE THIS WORKFLOW NOW.
Do not only inspect, summarize, or validate the prompt definitions.
Perform the project creation workflow in the current repository.

The following references are authoritative specifications. They are not commands
that VS Code should automatically invoke:

- [git-init](./git-init.prompt.md)
- [create-project](./create-project.prompt.md)
- [create-build](./create-build.prompt.md)
- [create-actions](./create-actions.prompt.md)
- [check](./check.prompt.md)

==================================================
STAGE 1 - git-init
==================================================

Execute now:

- verify that the current directory is a Git repository;
- show the current branch;
- show `git status`;
- inspect `.gitignore`;
- ensure that `target/` is ignored;
- do not commit, push, merge, or rebase.

If this stage fails, STOP.

==================================================
STAGE 2 - create-project
==================================================

Use the requirements in:

- [create-project](./create-project.prompt.md)
- [project-scaffold](../skills/project-scaffold/SKILL.md)

Actually create:

- `Cargo.toml`
- `src/main.rs`
- `README.md` if it does not exist, or safely update it if required content is
	missing;
- `.gitignore` if it does not exist, or safely update it if required rules are
	missing.

Project requirements:

- package name: `hello`
- language: Rust
- build system: Cargo
- executable name: `hello`

`src/main.rs` must print:

```text
Hello, World!
```

`README.md` must contain at least:

- a short description of the Rust Hello World project;
- `cargo run`;
- `cargo build --release`;
- `cargo test`.

`.gitignore` must contain at least:

- `target/`.

Do not overwrite an existing `README.md` or `.gitignore` completely when it
already contains valid documentation or rules. Update each file idempotently,
preserving its existing valid content and adding only missing requirements.

After creating the files, actually run `cargo run`.

Verify that `Cargo.toml`, `src/main.rs`, `README.md`, and `.gitignore` exist,
`cargo run` succeeds, `Cargo.lock` exists, and `target/` is ignored. If this
stage fails, STOP.

==================================================
STAGE 3 - create-build
==================================================

Use:

- [create-build](./create-build.prompt.md)
- [build-and-test](../skills/build-and-test/SKILL.md)

Actually create:

- `src/lib.rs`
- `tests/basic_addition.rs`
- `ci.sh`
- `ci.bat`

In `src/lib.rs`, create a public `addition` function.

In `tests/basic_addition.rs`, create a test named `BasicAddition` that verifies
`2 + 2 == 4`. If Rust warns about `non_snake_case`, add a local `allow` only
for this test name.

`ci.sh` must:

1. run `cargo build --release`;
2. run `cargo test`;
3. check `target/release/hello`;
4. exit with a non-zero code on failure.

`ci.bat` must provide the equivalent Windows workflow and check
`target\\release\\hello.exe`.

After creating the files, actually run `cargo build --release` and `cargo test`.
Verify that the build and tests pass and `target/release/hello` exists.
If this stage fails, STOP.

==================================================
STAGE 4 - create-actions
==================================================

Use:

- [create-actions](./create-actions.prompt.md)
- [github-actions](../skills/github-actions/SKILL.md)

Actually create `.github/workflows/ci.yml`.

Requirements:

- triggers: `push` and `pull_request` for `develop` and `master`;
- one matrix job using `ubuntu-latest`, `windows-latest`, and `macos-latest`;
- Linux and macOS run `bash ci.sh`;
- Windows runs `ci.bat`;
- the workflow does not directly contain `cargo build` or `cargo test`;
- build and test logic exists only in `ci.sh` and `ci.bat`;
- after a successful build, upload executable artifacts named
	`hello-ubuntu`, `hello-windows`, and `hello-macos`;
- validate the YAML structure.

If this stage fails, STOP.

==================================================
STAGE 5 - check
==================================================

Use [check](./check.prompt.md) as the specification and perform the final
fact-based verification.

Check all of the following:

- agent manifest exists;
- all three skills exist;
- all required commands exist;
- `Cargo.toml` exists;
- `Cargo.lock` exists;
- `src/main.rs` exists;
- `src/lib.rs` exists;
- `tests/basic_addition.rs` exists;
- `BasicAddition` exists;
- `ci.sh` exists;
- `ci.bat` exists;
- `.github/workflows/ci.yml` exists;
- `ubuntu-latest` exists;
- `windows-latest` exists;
- `macos-latest` exists;
- the workflow runs the scripts;
- the workflow does not directly run `cargo build` or `cargo test`;
- `cargo build --release` succeeds;
- `cargo test` succeeds;
- the `hello` executable exists;
- `target/` is ignored;
- `target/` is not tracked by Git;
- no obvious secrets are present.

Report `PASS` or `FAIL` for every check. Report `Overall SUCCESS` only when
all mandatory checks pass. Otherwise report `Overall FAILURE`.

==================================================
ORCHESTRATOR RULES
==================================================

- execute stages strictly in order;
- do not proceed to the next stage after a failure;
- do not limit the work to analyzing definitions;
- do not provide a plan-only response;
- do not finish without actually creating the files;
- do not commit;
- do not push;
- do not merge or rebase;
- make re-runs idempotent and preserve valid existing files.

At the end, show:

1. completed stages;
2. created or changed files;
3. `cargo run`, build, and test results;
4. the final `PASS`/`FAIL` summary.
