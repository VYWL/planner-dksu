# X / Twitter

## Purpose

Use this reference for X/Twitter-specific research surfaces where generic page fetching is weak and platform-aware routing is required.

## Consult When

- The input is an X handle, tweet URL, or X keyword request.
- The request is about recent posts, timelines, or tweet-level details.
- A generic reader or fetch path is known to be weak for this platform.

## Trigger Surfaces

- X handle
- tweet URL
- X keyword search
- timeline request
- single-post lookup

## What This Reference Adds

- A dedicated platform branch for X/Twitter.
- A distinction between keyword discovery, handle timelines, and single-post detail.
- A reminder that platform-native alternative surfaces may outperform generic page access.

## Planning-only Adaptation Rules

- Preserve X handling as routing knowledge only.
- Use this branch to decide whether the request is a discovery problem, a timeline problem, or a single-post problem.
- Do not turn public alternative surfaces into mandatory plugin runtime dependencies.

## Trust Notes

- X surfaces often require different tactics for search versus individual content.
- Weak generic fetch results should not be treated as final failure for this platform.
- Timeline-scale and single-post-scale evidence have different strengths and limits.

## Routing Summary

1. Detect whether the request is about search, timeline, or single post.
2. Use the X-specific branch before generic fallback.
3. Return structured planning evidence with explicit confidence about what level of X data was actually reachable.
