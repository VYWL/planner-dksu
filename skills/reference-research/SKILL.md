---
name: reference-research
description: 레퍼런스 조사 및 벤치마크 스킬 - "레퍼런스 조사", "참고할 서비스", "경쟁 분석", "벤치마크", "reference research" 요청 시 사용
version: 1.0.0
---

# Reference Research

Use this skill when the user needs strong external references before planning, designing, positioning, or implementing a feature.
This skill is proactive by default.
Do not wait for the user to hand you reference links.
Actively collect, compare, and interpret references from the market.

## Mission

Turn vague inspiration into structured evidence.
The output should explain not just that a product exists, but how it solves a problem, for whom, with which flow, and why its UX or business model matters.

## Mandatory Opening Questions

Always ask these two questions early, even if you will research independently:

1. 어떤 서비스를 참고하시나요?
2. 마음에 드는 앱이나 웹사이트 있으세요?

If the user has no answer, continue anyway with proactive research.

## Packaged Helper

Use `scripts/reference-capture-checklist.md` as the deterministic capture helper for each research pass.
It keeps per-reference notes, cross-source synthesis, and final Keep / Adapt / Avoid output consistent.

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

## Required Source Categories

Use multiple source types.
One source is never enough.

| Source | Why it matters | Minimum expectation |
| --- | --- | --- |
| UI Bowl | Useful for UI patterns and polished interaction ideas | Scan for layout and pattern similarities |
| Dribbble | Useful for visual direction and component motifs | Use carefully; validate against real-world product behavior |
| Behance | Useful for broader product narratives and flows | Extract actual sequence ideas, not just visuals |
| Competitor apps | Best for real production decisions | Inspect real flows, pricing, positioning, and constraints |
| Product Hunt | Good for product framing and perceived differentiation | Note messaging, launch angle, and user comments |
| Similar services | Good for adjacent domain patterns | Compare workflows that solve the same job differently |
| Web search | Good for real implementations, case studies, and reviews | Find evidence of actual UX behavior and adoption |

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

## Research Workflow

### Step 1: Frame the user problem

Define the core job to be done in one sentence.

Template:

```text
Users need to [goal] despite [constraint] so they can [outcome].
```

### Step 2: Clarify inspiration and domain anchors

Ask the user for preferred references.
Then infer three search lanes:

1. direct competitors
2. adjacent workflow analogs
3. visual inspiration sources

### Step 3: Collect references proactively

Do not wait for permission after the task is given.
Search immediately.
Aim for diversity across product maturity, business model, and UX philosophy.

### Step 4: Capture evidence in structured notes

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

### Step 5: Compare patterns across sources

Look for repetition and contrast.

Questions to answer:

- Which flow repeats across 3 or more products?
- Which feature is common but executed differently?
- Which visual pattern looks attractive but is unsupported in production?
- Which pricing strategy aligns with product maturity or target segment?

### Step 6: Produce findings, not a dump

Summarize insights into decisions.
The output must help the next step: planning, design, or implementation.

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

## Visual Description Template

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
- Never rely on a single source, single screenshot, or single competitor to justify a decision.
- Never report only that a feature exists without explaining the problem, flow, and UX pattern behind it.
- Never use Dribbble or Behance shots as production truth without checking real-world products or adjacent evidence.
- Never begin design recommendations without at least 3 visual references or equally concrete visual descriptions.
- Never return a raw link dump when the task requires structured findings and actionable interpretation.
