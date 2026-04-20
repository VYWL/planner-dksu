# insane-search Adaptive Research Protocol

insane-search는 원래 차단된 웹 접근을 집요하게 우회하는 조사 프로토콜이었지만, 현재 `dksu-planning-kit`에는 **runtime 도구 묶음이 아니라 reference-layer-driven planning adaptation** 형태로 전면 흡수됐다. 이제 이 문서는 "패턴 몇 개를 참고했다" 수준이 아니라, `skills/reference-research/references/` 아래 12개 레퍼런스 문서, `agents/researcher-dksu.md`, `skills/reference-research/SKILL.md`가 어떻게 하나의 운영 모델로 정렬되었는지를 설명하는 overview다.

Related: agent-roles (base architecture doc)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| GitHub | [fivetaku/insane-search](https://github.com/fivetaku/insane-search) |
| 현재 역할 | Research routing knowledge layer overview |
| 흡수 단위 | `skills/reference-research/references/` 12개 문서 + `researcher-dksu.md` + `reference-research/SKILL.md` |
| 핵심 원칙 | intent routing, reference-layer selection, support-layer enrichment, deterministic escalation, provenance/failure reporting |

### full absorption이 의미하는 것

현재 상태의 full absorption은 다음을 뜻한다.

1. **상위 슬로건만 반영한 상태가 아니다**
   - 이전처럼 "insane-search inspired" 수준이 아니라, 실제로 12개 upstream reference가 `skills/reference-research/references/` 아래 self-contained 문서로 존재한다.

2. **reference layer가 실제 routing brain이 되었다**
   - `researcher-dksu.md`는 입력 유형과 surface에 따라 어떤 reference를 먼저 읽는지 명시한다.
   - `reference-research/SKILL.md`는 workflow Step 2에서 `input classification -> first branch selection`을 강제한다.

3. **planning-only adaptation으로 흡수됐다**
   - Jina, Playwright, TLS impersonation, media extraction 같은 upstream 전술은 plugin의 hard dependency가 아니다.
   - 이들은 "어떤 상황에서 어떤 branch를 consult해야 하는가"를 설명하는 routing knowledge로만 보존된다.

### 현재 흡수 구조

```text
insane-search overview
  ├─ skills/reference-research/references/  (12-file reference layer)
  │   ├─ platform-first branches
  │   ├─ generic fallback / escalation branches
  │   └─ support-layer branches
  ├─ agents/researcher-dksu.md             (reference-driven agent routing)
  └─ skills/reference-research/SKILL.md    (reference operating system)
```

### reference layer 구성

#### 1) Platform-first branches

특정 입력 surface가 명확할 때 generic search보다 먼저 읽는 문서들이다.

- `twitter.md`
- `naver.md`
- `media.md`
- `public-api.md`
- `json-api.md`

이 계층은 "무조건 검색부터 한다"가 아니라, **surface가 분명하면 그 surface에 맞는 branch를 먼저 탄다**는 원칙을 담당한다.

#### 2) Generic fallback / escalation branches

surface가 불명확하거나, 차단되었거나, 더 강한 에스컬레이션이 필요한 경우를 담당한다.

- `fallback.md`
- `tls-impersonate.md`
- `playwright.md`
- `cache-archive.md`

이 계층은 runtime bypass를 실행하겠다는 약속이 아니라, **어떤 실패 신호에서 어떤 escalation branch를 검토해야 하는가**를 설명한다.

#### 3) Support-layer branches

부분 성공, 메타데이터 회수, 피드 발견 같은 보조 판단층이다.

- `metadata.md`
- `rss.md`
- `jina.md`

이 계층은 직접 본문을 얻지 못해도 structured signal, feed, lightweight public read를 통해 판단 품질을 보강한다.

### researcher-dksu에 반영된 상태

`agents/researcher-dksu.md`는 이제 insane-search의 상위 패턴만 유지하는 문서가 아니다. 현재는 다음을 명시한다.

- reference layer를 **dependency bundle이 아니라 routing knowledge layer**로 취급
- quick mode에서도 **initial reference branch**를 명시
- deep mode에서는 **reference layer를 명시적으로 소비하는 것**을 필수화
- 입력/표면별 routing table 제공
  - X/Twitter → `twitter.md` first
  - Korean keyword / Naver → `naver.md` first
  - media URL → `media.md` first
  - generic public article/docs → `fallback.md` first
  - blocked page / WAF / challenge → `fallback.md` 후 `tls-impersonate.md`, `playwright.md`, `cache-archive.md`
- provenance ledger와 failure reporting 유지

즉, agent는 이제 insane-search를 "생각 방식"으로만 차용하는 것이 아니라, **파일명 단위 reference consumption**을 실제 계약으로 가진다.

### reference-research 스킬에 반영된 상태

`skills/reference-research/SKILL.md`는 현재 reference layer의 canonical home으로 동작한다.

핵심 변화는 다음과 같다.

- `references/`를 **home of the reference layer**, **routing brain**으로 선언
- workflow에 `Step 2: input classification -> first branch selection` 추가
- quick mode와 deep mode 모두 reference branch naming과 연결
- structured return format에 `Route Used` 섹션 추가
- support-layer enrichment와 deterministic escalation을 workflow 본문에 통합

즉, 스킬 문서는 더 이상 일반적인 레퍼런스 조사 가이드가 아니라, **reference operating system** 역할을 한다.

### 전체 프로토콜 흐름 (현재 상태)

```text
입력 수신
  │
  ▼
1. Intent Routing
   URL / handle / keyword / mixed 분류
  │
  ▼
2. Reference-layer Selection
   platform-first / generic fallback / support-layer 중 첫 branch 선택
  │
  ▼
3. Evidence Collection
   선택된 branch 기준으로 조사 경로 설계 및 증거 수집
  │
  ▼
4. Support-layer Enrichment
   metadata / rss / jina로 부분 성공 보강
  │
  ▼
5. Deterministic Escalation
   blocked / challenge / weak evidence 시 escalation branch 검토
  │
  ▼
6. Provenance Ledger
   source / retrieval path / reference branch / confidence 기록
  │
  ▼
7. Failure Reporting
   어디까지 시도했고 무엇이 미확인인지 명시
  │
  ▼
8. Lightweight Judgment Synthesis
   findings + hypothesis comparison + causal explanation + recommendation
```

### Adopt / Adapt / Reject 요약

| 패턴 | 결정 | 현재 귀속처 |
|------|------|------------|
| Intent routing | **Adopt** | `researcher-dksu.md`, `reference-research/SKILL.md` |
| Reference-layer selection | **Adopt** | `references/` + agent routing table + skill workflow |
| Platform-first branches | **Adopt** | `twitter.md`, `naver.md`, `media.md`, `public-api.md`, `json-api.md` |
| Generic fallback / escalation | **Adopt** | `fallback.md`, `tls-impersonate.md`, `playwright.md`, `cache-archive.md` |
| Support-layer enrichment | **Adopt** | `metadata.md`, `rss.md`, `jina.md` |
| Provenance reporting | **Adopt** | agent output contract + skill return format |
| Failure reporting | **Adopt** | agent output contract + skill workflow |
| Runtime dependency bundle 이식 | **Reject** | planning-only boundary 유지 |
| bypass/runtime 실행 보장 주장 | **Reject** | routing knowledge만 흡수 |

### planning-only boundary

이 overview에서 반드시 유지해야 하는 진실은 다음이다.

- plugin은 **runtime crawler/bypass toolkit**이 아니다.
- plugin은 **planning-only research system**이다.
- upstream의 강력한 전술들은 현재 plugin 안에서 **실행 계약**이 아니라 **판단 계약**으로 흡수되었다.
- 따라서 이 문서가 설명하는 full absorption은 "코드를 옮겼다"가 아니라, **routing knowledge layer를 완성했다**는 의미다.

### 우리 체계에 적용된 최종 상태

- `skills/reference-research/references/`에 12개 reference 문서가 모두 존재한다.
- `researcher-dksu.md`가 이 reference들을 파일명 단위로 소비하는 routing table을 가진다.
- `reference-research/SKILL.md`가 reference layer를 workflow의 중심으로 사용한다.
- overview 문서인 본 파일은 이 세 요소의 관계를 설명하며, overclaim도 underclaim도 하지 않는다.

즉, 현재 `dksu-planning-kit`에서 insane-search는 더 이상 "patterns only" 상태가 아니고, 그렇다고 raw runtime migration도 아니다. **reference-layer-driven planning adaptation**이라는 정확한 형태로 full absorption이 완료된 상태다.
