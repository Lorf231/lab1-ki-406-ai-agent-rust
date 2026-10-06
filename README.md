---
title: Rust Build Engineer Agent Infrastructure
description: 'GitHub Copilot agent infrastructure for a future Cargo-based Rust project.'
---

# Rust Hello World Project

Variant: 4

- Language: Rust
- Build system: Cargo
- Testing: `cargo test`

## Description
This is a small Rust Hello World project built and tested with Cargo. The repository also contains the GitHub Copilot custom agent infrastructure used to automate its setup and CI configuration.

## Commands
```text
cargo run
cargo build --release
cargo test
```

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
