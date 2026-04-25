---
name: plan-dksu
description: >
  dksu 기획 세션을 시작합니다. Stage 1 Problem Framing부터 여섯 단계 기획 루프를 진행하며,
  코드 작성 없이 문제 정의, 요구사항 구조화, 의사결정 기록까지 완성합니다.
  Starts a dksu planning session in Stage 1 Problem Framing mode.
triggers:
  - /plan-dksu
  - /plan-dksu [topic]
  - "dksu로 기획 시작해줘"
  - "기획 시작"
---

# /plan-dksu — dksu 기획 세션 시작

`/plan-dksu`는 `dksu` 기획 오케스트레이터를 Stage 1 Problem Framing 모드로 활성화합니다.
코드 작성이나 구현 오케스트레이션이 아닌, **"무엇을, 왜 만드는가"** 를 먼저 정의하는 사전 기획 전용 명령입니다.

---

## 사용법

```
/plan-dksu
/plan-dksu [topic]
/plan-dksu 새로운 결제 시스템 기획
/plan-dksu 해커톤 아이디어 검증 도구
```

슬래시 명령이 지원되지 않는 환경에서는 아래 문장으로 동일하게 시작할 수 있습니다.

```
dksu로 기획 시작해줘.
기획 시작해줘.
문제: [문제 설명]
```

---

## 동작 방식

### Stage 1 진입 — Problem Framing & Analysis

`/plan-dksu`를 실행하면 `dksu`가 Stage 1로 진입합니다.

- 5W1H 프레임으로 문제를 구체화합니다.
- `deep-dive` 스킬을 사용해 근본 원인과 모호한 가정을 추적합니다.
- 모호성이 남아 있으면 명시적 선택지를 제시하고 사용자 확인을 받습니다. 모호성이 닫힐 때까지 다음 단계로 넘어가지 않습니다 (no-more-ambiguity 원칙).
- 문제 정의, 범위 경계, 가정 목록, 미지 항목을 산출물로 남깁니다.

### 여섯 단계 기획 루프

Stage 1 이후 `dksu`는 아래 순서로 진행합니다.

| 단계 | 이름 | 주요 산출물 |
|------|------|------------|
| 1 | Problem Framing & Analysis | 문제 정의, 범위 맵, 가정, 미지 항목 |
| 2 | Clarification & Persona Design | 모호성 해소 결정, 페르소나, 시나리오 개요 |
| 3 | Reference Research | 근거 기반 비교 분석, 레퍼런스 요약 |
| 4 | Requirement Structuring | 요구사항 명세, 수용 기준, 의존성 |
| 5 | Task Plan & Validation Design | 태스크 계획, 검증 케이스, 커버리지 매트릭스 |
| 6 | Decision Log | 의사결정 기록, 미해결 리스크, 이관 항목 |

각 단계는 명확한 산출물이 나올 때까지 닫히지 않습니다.

### 산출물 저장

기획 세션 중 생성된 산출물은 `.dksu/` 디렉터리 아래 세 폴더로 구분됩니다.

```
.dksu/
├── drafts/       # 작업 중인 문서 (문제 정의, 페르소나, 요구사항 초안 등)
├── plans/        # 확정된 기획 문서 (Seed 섹션 포함)
└── evidence/     # 레퍼런스 인용, 리서치 아티팩트, 비교 근거
```

- **`drafts/`** — 각 단계에서 작성 중인 작업 문서를 보관합니다.
- **`plans/`** — Stage 6 완료 후 확정된 기획 문서를 저장합니다. 확정 플랜에는 핵심 전제와 범위를 요약한 Seed 섹션이 포함됩니다.
- **`evidence/`** — `researcher-dksu`가 수집한 레퍼런스 인용, 비교 분석 결과, 리서치 아티팩트를 저장합니다.

---

## 이 명령이 하지 않는 것

- 코드를 작성하지 않습니다.
- 구현 오케스트레이션을 하지 않습니다.
- 테스트 실행, git 작업, 배포를 다루지 않습니다.
- 외부 vault나 파일 시스템에 접근하지 않습니다.
- `designer-dksu`를 자동으로 활성화하지 않습니다. 명시적으로 요청해야 합니다.

Stage 6이 닫히면 기획 패킷이 완성됩니다. 이후 구현은 별도 시스템에 이관합니다.

---

## 관련 에이전트

| 에이전트 | 역할 | 활성화 조건 |
|---------|------|------------|
| `dksu` | 기획 오케스트레이터, 전체 루프 소유 | `/plan-dksu` 실행 시 자동 |
| `researcher-dksu` | 외부 근거 수집, 비교 분석 | `dksu`가 필요 시 위임 |
| `critical-dksu` | Stage 5 Breadth-Keeper. 치명적 누락·미검증 가정·5W1H 취약점·AI-Slop 탐지 | `dksu`가 Stage 5 종료 전 내부 호출; 사용자 직접 호출 불가 |
| `designer-dksu` | UX 명세, 화면 흐름 설계 | 명시적 요청 시에만 |

---

## 관련 스킬

| 스킬 | 사용 시점 |
|------|----------|
| `deep-dive` | 문제 프레이밍, 모호성 수렴, 근본 원인 추적 |
| `no-more-ambiguity` | 모호성 점수 계산, 단계별 명확도 게이트, Stage 6 Final Gate 강제 |
| `persona-scenario` | 사용자 모델링, 여정 설계, 시나리오 구체화 |
| `reference-research` | 비교 근거, 벤치마크, 선례 수집 |
| `scenario-test` | 검증 케이스 정의, 커버리지 매트릭스 완성 |
