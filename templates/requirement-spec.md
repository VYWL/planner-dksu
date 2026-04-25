# Requirement Spec: [Feature Name]

## Seed

> **Baseline lock**: Goal, Constraints, and Success Criteria are locked after Stage 2 confirmation. Any change to these three fields requires an explicit direction-change decision logged in the decision log, followed by a full re-score.
>
> **Ambiguity Score rows**: The Stage 2 Exit Score is recorded when Stage 2 closes. The Final Score (Stage 6) is appended when Stage 6 closes. Filling in the Final Score row does not modify the locked baseline; it records the outcome of the Final Ambiguity Gate against the same baseline.
>
> The Seed lives here inside the requirement spec, not in a separate file.

### Goal

> One measurable project-level goal. State the specific outcome in observable terms. No "improve" or "enhance" without a direction and threshold.

[Goal statement]

### Constraints

> Hard limits accepted by all stakeholders. Name each constraint explicitly; implied constraints do not count.

- [Constraint 1]
- [Constraint 2]

### Success Criteria

> Testable or checkable criteria. Each criterion must name what is measured, how, and by whom.

- [ ] [Criterion 1]
- [ ] [Criterion 2]

### Ambiguity Score

> Calculated using the `no-more-ambiguity` skill. Pass threshold: **≤ 0.2**. Both conditions must hold: overall score ≤ 0.2 and no dimension below its floor threshold.

| Checkpoint | Score | Gate |
| --- | --- | --- |
| Stage 2 Exit Score | | PASS / FAIL |
| Final Score (Stage 6) | | PASS / FAIL |

---

## Summary
> One paragraph: what this feature does and why.

## User Stories

| ID | As a | I want to | So that |
| --- | --- | --- | --- |
| US-001 | | | |
| US-002 | | | |

## Functional Requirements

| ID | Requirement | Priority | Source |
| --- | --- | --- | --- |
| FR-001 | | Must / Should / Could | US-XXX |

## Non-Functional Requirements
- Performance:
- Accessibility:
- Constraints:

## Out of Scope
-

## Open Questions
- [ ]
