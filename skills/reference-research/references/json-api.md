# JSON API

## Purpose

Use this reference when a site exposes a public JSON endpoint or `.json` variant that is cleaner, faster, and more structured than page-oriented extraction.

## Consult When

- The platform is known to expose public JSON.
- The page source is noisy but the data model is likely structured.
- A feed, list, post, or registry surface is easier to consume as JSON than HTML.
- You want stable fields rather than rendered prose.

## Trigger Surfaces

- Reddit-like post lists
- HN-style item endpoints
- developer community APIs
- registry or package metadata
- `.json` URL variants

## What This Reference Adds

- A structured-data fast path.
- A catalog mindset for known public JSON surfaces.
- Guidance that HTML should not be the default when a better structured surface exists.

## Planning-only Adaptation Rules

- Preserve endpoint awareness as routing knowledge only.
- Do not embed runtime calling logic into the plugin contract.
- Use this reference to justify why a structured branch should be consulted before page scraping.

## Trust Notes

- Public JSON is often more reliable than visual pages for lists, counts, identifiers, and metadata.
- JSON may still be partial; lack of prose does not mean lack of value.
- Pair with `metadata.md` or `public-api.md` when a platform overlaps both families.

## Routing Summary

1. If a known public JSON surface exists, prefer it over page extraction.
2. Use the structured result to anchor high-confidence facts.
3. Fall back to generic routing only when the JSON branch is unavailable or insufficient.
