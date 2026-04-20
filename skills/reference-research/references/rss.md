# RSS & Atom

## Purpose

Use this reference for feed-oriented surfaces where RSS or Atom provides a cleaner, lower-cost, and often more up-to-date entry point than page scraping.

## Consult When

- The target is a news site, blog, release stream, or headline feed.
- You need lists of recent items rather than one page only.
- The source may expose a discoverable feed even if the homepage is noisy.
- Feed-first discovery is likely cheaper than generic crawling.

## Trigger Surfaces

- news site root
- blog root
- feed URL
- release stream
- headline discovery request

## What This Reference Adds

- A feed-first discovery branch.
- A support path for recent-item retrieval and source monitoring.
- A reminder that feeds can be both primary sources and discovery aids.

## Planning-only Adaptation Rules

- Do not make feed parsing a mandatory runtime dependency.
- Preserve the idea that feed availability should influence routing decisions early.
- Use this reference to distinguish feed-rich surfaces from page-only surfaces.

## Trust Notes

- Feeds are often high value for recency and item lists.
- Feed summaries may be shorter than full pages, so context can still be partial.
- A feed can reveal the right next URL even when it is not the final content source.

## Routing Summary

1. If the source looks feed-friendly, consult this branch early.
2. Use feeds for discovery, recency, and low-cost item retrieval.
3. Fall back to page or metadata branches only when feed detail is insufficient.
