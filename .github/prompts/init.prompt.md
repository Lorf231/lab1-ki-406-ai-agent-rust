---
agent: build-engineer
description: 'Run the project setup workflow in the correct order and stop on critical failure.'
---

# init

This is the orchestrator for the GitHub Copilot custom agent workflow.

## Prompt references
This orchestrator must execute the instructions from each referenced prompt in the exact sequence below:

- [git-init](./git-init.prompt.md)
- [create-project](./create-project.prompt.md)
- [create-build](./create-build.prompt.md)
- [create-actions](./create-actions.prompt.md)
- [check](./check.prompt.md)

## Execution order
1. [git-init](./git-init.prompt.md)
2. [create-project](./create-project.prompt.md)
3. [create-build](./create-build.prompt.md)
4. [create-actions](./create-actions.prompt.md)
5. [check](./check.prompt.md)

## Mandatory rules
- Validate the result of each stage before moving to the next stage.
- Stop immediately when a critical failure occurs.
- Do not continue to dependent stages if the current stage failed.
- Show the failed stage clearly.
- Do not announce `SUCCESS` after a failed `check`.
- Re-running the orchestrator must not break a valid repository.

## Failure behavior
- If `git-init` fails, stop execution.
- If `create-project` fails, stop execution.
- If `create-build` fails, stop execution.
- If `create-actions` fails, stop execution.
- If `check` fails, report `Overall FAILURE` and stop.

## Idempotency
- Re-running the orchestrator must not duplicate configuration or instructions.
- Re-running must preserve valid existing files.
- Re-running must leave the repository in a safe, valid state.

## Completion criteria
- `git-init` passes.
- `create-project` passes.
- `create-build` passes.
- `create-actions` passes.
- `check` passes.
- Only then is the workflow considered complete.
