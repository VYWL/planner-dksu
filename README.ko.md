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
| `dksu` | planning orchestrator. 여섯 단계 기획 루프 전체 소유 | 활성 |
| `researcher-dksu` | insane-search reference layer를 사용하는 근거 기반 조사 specialist | 활성 |
| `critical-dksu` | Stage 5 Breadth-Keeper. 치명적 누락·미검증 가정·5W1H 취약점·AI-Slop 탐지. `dksu`가 내부 호출; 사용자 직접 호출 불가 | 내부 |
| `designer-dksu` | UX/흐름/시각 방향 기획 | **opt-in** |

### Skills

| Skill | 용도 |
|---|---|
| `deep-dive` | 문제 프레이밍, 원인/가정 정리 |
| `no-more-ambiguity` | 모호성 점수 계산, 단계별 명확도 게이트, Stage 6 Final Gate 강제 |
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

| 단계 | 이름 | 주요 산출물 |
|------|------|------------|
| 1 | Problem Framing & Analysis | 문제 정의, 범위 맵, 가정, 미지 항목 |
| 2 | Clarification & Persona Design | 모호성 해소 결정, 페르소나, 시나리오 개요 |
| 3 | Reference Research | 근거 기반 비교 분석, 레퍼런스 요약 |
| 4 | Requirement Structuring | 요구사항 명세, 수용 기준, 의존성 |
| 5 | Task Plan & Validation Design | 태스크 계획, 검증 케이스, 커버리지 매트릭스 |
| 6 | Decision Log | 의사결정 기록, 미해결 리스크, 이관 항목 |

여기서 종료합니다. 구현·런타임 검증·배포는 이 plugin 범위 밖입니다.

---

## designer-dksu는 opt-in

`designer-dksu`는 **기본 비활성**입니다. 자동으로 활성화되지 않습니다.
아래처럼 명시적으로 요청할 때만 사용합니다.

```text
designer-dksu로 UX 명세 작성해줘
디자이너 에이전트 써서 화면 흐름 정의해줘
```

요청이 없으면 `dksu`와 `researcher-dksu` 중심으로 planning을 닫습니다. 이때 `researcher-dksu`는 입력 surface에 맞는 reference branch를 먼저 고른 뒤 근거를 수집합니다.

---

## 설치 / 사용

### 에이전트 직접 실행 설치

AI 에이전트가 "dksu 설치해줘" 또는 "install dksu-planning-kit" 요청을 받아 이 README를 읽고 있다면, 아래 블록을 그대로 실행하면 됩니다. 사람의 개입 없이 완료됩니다.

**전제 조건:** 레포가 로컬에 클론되어 있어야 합니다. 없다면 먼저 클론하세요.

```bash
git clone https://github.com/dksu/dksu-planning-kit.git
cd dksu-planning-kit
```

**설치:**

```bash
# 레포 루트에서 실행
bash ./scripts/sync-agents.sh && bash ./scripts/sync-commands.sh
```

설치되는 파일:

| 파일 | 설치 경로 |
|---|---|
| `agents/dksu.md` | `~/.config/opencode/agents/dksu.md` |
| `agents/researcher-dksu.md` | `~/.config/opencode/agents/researcher-dksu.md` |
| `agents/designer-dksu.md` | `~/.config/opencode/agents/designer-dksu.md` |
| `agents/critical-dksu.md` | `~/.config/opencode/agents/critical-dksu.md` |
| `commands/plan-dksu.md` | `~/.claude/commands/plan-dksu.md` |

**설치 확인:**

```bash
ls ~/.config/opencode/agents/dksu.md && \
ls ~/.config/opencode/agents/researcher-dksu.md && \
ls ~/.claude/commands/plan-dksu.md && \
echo "설치 완료."
```

세 파일이 모두 존재하면 마지막에 `설치 완료.`가 출력됩니다.

**설치 후:** Claude Code 세션을 재시작해야 합니다. 세션을 리로드하기 전까지 `/plan-dksu`가 커맨드 팔레트에 나타나지 않습니다.

---

### 1. 현재 standalone repo로 사용

이 repo 자체가 standalone plugin repo입니다.

필요하면 Claude plugin 디렉토리로 복사:

```bash
cp -r ./dksu-planning-kit "$CLAUDE_PLUGIN_DIR/dksu-planning-kit"
```

### 2. opencode 전역 에이전트 동기화 (선택)

번들 에이전트를 opencode 전역 에이전트 경로에서도 사용하려면:

```bash
./scripts/sync-agents.sh
```

수동 복사 예시:

```bash
cp ./agents/dksu.md ~/.config/opencode/agents/
cp ./agents/critical-dksu.md ~/.config/opencode/agents/
```

### 3. Claude Code 전역 커맨드 동기화 (`/plan-dksu` 필수)

Claude Code는 `~/.claude/commands/`에서 슬래시 커맨드를 검색합니다. 플러그인 커맨드 자동 검색이 활성화되지 않은 환경에서는 커맨드 파일을 직접 복사해야 `/plan-dksu`가 커맨드 팔레트에 나타납니다.

```bash
./scripts/sync-commands.sh
```

이 스크립트는 `commands/plan-dksu.md`를 `~/.claude/commands/plan-dksu.md`로 복사합니다. 실행 후 Claude Code 세션을 재시작하거나 리로드해야 커맨드 팔레트가 갱신됩니다.

수동 복사:

```bash
cp ./commands/plan-dksu.md ~/.claude/commands/plan-dksu.md
```

에이전트 동기화(`sync-agents.sh`)와 커맨드 동기화(`sync-commands.sh`)는 별개 작업입니다. 사용하는 도구에 따라 하나 또는 둘 다 실행하면 됩니다.

### 4. `/plan-dksu`로 세션 시작

`/plan-dksu` 커맨드는 `dksu`를 Stage 1 Problem Framing 모드로 활성화합니다.

```
/plan-dksu
/plan-dksu [topic]
/plan-dksu 새로운 결제 시스템 기획
/plan-dksu 해커톤 아이디어 검증 도구
```

슬래시 커맨드가 지원되지 않는 환경에서는 아래 문장으로 동일하게 시작할 수 있습니다.

```
dksu로 기획 시작해줘.
문제: 해커톤 팀이 아이디어를 빠르게 검증할 수 있는 도구가 없다.
```

### 5. 예시 세션 보기

`EXAMPLE_SESSION.md` 참고

---

## 기획 산출물: `.dksu/`

기획 세션 중 생성된 산출물은 프로젝트 루트의 `.dksu/` 아래 세 폴더로 구분됩니다.

```
.dksu/
├── drafts/     # 각 단계에서 작업 중인 문서 (문제 정의, 페르소나, 요구사항 초안 등)
├── plans/      # Stage 6 완료 후 확정된 기획 문서 (Seed 섹션 포함)
└── evidence/   # researcher-dksu가 수집한 레퍼런스 인용, 비교 분석 결과
```

- **`drafts/`** — 각 단계에서 작성 중인 작업 문서를 보관합니다.
- **`plans/`** — Stage 6 완료 후 확정된 기획 문서를 저장합니다. 확정 플랜에는 핵심 전제와 범위를 요약한 Seed 섹션이 포함됩니다. Seed는 별도 파일이 아닌 플랜 문서 내 섹션입니다.
- **`evidence/`** — `researcher-dksu`가 수집한 레퍼런스 인용, 비교 분석 결과, 리서치 아티팩트를 저장합니다.

---

## 모호성 점수와 Final Gate

기획 세션은 `no-more-ambiguity` 스킬을 사용해 다섯 차원(Goal, Constraint, Success Criteria, Context, Scope)에 걸쳐 명확도를 추적합니다. 스킬은 주요 단계 전환 시 Ambiguity Score를 계산하고, Stage 6에서 하드 게이트를 강제합니다.

Stage 6은 아래 두 조건이 모두 충족될 때만 닫힙니다.

1. Final Ambiguity Score ≤ 0.2 (공식: `1 - Σ(clarity_i × weight_i)`)
2. 어떤 차원도 floor threshold 아래로 내려가지 않음

게이트가 실패하면 `dksu`는 해당 단계로 돌아가 미해결 항목을 보완합니다.

**명시적 사용자 오버라이드**: 게이트 실패 후 "진행해" 또는 동등한 오버라이드 신호를 입력하면, `dksu`는 진행할 수 있습니다. 단, 반드시 경고를 발행하고 미해결 모호성을 의사결정 로그의 "Known Risks at Handoff" 항목에 기록해야 합니다. 오버라이드는 반드시 인지되고 로그에 남겨야 하며, 무언의 우회(silent bypass)는 허용되지 않습니다.

이것은 기획 준비 상태 확인이며, 코드나 빌드 게이트가 아닙니다.

---

## 디렉토리 구조

```text
dksu-planning-kit/
├── .claude-plugin/
│   └── plugin.json
├── agents/
│   ├── dksu.md
│   ├── researcher-dksu.md
│   ├── critical-dksu.md          # 내부 Stage 5 비평가
│   └── designer-dksu.md          # opt-in
├── commands/
│   └── plan-dksu.md              # /plan-dksu 커맨드 정의
├── skills/
│   ├── deep-dive/
│   ├── no-more-ambiguity/        # 모호성 점수 및 Final Gate
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
│   └── (8개 기획 템플릿)
├── references/
│   └── (8개 레퍼런스 문서)
├── scripts/
│   ├── sync-agents.sh            # opencode 전역 에이전트 동기화
│   └── sync-commands.sh          # Claude Code 전역 커맨드 동기화
├── README.md
├── README.ko.md
├── EXAMPLE_SESSION.md
└── LICENSE
```

런타임 기획 산출물은 플러그인 디렉터리가 아닌 프로젝트 루트의 `.dksu/`에 저장됩니다.

```
your-project/
└── .dksu/
    ├── drafts/
    ├── plans/
    └── evidence/
```

---

## 라이선스

MIT
