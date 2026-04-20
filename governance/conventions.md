# Conventions

## Purpose

This document defines cross-cutting rules that apply across the full planning workflow. It does not define stage order, trigger inventory, resolver precedence, or agent contracts.

---

## Planning Laws

| ID | Rule | Prevents |
|---|---|---|
| PL-01 | Do not proceed on hidden assumptions. Make them explicit as options, evidence gaps, or decisions. | Wrong planning direction caused by silent guesses |
| PL-02 | No placeholders in planning artifacts. | Half-defined plans that look complete |
| PL-03 | Every claim that affects direction must be backed by evidence, a stated assumption, or an owner decision. | Unsupported certainty |
| PL-04 | The same fact lives in one governance document only. | Drift across duplicated rules |
| PL-05 | Failures must be reported directly. | False confidence from silent misses |
| PL-06 | Roles and names must not overlap. | Ambiguous ownership between agent, skill, requirement, and task labels |

---

## Cross-Cutting Rules

### CONV-001 — Options, Not Open-Ended Clarification

When ambiguity remains, present bounded options instead of pushing the full thinking burden outward.

**Good pattern**
- Option A: narrow scope
- Option B: broad scope
- Option C: evidence-first defer

### CONV-002 — Evidence-Labeled Statements

Every planning statement that changes priority, scope, or decision status must be labeled as one of:

- `evidence`
- `assumption`
- `decision`
- `open-question`

### CONV-003 — No Placeholders

Do not leave `TBD`, `TODO`, `later`, `추후`, or blank decision slots in planning outputs.

### CONV-004 — Single Source of Truth

Keep each governance fact in one place only:

| Fact | Document |
|---|---|
| Stage order and stage exits | `planning-workflow.md` |
| Trigger inventory | `trigger-registry.md` |
| Collision winners and routing precedence | `resolver-table.md` |
| Skill metadata | `skill-registry.md` |
| Agent Must/May/Never contracts | `agent-skill-matrix.md` |

### CONV-005 — Failure Transparency

If research, lookup, or structuring fails, say so directly and state what was attempted.

### CONV-006 — Naming Separation

Use distinct names for the following:

- problem labels
- requirement labels
- task labels
- decision labels

Do not reuse the same label across these layers unless it refers to the exact same artifact.

### CONV-007 — Self-Contained Governance

Governance documents inside this plugin must stand alone.

- Use relative plugin-local references only.
- Do not depend on outside path conventions.
- Do not reference external owners as a prerequisite for understanding the rule.

---

## Enforcement Style

| Strength | Meaning |
|---|---|
| Hard | Blocks the planning artifact from being considered complete |
| Soft | Requires rewrite or clarification |
| Audit | Checked during final governance review |

| Rule | Strength |
|---|---|
| PL-01 | Hard |
| PL-02 | Hard |
| PL-03 | Soft |
| PL-04 | Audit |
| PL-05 | Soft |
| PL-06 | Hard |

---

## Boundary Rules

- Do not restate stage sequencing here.
- Do not declare trigger phrases here.
- Do not store collision winner logic here.
- Do not redefine agent contracts here.
