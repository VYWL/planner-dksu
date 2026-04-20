# gbrain Conventions and Resolver

gbrain은 에이전트 시스템의 라우팅 규칙과 행동 규약을 별도 파일로 분리하는 패턴을 제시한다. RESOLVER.md 하나에 모든 trigger → skill/agent 매핑을 집중하고, conventions 파일에 cross-cutting 행동 규칙을 모으는 구조다. thin harness/fat skills 원칙도 여기서 왔다. trigger registry, resolver-table, conventions 문서의 직접적인 설계 근거다.

Related: agent-architecture (base architecture doc), [gstack Sprint Framework](./gstack-sprint-framework.md)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| 역할 | Conventions/resolver layer — "어떤 규칙으로 라우팅하고, 어떻게 행동할 것인가" |
| 핵심 패턴 | RESOLVER.md, conventions, brain-first lookup, thin harness/fat skills |

### 핵심 패턴 분석

#### RESOLVER.md 패턴

모든 trigger → skill/agent 매핑을 단일 파일에서 관리한다.

```
trigger phrase → skill/agent → precedence → source file
```

- 라우팅 결정의 단일 권위 파일
- trigger phrase 원문은 registry에만 존재. resolver는 trigger_id만 참조
- 충돌 해소 규칙(precedence ladder)도 이 파일에서 관리

이 패턴이 `governance/trigger-registry.md` + `resolver-table.md` 구조로 번역됐다. 단, registry(trigger 목록)와 resolver(충돌 해소 규칙)를 두 파일로 분리해 책임을 더 명확히 했다.

#### Conventions 문서

모든 에이전트/스킬에 공통 적용되는 행동 규칙을 단일 파일로 분리한다.

- 단계 순서(workflow 책임)와 행동 규칙(conventions 책임)을 분리
- 각 규칙은 rationale(실패 모드 방어)과 enforcement point를 함께 명시

`governance/conventions.md`의 설계 근거다.

#### Brain-first Lookup

구현 전 지식 베이스를 먼저 조회하는 원칙이다.

- 새 작업 시작 전 knowledge base 조회 시도
- 이미 해결된 문제를 재발명하지 않는 원칙

#### Thin Harness / Fat Skills

에이전트 파일은 얇게, 실제 방법론은 스킬에 집중하는 원칙이다.

```
에이전트 파일 (thin harness):
  - 역할 경계 정의
  - invoke contract
  - routing 규칙

스킬 파일 (fat skills):
  - 실제 방법론
  - 단계별 절차
  - anti-pattern
  - terminal state
```

에이전트 파일이 비대해지면 역할 경계가 흐려지고 스킬 재사용이 어려워진다. 에이전트는 "무엇을 할 것인가"를 정의하고, 스킬은 "어떻게 할 것인가"를 담당한다.

### Adopt / Adapt / Reject 요약

| 패턴 | 결정 | 내부 귀속처 |
|------|------|------------|
| RESOLVER.md (단일 라우팅 테이블) | **Adopt** | `governance/trigger-registry.md` + `resolver-table.md` |
| Conventions 문서 분리 | **Adopt** | `governance/conventions.md` |
| Brain-first lookup | **Adopt** | 지식 베이스 우선 조회 원칙 |
| Thin harness / Fat skills | **Adopt** | skill packaging standard + agent-skill matrix |
| Skill frontmatter | **Adopt** | skill packaging standard |
| Resolver와 conventions 책임 분리 | **Adopt** | 두 파일로 분리 (registry + resolver) |
| gbrain 전체 아키텍처 이식 | **Reject** | 패턴만 채택, 전체 시스템 이식 아님 |
| Brain-first lookup 강제 동기화 | **Reject** | "시도" 수준으로 제한 (오버헤드 방지) |

### 우리 체계에 적용한 부분

- **trigger-registry.md 구조** — RESOLVER.md 패턴을 registry/resolver 두 파일로 분리
- **conventions.md 분리** — workflow의 cross-cutting 규칙을 별도 파일로 정리
- **thin harness 원칙** — 에이전트 파일 슬림화 방향, skill packaging standard 설계 기준
