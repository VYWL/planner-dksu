# Naver Surfaces

## Purpose

Use this reference for Naver-specific research surfaces, especially when Korean-language discovery and retrieval work better through Naver branches than through generic web search.

## Consult When

- The request is about Korean search results, blog posts, news, or finance pages.
- The surface belongs to a Naver-controlled domain.
- The research target is Korean and freshness matters.
- Generic search seems weaker than platform-native discovery.

## Trigger Surfaces

- Korean keyword search
- Naver blog URL
- Naver news URL
- Naver finance URL
- Naver-centered discovery flow

## What This Reference Adds

- A Korea-specific platform branch.
- A reminder that Korean search and discovery behavior may require different routing assumptions.
- Distinct handling for blog, news, finance, and search surfaces under one platform family.

## Planning-only Adaptation Rules

- Preserve Naver handling as routing knowledge, not as a plugin-level automation requirement.
- Use this reference to justify Naver-first reasoning when Korean retrieval quality is the core concern.
- Keep the focus on surface choice, not on spoofing or runtime mechanics.

## Trust Notes

- Naver-native results may be stronger for Korean recency and local content.
- Not all Naver surfaces are equally accessible or equally useful.
- Distinguish discovery surfaces from content surfaces in planning output.

## Routing Summary

1. If the request is clearly Korean or Naver-native, consult this branch early.
2. Split the route by search, blog, news, or finance surface.
3. Return to generic support layers only when Naver-specific handling is insufficient.
