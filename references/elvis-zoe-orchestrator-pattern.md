# Elvis Sun / Zoe Orchestrator Pattern

Elvis Sun이 설명한 Zoe 오케스트레이터 패턴에서, **planning plugin에 직접 도움이 되는 부분만** 추려 정리한 레퍼런스 문서다. 핵심은 컨텍스트 제로섬, memory 중심 운영, 오케스트레이터와 specialist의 책임 분리다.

Related: agent-architecture (base architecture doc), agent-roles (base architecture doc), workflow-agent-mapping (base architecture doc), [Context Engineering Principles](./context-engineering-principles.md)

---

## Detail

### 개요

Elvis Sun은 하나의 에이전트에 모든 일을 몰아넣지 않고, 상위 오케스트레이터가 비즈니스 맥락과 의사결정 기록을 들고 specialist에게 좁고 선명한 일을 넘기는 구조를 강조한다. planning plugin 관점에서 중요한 점은 다음 세 가지다.

1. **컨텍스트는 제로섬**이다.
2. **기억과 결정 근거는 중앙 저장소**에 남겨야 한다.
3. **전문 역할은 분리**하고, 오케스트레이터는 방향과 handoff 품질을 책임진다.

- **출처**: Elvis Sun SNS 게시글 기반 (정확한 URL 없음)
- **시기**: 2025~2026년

### planning 관점 핵심 해석

#### 1. 컨텍스트 제로섬

하나의 에이전트가 사용자 맥락, 시장 맥락, 과거 결정, 세부 실행 정보까지 동시에 들고 있으면 품질이 떨어진다. 따라서 planning 오케스트레이터는 **왜 이 일을 하는가**, **무엇을 결정해야 하는가**, **어떤 제약이 있는가**에 집중해야 한다.

#### 2. Memory-first 운영

과거 결정, 미팅 메모, 사용자 제약, 조사 결과가 흩어져 있으면 같은 질문을 반복하게 된다. Zoe 패턴은 중앙 memory를 통해 같은 맥락을 재구성하는 비용을 줄인다는 점에서 planning system에 유효하다.

#### 3. Specialist delegation

오케스트레이터는 모든 전문 작업을 직접 수행하지 않는다. 대신 적절한 specialist에게 필요한 범위만 전달하고, 다시 planning packet으로 회수한다. 이 패턴은 planning plugin에서 `researcher-dksu`, `designer-dksu` 같은 specialist 분리의 근거가 된다.

---

## Extracted Planning Patterns

| 패턴 | planning plugin에 중요한 이유 |
|------|------------------------------|
| **컨텍스트 제로섬** | planning owner가 문제 정의와 의사결정 품질에 집중하게 만든다 |
| **오케스트레이터 ↔ specialist 분리** | research, design, structuring 책임을 뒤섞지 않게 한다 |
| **memory 중심 운영** | 이전 결정과 제약을 재사용 가능하게 보존한다 |
| **정밀 handoff** | specialist 호출을 막연한 요청이 아니라 decision-ready payload로 바꾼다 |
| **근거 보존** | 결과만이 아니라 왜 그런 판단이 나왔는지 남긴다 |

---

## Adaptation for dksu-planning-kit

Elvis의 Zoe 패턴을 dksu planning 구조에 맞게 해석하면 아래와 같다.

| Elvis 구조 | dksu planning 구조 | 역할 |
|-----------|--------------------|------|
| Zoe (Orchestrator) | `dksu` | planning owner, 문제 정의, 방향 정리, specialist handoff |
| Central memory | planning artifacts / decision logs / research notes | 근거, 제약, 과거 결정을 보존 |
| Research specialist | `researcher-dksu` | 외부 근거 수집과 비교 판단 |
| Design specialist | `designer-dksu` | persona, flow, UX 방향 정리 (opt-in) |

### 구조 비교 다이어그램

```text
Elvis planning pattern:
  request / meeting / memory
      ↓
  orchestrator
      ↓
  specialist delegation
      ↓
  structured decision packet

dksu planning kit:
  사용자 요청
      ↓
  dksu
      ├─ researcher-dksu (조사)
      ├─ designer-dksu (UX 기획, opt-in)
      └─ planning artifacts (분석/요구사항/검증/결정 로그)
```

---

## What to Keep

- 하나의 owner가 planning packet의 최종 구조를 책임진다.
- specialist는 더 좁은 질문과 더 깊은 방법론을 가진다.
- memory와 decision rationale을 남겨 다음 작업자가 다시 묻지 않게 한다.
- 오케스트레이터는 실행자가 아니라 **방향과 기준의 관리자**로 남는다.

## What Not to Import

- implementation execution details
- 운영 자동화 세부사항
- delivery-stage review mechanics
- tool-specific execution mechanics

planning plugin이 가져갈 것은 **역할 분리 원리와 memory 운영 방식**이지, delivery machinery가 아니다.

---

## One-line takeaway

> 좋은 planning system은 모든 일을 혼자 하는 에이전트를 만드는 것이 아니라, 가장 중요한 맥락을 쥔 오케스트레이터가 specialist를 정확히 부르고 근거를 보존하게 만드는 구조다.
