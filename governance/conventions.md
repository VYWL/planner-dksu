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
| PL-07 | Stage 6 cannot close unless the Final Ambiguity Score is ≤ 0.2 and all five dimension floors pass. | Handing off a plan that carries unresolved ambiguity into implementation |

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

### CONV-008 — Ambiguity Gate (PL-07 Enforcement)

Stage 6 carries a mandatory readiness gate before the plan can be handed off. This is a planning readiness check, not a code or build gate.

**Verification method**: run the `no-more-ambiguity` skill. Score all five clarity dimensions and compute the Final Ambiguity Score using the formula `1 - Σ(clarity_i × weight_i)`.

**Pass conditions** (both must hold):

1. Final Ambiguity Score ≤ 0.2
2. No dimension falls below its floor threshold (Goal 0.75, Constraint 0.65, Success Criteria 0.70, Context 0.60, Scope 0.65)

**Failure behavior**: if either condition fails, Stage 6 does not close. Return to the appropriate earlier stage:

- Goal or Context floor failure → return to Stage 1 (Problem Framing)
- Scope floor failure → return to Stage 2 (Clarification)
- Constraint or Success Criteria floor failure → return to Stage 4 (Requirement Structuring)
- Overall score too high with all floors passing → address the weakest dimensions before re-scoring

**Score recording**: the Ambiguity Score Report must be recorded in the Stage 6 planning artifact before the gate is considered evaluated.

**User override**: if the gate fails but the user explicitly says "진행해" or an equivalent override signal, continue with a warning. Record the unresolved ambiguity in the decision log under "Known Risks at Handoff". Do not silently proceed; the override must be acknowledged and logged.

### CONV-009 — Planning Artifact Paths

Planning session artifacts are stored under `.dksu/` in the project root, organized into three directories:

```
.dksu/
├── drafts/     # Working documents during each stage (problem definition, personas, requirement drafts)
├── plans/      # Finalized planning documents after Stage 6 closes; each plan includes a Seed section
└── evidence/   # Reference citations, research artifacts, and comparative findings from researcher-dksu
```

- A document moves from `drafts/` to `plans/` only after Stage 6 closes and PL-07 passes (or an override is logged).
- `evidence/` files are owned by `researcher-dksu` and must not be edited by other agents.
- Do not create subdirectories inside these three folders without a documented reason in the decision log.

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
| PL-07 | Hard |

---

## Boundary Rules

- Do not restate stage sequencing here.
- Do not declare trigger phrases here.
- Do not store collision winner logic here.
- Do not redefine agent contracts here.
