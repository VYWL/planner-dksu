# Agent-Skill Matrix

## Purpose

This document defines Must, May, and Never contracts for the three planning agents in this plugin.

---

## Summary Matrix

| Agent | Role | Must | May | Never |
|---|---|---|---|---|
| `dksu` | Planning orchestrator and structuring owner | `deep-dive`; `scenario-test` for validation design closure | `persona-scenario`; `reference-research`; delegate to `researcher-dksu` or `designer-dksu` when specialist depth is needed | Owning specialist-only research collection by default; owning detailed design-spec work by default |
| `researcher-dksu` | Evidence and benchmark specialist | `reference-research` | `deep-dive` when evidence needs causal interpretation | `persona-scenario`; `scenario-test`; final task decomposition ownership |
| `designer-dksu` | Optional persona, flow, and planning design specialist | `persona-scenario` | consume a research packet from `researcher-dksu`; `deep-dive` for framing support | `reference-research` as local ownership; `scenario-test`; final decision ownership |

---

## Per-Agent Detail

### `dksu`

**Role**: Owns the planning packet, stage transitions, and final structure.

**Must**
- Use `deep-dive` to sharpen the problem and assumptions.
- Use `scenario-test` before declaring the plan validation-ready.

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
- Override final decision ownership from `dksu`.

---

## Boundary Rules

- `dksu` owns orchestration and final structure.
- `researcher-dksu` owns evidence work.
- `designer-dksu` owns persona and flow shaping only when opted in.
- When two roles could act, prefer the narrower specialist role.
