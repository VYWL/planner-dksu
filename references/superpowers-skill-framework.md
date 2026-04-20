# Superpowers Skill Framework

obra/superpowers는 에이전트의 행동 규율을 코드처럼 정의하는 스킬 프레임워크다. 스킬을 "읽기 좋은 문서"가 아니라 "행동을 바꾸는 workflow code"로 취급하는 점이 핵심이며, 우리 워크플로우의 하드 게이트, anti-pattern 문서화, 함수 단위 검증 의무화의 설계 근거가 됐다.

Related: agent-architecture (base architecture doc), workflow-agent-mapping (base architecture doc), [Elvis Sun / Zoe Orchestrator Pattern](./elvis-zoe-orchestrator-pattern.md), [Oh-My-ClaudeCode Orchestration Platform](./omc-orchestration-platform.md)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| GitHub | [obra/superpowers](https://github.com/obra/superpowers) |
| 규모 | ~157K stars · 14개 스킬 |
| 역할 | Discipline layer — "어떻게 생각하고 일하게 만들 것인가" |

### 주요 스킬 사례

| 스킬 | 하는 일 | 패턴 |
|------|---------|------|
| **brainstorming** | 창작 작업의 필수 진입점. 디자인 승인 전까지 구현 차단 | 하드 게이트 |
| **writing-plans** | 태스크를 2~5분 단위 스텝으로 분해 | 세밀한 분해 |
| **test-driven-development** | RED-GREEN-REFACTOR를 iron law로 강제 | Iron law |
| **systematic-debugging** | 4단계 조사 프로세스 (추측 금지) | 체계적 절차 |
| **dispatching-parallel-agents** | 독립 도메인별 병렬 조사 | 도메인 격리 |
| **subagent-driven-development** | 태스크마다 fresh 서브에이전트 + 2단계 리뷰 | 리뷰 게이트 |

### 추출한 설계 원칙 (10개)

1. **하드 게이트** — 단계를 건너뛸 수 없다
2. **Iron law** — 예외 없는 핵심 규칙
3. **프로세스 다이어그램** — Graphviz DOT으로 흐름 시각화
4. **Good vs Bad 예시** — 옳은 것과 틀린 것을 나란히
5. **순서 있는 체크리스트** — 순서를 바꿀 수 없다
6. **Supporting artifacts** — 본체와 보조 자료 분리
7. **Terminal state** — 스킬이 끝나면 다음 스킬이 명시
8. **Self-review gate** — 제출 전 자기 검증
9. **No placeholder rule** — 모호한 지시 금지
10. **Escalation protocol** — 막히면 상위 보고

### 스킬 아티팩트 구조

```
skills/{name}/
├── SKILL.md              ← 메인 스킬 정의 (하드 게이트, 체크리스트, anti-pattern)
├── techniques/           ← 보조 기법 파일들
│   ├── technique-a.md
│   └── technique-b.md
└── scripts/              ← 검증 스크립트 (있는 경우)
```

### 우리 체계에 적용한 부분

- **planning-workflow.md의 HARD GATE** (Step 2→3 사용자 승인) — brainstorming의 하드 게이트 패턴
- **스킬의 anti-pattern 섹션** — 각 스킬마다 "하지 말 것" 명시
- **함수 단위 검증 의무화** — TDD 스킬의 "lint ≠ 검증" 원칙
- **Terminal state** — 스킬 종료 시 다음 워크플로우 단계 명시
