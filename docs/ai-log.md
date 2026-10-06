---
title: AI Log
description: 'Template for recording prompts, results, errors, corrections, and student decisions.'
---

# AI Log Template

## Template

- Date / Stage
- Prompt / Request
- Important AI Response
- Generated or Modified Files
- Verification
- Result
- Error
- Error Cause
- Correction
- Student Decision

## Controlled error and its fix

### Real example

- Date / Stage: 2026-10-06 / Definition correction
- Prompt / Request: Review the custom agent and skills for incorrect restrictions that prevented real Rust project generation.
- Important AI Response: The original definitions incorrectly forbade Cargo.toml, src/, tests/, scripts, and workflow generation, and described the commands as future planning instead of real actions. This prevented the real project creation flow from being valid in a feature branch.
- Generated or Modified Files: `.github/agents/build-engineer.agent.md`, `.github/skills/project-scaffold/SKILL.md`, `.github/skills/build-and-test/SKILL.md`, `.github/skills/github-actions/SKILL.md`, `.github/prompts/create-project.prompt.md`, `.github/prompts/create-build.prompt.md`, `.github/prompts/create-actions.prompt.md`, `.github/prompts/check.prompt.md`, `.github/prompts/init.prompt.md`, `docs/architecture.md`, `docs/usage.md`, `docs/report-checklist.md`
- Verification: Definitions were checked for forbidden wording, prompt frontmatter was validated, and the workflow model was confirmed to preserve `develop` as the definition-only branch while allowing real execution in a feature branch.
- Result: PASS
- Error: The initial definitions wrongly prohibited creation of Cargo.toml, src/, tests/, ci scripts, and workflow files, and they described commands as future planning rather than real execution.
- Error Cause: The repository was originally modeled as a future-only planning layer, which conflicted with the requirement that the same agent/skill/prompt definitions are inherited by a feature branch and then run for actual project creation.
- Correction: Removed the false restrictions; updated the project-scaffold, build-and-test, github-actions, check, and init definitions; added real skill links; clarified that `develop` stores definitions only, while feature branch execution creates the project and CI assets.
- Student Decision: Keep the corrected definitions in `develop` and execute the actual creation flow only in a feature branch when required.

## Notes
This log is intentionally kept simple and traceable. Each stage should record a real result, a real verification step, and, if needed, a clear correction path.
