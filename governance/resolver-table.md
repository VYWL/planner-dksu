# Resolver Table

## Purpose

This document decides routing when two or more plugin-local planning triggers compete for the same request. It references trigger ids only and never repeats trigger text.

---

## Precedence Ladder

1. Explicit invocation
2. Exact match
3. Registered collision rule
4. Clarify with bounded options

---

## Resolution Rules

### Step 1 — Explicit Invocation

If the caller names a skill or agent directly, that target wins immediately.

### Step 2 — Exact Match

If exactly one active row matches exactly, route to that owner.

### Step 3 — Registered Collision Rule

Apply the collision rows below when a trigger id is shared by more than one active row.

### Step 4 — Clarify With Options

If no single winner exists, present bounded options instead of silently picking one.

---

## Collision Rows

| collision_id | trigger_ids | resolution_step | winner_rule | winner_trigger_id | notes |
|---|---|---|---|---|---|
| col-001 | `pkit-reference-research-001`, `pkit-researcher-dksu-001` | Step 3 | phrase-level research request wins; explicit specialist delegation keeps the agent eligible | `pkit-reference-research-001` | Use the skill for planning research asks; use the agent only for explicit delegation to the researcher role. |

---

## Proactive Routing Rules

- Proactive routing is allowed when one active row wins by the ladder above.
- Proactive routing is blocked when the only available match is contextual and another plausible owner remains.
- When blocked, clarify with 2–4 options.

---

## Boundary Rules

- Do not store trigger text here.
- Do not duplicate skill metadata here.
- Do not redefine stage order here.
