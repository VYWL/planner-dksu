# Browser Escalation

## Purpose

Use this reference for surfaces that appear to require a real browser context because lightweight or mid-tier branches cannot reach meaningful content.

## Consult When

- The page is heavily JS-rendered.
- The surface appears to hide key data behind browser execution.
- A hidden internal API may exist behind the rendered shell.
- Earlier branches fail despite the content being publicly visible in a browser.

## Trigger Surfaces

- heavy SPA
- browser challenge
- dynamic feed or infinite scroll
- hidden API discovery need
- rendered-only content surface

## What This Reference Adds

- A final browser-required escalation branch.
- A way to reason about when JS execution is probably necessary.
- A reminder that browser access can also reveal lower-cost follow-up surfaces.

## Planning-only Adaptation Rules

- Treat browser automation as optional knowledge, not as a required plugin dependency.
- Preserve the decision rule for when a surface is likely browser-only.
- Keep hidden-API discovery as a concept that informs later routing, not as a mandatory implementation feature.

## Trust Notes

- Browser-required does not automatically mean higher trust; it only means the surface is harder to access.
- If authentication is still required, the escalation should stop.
- Browser-only reasoning is useful mainly for branch choice and confidence framing.

## Routing Summary

1. Try cheaper branches first.
2. If the page still looks browser-required, consult this branch.
3. Use the result to decide whether the surface is accessible, partially recoverable, or outside public access boundaries.
