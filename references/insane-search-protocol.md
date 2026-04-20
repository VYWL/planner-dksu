# insane-search Adaptive Research Protocol

insane-search는 단순 검색을 넘어 입력 유형 분기, 병렬 탐색, 결정론적 에스컬레이션, 실패 투명성을 결합한 적응형 연구 프로토콜이다. 검색 실패를 조용히 넘기지 않고, 찾지 못한 경우도 명시적으로 보고하는 원칙이 핵심이다. researcher-dksu의 기본 연구 프로토콜로 전면 흡수됐다.

Related: agent-roles (base architecture doc)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| GitHub | [fivetaku/insane-search](https://github.com/fivetaku/insane-search) |
| 역할 | Research protocol — "어떻게 찾고, 어떻게 보고할 것인가" |
| 핵심 패턴 | intent routing, parallel probe, deterministic escalation, metadata fallback, provenance/failure reporting |

### 전체 프로토콜 흐름

```
입력 수신
  │
  ▼
1. Intent Routing
   URL/handle/keyword 분기 → 입력 유형에 따라 검색 전략 선택
  │
  ▼
2. Platform-specific Routing
   단일 검색 도구 의존 금지 → 플랫폼별 최적 경로 선택
  │
  ▼
3. Parallel Probe
   복수 경로 동시 탐색 → 단일 검색 실패 시 대안 경로 확보
  │
  ▼
4. Deterministic Escalation
   에스컬레이션 조건 명시 → quick mode vs deep mode 전환 기준
  │
  ▼
5. Metadata Fallback
   직접 검색 실패 시 메타데이터 경로 → 조용한 실패 방지
  │
  ▼
6. Provenance Reporting
   모든 주요 발견에 출처 첨부 → 재현 가능한 근거 보존
  │
  ▼
7. Failure Reporting
   찾지 못한 경우 명시적 보고 → 잘못된 정보보다 투명한 실패
```

### 핵심 패턴 분석

#### Intent Routing

입력 유형(URL, handle, keyword 등)에 따라 검색 전략을 분기한다. 모든 입력을 동일한 방식으로 처리하지 않는다.

#### Deterministic Escalation Signals

"언제 더 깊이 파야 하는가"를 명시적 조건으로 정의한다.

researcher-dksu의 quick/deep 모드 전환 기준:

| 조건 | 모드 |
|------|------|
| 단순 사실 확인, 링크 수집 | quick mode |
| why/tradeoff/recommendation 필요 | deep mode |
| 3개 이상 옵션 비교 | deep mode |
| 증거 충돌 발생 | deep mode |
| 판단 근거가 결과 품질에 직접 영향 | deep mode |

#### Provenance Reporting

모든 주요 발견에 출처를 첨부한다. 링크 모음이 아니라 근거 기반 판단을 목표로 한다.

출력 형식: `findings + hypothesis comparison + causal explanation + evidence-backed recommendation`

#### Failure Reporting

찾지 못한 경우 명시적으로 보고한다. "찾지 못했음"이 잘못된 정보보다 낫다는 원칙이다.

### Adopt / Adapt / Reject 요약

| 패턴 | 결정 | 내부 귀속처 |
|------|------|------------|
| Intent routing | **Adopt** | researcher-dksu 기본 프로토콜 Step 1 |
| Platform-specific routing | **Adopt** | researcher-dksu multi-source 탐색 규칙 |
| Parallel probe | **Adopt** | researcher-dksu multi-angle queries |
| Deterministic escalation | **Adopt** | researcher-dksu quick/deep 모드 전환 기준 |
| Metadata fallback | **Adopt** | researcher-dksu 실패 처리 규칙 |
| Provenance reporting | **Adopt** | researcher-dksu 출력 계약 |
| Failure reporting | **Adopt** | researcher-dksu 출력 계약 |
| 전체 코드베이스 이식 | **Reject** | 패턴만 흡수 |
| 모든 조사에 전체 프로토콜 강제 | **Reject** | quick mode에서는 경량 버전만 적용 |

### 우리 체계에 적용한 부분

- **researcher-dksu 기본 연구 프로토콜** — 전체 흐름(intent routing → parallel probe → escalation → fallback → provenance/failure reporting)을 researcher-dksu의 deep mode 프로토콜로 흡수
- **quick/deep 모드 구분** — 간단한 조사에는 intent routing + provenance만 적용하는 경량 버전 병행
- **실패 투명성** — "찾지 못했음"을 명시하는 원칙을 conventions에 반영
