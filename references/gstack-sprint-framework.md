# gstack Sprint Framework

gstack은 trigger-driven routing과 명시적 스프린트 구조를 결합한 워크플로우 프레임워크다. 에이전트가 trigger phrase를 감지해 자동으로 적절한 스킬/에이전트를 선택하는 패턴과, 스킬 변경 검증을 3계층으로 나누는 QA 전략이 핵심이다. trigger registry 설계와 skill QA 전략의 직접적인 설계 근거가 됐다.

Related: agent-architecture (base architecture doc), workflow-agent-mapping (base architecture doc), [gbrain Conventions and Resolver](./gbrain-conventions-resolver.md)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| 역할 | Sprint/workflow framework — "언제 어떤 스킬을 쓸 것인가" |
| 핵심 패턴 | trigger-driven routing, preamble-tier, 3-tier skill QA |

### 스프린트 구조

gstack은 작업을 Think/Plan/Build/Test/Ship/Reflect 6단계 스프린트로 구성한다.

| 단계 | 역할 | 기획 워크플로우 매핑 |
|------|------|--------------|
| **Think** | 문제 정의, 가설 수립 | Step 1 문제 프레이밍 & 분석 |
| **Plan** | 작업 계획, 테스트 정의 | Step 2 명확화 & 페르소나 설계 |
| **Build** | 구현 | (기획 워크플로우 범위 밖) |
| **Test** | 검증 | Step 5 작업 계획 & 검증 설계 |
| **Ship** | 배포/문서화 | (기획 워크플로우 범위 밖) |
| **Reflect** | 회고, 운영 지식 보존 | Step 6 의사결정 로그 |

### 핵심 패턴 분석

#### Trigger-driven Routing

에이전트가 사용자 입력에서 trigger phrase를 감지하면 사전 정의된 skill/agent로 자동 라우팅한다.

```
사용자 입력 → trigger phrase 감지 → skill/agent 선택 → 실행
```

- trigger phrase는 agent 파일에 명시적으로 선언
- 충돌(동일 phrase, 다른 skill) 발생 시 precedence 규칙으로 해소
- proactive routing은 명시적 조건에서만 허용

#### AGENTS.md 패턴

에이전트별 skill catalog를 명시적으로 선언하는 파일 구조다.

```yaml
agents:
  - name: researcher
    must_skills: [reference-research]
    may_skills: [deep-dive]
    never_skills: [frontend-ui-ux]
    triggers:
      - "조사해줘"
      - "레퍼런스 찾아줘"
```

이 패턴이 agent-skill matrix의 Must/May/Never 계약 형식으로 번역됐다.

#### 3-Tier Skill QA

스킬 변경 시 검증 비용을 계층화한다.

| Tier | 이름 | 적용 대상 | 방법 |
|------|------|----------|------|
| **Tier 1** | Static validation | SKILL.md 구조/복사 변경 | 파일 구조 검사, frontmatter 유효성 |
| **Tier 2** | LLM-as-judge | reference/, templates/ 추가 | 대표 시나리오 behavioral 검증 |
| **Tier 3** | Runtime E2E | trigger registry, resolver, scripts/ | 실제 실행 경로 검증 |

모든 변경에 Tier 3를 강제하지 않는다. 변경 범위에 맞는 최소 충분 tier를 선택한다.

#### Preamble-tier

에이전트 호출 전 공통 컨텍스트를 주입하는 패턴이다. 이 plugin에서는 agent 파일의 공통 규칙 섹션으로 흡수했다. 별도 preamble 파일은 생성하지 않는다.

### Adopt / Adapt / Reject 요약

| 패턴 | 결정 | 내부 귀속처 |
|------|------|------------|
| Trigger-driven routing | **Adopt** | `governance/trigger-registry.md` |
| AGENTS.md (Must/May/Never) | **Adopt** | `governance/agent-skill-matrix.md` |
| 3-tier skill QA | **Adopt** | skill QA 전략 |
| Think/Plan/Build/Test/Ship/Reflect | **Adapt** | 기획 단계만 추출 |
| Frontmatter 기반 스킬 메타데이터 | **Adopt** | skill packaging standard |
| Collision resolution | **Adopt** | `governance/resolver-table.md` |
| Skill generation (동적) | **Reject** | governance 복잡도 이유 |
| Preamble 파일 | **Adapt** | agent 파일 공통 섹션으로 흡수 |

### 우리 체계에 적용한 부분

- **trigger-registry.md 설계 모델** — trigger phrase → skill/agent 매핑의 단일 권위 파일 구조
- **agent-skill matrix의 Must/May/Never 형식** — AGENTS.md 패턴을 번역
- **skill QA 3계층** — 변경 범위에 따른 검증 강도 선택 규칙
