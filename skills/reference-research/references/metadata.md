# Metadata Support

## Purpose

Use this reference whenever structured signals such as OGP, JSON-LD, schema markup, or app payload metadata can recover value even if the full body is weak or unavailable.

## Consult When

- A page loads but the main text is incomplete.
- You need title, description, author, product, price, or profile fields.
- The surface is a product page, article page, profile page, or app shell.
- You need support evidence to validate or downgrade another branch.

## Trigger Surfaces

- partial HTML
- product page
- article page
- profile page
- app-shell page with structured payloads

## What This Reference Adds

- A cross-cutting enrichment layer.
- A reminder that partial success is still useful if metadata is strong.
- A way to recover structured fields without pretending full content access exists.

## Planning-only Adaptation Rules

- Keep metadata extraction as reasoning guidance, not as implementation detail.
- Use it to classify outputs as full, partial, or support-only evidence.
- Treat metadata as a support layer that can attach to many other branches.

## Trust Notes

- Metadata is often reliable for identifiers and labels, but not always for narrative completeness.
- Good metadata can rescue a weak surface.
- Support-only evidence should not be mistaken for full-text understanding.

## Routing Summary

1. Whenever HTML-like content appears, consider metadata recovery in parallel.
2. Use structured fields to strengthen confidence or clarify the object type.
3. Mark the result as support-only if narrative coverage is still incomplete.
