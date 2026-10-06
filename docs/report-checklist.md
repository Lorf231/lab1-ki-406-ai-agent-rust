---
title: Report Checklist
description: 'Final checklist for the Rust build-engineer agent infrastructure, validation flow, and project reporting.'
---

# Report Checklist

## 1. Title page, topic, goal, variant
- [ ] Topic: GitHub Copilot custom agent for Rust project generation
- [ ] Goal: automate safe project creation, validation, and GitHub Actions workflow generation
- [ ] Variant: 4

## 2. Task description for the AI agent
- [ ] The repository contains a build-engineer custom agent for Cargo-based Rust work.
- [ ] The agent is configured to create or update project files only through the approved command flow.
- [ ] Safety rules and verification requirements are documented.

## 3. Interaction diagram: manifest, skills, commands, orchestrator
- [ ] Agent manifest exists and describes the role and workflow.
- [ ] Three skills exist and are documented.
- [ ] Prompt commands exist and are mapped to the correct skill.
- [ ] `init` orchestrates `git-init -> create-project -> create-build -> create-actions -> check`.

## 4. Agent manifest listing
- [ ] [../.github/agents/build-engineer.agent.md](../.github/agents/build-engineer.agent.md)
- [ ] Includes role, purpose, scope, workflow, safety rules, failure handling, completion criteria, idempotency.

## 5. Skills listing
- [ ] [../.github/skills/project-scaffold/SKILL.md](../.github/skills/project-scaffold/SKILL.md)
- [ ] [../.github/skills/build-and-test/SKILL.md](../.github/skills/build-and-test/SKILL.md)
- [ ] [../.github/skills/github-actions/SKILL.md](../.github/skills/github-actions/SKILL.md)

## 6. Commands listing
- [ ] [../.github/prompts/git-init.prompt.md](../.github/prompts/git-init.prompt.md)
- [ ] [../.github/prompts/create-project.prompt.md](../.github/prompts/create-project.prompt.md)
- [ ] [../.github/prompts/create-build.prompt.md](../.github/prompts/create-build.prompt.md)
- [ ] [../.github/prompts/create-actions.prompt.md](../.github/prompts/create-actions.prompt.md)
- [ ] [../.github/prompts/check.prompt.md](../.github/prompts/check.prompt.md)
- [ ] [../.github/prompts/init.prompt.md](../.github/prompts/init.prompt.md)

## 7. Project structure and key files
- [ ] `Cargo.toml` is part of the future project structure and is created only after the command flow is invoked in the target branch.
- [ ] `src/main.rs` is created by the project-scaffold skill.
- [ ] `src/lib.rs` is created by the build-and-test skill.
- [ ] `tests/basic_addition.rs` contains the `BasicAddition` test.
- [ ] GitHub Actions workflow exists in `.github/workflows/ci.yml` when the feature branch creates the project.
- [ ] `ci.sh` and `ci.bat` execute the project build/test logic and validate the executable.

## 8. AI interaction log with at least one real error and fix
- [ ] [ai-log.md](ai-log.md) includes the template and at least one real recorded error and correction.
- [ ] There is evidence of a real failure and the applied fix.

## 9. Local build and test results
- [ ] Local build command is defined as `cargo build --release`.
- [ ] Local test command is defined as `cargo test`.
- [ ] Build/test verification is documented and run only in the target feature branch after project creation.

## 10. GitHub Actions results
- [ ] Ubuntu workflow run is defined for Linux.
- [ ] Windows workflow run is defined for Windows runner.
- [ ] macOS workflow run is defined for macOS runner.
- [ ] Executables are uploaded as `hello-ubuntu`, `hello-windows`, and `hello-macos`.

## 11. Pull request and video references
- [ ] Pull request title: `lab1/finish`
- [ ] Video link is recorded.
- [ ] GitHub and Copilot screenshots are included.

## 12. Conclusion
- [ ] The agent automates the creation and validation of a Cargo-based Rust project safely.
- [ ] The custom agent restricts destructive actions and avoids false success after failed verification.
- [ ] The checks prevent the wrong project state, invalid workflow, or hidden failure from completing the task.

## Screenshots / artifacts
- [ ] Screenshots are attached or referenced.
- [ ] Generated artifacts are recorded.
- [ ] Validation logs are attached or referenced.

## Additional notes
This checklist is intended for the final reporting stage after the actual Rust project is generated and validated in the feature branch. In `develop`, only the agent definitions and validation infrastructure are kept.
