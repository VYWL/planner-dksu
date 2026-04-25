# Planning Workflow

## Purpose

This plugin runs a six-stage planning loop. Each stage produces a concrete artifact that sharpens problem understanding, user intent, evidence quality, requirement shape, validation readiness, or final planning decisions.

Five integrated Perspectives operate as workflow roles across these stages, mapping each planning concern to the appropriate agent or skill. Ambiguity Check gates enforce quantitative clarity thresholds at critical transitions using the `no-more-ambiguity` skill.

This workflow is project-level pre-code planning. It does not manage implementation orchestration, runtime verification, or code generation.

---

## 5 Perspectives — Workflow Role Mapping

Each Perspective is a planning concern assigned to an existing agent or skill. These are not standalone artifacts or separate skills; they describe who owns what type of thinking at each stage.

| Perspective | Role | Mapped to | Active stages |
|---|---|---|---|
| Researcher | Evidence gathering, reference comparison, current-state mapping | `researcher-dksu` | Stage 1, Stage 3 |
| Simplifier | Root-cause analysis, assumption surfacing, ambiguity convergence | `deep-dive` skill | Stage 1 |
| Architect | Scope decisions, requirement structuring, planning structure choices | `dksu` directly | Stage 2, Stage 4 |
| Breadth-Keeper | Blind spot detection, unverified assumptions, 5W1H gaps, AI-slop patterns | `critical-dksu` | Stage 5 |
| Seed-Closer | Final gate enforcement, decision freeze, handoff readiness | `dksu` (Stage 6 Final Gate) | Stage 6 |

---

## Stage Map

| Stage | Name | Goal | Primary outputs | Perspective | Default owner |
|---|---|---|---|---|---|
| 1 | Problem Framing & Analysis | Define the problem, boundaries, assumptions, and current-state map. | problem statement, scope map, assumptions, unknowns | Researcher + Simplifier | `dksu`, `researcher-dksu` |
| 2 | Clarification & Persona Design | Resolve ambiguity with explicit options and model the target user. | clarification decisions, persona, scenario outline | Architect | `dksu` (+ `designer-dksu` opt-in only) |
| 3 | Reference Research | Gather outside or internal reference signals with evidence and comparison. | findings, comparison notes, evidence-backed recommendations | Researcher | `researcher-dksu` |
| 4 | Requirement Structuring | Convert insights into structured requirements and constraints. | requirement spec, acceptance boundaries, dependency notes | Architect | `dksu` |
| 5 | Task Plan & Validation Design | Break work into verifiable tasks and define completion checks. | task plan, validation cases, coverage matrix | Breadth-Keeper | `dksu`, `critical-dksu` |
| 6 | Decision Log | Freeze the planning outcome and record why each decision was taken. | decision log, open questions, deferred items with owner | Seed-Closer | `dksu` |

---

## Stage Details

### Stage 1 — Problem Framing & Analysis

**Perspective**: Researcher (`researcher-dksu`) + Simplifier (`deep-dive`)

- Start here for every non-trivial task.
- Capture the current problem in plain language before proposing solutions.
- Record assumptions as explicit hypotheses, not hidden facts.
- Produce a scope map that separates in-scope, adjacent, and out-of-scope concerns.
- Use `deep-dive` to surface root causes and converge ambiguous problem definitions.
- Use `researcher-dksu` to map the current state with evidence when applicable.

**Ambiguity Check — Goal + Context**

Before closing Stage 1, run `no-more-ambiguity` on Goal Clarity and Context Clarity.

- Goal Clarity floor: 0.75. If below, do not proceed to Stage 2.
- Context Clarity floor: 0.60. If below, do not proceed to Stage 2.

Return to the problem framing loop and resolve gaps before advancing.

**Exit checks**
- Problem statement is concrete.
- Scope boundaries are visible.
- Unknowns are listed.
- Goal Clarity ≥ 0.75 and Context Clarity ≥ 0.60.

### Stage 2 — Clarification & Persona Design

**Perspective**: Architect (`dksu`)

- Resolve ambiguity by presenting bounded options.
- Model target users only when user behavior changes planning quality.
- Convert raw requests into user goals, motivations, and scenario paths.
- `dksu` owns scope decisions and planning structure choices at this stage.
- `designer-dksu` is **opt-in only** and never a default owner at this stage. Activate it only when the user explicitly requests visual direction, design system decisions, or screen-level interaction specs.

**Ambiguity Check — Scope**

Before closing Stage 2, run `no-more-ambiguity` on Scope Clarity.

- Scope Clarity floor: 0.65. If below, the persona and scenario work is built on an undefined boundary.

Resolve scope before finalizing personas.

**Exit checks**
- Ambiguous points are reduced to explicit choices.
- Persona and scenario outputs do not duplicate requirement text.
- User goals are separated from solution shape.
- Scope Clarity ≥ 0.65.

### Stage 3 — Reference Research

**Perspective**: Researcher (`researcher-dksu`)

- Use when planning needs comparative evidence, precedent, or benchmark support.
- Prioritize evidence quality over link volume.
- Summaries must explain what the reference means for the current plan.
- `researcher-dksu` owns evidence gathering and reference comparison.

**Exit checks**
- Findings include sources or evidence anchors.
- Trade-offs are compared, not merely listed.
- Recommendations are traceable to evidence.

### Stage 4 — Requirement Structuring

**Perspective**: Architect (`dksu`)

- Turn the framed problem and research into stable requirements.
- Separate user outcomes, constraints, and exclusions.
- Keep requirement names distinct from task names and decision names.
- `dksu` owns constraint resolution and requirement architecture.

**Ambiguity Check — Constraint + Success Criteria**

Before closing Stage 4, run `no-more-ambiguity` on Constraint Clarity and Success Criteria.

- Constraint Clarity floor: 0.65. If below, requirements are unverifiable.
- Success Criteria floor: 0.70. If below, the requirement spec is incomplete.

**Exit checks**
- Each requirement is testable in principle.
- Constraints are explicit.
- Out-of-scope items are documented once.
- Constraint Clarity ≥ 0.65 and Success Criteria ≥ 0.70.

### Stage 5 — Task Plan & Validation Design

**Perspective**: Breadth-Keeper (`critical-dksu`)

- Break the approved requirement set into planning tasks.
- Attach validation logic before handoff.
- Cover happy path, alternate path, and failure path where relevant.

**Breadth-Keeper Invocation**

Before closing Stage 5, `dksu` invokes `critical-dksu` as the Breadth-Keeper. `critical-dksu` checks four areas only:

1. **Critical Gaps** — missing essential cases that would prevent the product from working.
2. **Unverified Assumptions** — assumptions that could collapse the entire plan if wrong.
3. **5W1H Gaps** — any dimension (WHO, WHAT, WHEN, WHERE, WHY, HOW) that is completely empty.
4. **AI-Slop Patterns** — scope inflation, premature abstraction, over-validation, documentation bloat.

`critical-dksu` returns a verdict: OKAY, CONCERN, or BLOCK (max 3 issues). If BLOCK, `dksu` resolves the blocking issues before proceeding to Stage 6.

**Exit checks**
- Task list is actionable.
- Validation cases cover the planned surface.
- Coverage matrix has no empty ownership gaps.
- `critical-dksu` verdict is OKAY or CONCERN (BLOCK issues resolved).

### Stage 6 — Decision Log

**Perspective**: Seed-Closer (`dksu`)

- Record final planning decisions and their rationale.
- Separate confirmed decisions from open questions.
- Preserve enough context for a later executor to continue without reconstructing the plan.

**Downstream Handoff Basis**

The finalized plan is implementation planning input, not implementation orchestration. Before closing Stage 6, ensure the plan provides explicit planning views for each applicable downstream track:

| Track | What the plan must provide |
|---|---|
| Frontend / UI | User stories, persona context, scenario paths, UX constraints, and acceptance criteria that shape screen-level decisions |
| Server / API | Functional requirements, data flow constraints, integration points, and non-functional requirements (performance, security, compliance) |
| Data / Integrations | Data entities, external system dependencies, and known integration constraints |
| QA / Validation | Validation cases, coverage matrix, and success criteria with measurement methods |
| Project / Estimate | Phased or modular task breakdown, open questions with owners, and deferred items with rationale |

Not every track applies to every plan. Omit a track only when it is explicitly out of scope and that exclusion is logged in the decision log.

**Final Ambiguity Gate**

Before closing Stage 6 and handing off the plan, run the full `no-more-ambiguity` score across all five clarity dimensions.

The plan may only proceed to handoff if both conditions are met:

1. **Ambiguity Score ≤ 0.2** (formula: `1 - Σ(clarity_i × weight_i)`)
2. **No dimension falls below its floor threshold**:
   - Goal Clarity ≥ 0.75
   - Constraint Clarity ≥ 0.65
   - Success Criteria ≥ 0.70
   - Context Clarity ≥ 0.60
   - Scope Clarity ≥ 0.65

If either condition fails, the plan is not ready for handoff. Resolve the gaps or log an explicit user override under "Known Risks at Handoff" in the decision log.

**Exit checks**
- Major choices have rationale.
- Open questions have an owner or next action.
- The final plan can be handed off as a self-contained packet.
- Full Ambiguity Score ≤ 0.2 with all floors met, or explicit user override logged.

---

## Ambiguity Check Summary

| Stage | Dimensions checked | Gate type |
|---|---|---|
| 1 | Goal Clarity (floor 0.75) + Context Clarity (floor 0.60) | Partial — block advancement |
| 2 | Scope Clarity (floor 0.65) | Partial — block persona finalization |
| 4 | Constraint Clarity (floor 0.65) + Success Criteria (floor 0.70) | Partial — block requirement close |
| 6 | All five dimensions, full Ambiguity Score ≤ 0.2 | Final Ambiguity Gate — block handoff |

Threshold: **Score ≤ 0.2** to pass the final gate. Floor thresholds are enforced at every check point; a single dimension below its floor fails the gate regardless of the overall score.

Scoring, rubrics, and dimension checklists are defined in `skills/no-more-ambiguity/SKILL.md`.

---

## Stage-to-Skill Fit

| Stage | Perspective | Primary skill or agent |
|---|---|---|
| 1 | Researcher + Simplifier | `deep-dive`, `researcher-dksu`, `dksu` |
| 2 | Architect | `persona-scenario`, `dksu`; `designer-dksu` opt-in only (explicit visual/UX request required) |
| 3 | Researcher | `reference-research`, `researcher-dksu` |
| 4 | Architect | `dksu` |
| 5 | Breadth-Keeper | `scenario-test`, `critical-dksu`, `dksu` |
| 6 | Seed-Closer | `no-more-ambiguity`, `dksu` |

---

## Boundary Rules

- This workflow is project-level pre-code planning, not implementation orchestration.
- It does not manage code generation, runtime verification, test execution, or deployment.
- Stage order lives here; cross-cutting behavior rules live in `conventions.md`.
- Trigger ownership lives in `trigger-registry.md`.
- Collision handling lives in `resolver-table.md`.
- Skill metadata lives in `skill-registry.md`.
- Agent responsibility boundaries live in `agent-skill-matrix.md`.
- Ambiguity scoring and gate behavior live in `skills/no-more-ambiguity/SKILL.md`.
- `critical-dksu` check behavior lives in `agents/critical-dksu.md`.
