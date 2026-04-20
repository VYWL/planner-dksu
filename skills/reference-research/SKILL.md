---
name: reference-research
description: 레퍼런스 조사 및 벤치마크 스킬 - "레퍼런스 조사", "참고할 서비스", "경쟁 분석", "벤치마크", "reference research" 요청 시 사용
version: 1.0.0
---

# Reference Research

Use this skill when the user needs strong external references before planning, design direction, positioning, prioritization, or decision-heavy product work.
This skill is proactive by default.
Do not wait for the user to hand you links.

## Mission

Turn vague inspiration into structured, decision-ready evidence.
The output should explain not just that something exists, but how it solves a problem, for whom, through which flow, and why the pattern matters.

## Mandatory Opening Questions

Always ask these two questions early, even if you will continue with proactive research:

1. 어떤 서비스를 참고하시나요?
2. 마음에 드는 앱이나 웹사이트 있으세요?

If the user has no answer, continue anyway.

## Packaged Helper

Use `scripts/reference-capture-checklist.md` as the deterministic capture helper for each research pass.
It keeps per-reference notes, cross-source synthesis, and final Keep / Adapt / Avoid output consistent.

## Reference Operating System

`references/` is the **home of the reference layer**.
It is not helper text and not a side note.
It is the routing brain for this skill.

Treat the reference layer as three tiers:

### 1. Platform-first branches
- `twitter.md`
- `naver.md`
- `media.md`
- `public-api.md`
- `json-api.md`

Use these when the input surface already suggests a specific platform or structured data family.

### 2. Generic fallback and escalation branches
- `fallback.md`
- `tls-impersonate.md`
- `playwright.md`
- `cache-archive.md`

Use these when the surface is blocked, ambiguous, challenge-heavy, or historically recoverable only.

### 3. Support-layer branches
- `metadata.md`
- `rss.md`
- `jina.md`

Use these to enrich, validate, or downgrade partial evidence.

## Core Rule

Research depth must be functional, not decorative.

### Too shallow
- Product X has a dashboard.
- Product Y supports team sharing.
- Competitor Z uses cards.

### Deep enough
- Product X solves onboarding hesitation with a three-step setup wizard, progressive disclosure, and a pre-filled starter state that reduces blank-screen anxiety.
- Product Y solves repeated coordination pain with a shared timeline, activity feed, and role-specific reminders.
- Competitor Z uses cards only in discovery; the core workflow switches to a dense table because users optimize for scan speed after week one.

## Planning Boundary

This skill remains planning-oriented.

- The reference layer is **routing knowledge**, not a dependency bundle.
- Do not turn public APIs, browser tactics, reader tactics, or anti-block tactics into mandatory runtime requirements.
- Do not drift into implementation or coding-plugin behavior.
- Use the references to choose the right research branch, explain confidence, and preserve provenance.

## Required Source Categories

Use multiple source types.
One source is never enough.

| Source | Why it matters | Minimum expectation |
| --- | --- | --- |
| Competitor apps | Best for real production decisions | Inspect real flows, pricing, positioning, and constraints |
| Official pages | Best for source-of-truth claims | Check current messaging, docs, pricing, or release notes |
| Product Hunt | Good for product framing and perceived differentiation | Note messaging, launch angle, and user comments |
| Similar services | Good for adjacent domain patterns | Compare workflows that solve the same job differently |
| Web search | Good for real implementations, case studies, and reviews | Find evidence of actual UX behavior and adoption |
| Visual inspiration sources | Useful for UI direction only when cross-validated | Never treat concept shots as production truth by default |

## Visual Reference Mandate

Before any design direction is proposed, collect at least one of these:

- 3+ screenshots
- 3+ concrete visual descriptions detailed enough to reconstruct the layout
- a mixed set of screenshots and detailed visual notes totaling at least 3 artifacts

Without visual evidence, design guidance is incomplete.

## Research Standard

Cross-reference multiple sources before making a claim.

Example:

- Dribbble suggests a floating command panel.
- Competitor product shows the panel is actually tucked into the right rail after onboarding.
- Product Hunt comments reveal new users found the floating panel distracting.

Conclusion: do not recommend the floating panel as a default state without evidence that it supports usability in production.

## Reference-Driven Workflow

### Step 1: Frame the user problem

Define the core job to be done in one sentence.

Template:

```text
Users need to [goal] despite [constraint] so they can [outcome].
```

### Step 2: Classify the input and choose the first branch

Classify the request first:
- `URL`
- `handle`
- `keyword`
- `mixed`

Then classify the surface:
- X / Twitter
- Naver / Korean discovery
- media
- public API platform
- JSON-capable platform
- feed-friendly source
- generic public page
- blocked or challenge-heavy page
- deleted or historical source

Choose the first reference branch explicitly.

| Input / surface | Read first | Add next when needed |
| --- | --- | --- |
| X handle / tweet URL / X keyword | `twitter.md` | `fallback.md`, `metadata.md`, `cache-archive.md` |
| Korean keyword / Naver domain | `naver.md` | `rss.md`, `metadata.md`, `fallback.md` |
| media URL / channel / stream | `media.md` | `metadata.md`, `fallback.md` |
| known public API platform | `public-api.md` | `metadata.md`, `fallback.md` |
| known JSON-capable site or `.json` surface | `json-api.md` | `public-api.md`, `metadata.md`, `fallback.md` |
| feed-friendly root / news / blog / release stream | `rss.md` | `jina.md`, `metadata.md`, `fallback.md` |
| generic public article or docs URL | `fallback.md` | `jina.md`, `metadata.md`, `rss.md` |
| partial HTML or metadata-rich page | `metadata.md` | `jina.md`, `fallback.md` |
| blocked page / WAF / challenge signal | `fallback.md` | `tls-impersonate.md`, `playwright.md`, `cache-archive.md` |
| deleted / historical / cached need | `cache-archive.md` | `fallback.md`, `public-api.md` |

### Step 3: Plan the evidence lanes

After selecting the first reference branch, define at least three research lanes when the task is decision-heavy:

1. direct competitors or direct evidence
2. adjacent workflow analogs
3. visual or behavioral evidence

If the task is simpler, use fewer lanes but still name the branch choice explicitly.

### Step 4: Collect references proactively

Do not wait for permission after the task is given.
Search immediately.
Aim for diversity across product maturity, business model, and UX philosophy.

### Step 5: Capture evidence in structured notes

For each reference, document:
- product name
- source type
- link or retrieval context
- target user
- problem solved
- key feature
- flow summary
- UX pattern
- visual notes
- pricing or packaging signal
- technical hints if visible
- reference branch used

### Step 6: Add support-layer enrichment

Use support references deliberately:

- `metadata.md` when structured signals can rescue partial access
- `rss.md` when recency, feed discovery, or low-cost list retrieval matters
- `jina.md` when a lightweight public read may be enough

Support evidence must not be overstated as full understanding.

### Step 7: Escalate deterministically

Escalate only when the evidence justifies it.

- `fallback.md` for generic ordering and validation logic
- `tls-impersonate.md` when the page appears public but blocked by anti-bot posture
- `playwright.md` when the surface appears browser-required or JS-heavy
- `cache-archive.md` when the source is stale, gone, or historically recoverable only

If the real boundary is authentication, subscription, or private access, stop and report the boundary clearly.

### Step 8: Produce findings, not a dump

Summarize insights into decisions.
The output must help the next step: planning, design, prioritization, or policy.

## Quick vs Deep Behavior

### Quick mode

Use quick mode when the task is mainly:
- fact check
- URL or handle verification
- shortlist generation
- 1~2 reference comparison
- information confirmation without recommendation-heavy judgment

Quick mode still requires:
1. explicit first-branch selection
2. at least 2 search paths
3. provenance on core claims
4. failure transparency

### Deep mode

Escalate to deep mode when any apply:
1. why / tradeoff / recommendation is required
2. comparison target is 3 or more
3. evidence conflicts
4. single-source conclusion is risky
5. output will influence policy / design / prioritization
6. the user needs pattern explanation, not only fact lookup

Deep mode must **explicitly consume the reference layer**.
It is incomplete if it searches broadly without naming the first reference and the support or escalation references used.

Deep mode minimum behavior:
1. classify the input and surface
2. name the first reference consulted
3. name support and escalation references used
4. explain why the route fits the surface
5. preserve provenance and failure transparency

## Deep-Dive Extraction Framework

For every strong reference, write findings in this form:

```markdown
[Product] solves [problem] for [user] with [feature] using [flow] and [UX pattern].
```

Examples:
- Linear solves issue triage for product teams with keyboard-first workflows using inbox-like prioritization and command-driven navigation.
- Notion solves flexible knowledge capture for mixed-skill teams with block editing using progressive complexity and page-as-container mental models.
- Duolingo solves habit retention for casual learners with streaks, visible progress, and low-friction session loops.

## Comparison Matrix Template

Always include a comparison matrix when more than one reference is used.

| Product | Feature | User Flow | UX Approach | Technical Stack | Pricing |
| --- | --- | --- | --- | --- | --- |
| Product A | ... | ... | ... | ... | ... |
| Product B | ... | ... | ... | ... | ... |
| Product C | ... | ... | ... | ... | ... |

Use `Unknown` only when the detail truly cannot be inferred.
Do not leave blanks.

## Design-Focused Research Additions

When the output will influence design, also collect:
- mood board signals from real products
- color palette references
- typography references
- spacing and density patterns
- interaction cues like hover, empty state, and motion style

### Mood Board Format

```markdown
## Mood Board Signals
- Product: ...
  - Visual personality: ...
  - Primary colors: ...
  - Typography feel: ...
  - Notable components: ...
  - Why it matters: ...
```

### Visual Description Template

Use this when screenshots are unavailable:

```markdown
## Visual Reference
- Product: ...
- Screen: ...
- Layout: left rail / top nav / split pane / dense table / card grid / etc.
- Dominant colors: ...
- Typography: ...
- Key CTA placement: ...
- Information density: low / medium / high
- Interaction cues: hover states / badges / progress / sticky actions / etc.
```

## Technical Stack Guidance

Do not fabricate internal stack details.
Infer carefully from public signals only:
- public job posts
- framework signatures in page source
- engineering blogs
- public docs
- API patterns

If unsure, say `Likely` or `Unknown`.

## Structured Return Format

Always return findings in a decision-ready structure.

```markdown
## Research Goal
- ...

## User-Provided Anchors
- ...

## Route Used
- Primary reference:
- Support references:
- Escalation references:
- Why this route fit the surface:

## Reference Set
1. ...
2. ...
3. ...

## Cross-Source Findings
- Pattern 1: ...
- Pattern 2: ...
- Pattern 3: ...

## Comparison Matrix
| Product | Feature | User Flow | UX Approach | Technical Stack | Pricing |
| --- | --- | --- | --- | --- | --- |

## Visual References
- Screenshot or description 1
- Screenshot or description 2
- Screenshot or description 3

## Recommendations
- Keep:
- Avoid:
- Adapt:

## Unresolved or Failure Notes
- ...
```

## Search Prompts

Use search language that seeks real implementations, not abstract inspiration.

Examples:
- best SaaS onboarding flow with workspace creation screenshots
- competitor app pricing comparison for AI writing tools
- project management timeline UX real product screenshots
- habit tracking app empty state and streak design
- B2B analytics dashboard filter interaction case study

## Evaluation Heuristics

Rate each reference against these dimensions:

| Dimension | Questions |
| --- | --- |
| Relevance | Does it solve the same user problem or job to be done? |
| Reality | Is this a live product decision or just a concept shot? |
| Transferability | Can this pattern work with our constraints and audience? |
| Clarity | Is the user flow understandable from available evidence? |
| Differentiation | Does it help us match the category or stand out intentionally? |

## What Good Findings Look Like

Good findings connect the source to a product decision.

Examples:
- Three competitors gate collaboration behind invitation because empty shared spaces confuse single-user evaluators; for our MVP, single-player first and invite later is likely lower friction.
- The most trusted finance apps use restrained color and dense tables after onboarding, while acquisition pages stay bright and benefit-led; split-brand behavior may be appropriate.
- Similar services consistently keep pricing simple until users understand core value; complex usage-based pricing appears later in mature platforms.

## Escalation Rule

If research reveals two clearly different strategic directions, return both.
Do not silently choose one.

Example:
- Direction A: premium expert workflow, high density, keyboard-first
- Direction B: friendly mainstream workflow, guided, lower density

Explain which references support each direction.

## Anti-Patterns (NEVER)

- Never wait passively for reference links if the task already implies market or UX research.
- Never treat `references/` as optional helper text.
- Never skip branch selection when the surface clearly matches a platform-first reference.
- Never rely on a single source, single screenshot, or single competitor to justify a decision.
- Never report only that a feature exists without explaining the problem, flow, and UX pattern behind it.
- Never use Dribbble or Behance shots as production truth without checking real-world products or adjacent evidence.
- Never begin design recommendations without at least 3 visual references or equally concrete visual descriptions.
- Never return a raw link dump when the task requires structured findings and actionable interpretation.
- Never present runtime tactics as plugin requirements; preserve them only as routing knowledge.
