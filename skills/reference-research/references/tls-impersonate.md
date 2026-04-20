# TLS Impersonation

## Purpose

Use this reference when a public surface appears reachable in principle but is guarded by WAF, fingerprint, or bot-detection signals that block simpler access paths.

## Consult When

- The page returns anti-bot responses or challenge-like behavior.
- Earlier branches fail with signals that suggest browser identity or network fingerprint sensitivity.
- The content seems public but blocked by access posture rather than by authentication.

## Trigger Surfaces

- 403-like block behavior
- WAF signal
- challenge page
- anti-bot response
- fingerprint-sensitive platform

## What This Reference Adds

- An anti-block escalation branch.
- A way to distinguish public-but-guarded surfaces from truly private surfaces.
- Clearer reasoning about when to escalate toward stronger public-access tactics.

## Planning-only Adaptation Rules

- Preserve this branch as knowledge about anti-block escalation, not as required runtime bypass.
- Use it to decide when a surface is blocked by posture rather than by permission.
- Stop escalating when authentication, subscription, or private access boundaries are the real issue.

## Trust Notes

- Anti-block success still requires later validation of content quality.
- A blocked signal is not proof that the content is unavailable; it is proof that the current branch is weak.
- This branch is about access posture, not about content semantics.

## Routing Summary

1. Detect whether failure signals suggest anti-bot blocking.
2. If yes, consult this branch before assuming the source is inaccessible.
3. If the real boundary is authentication, stop and report the constraint clearly.
