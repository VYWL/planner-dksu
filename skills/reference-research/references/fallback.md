# Fallback Scheduler

## Purpose

Use this reference as the generic routing backbone when a surface is unknown, partially accessible, or blocked and no better platform-specific branch is obvious.

## Consult When

- The input is a public URL with no known special handling.
- The first method fails or yields weak results.
- The surface shows challenge signals, partial content, or low-confidence output.
- A consistent escalation order is needed.

## Trigger Surfaces

- generic URL
- unknown platform
- blocked page
- partial extraction
- challenge or rate-limit signal

## What This Reference Adds

- A decision order from lightweight attempts to stronger escalation.
- A signal-based way to decide when to move from one branch to another.
- Validation rules for accepting, rejecting, or downgrading a result.

## Planning-only Adaptation Rules

- Preserve the scheduler as reasoning structure, not as runtime machinery.
- Use it to decide which reference file should be consulted next.
- Keep the focus on routing logic, confidence, and escalation triggers.

## Trust Notes

- Earlier branches are usually cheaper and cleaner.
- Stronger escalation does not automatically mean higher trust; it only means the surface required more effort.
- Authentication-required pages should terminate with a clear boundary, not endless escalation.

## Routing Summary

1. Prefer a known platform-specific branch if one clearly exists.
2. Otherwise begin with the generic fallback order.
3. Escalate only when signals justify it, and stop when confidence boundaries are clear.
