# Jina Reader

## Purpose

Use this reference for lightweight first-pass reading of public URLs when a quick markdown-like, text-like, or structured reader path is likely to work.

## Consult When

- The target is a public article or page.
- You want a fast first pass before deeper escalation.
- The surface may contain readable content even if the raw page is cluttered.
- You need a simple option for PDF-like or article-like material.

## Trigger Surfaces

- public article URL
- blog post
- community page
- PDF URL
- moderately dynamic page

## What This Reference Adds

- A lightweight universal extraction option.
- Reader-oriented cues such as plain text, markdown-style output, or structured response modes.
- A way to treat reader access as a low-friction first branch before heavier tactics.

## Planning-only Adaptation Rules

- Do not turn reader access into a mandatory plugin requirement.
- Preserve it as an early routing option for public surfaces.
- Use its existence to inform branch choice, not to prescribe runtime installs or execution steps.

## Trust Notes

- Good for readable public content.
- Weak results should trigger secondary checks rather than blind acceptance.
- Pair with `metadata.md` or `rss.md` when the first-pass output is partial.

## Routing Summary

1. If the URL looks public and article-like, consider this branch early.
2. If the result is partial, enrich with metadata or feeds.
3. If the page is blocked or JS-heavy, move to stronger branches.
