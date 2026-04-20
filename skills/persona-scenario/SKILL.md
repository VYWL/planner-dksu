---
name: persona-scenario
description: 페르소나와 사용자 시나리오 설계 스킬 - "페르소나", "시나리오", "사용자 스토리", "유저 저니", "persona", "scenario" 요청 시 사용
version: 1.0.0
---

# Persona Scenario

Use this skill when the user needs concrete human stories, user segments, and scenario-based product thinking.
The goal is to make product decisions feel anchored in real behavior instead of abstract requirements.

## Mission

Translate a product idea into believable people, painful situations, and clear user journeys.
The output should help prioritization, UX design, copywriting, and test scenario design.

## Core Rule

Do not describe users as faceless averages.
Create vivid, concrete, distinct personas and stories.
The story must sound like something that could happen on a Tuesday afternoon, not a slide deck slogan.

## Minimum Output Standard

For each project, create 2-3 distinct personas:

1. primary persona
2. secondary persona
3. edge-case persona

They must differ in motivation, environment, constraints, and behavior.

## Persona Template

Always start from these packaged skeletons:

- `templates/persona.md`
- `templates/problem-story.md`
- `templates/user-journey.md`
- `templates/solution-mapping.md`

Keep them as structure anchors, then fill them with concrete, vivid details.

## Story Quality Bar

### Bad

- Users need scheduling.
- Teams want better collaboration.
- People forget their tasks.

### Good

- 민수(28, freelancer) checks three calendars every morning and wastes 30 minutes reconciling schedule conflicts. Yesterday he missed a client call because a personal event and a project sync overlapped. He sent an apology email and now keeps a sticky note on his monitor listing "real schedule first".

Concrete stories reveal urgency, workarounds, and emotional cost.

## Workflow

### Step 1: Define the product promise

Write one sentence answering:

```text
Who is trying to do what, under which constraint, and why does it matter now?
```

This becomes the anchor for persona selection.

### Step 2: Identify the user spectrum

Map likely user categories before writing personas.

Ask:

- Who feels the pain most often?
- Who influences the buying or adoption decision?
- Who struggles because they are not the ideal user but still show up?

Then classify:

- primary = highest urgency and best fit
- secondary = important but slightly different needs
- edge-case = stress-tests assumptions and reveals hidden requirements

### Step 3: Build personas with real-life texture

Each persona needs practical detail.
Mention routines, constraints, and emotional context.
Avoid stereotypes with no product relevance.

### Step 4: Write detailed problem stories

Each persona must have at least one detailed problem story.
Stories must describe a real moment, not a general preference.

Include:

- what happened
- what they were trying to do
- what went wrong
- how often it happens
- how bad it feels
- what workaround they use now

### Step 5: Map the user journey

For each core persona, map this journey:

1. Trigger
2. First contact
3. Onboarding
4. Core usage
5. Repeat loop
6. Churn risk

### Step 6: Quantify pain points

Every pain point needs three attributes:

| Attribute | What to capture |
| --- | --- |
| Frequency | How often the pain occurs |
| Severity | How disruptive or costly it is |
| Current workaround | How the user currently copes |

### Step 7: Map solution to pain

Every important pain point must map to a specific feature and explanation.
If a pain point has no solving feature, note it as an uncovered risk.

## Scenario Format

Scenarios must follow this sentence logic:

```text
Given [context] → User feels [emotion] → User does [action] → System responds [result] → User feels [new emotion]
```

This forces emotional and functional clarity.

## Pain Point Quantification Template

```markdown
## Pain Point
- Description:
- Frequency:
- Severity:
- Current workaround:
- Cost of workaround:
```

## Output Contract

- Use `templates/persona.md` for each persona.
- Use `templates/problem-story.md` for the narrative problem moments.
- Use `templates/user-journey.md` for journey mapping.
- Use `templates/solution-mapping.md` to connect pain points to features.

## Example Set

### Persona 1: Primary

- Name: Minsu Kim
- Age: 28
- Occupation: Freelance marketer
- Tech savviness: High; comfortable with SaaS tools, automations, and mobile-first workflows
- Goals: Keep client meetings, tasks, and deadlines aligned without checking multiple services manually
- Frustrations: Calendar conflicts, scattered reminders, and the feeling of looking unprofessional
- Context of use: Early morning planning, fast changes during the day, tired end-of-day review
- Quote: "I don't need more features. I need one place I can trust before I message a client."

#### Problem Story

Minsu starts every weekday by opening Google Calendar, Notion, and a KakaoTalk chat room where clients casually change times. He spends about 30 minutes reconciling what is actually fixed and what is still moving. Last night a client moved a meeting in chat, but Minsu forgot to update his calendar. This morning he joined the wrong call and had to send an apology. It happens two or three times a month, which feels severe because each miss hurts trust more than the actual lost time. His workaround is a handwritten note beside the monitor that says "check chat before calendar," but that only works when he remembers to look.

### Persona 2: Secondary

- Name: Jiyoon Park
- Age: 35
- Occupation: Operations manager at a small agency
- Tech savviness: Medium; uses tools well when the workflow is obvious, dislikes setup complexity
- Goals: See team schedules quickly and reduce back-and-forth coordination
- Frustrations: Hidden status, poor visibility across teammates, and onboarding friction for non-technical staff
- Context of use: During weekly team planning, while assigning urgent work, and when clients request sudden changes
- Quote: "If I need to explain the tool for 20 minutes, the tool is already too expensive."

#### Problem Story

Jiyoon manages eight people and gets pulled into schedule conflicts several times a week. The pain is not one missed meeting; it is the cascade of messages, reassignments, and client confusion afterward. She currently keeps a color-coded spreadsheet because it is easy to explain, even though it goes stale almost immediately. The severity is medium to high because the workaround is familiar but unreliable. Last Friday she approved a client timeline using spreadsheet data that was already outdated by noon.

### Persona 3: Edge-Case

- Name: Hyunwoo Lee
- Age: 46
- Occupation: Small business owner
- Tech savviness: Low to Medium; confident on mobile apps, easily overwhelmed by settings and dense dashboards
- Goals: Confirm today's commitments without learning a complicated system
- Frustrations: Jargon, too many toggles, and fear of making irreversible mistakes
- Context of use: Between customer visits, often on a phone, with interruptions and poor connectivity
- Quote: "If I can't understand it in one glance, I'll go back to calling people."

#### Problem Story

Hyunwoo runs a local service business and checks schedules between customer visits. He is not trying to optimize a workflow; he is trying to avoid embarrassment. Twice this month he drove to the wrong site because a staff member updated a schedule in a tool he rarely opens. The pain is infrequent compared with Minsu's, but severe because each failure wastes travel time and damages confidence. His workaround is calling an employee before driving, which adds friction and still fails when no one answers.

## Journey Example

| Stage | User context | User action | Emotion | Friction | Product opportunity |
| --- | --- | --- | --- | --- | --- |
| Trigger | A missed or conflicting event just happened | Searches for a better way to coordinate schedules | Frustrated | Existing tools feel fragmented | Promise trust and consolidation |
| First contact | Lands on the product page or hears a referral | Scans for whether the tool fits their situation | Skeptical | Too much jargon creates drop-off | Show familiar use cases fast |
| Onboarding | Creates an account | Connects calendars and communication sources | Hopeful but cautious | Fear of setup complexity | Guided import with clear progress |
| Core usage | Needs to confirm today's commitments | Opens dashboard, checks conflicts, acts | Relieved if clear | Dense or stale views increase anxiety | Make "today" state obvious |
| Repeat loop | Returns daily or weekly | Reviews updates and resolves conflicts | Trust grows | Inconsistent data breaks habit | Reliable sync and digest notifications |
| Churn risk | Tool feels like one more place to maintain | Stops updating or checking it | Indifferent or annoyed | Manual upkeep outweighs value | Automate updates and surface wins |

## Scenario Examples

1. Given Minsu sees three conflicting events before a client call → User feels anxious → User opens the app and asks for the single confirmed schedule → System responds with merged conflict view and recommended action → User feels reassured.
2. Given Jiyoon needs to reshuffle tasks after a sudden client request → User feels rushed → User filters the team's availability and reassigns one slot → System responds with updated visibility for everyone affected → User feels in control.
3. Given Hyunwoo is on mobile with weak signal before driving → User feels uncertain → User opens today's timeline view → System responds with a simplified schedule and clear confirmation state → User feels safe to proceed.

## Decision Rules

Use personas to make trade-offs.

- If a feature delights the edge-case but harms the primary flow, keep the primary flow first.
- If the secondary persona controls team adoption, onboarding clarity may deserve more weight than advanced power features.
- If a story cannot be narrated concretely, the requirement is still too abstract.

## Review Checklist

Before finalizing, confirm:

- Are the 2-3 personas truly distinct?
- Does each persona have a vivid problem story?
- Is every journey stage filled with emotion and friction, not just tasks?
- Are pain points quantified by frequency, severity, and workaround?
- Is each important pain point mapped to a specific feature?
- Can the scenarios be turned into design or test cases directly?

## Anti-Patterns (NEVER)

- Never create generic personas like "busy professional" without concrete goals, context, and pain.
- Never describe user needs only as abstract nouns such as "efficiency" or "convenience" without a real-life story.
- Never skip the edge-case persona; edge cases expose hidden constraints and failure modes.
- Never write journeys as feature lists without emotions, friction, and churn risk.
- Never leave pain points unquantified; frequency, severity, and current workaround must be explicit.
- Never claim a feature solves a pain point unless you explain exactly how the feature changes the user's situation.
