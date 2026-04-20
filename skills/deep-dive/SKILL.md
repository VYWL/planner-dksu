---
name: deep-dive
description: 딥다이브 근본 원인 분석 스킬 - "딥다이브", "근본 원인", "왜?를 반복", "5 Whys", "root cause" 요청 시 사용
version: 1.0.0
---

# Deep Dive

Use this skill when the user wants a true root cause analysis instead of a surface-level explanation.
This method is based on Toyota's 5 Whys practice associated with Sakichi Toyoda and Taiichi Ohno, but it extends beyond five levels whenever the problem still has hidden drivers.
The target is not to stop at a neat sentence, but to reach a reason that is actionable, systemic, and within the team's control.

## Core Principle

Do not ask open-ended questions like a casual interview.
Ask hypothesis-based questions that narrow the search space and can be tested immediately.
Every answer must be checked against evidence: interviews, support notes, timelines, screenshots, observed behavior, sample data, documents, or user actions.

## Objective

Produce a chain like this:

1. Symptom is observed.
2. Immediate cause is identified.
3. Supporting conditions are separated from actual drivers.
4. Auxiliary Reason of Problem (ARP) is distinguished from Fundamental Reason of Problem (FRP).
5. A fix plan is proposed at the FRP level.

## Definitions

| Term | Meaning | Diagnostic use |
| --- | --- | --- |
| Symptom | What people noticed first | Starting point only |
| Cause candidate | A testable explanation for the current layer | Validate with data |
| ARP | Auxiliary Reason of Problem: a contributor that worsens or enables the issue but is not the deepest lever | May require mitigation, but do not stop here |
| FRP | Fundamental Reason of Problem: the controllable systemic reason that keeps generating the issue | Main target for prevention |
| Evidence | Logs, metrics, code, configs, recordings, incident timeline, sample data | Required for every accepted answer |

## Operating Rules

1. Never assume. Verify every answer with data.
2. Never stop at exactly five levels just because the method is called 5 Whys.
3. Ask at least 8+ levels of why for deep problems when the chain still branches or the system is complex.
4. Prefer closed hypothesis ranges with 2-4 options.
5. Stop only when the same answer repeats, or when the root cause is actionable, systemic, and within control.
6. Separate ARP from FRP explicitly.
7. Perform a 5W1H completeness check before finalizing.

## Question Format

### Bad

- What do you think caused it?
- Why are users dropping off?
- What kind of login do we have?

### Good

- Which best matches the drop-off source: unclear value proposition / onboarding friction / trust gap / wrong target segment?
- Which evidence do we have first: interview quote / funnel snapshot / support note / onboarding screenshot?
- Which auth mode fits this product: OAuth / Email+Password / SSO / Magic Link?

## Required 3-Round Depth Pattern

### R1: Broad exploration

Ask 3-4 hypothesis questions to establish direction.
These should cover the major branches, not implementation trivia.

Example structure:

1. Where is the first observable break: awareness / onboarding / first-value moment / repeat usage?
2. When did it become visible: after a messaging change / after audience shift / always existed / unknown?
3. Which evidence is strongest: interview quote / funnel anomaly / support pattern / usage recording?
4. Which class fits best: wrong assumption / unclear promise / workflow friction / trust gap?

### R2: Drill weak spots

Ask 2-3 targeted questions driven by actual R1 answers.
These must not be pre-prepared blindly.
If R1 points to onboarding friction, R2 must test onboarding more deeply.
If R1 points to trust issues, R2 must target proof, reassurance, and expectation setting.

Example structure:

1. Is the friction in copy clarity / input burden / missing defaults / hidden next step?
2. Does the problem affect all new users / one segment / one acquisition channel?
3. Is the mismatch introduced before signup / during setup / at first-use?

### R3: Execution details

Ask 2-3 specific questions only if needed to define action.
Do not force R3 if FRP is already clear.

Example structure:

1. Which artifact currently owns the source of truth: landing page / onboarding flow / FAQ / sales deck?
2. Which planning decision could have prevented the wrong assumption earlier?
3. Which owner can change the message, flow, or policy this cycle?

## Depth Guidance

Five levels is a mnemonic, not a ceiling.
Use more than five whenever the answer is still local, accidental, or person-blaming.
For deep problems, ask at least 8+ levels of why.
The point is depth, not count.
If level 6, 7, or 8 still reveals a deeper repeated control failure, continue.

## ARP vs FRP Heuristic

Use this test:

| Check | If yes | Likely class |
| --- | --- | --- |
| Does fixing it reduce severity but not recurrence? | Yes | ARP |
| Is it a condition that enabled the issue, but not the system rule that keeps reproducing it? | Yes | ARP |
| Would changing this system rule prevent a class of similar failures? | Yes | FRP |
| Is the cause within our process, codebase, tooling, or operating policy control? | Yes | FRP candidate |

### Examples

- "Users were busy that week" can be an ARP.
- "The first-run flow assumed users already understood category jargon" may be the FRP.
- "One stakeholder forgot to explain the feature" is rarely FRP.
- "The planning process allowed core assumptions to pass without user-evidence review" is a stronger FRP candidate.

## Standard Workflow

### Step 1: Define the symptom precisely

Write one sentence with observable facts only.

Template:

```text
Symptom: [who/what] experienced [observable failure] at [time/place] under [conditions].
```

### Step 2: Gather evidence before questioning

Collect at least one artifact from each relevant layer:

- user-visible behavior
- interview notes or support requests
- screenshots, recordings, or prototype walkthroughs
- requirement or policy documents
- sample data or usage snapshots
- timeline of decisions or changes

### Step 3: Run R1 broad exploration

Ask 3-4 hypothesis questions.
Each question must provide 2-4 options.
Reject answers that are opinion-only.

### Step 4: Run R2 targeted drilling

Use R1 results to focus on the weakest or most causal branch.
Update the why-chain in writing after each verified answer.

### Step 5: Run R3 only if action is still vague

Define execution ownership, control point, and prevention mechanism.

### Step 6: Label ARP and FRP

Write them separately.
Do not merge them into a single conclusion.

### Step 7: 5W1H completeness check

Before closing, confirm all six are concrete.

| Dimension | Required answer |
| --- | --- |
| WHO | Which user, team, service, or component is affected or responsible for the fix |
| WHAT | What exactly failed |
| WHEN | When it started and under which sequence |
| WHERE | Which environment, region, screen, service, node, or workflow |
| WHY | Verified causal chain with evidence |
| HOW | Mechanism of failure and mechanism of prevention |

### Step 8: Apply stopping condition

Stop only if one of these is true:

- the same answer repeats across deeper why levels
- the identified root cause is actionable, systemic, and within control

## Output Template

```markdown
## Symptom
- ...

## Evidence
- ...

## Why Chain
1. Why? ...
   - Answer: ...
   - Evidence: ...
   - Class: ARP / FRP candidate / unknown
2. Why? ...
   - Answer: ...
   - Evidence: ...
   - Class: ...

## ARP
- ...

## FRP
- ...

## 5W1H Check
- WHO: ...
- WHAT: ...
- WHEN: ...
- WHERE: ...
- WHY: ...
- HOW: ...

## Corrective Actions
- Immediate containment:
- Systemic prevention:
- Verification plan:
```

## Water Leak Example Pattern

Use this pattern to explain the difference between surface cause and root cause.

1. Symptom: Water is leaking from the faucet.
2. Why? Because internal pressure is too high for the worn seal.
3. Why is pressure too high? Because the upstream regulator is sending abnormal pressure.
4. Why is the regulator doing that? Because its reference value was misconfigured.
5. Why was it misconfigured? Because maintenance copied settings from a different building profile.
6. Why was copying allowed? Because there is no validated configuration baseline by building type.
7. Why is there no validated baseline? Because configuration ownership is undefined between facilities and maintenance.
8. Why is ownership undefined? Because the operating process was never standardized after expansion.

Possible classification:

- Worn seal = ARP
- High pressure = ARP or intermediate cause
- Missing standardized operating process and config ownership = FRP

## Concrete Planning Example: Signup Drop-Off Traced 8 Levels Deep

### Symptom

New users abandon signup before reaching the first planning artifact.

### Evidence collected

- Funnel snapshot shows a sharp drop between account creation and first artifact setup.
- User interviews describe the flow as "too much setup before value."
- Support notes show repeated confusion about the difference between persona, scenario, and requirement spec.
- Onboarding screenshots show three planning concepts introduced at once with no example outcome.
- Earlier planning documents assumed users already knew the planning vocabulary.

### Why chain

1. Why do users abandon signup before reaching the first artifact?
   - Because the onboarding asks them to classify the work before showing any concrete payoff.
   - Evidence: onboarding screenshots and interview notes.
2. Why does that cause abandonment?
   - Because new users do not yet understand the planning vocabulary well enough to answer confidently.
   - Evidence: support notes and interview quotes.
3. Why do they not understand the vocabulary?
   - Because persona, scenario, and requirement framing are introduced simultaneously without a worked example.
   - Evidence: current flow copy and setup screens.
4. Why are all three introduced at once?
   - Because the flow is optimized around internal planning categories instead of user learning order.
   - Evidence: product brief and onboarding structure.
5. Why was internal category order used as the learning order?
   - Because the team assumed planning-literate users as the default audience.
   - Evidence: target user assumption in earlier planning notes.
6. Why was that assumption left unchallenged?
   - Because early validation focused on completeness of the framework, not first-time comprehension.
   - Evidence: decision log and missing beginner validation criteria.
7. Why was beginner comprehension not part of validation?
   - Because success criteria emphasized artifact coverage rather than time-to-first-value.
   - Evidence: planning checklist and acceptance framing.
8. Why was success framed that way?
   - Because the planning process lacked an explicit rule to test the first-value moment for unfamiliar users.
   - Evidence: workflow artifacts and missing onboarding-specific validation contract.

### Classification

- Dense terminology on one screen = ARP or intermediate cause.
- Internal-category-first onboarding order = ARP.
- No explicit first-value validation for unfamiliar users = FRP.

### Corrective actions

- Immediate: reduce onboarding concepts on the first screen and show one worked example.
- Systemic: add first-value validation to planning criteria, test vocabulary comprehension early, and separate internal framework order from user learning order.

## Evidence Standards

Acceptable verification sources:

- metrics with timestamps
- interview notes or support threads
- screenshots and recordings
- requirement docs and decision logs
- sample user inputs or artifact outputs
- usability study notes
- screenshots only when supported by more direct evidence if possible

Weak evidence to avoid:

- memory-based claims
- single-person intuition
- "it usually happens when..."
- blame statements without system proof

## Facilitation Script

Use this condensed sequence when running live analysis:

1. State the symptom in one sentence.
2. Ask for evidence, not opinions.
3. Run R1 with 3-4 options per question.
4. Select the strongest causal branch.
5. Run R2 based on actual answers.
6. Run R3 only if the fix mechanism is still unclear.
7. Label ARP and FRP separately.
8. Check 5W1H completeness.
9. Stop at repetition or actionable systemic control.
10. Propose containment plus prevention.

## Anti-Patterns (NEVER)

- Never stop at five levels just because the method name says 5 Whys.
- Never ask vague open-ended questions when you can present testable options.
- Never accept an answer without evidence from data, logs, configs, or reproducible behavior.
- Never confuse a trigger or contributing condition (ARP) with the controllable systemic root cause (FRP).
- Never end with a person-blaming conclusion such as "someone forgot" if the system allowed the mistake.
- Never close the analysis without a 5W1H completeness check and a prevention mechanism.
