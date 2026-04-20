# Public API

## Purpose

Use this reference when a platform offers a known public or official API surface that is more stable and structured than page-oriented extraction.

## Consult When

- The platform has a known public endpoint family.
- Structured fields are more valuable than rendered prose.
- The request targets posts, profiles, papers, repositories, or registries that map cleanly to public APIs.
- Reliability and consistency matter more than page fidelity.

## Trigger Surfaces

- official public API platform
- research registry
- academic record source
- social or developer platform with public endpoints
- archive index surface

## What This Reference Adds

- An official structured-data branch.
- A catalog mindset for high-confidence public endpoints.
- Guidance to prefer stable public surfaces over brittle page scraping when possible.

## Planning-only Adaptation Rules

- Preserve the API branch as a routing map, not as embedded calling code.
- Keep rate-limit and coverage awareness as planning knowledge.
- Use this reference to justify why the researcher should prefer public endpoints where they exist.

## Trust Notes

- Public APIs often offer the cleanest facts and identifiers.
- Coverage limits still matter; some platforms expose only part of what a page shows.
- API confidence is high for structure, but narrative context may still need other layers.

## Routing Summary

1. If the platform is known to provide public endpoints, consult this branch early.
2. Use the structured result to anchor the factual layer.
3. Add support layers only when contextual or descriptive coverage is still missing.
