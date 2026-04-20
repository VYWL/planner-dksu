# Trigger Registry

## Purpose

This document inventories the plugin-local planning triggers recognized by this bundle. Only rows listed here are governance-protected for routing and collision handling.

---

## Row Schema

| Field | Description |
|---|---|
| `trigger_id` | Unique row identifier |
| `scope` | Always `plugin` |
| `trigger_text` | Phrase or invocation pattern |
| `match_kind` | `exact`, `phrase`, `contextual`, or `explicit-command` |
| `surface_type` | `skill` or `agent` |
| `surface_path` | Plugin-local declaration path |
| `owner` | Target skill or agent |
| `status` | `active`, `experimental`, or `deprecated` |
| `collision_group` | Resolver group id or `null` |

---

## Registry

### Skills

| trigger_id | scope | trigger_text | match_kind | surface_type | surface_path | owner | status | collision_group |
|---|---|---|---|---|---|---|---|---|
| pkit-deep-dive-001 | plugin | "딥다이브", "근본 원인", "5 Whys", "root cause" | phrase | skill | `skills/deep-dive/SKILL.md` | `deep-dive` | active | null |
| pkit-reference-research-001 | plugin | "레퍼런스 조사", "벤치마크", "reference research", "근거 조사" | phrase | skill | `skills/reference-research/SKILL.md` | `reference-research` | active | `col-001` |
| pkit-persona-scenario-001 | plugin | "페르소나", "사용자 시나리오", "유저 저니", "persona", "scenario" | phrase | skill | `skills/persona-scenario/SKILL.md` | `persona-scenario` | active | null |
| pkit-scenario-test-001 | plugin | "테스트 정의", "시나리오 테스트", "커버리지", "validation design" | phrase | skill | `skills/scenario-test/SKILL.md` | `scenario-test` | active | null |

### Agents

| trigger_id | scope | trigger_text | match_kind | surface_type | surface_path | owner | status | collision_group |
|---|---|---|---|---|---|---|---|---|
| pkit-dksu-001 | plugin | "기획 정리", "요구사항 구조화", "planning packet" | contextual | agent | `agents/dksu.md` | `dksu` | active | null |
| pkit-researcher-dksu-001 | plugin | "조사해", "research", "근거 찾아", "reference scan" | contextual | agent | `agents/researcher-dksu.md` | `researcher-dksu` | active | `col-001` |
| pkit-designer-dksu-001 | plugin | "IA 설계", "화면 구조", "UX spec", "service flow sketch" | contextual | agent | `agents/designer-dksu.md` | `designer-dksu` | active | null |

---

## Collision Summary

| collision_id | trigger_ids involved | collision type |
|---|---|---|
| col-001 | `pkit-reference-research-001`, `pkit-researcher-dksu-001` | overlap |

---

## Operating Rules

1. Register only plugin-local planning rows here.
2. When two rows overlap, assign the same `collision_group` on both rows.
3. Change trigger text by adding a new row and deprecating the old row.
4. Keep trigger text out of `resolver-table.md`.
5. Keep agent-only wording and skill-only wording distinct whenever possible.

---

## Boundary Rules

- This registry stores trigger facts only.
- Winner logic belongs in `resolver-table.md`.
- Metadata belongs in `skill-registry.md`.
