# Planning Workflow

## Purpose

This plugin runs a six-stage planning loop. Each stage produces a concrete artifact that sharpens problem understanding, user intent, evidence quality, requirement shape, validation readiness, or final planning decisions.

---

## Stage Map

| Stage | Name | Goal | Primary outputs | Default owner |
|---|---|---|---|---|
| 1 | Problem Framing & Analysis | Define the problem, boundaries, assumptions, and current-state map. | problem statement, scope map, assumptions, unknowns | `dksu` |
| 2 | Clarification & Persona Design | Resolve ambiguity with explicit options and model the target user. | clarification decisions, persona, scenario outline | `dksu`, `designer-dksu` |
| 3 | Reference Research | Gather outside or internal reference signals with evidence and comparison. | findings, comparison notes, evidence-backed recommendations | `researcher-dksu` |
| 4 | Requirement Structuring | Convert insights into structured requirements and constraints. | requirement spec, acceptance boundaries, dependency notes | `dksu` |
| 5 | Task Plan & Validation Design | Break work into verifiable tasks and define completion checks. | task plan, validation cases, coverage matrix | `dksu` |
| 6 | Decision Log | Freeze the planning outcome and record why each decision was taken. | decision log, open questions, deferred items with owner | `dksu` |

---

## Stage Details

### Stage 1 — Problem Framing & Analysis

- Start here for every non-trivial task.
- Capture the current problem in plain language before proposing solutions.
- Record assumptions as explicit hypotheses, not hidden facts.
- Produce a scope map that separates in-scope, adjacent, and out-of-scope concerns.

**Exit checks**
- Problem statement is concrete.
- Scope boundaries are visible.
- Unknowns are listed.

### Stage 2 — Clarification & Persona Design

- Resolve ambiguity by presenting bounded options.
- Model target users only when user behavior changes planning quality.
- Convert raw requests into user goals, motivations, and scenario paths.

**Exit checks**
- Ambiguous points are reduced to explicit choices.
- Persona and scenario outputs do not duplicate requirement text.
- User goals are separated from solution shape.

### Stage 3 — Reference Research

- Use when planning needs comparative evidence, precedent, or benchmark support.
- Prioritize evidence quality over link volume.
- Summaries must explain what the reference means for the current plan.

**Exit checks**
- Findings include sources or evidence anchors.
- Trade-offs are compared, not merely listed.
- Recommendations are traceable to evidence.

### Stage 4 — Requirement Structuring

- Turn the framed problem and research into stable requirements.
- Separate user outcomes, constraints, and exclusions.
- Keep requirement names distinct from task names and decision names.

**Exit checks**
- Each requirement is testable in principle.
- Constraints are explicit.
- Out-of-scope items are documented once.

### Stage 5 — Task Plan & Validation Design

- Break the approved requirement set into planning tasks.
- Attach validation logic before handoff.
- Cover happy path, alternate path, and failure path where relevant.

**Exit checks**
- Task list is actionable.
- Validation cases cover the planned surface.
- Coverage matrix has no empty ownership gaps.

### Stage 6 — Decision Log

- Record final planning decisions and their rationale.
- Separate confirmed decisions from open questions.
- Preserve enough context for a later executor to continue without reconstructing the plan.

**Exit checks**
- Major choices have rationale.
- Open questions have an owner or next action.
- The final plan can be handed off as a self-contained packet.

---

## Stage-to-Skill Fit

| Stage | Primary skill or agent |
|---|---|
| 1 | `deep-dive`, `dksu` |
| 2 | `persona-scenario`, `designer-dksu`, `dksu` |
| 3 | `reference-research`, `researcher-dksu` |
| 4 | `dksu` |
| 5 | `scenario-test`, `dksu` |
| 6 | `dksu` |

---

## Boundary Rules

- This workflow is planning-only.
- Stage order lives here; cross-cutting behavior rules live in `conventions.md`.
- Trigger ownership lives in `trigger-registry.md`.
- Collision handling lives in `resolver-table.md`.
- Skill metadata lives in `skill-registry.md`.
- Agent responsibility boundaries live in `agent-skill-matrix.md`.
