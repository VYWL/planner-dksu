# Agent-Skill Matrix

## Purpose

This document defines Must, May, and Never contracts for the planning agents and skills in this plugin.

---

## Summary Matrix

| Agent | Role | Must | May | Never |
|---|---|---|---|---|
| `dksu` | Planning orchestrator and structuring owner | `deep-dive`; `scenario-test` for validation design closure; `no-more-ambiguity` at stage gates; delegate to `critical-dksu` at Stage 5 for Breadth-Keeper review | `persona-scenario`; `reference-research`; delegate to `researcher-dksu` or `designer-dksu` when specialist depth is needed | Owning specialist-only research collection by default; owning detailed design-spec work by default |
| `researcher-dksu` | Evidence and benchmark specialist | `reference-research` | `deep-dive` when evidence needs causal interpretation | `persona-scenario`; `scenario-test`; `no-more-ambiguity`; final task decomposition ownership |
| `designer-dksu` | Optional persona, flow, and planning design specialist | `persona-scenario` | consume a research packet from `researcher-dksu`; `deep-dive` for framing support | `reference-research` as local ownership; `scenario-test`; `no-more-ambiguity`; final decision ownership |
| `critical-dksu` | Planning critic and Breadth-Keeper | Check four areas only: Critical Gaps, Unverified Assumptions, 5W1H Gaps, AI-Slop; return OKAY / CONCERN / BLOCK verdict with max 3 issues | Use extended thinking budget for deep blind-spot analysis | Final decision ownership; direct plan modification; implementation orchestration; technical architecture decisions; calling other agents |

---

## Per-Agent Detail

### `dksu`

**Role**: Owns the planning packet, stage transitions, and final structure.

**Must**
- Use `deep-dive` to sharpen the problem and assumptions.
- Use `scenario-test` before declaring the plan validation-ready.
- Run `no-more-ambiguity` at each stage gate (Stage 1, 2, 4, 6) to enforce clarity thresholds.
- Delegate to `critical-dksu` at Stage 5 for Breadth-Keeper review before closing the task plan.

**May**
- Use `persona-scenario` when user behavior materially changes the plan.
- Use `reference-research` directly for light evidence gathering.
- Delegate to `researcher-dksu` for deep evidence work.
- Delegate to `designer-dksu` only for explicit visual/UX planning or structure-heavy planning design that clearly needs it.

**Never**
- Default to specialist work when a bounded specialist role exists.
- Collapse research, design, and validation ownership into one undifferentiated planning step.

### `researcher-dksu`

**Role**: Produces evidence-backed findings and planning comparisons.

**Must**
- Load or operate through `reference-research` logic on every research invocation.

**May**
- Use `deep-dive` to interpret why a pattern or benchmark matters.

**Never**
- Own persona or scenario design.
- Own validation design or coverage definition.
- Run `no-more-ambiguity` gates; that is `dksu`'s responsibility.
- Rewrite the final planning packet as if it were the orchestrator.

### `designer-dksu`

**Role**: Optional specialist that translates planning intent into persona, journey, flow, and structure outputs.

**Activation**
- Opt-in only.
- Use only when explicitly requested or when visual/UX planning is clearly needed.

**Must**
- Use `persona-scenario` when acting as the planning design specialist.

**May**
- Consume a research packet from `researcher-dksu` before shaping flows.
- Use `deep-dive` to tighten framing before producing journey or structure artifacts.

**Never**
- Become the primary evidence collector.
- Own validation design.
- Run `no-more-ambiguity` gates.
- Override final decision ownership from `dksu`.

### `critical-dksu`

**Role**: Planning critic and Breadth-Keeper. Invoked by `dksu` at Stage 5 only.

**Activation**
- Invoked by `dksu` at Stage 5 before closing the task plan.
- Not self-activating; requires explicit delegation from `dksu`.

**Must**
- Check exactly four areas: Critical Gaps, Unverified Assumptions, 5W1H Gaps, AI-Slop patterns.
- Return a verdict of OKAY, CONCERN, or BLOCK.
- Limit issues to a maximum of 3, prioritized by severity.
- Make each issue concrete, actionable, and labeled with Blocking: YES / NO.

**May**
- Use extended thinking budget (32,000 tokens) for deep blind-spot analysis before issuing a verdict.

**Never**
- Own final planning decisions; those belong to `dksu` and the user.
- Modify the plan directly.
- Orchestrate implementation or task execution.
- Make technical architecture decisions.
- Call other agents or skills.
- List more than 3 issues even when more exist.
- Issue vague findings ("something seems missing").

---

## Skill Ownership Summary

| Skill | Primary owner | Secondary users | Excluded agents |
|---|---|---|---|
| `deep-dive` | `dksu` | `researcher-dksu` (causal interpretation); `designer-dksu` (framing support) | `critical-dksu` |
| `reference-research` | `researcher-dksu` | `dksu` (light use only) | `designer-dksu`; `critical-dksu` |
| `persona-scenario` | `designer-dksu` | `dksu` (when user behavior changes plan) | `researcher-dksu`; `critical-dksu` |
| `scenario-test` | `dksu` | — | `researcher-dksu`; `designer-dksu`; `critical-dksu` |
| `no-more-ambiguity` | `dksu` | — | `researcher-dksu`; `designer-dksu`; `critical-dksu` |

---

## Boundary Rules

- `dksu` owns orchestration, stage gates, and final structure.
- `researcher-dksu` owns evidence work.
- `designer-dksu` owns persona and flow shaping only when opted in.
- `critical-dksu` owns blind-spot detection at Stage 5 only; it does not own decisions or plan modifications.
- When two roles could act, prefer the narrower specialist role.
- `no-more-ambiguity` is a gate skill for `dksu` only; specialist agents do not run ambiguity gates.
- `critical-dksu` is not Metis or Momus; it is a purpose-built planning critic with a narrower scope and a hard 3-issue cap.
