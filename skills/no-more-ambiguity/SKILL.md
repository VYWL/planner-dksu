---
name: no-more-ambiguity
description: 모호성 점수 계산 및 기획 진행 게이트 스킬 - "모호성 점수", "명확도 확인", "ambiguity score", "clearance gate", "기획 진행 가능 여부" 요청 시 사용
version: 1.0.0
---

# No More Ambiguity

Use this skill when a planning session needs a quantitative check before moving to the next stage.
This skill calculates an Ambiguity Score across five clarity dimensions and enforces a clearance gate.
It does not replace qualitative judgment; it makes the judgment explicit and traceable.

## Core Principle

Ambiguity is not binary. It lives on a spectrum, and different dimensions carry different weight.
A plan can be crystal-clear on goals but dangerously vague on constraints.
This skill surfaces those gaps before they become expensive rework.

## The Formula

```
Ambiguity Score = 1 - Σ(clarity_i × weight_i)
```

Where each `clarity_i` is a value between 0.0 and 1.0 for one of the five dimensions, and `weight_i` is its assigned weight.

**Final pass threshold: Score ≤ 0.2**

A score above 0.2 means the plan carries too much unresolved ambiguity to proceed safely.

## Five Clarity Dimensions

| Dimension | Weight | Floor Threshold | What it measures |
| --- | --- | --- | --- |
| Goal Clarity | 30% | 0.75 | Is the problem statement specific, bounded, and agreed upon? |
| Constraint Clarity | 20% | 0.65 | Are the hard limits (time, budget, tech, legal) named and accepted? |
| Success Criteria | 20% | 0.70 | Can we tell, after the fact, whether we succeeded? |
| Context Clarity | 15% | 0.60 | Do we understand the environment, users, and existing system well enough? |
| Scope Clarity | 15% | 0.65 | Is the boundary between in-scope and out-of-scope explicit? |

**Floor threshold rule**: if any single dimension falls below its floor, the gate fails regardless of the overall score.
A high score in other dimensions cannot compensate for a dimension that is critically unclear.

## Scoring Rubric

For each dimension, assign a clarity value using this rubric:

| Clarity Value | Meaning |
| --- | --- |
| 1.0 | Fully defined, documented, and agreed upon by all stakeholders |
| 0.8 | Mostly clear with minor open questions that do not block progress |
| 0.6 | Partially clear; key gaps exist but the direction is understood |
| 0.4 | Significant gaps; multiple interpretations are possible |
| 0.2 | Mostly unclear; only fragments of clarity exist |
| 0.0 | Completely undefined or contradictory |

Use intermediate values (0.1, 0.3, 0.5, 0.7, 0.9) when the situation falls between two levels.

## Dimension Checklists

### Goal Clarity (weight 0.30, floor 0.75)

A goal is clear when all of the following are true:

- The problem statement names a specific user or stakeholder group
- The problem statement names a specific pain point or unmet need
- The desired outcome is stated in observable terms, not aspirational language
- The goal is bounded: there is a "this is not the goal" statement or equivalent
- All key stakeholders have confirmed the same interpretation
- The goal does not contain "and also" that hides a second goal

Deduct clarity when:

- The goal uses vague verbs like "improve", "enhance", "optimize" without a measurable direction
- Two stakeholders describe the goal differently
- The goal conflates problem and solution

### Constraint Clarity (weight 0.20, floor 0.65)

Constraints are clear when all of the following are true:

- Hard deadlines are named with dates, not relative terms like "soon"
- Budget limits are stated as numbers or explicit ranges
- Technical constraints (platform, stack, integration points) are listed
- Legal or compliance requirements are identified
- Team capacity constraints are acknowledged
- Any non-negotiable constraints are labeled as such

Deduct clarity when:

- Constraints are implied but not written down
- "We'll figure it out later" appears in any constraint discussion
- Constraints conflict with each other and the conflict is unresolved

### Success Criteria (weight 0.20, floor 0.70)

Success criteria are clear when all of the following are true:

- At least one measurable outcome is defined (metric, threshold, or observable state)
- The measurement method is named (who measures, how, when)
- There is a minimum acceptable outcome distinct from the ideal outcome
- Failure conditions are named: what would make this a failed plan
- The criteria are agreed upon by the decision-maker, not just the planner

Deduct clarity when:

- Success is described only as "users are happy" or "stakeholders approve"
- No measurement method exists
- The criteria were set by the planner alone without stakeholder confirmation

### Context Clarity (weight 0.15, floor 0.60)

Context is clear when all of the following are true:

- The target user group is described with at least one concrete characteristic (behavior, need, environment)
- The existing system or workflow that this plan touches is described
- Known competing solutions or alternatives are acknowledged
- The trigger for this planning session is documented (why now, not just what)
- Any relevant prior attempts or failures are noted

Deduct clarity when:

- The user is described only as "general users" or "our customers"
- No prior research or evidence is referenced
- The planning session started without a documented trigger

### Scope Clarity (weight 0.15, floor 0.65)

Scope is clear when all of the following are true:

- At least three explicit "in scope" items are named
- At least two explicit "out of scope" items are named
- The boundary between this plan and adjacent plans or systems is drawn
- Edge cases that are explicitly excluded are listed
- The scope has been reviewed by someone other than the author

Deduct clarity when:

- Scope is described only as "everything related to X"
- No out-of-scope items are named
- The scope boundary was never reviewed

## Stage Application Points

Apply this skill at four points in the planning workflow:

### Stage 1: Problem Framing and Analysis

Check: **Goal Clarity + Context Clarity**

Before closing Stage 1, score these two dimensions.
If Goal Clarity falls below 0.75 or Context Clarity falls below 0.60, do not proceed to Stage 2.
Return to the problem framing loop and resolve the gaps first.

### Stage 2: Clarification and Persona Design

Check: **Scope Clarity**

Before closing Stage 2, score Scope Clarity.
If it falls below 0.65, the persona and scenario work in this stage is built on an undefined boundary.
Resolve scope before finalizing personas.

### Stage 4: Requirement Structuring

Check: **Constraint Clarity + Success Criteria**

Before closing Stage 4, score these two dimensions.
Requirements written without clear constraints or success criteria will be unverifiable.
If either falls below its floor, the requirement spec is incomplete.

### Stage 6: Final Gate

Check: **All five dimensions, full Ambiguity Score**

Before closing Stage 6 and handing off the plan, run the full score.
The plan may only proceed if:

1. Ambiguity Score ≤ 0.2
2. No dimension falls below its floor threshold

If either condition fails, the plan is not ready for handoff.

## Clearance Gate Behavior

### Gate passes when

- Ambiguity Score ≤ 0.2
- All five dimensions are at or above their floor thresholds

Output: "Clearance granted. Plan is ready for handoff."

### Gate fails when

- Ambiguity Score > 0.2, OR
- Any dimension is below its floor threshold

Output: List every failing dimension with its current score, its floor, and the specific checklist items that are unresolved.
Do not proceed until the gaps are addressed.

### User override

If the score fails but the user explicitly says "진행해" or an equivalent override signal, continue with a warning.
Record the unresolved ambiguity in the decision log under "Known Risks at Handoff".
Do not silently proceed; the override must be acknowledged and logged.

## Calculation Example

Suppose a plan at Stage 6 has these scores:

| Dimension | Clarity | Weight | Contribution |
| --- | --- | --- | --- |
| Goal Clarity | 0.85 | 0.30 | 0.255 |
| Constraint Clarity | 0.70 | 0.20 | 0.140 |
| Success Criteria | 0.75 | 0.20 | 0.150 |
| Context Clarity | 0.65 | 0.15 | 0.098 |
| Scope Clarity | 0.80 | 0.15 | 0.120 |

Weighted sum = 0.255 + 0.140 + 0.150 + 0.098 + 0.120 = 0.763

Ambiguity Score = 1 - 0.763 = **0.237**

Result: Gate fails. Score 0.237 > 0.20.
All dimensions are above their floors, so the floor check passes.
But the overall score is too high. The plan needs more work before handoff.

## Output Template

Use this template when reporting a score in a planning session:

```
## Ambiguity Score Report

**Stage**: [Stage number and name]
**Date**: [YYYY-MM-DD]

### Dimension Scores

| Dimension | Clarity | Floor | Status |
| --- | --- | --- | --- |
| Goal Clarity (30%) | [0.0–1.0] | 0.75 | PASS / FAIL |
| Constraint Clarity (20%) | [0.0–1.0] | 0.65 | PASS / FAIL |
| Success Criteria (20%) | [0.0–1.0] | 0.70 | PASS / FAIL |
| Context Clarity (15%) | [0.0–1.0] | 0.60 | PASS / FAIL |
| Scope Clarity (15%) | [0.0–1.0] | 0.65 | PASS / FAIL |

### Calculation

Weighted sum = [sum]
Ambiguity Score = 1 - [sum] = [score]

### Gate Result

[PASS / FAIL]

### Unresolved Items (if FAIL)

- [Dimension]: [specific checklist item that is missing or unclear]
- [Dimension]: [specific checklist item that is missing or unclear]

### Recommended Actions

- [Concrete next step to resolve each gap]
```

## Anti-Patterns (NEVER)

- Never skip the floor threshold check because the overall score looks acceptable.
- Never assign a clarity value without referencing the checklist for that dimension.
- Never use this skill as a code review or implementation verification tool; it applies to pre-code project planning only.
- Never proceed past a failed gate without either resolving the gaps or logging an explicit user override.
- Never treat a score of 0.21 as "close enough"; the threshold is strict.
- Never score a dimension based on intent ("we plan to define this later"); score only what is documented now.
- Never include Metis or Momus as runtime dependencies; this skill runs standalone.
