---
title: Rust Build Engineer Agent Infrastructure
description: 'GitHub Copilot agent infrastructure for a future Cargo-based Rust project.'
---

# Rust Build Engineer Agent Infrastructure

Variant: 4

- Language: Rust
- Build system: Cargo
- Testing: `cargo test`

## Description
This repository contains the GitHub Copilot custom agent infrastructure for a future Rust project. The custom agent is named `build-engineer` and is intended to automate project generation, build/test validation, and CI configuration for a Cargo-based Rust hello project.

## Future project planned
The eventual project will be a simple Rust hello-world application compiled with Cargo and validated on Windows, Linux, and macOS.

## How to run the agent
Open GitHub Copilot Chat in VS Code and select the custom agent called `build-engineer`.

Then run the prompts in order:

1. `git-init`
2. `create-project`
3. `create-build`
4. `create-actions`
5. `check`

The orchestrator prompt is `init`.

## Documentation
- [docs/architecture.md](docs/architecture.md)
- [docs/usage.md](docs/usage.md)
- [docs/ai-log.md](docs/ai-log.md)
- [docs/report-checklist.md](docs/report-checklist.md)

## Student info
- Student: <ПІП>
- Group: <ГРУПА>
