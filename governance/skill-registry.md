# Skill Registry

## Purpose

This document stores the plugin-local planning skill inventory for this bundle: purpose, status, workflow fit, and boundary notes.

---

## Registry Schema

| Field | Description |
|---|---|
| `name` | Skill directory name |
| `scope` | Always `plugin`; this bundle is plugin-local only |
| `owner` | Maintainer label within this bundle |
| `status` | `active`, `experimental`, or `deprecated` |
| `purpose` | One-sentence problem the skill solves |
| `workflow_stage` | One or more planning stages |
| `trigger_source` | Where the runtime-discoverable text is declared |
| `boundary_note` | What the skill must not absorb |

---

## Registry

| name | scope | owner | status | purpose | workflow_stage | trigger_source | boundary_note |
|---|---|---|---|---|---|---|---|
| `deep-dive` | plugin | planning-kit | active | Perform root-cause framing and structured why-analysis for planning problems. | 1 | skill-description + trigger-registry | Must not become general research collection. |
| `reference-research` | plugin | planning-kit | active | Collect and synthesize evidence, precedents, and benchmark signals for planning decisions. | 3 | skill-description + trigger-registry | Must not own persona design or validation design. |
| `persona-scenario` | plugin | planning-kit | active | Define target personas, journeys, and scenario paths that shape planning outputs. | 2 | skill-description + trigger-registry | Must not replace requirement structuring or task decomposition. |
| `scenario-test` | plugin | planning-kit | active | Design validation cases and coverage logic for the planned work. | 5 | skill-description + trigger-registry | Must not take over root-cause analysis or reference gathering. |

---

## Lifecycle Rules

1. New planning skills start as `experimental` unless they are part of the core bundle.
2. A deprecated skill must also have its trigger rows deprecated.
3. Boundary changes require checking `agent-skill-matrix.md` and `trigger-registry.md` together.

---

## Boundary Rules

- This registry contains skills only.
- Agent contracts belong in `agent-skill-matrix.md`.
- Trigger text belongs in `trigger-registry.md`.
