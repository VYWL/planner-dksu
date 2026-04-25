# dksu-planning-kit

[한국어 README](./README.ko.md)

A planning OS for Claude Code. Not a coding plugin.

This plugin handles the "what and why" before any implementation starts: problem framing, user research, persona design, requirement structuring, and validation planning. It stops at the planning boundary and hands off a complete, decision-logged plan.

---

## What's inside

### Agents

| Agent | Role | Default |
|---|---|---|
| `dksu` | Planning orchestrator. Owns the full six-stage planning loop. | Active |
| `researcher-dksu` | Research specialist. Uses the absorbed insane-search reference layer for surface-aware evidence gathering. | Active |
| `critical-dksu` | Stage 5 Breadth-Keeper. Planning critic invoked by `dksu` to surface critical gaps, unverified assumptions, and 5W1H holes before Stage 6. Not user-facing; `dksu` calls it internally. | Internal |
| `designer-dksu` | Product designer. Produces UX specs and design direction. | **Opt-in only** |

### Skills

| Skill | When it fires |
|---|---|
| `deep-dive` | Problem framing, ambiguity convergence, root-cause chains |
| `no-more-ambiguity` | Ambiguity Score calculation, stage clarity checks, Final Gate enforcement at Stage 6 |
| `reference-research` | Comparative evidence, benchmarks, precedent gathering |
| `persona-scenario` | User modeling, journey mapping, scenario design |
| `scenario-test` | Validation case definition, coverage matrix closure |

### Governance

Six documents that define how planning runs inside this plugin:

- `planning-workflow.md` — the six-stage planning loop
- `conventions.md` — naming, output format, and communication rules
- `trigger-registry.md` — which phrases activate which skill or agent
- `resolver-table.md` — how to resolve skill/agent conflicts
- `skill-registry.md` — canonical skill list with scope and ownership
- `agent-skill-matrix.md` — which agent may/must/never use which skill

### Templates

Eight skeleton templates for planning artifacts:

`problem-definition`, `persona`, `user-journey`, `scenario`, `requirement-spec`, `decision-log`, `test-case`, `coverage-matrix`

### References

Eight portable reference documents on planning frameworks, orchestration patterns, and research protocols. These live in `references/` and are self-contained, no vault or external links required.

### researcher-dksu, upgraded

`researcher-dksu` no longer uses only the high-level insane-search pattern. It now routes through the absorbed reference layer under `skills/reference-research/references/`.

- Supports X/Twitter, Naver/Korean discovery, media surfaces, public API or JSON-capable platforms, feed-friendly sources, generic public pages, and blocked or challenge-heavy pages.
- In **quick mode**, it picks an initial branch and returns concise, provenance-backed confirmation.
- In **deep mode**, it must name the first reference branch plus support or escalation branches before synthesizing findings.
- This remains a planning-only capability: better routing knowledge and evidence handling, not a promise of runtime bypass or tool execution.

---

## The planning workflow

This plugin runs six stages. Each stage produces a concrete artifact.

```
Stage 1  Problem Framing & Analysis
Stage 2  Clarification & Persona Design
Stage 3  Reference Research
Stage 4  Requirement Structuring
Stage 5  Task Plan & Validation Design
Stage 6  Decision Log
```

The workflow stops here. Implementation, runtime verification, and deployment are out of scope. When Stage 6 closes, you have a decision-logged plan ready to hand to an implementation system.

---

## designer-dksu: opt-in only

`designer-dksu` is included in the bundle but is **default-off**. It never activates automatically.

To use it, explicitly request it:

```
"designer-dksu로 UX 명세 작성해줘"
"디자이너 에이전트 써서 화면 흐름 정의해줘"
```

Without an explicit request, `dksu` handles Stage 2 (Clarification & Persona Design) on its own. `designer-dksu` is only worth activating when you need detailed visual direction, design system decisions, or screen-level interaction specs.

---

## Installation

### Option A: Use this standalone repository

This repository is the standalone plugin bundle.

### Option B: Copy to Claude plugins directory

```bash
cp -r ./dksu-planning-kit "$CLAUDE_PLUGIN_DIR/dksu-planning-kit"
```

### Option C: Publish this repository directly

The bundle is already self-contained. Publish this repository as-is. No external dependencies, no vault references, no global path assumptions.

### Sync opencode global agents (optional)

Use this only when you want the bundled agents available in opencode's global agent path outside the plugin bundle.

```bash
./scripts/sync-agents.sh
```

Manual copy examples:

```bash
cp ./agents/dksu.md ~/.config/opencode/agents/
cp ./agents/critical-dksu.md ~/.config/opencode/agents/
```

---

## Usage

### Starting a session with `/plan-dksu`

The `/plan-dksu` command activates `dksu` in Stage 1 Problem Framing mode. It's the fastest way to open a planning session.

```
/plan-dksu
/plan-dksu [topic]
/plan-dksu 새로운 결제 시스템 기획
/plan-dksu 해커톤 아이디어 검증 도구
```

If your environment doesn't support slash commands, these phrases work the same way:

```
dksu로 기획 시작해줘.
문제: 해커톤 팀이 아이디어를 빠르게 검증할 수 있는 도구가 없다.
```

`dksu` will open Stage 1, ask clarifying questions, and walk through the six-stage loop. It delegates research to `researcher-dksu`, which chooses surface-specific reference branches before collecting evidence, and, if you request it, design specs to `designer-dksu`.

For a fuller walkthrough, see `EXAMPLE_SESSION.md`.

A typical session produces:

- A problem statement with scope boundaries
- A persona and scenario outline
- Evidence-backed reference findings
- A structured requirement spec
- A validation case set with coverage matrix
- A decision log with rationale for every key choice

### Planning artifacts: `.dksu/`

All artifacts from a planning session are stored under `.dksu/` in your project root, organized into three directories:

```
.dksu/
├── drafts/     # Working documents during each stage
├── plans/      # Finalized plans after Stage 6 closes; each includes a Seed section
└── evidence/   # Reference citations and research artifacts from researcher-dksu
```

A document moves from `drafts/` to `plans/` only after Stage 6 closes and the Final Ambiguity Gate passes. The Seed section is part of the finalized plan document, not a separate file.

### Ambiguity Score and the Final Gate

Planning sessions use the `no-more-ambiguity` skill to track clarity across five dimensions: Goal, Constraint, Success Criteria, Context, and Scope. The skill computes an Ambiguity Score at key stage transitions and enforces a hard gate at Stage 6.

Stage 6 cannot close under normal conditions unless:

1. Final Ambiguity Score is ≤ 0.2
2. No dimension falls below its floor threshold

If the gate fails, `dksu` returns to the appropriate earlier stage rather than handing off an incomplete plan.

**Explicit user override**: if you say "진행해" or an equivalent override signal after a gate failure, `dksu` may proceed — but only after issuing a warning and recording the unresolved ambiguity under "Known Risks at Handoff" in the decision log. The override must be acknowledged and logged; silent bypass is not allowed.

This is a planning readiness check, not a code or build gate.

---

## What this plugin does NOT do

- Write code
- Run tests or verify runtime behavior
- Manage git, issues, or deployments
- Access your vault or any external file system
- Activate `designer-dksu` without an explicit request

---

## Structure

```
dksu-planning-kit/
├── .claude-plugin/
│   └── plugin.json
├── agents/
│   ├── dksu.md
│   ├── researcher-dksu.md
│   ├── critical-dksu.md          # internal Stage 5 critic
│   └── designer-dksu.md          # opt-in
├── commands/
│   └── plan-dksu.md              # /plan-dksu command definition
├── skills/
│   ├── deep-dive/
│   ├── no-more-ambiguity/        # Ambiguity Score and Final Gate
│   ├── reference-research/
│   ├── persona-scenario/
│   └── scenario-test/
├── governance/
│   ├── planning-workflow.md
│   ├── conventions.md
│   ├── trigger-registry.md
│   ├── resolver-table.md
│   ├── skill-registry.md
│   └── agent-skill-matrix.md
├── templates/
│   └── (8 planning templates)
├── references/
│   └── (8 reference documents)
├── README.md
├── README.ko.md
├── EXAMPLE_SESSION.md
└── LICENSE
```

At runtime, planning artifacts land in `.dksu/` inside your project (not inside this plugin directory):

```
your-project/
└── .dksu/
    ├── drafts/
    ├── plans/
    └── evidence/
```

---

## License

MIT. See `LICENSE`.
