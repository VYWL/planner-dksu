# Example Session

## Goal

해커톤이나 신규 프로젝트 킥오프에서 `dksu-planning-kit`를 어떻게 쓰는지 보여주는 짧은 예시 세션이다.

---

## Scenario

문제: "해커톤 팀이 아이디어를 빠르게 검증할 수 있는 도구가 없다."

목표:
- 문제를 명확히 정의
- 대상 사용자 가설 수립
- 레퍼런스 조사
- 요구사항 구조화
- 검증 가능한 작업설계 생성

---

## Example Conversation

### 1. Start with `dksu`

```text
dksu로 기획 시작해줘.
문제: 해커톤 팀이 아이디어를 빠르게 검증할 수 있는 도구가 없다.
```

예상 동작:
- Stage 1: Problem Framing 시작
- 문제 statement, 범위, 가정, unknown 정리
- 필요 시 bounded options로 clarification

---

### 2. Escalate to research when evidence matters

```text
이 아이디어에 대해 비슷한 서비스 5개 조사해줘.
왜 차별화가 가능한지도 판단해줘.
```

예상 동작:
- `dksu`가 `researcher-dksu` 위임
- `researcher-dksu`가 quick/deep 판단
- 결과물:
  - evidence-backed findings
  - comparison matrix
  - recommendation

---

### 3. Use persona/scenario framing

```text
타깃 사용자를 2~3개 페르소나로 정리하고,
각 페르소나의 문제 상황 시나리오를 써줘.
```

예상 동작:
- `persona-scenario` 사용
- 산출물:
  - persona
  - problem story
  - user journey
  - scenario

---

### 4. Optional: bring in designer-dksu

```text
designer-dksu로 IA랑 화면 흐름 초안까지 같이 잡아줘.
```

예상 동작:
- `designer-dksu`는 기본 비활성이므로 이 요청이 있을 때만 사용
- 산출물:
  - flow structure
  - UX direction
  - design-level planning notes

---

### 5. Close with validation planning

```text
이 기획이 끝났다고 볼 수 있는 테스트/검증 기준도 같이 정리해줘.
```

예상 동작:
- `scenario-test` 사용
- 산출물:
  - test cases
  - coverage matrix
  - task-ready validation plan

---

## Final Output Packet

정상적으로 끝나면 다음이 한 세트로 나온다.

- Problem Definition
- Persona
- User Journey
- Scenario
- Reference Findings
- Requirement Spec
- Test Cases
- Coverage Matrix
- Decision Log

이 시점에서 planning plugin의 역할은 끝난다.
구현은 다른 시스템이나 다른 workflow가 이어받는다.
