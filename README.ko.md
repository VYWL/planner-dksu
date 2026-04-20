# dksu-planning-kit

[English README](./README.md)

Claude Code용 **기획 OS**입니다. 코딩 플러그인이 아니라, 구현 전에 필요한 문제정의·레퍼런스조사·페르소나/시나리오 설계·요구사항 구조화·작업설계를 끝까지 밀어붙이는 planning bundle입니다.

---

## 이 플러그인이 하는 일

- 문제를 선명하게 정의한다
- 사용자와 시나리오를 구체화한다
- 외부 레퍼런스를 비교 조사한다
- 요구사항을 구조화한다
- 검증 가능한 작업설계를 만든다
- 결정 로그를 남긴다

**하지 않는 일**:
- 코드 작성
- 구현 오케스트레이션
- 런타임 검증
- git/issue/deploy 작업

---

## 포함된 구성

### Agents

| Agent | 역할 | 기본 상태 |
|---|---|---|
| `dksu` | planning orchestrator | 활성 |
| `researcher-dksu` | insane-search reference layer를 사용하는 근거 기반 조사 specialist | 활성 |
| `designer-dksu` | UX/흐름/시각 방향 기획 | **opt-in** |

### Skills

| Skill | 용도 |
|---|---|
| `deep-dive` | 문제 프레이밍, 원인/가정 정리 |
| `reference-research` | 레퍼런스 조사, 비교, 추천 |
| `persona-scenario` | 페르소나, 유저 저니, 시나리오 |
| `scenario-test` | 테스트 정의, 검증 설계, 커버리지 |

### Governance

- `planning-workflow.md`
- `conventions.md`
- `trigger-registry.md`
- `resolver-table.md`
- `skill-registry.md`
- `agent-skill-matrix.md`

### Templates

- `problem-definition.md`
- `persona.md`
- `user-journey.md`
- `scenario.md`
- `requirement-spec.md`
- `decision-log.md`
- `test-case.md`
- `coverage-matrix.md`

### References

planning과 research에 필요한 8개 reference 문서를 self-contained 형태로 포함합니다.

### 업그레이드된 researcher-dksu

`researcher-dksu`는 이제 insane-search의 상위 프로토콜만 참고하지 않습니다. `skills/reference-research/references/` 아래 흡수된 reference layer를 기준으로 surface-aware routing을 수행합니다.

- X/Twitter, Naver/한국어 검색, media surface, public API / JSON-capable platform, feed-friendly source, generic public page, blocked/challenge-heavy page를 구분해 접근합니다.
- **quick mode**에서는 먼저 읽을 branch를 정하고, 짧지만 provenance가 붙은 확인 결과를 반환합니다.
- **deep mode**에서는 첫 reference branch와 support/escalation branch를 명시한 뒤 비교·판단·추천을 정리합니다.
- 여전히 planning-only 범위입니다. 런타임 우회나 도구 실행을 보장하는 것이 아니라, routing knowledge와 evidence handling이 강화된 것입니다.

---

## Planning Workflow

이 plugin은 6단계 planning loop를 가집니다.

1. Problem Framing & Analysis
2. Clarification & Persona Design
3. Reference Research
4. Requirement Structuring
5. Task Plan & Validation Design
6. Decision Log

여기서 종료합니다. 구현·런타임 검증·배포는 이 plugin 범위 밖입니다.

---

## designer-dksu는 opt-in

`designer-dksu`는 **기본 비활성**입니다.
아래처럼 명시적으로 요청할 때만 사용합니다.

```text
designer-dksu로 UX 명세 작성해줘
디자이너 에이전트 써서 화면 흐름 정의해줘
```

요청이 없으면 `dksu`와 `researcher-dksu` 중심으로 planning을 닫습니다. 이때 `researcher-dksu`는 입력 surface에 맞는 reference branch를 먼저 고른 뒤 근거를 수집합니다.

---

## 설치 / 사용

### 1. 현재 standalone repo로 사용

이 repo 자체가 standalone plugin repo입니다.

필요하면 Claude plugin 디렉토리로 복사:

```bash
cp -r ./dksu-planning-kit "$CLAUDE_PLUGIN_DIR/dksu-planning-kit"
```

### 2. 시작 예시

```text
dksu로 기획 시작해줘.
문제: 해커톤 팀이 아이디어를 빠르게 검증할 수 있는 도구가 없다.
```

### 3. 예시 세션 보기

`EXAMPLE_SESSION.md` 참고

---

## 디렉토리 구조

```text
dksu-planning-kit/
├── .claude-plugin/
│   └── plugin.json
├── agents/
├── skills/
├── governance/
├── templates/
├── references/
├── README.md
├── README.ko.md
├── EXAMPLE_SESSION.md
└── LICENSE
```

---

## 라이선스

MIT
