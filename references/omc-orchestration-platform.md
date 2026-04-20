# Oh-My-ClaudeCode (OMC) Orchestration Platform

OMC는 Claude Code 위에서 동작하는 멀티에이전트 오케스트레이션 프레임워크다. 에이전트 위임, 세션 관리, 병렬 실행, 모델 라우팅, 자동 업데이트를 제공하며, dksu 에이전트 체계는 이 위에 얹힌 커스텀 오버레이다.

Related: agent-architecture (base architecture doc), [Elvis Sun / Zoe Orchestrator Pattern](./elvis-zoe-orchestrator-pattern.md), [Superpowers Skill Framework](./superpowers-skill-framework.md)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| GitHub | [Yeachan-Heo/oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) |
| 규모 | ~29K stars · 90 contributors · 216 releases |
| 버전 | v4.12.0 (2026-04-16) |
| 설치 방식 | npm (`oh-my-claude-sisyphus`) |
| 역할 | Orchestration layer — "누가 어떻게 분담해서 일할 것인가" |

### 에이전트 체계 구조

```
OMC (인프라)                        ← 설치된 기반 플랫폼
 ├─ task() API (에이전트 위임)
 ├─ session_id (세션 연속성)
 ├─ background tasks (병렬 실행)
 ├─ model routing (Haiku→Sonnet→Opus)
 └─ auto-update

dksu overlay (커스텀)               ← 운영 레이어
 ├─ 역할 재정의 (dksu, designer-dksu, researcher-dksu)
 ├─ 워크플로우 강화 (기획 6단계 + 하드게이트)
 └─ 스킬 매핑 (단계별 필수 스킬)
```

### OMC 제공 에이전트

| 에이전트 | 모델 | 역할 |
|---------|------|------|
| oracle | Opus | 아키텍처·디버깅 상담 |
| prometheus | Opus | 전략적 계획 수립 |
| metis | Opus | 사전 분석·숨은 요구사항 |
| momus | Opus | 계획 비평·품질 검증 |
| explore | Haiku | 코드베이스 검색 |
| librarian | Sonnet | 외부 문서·OSS 조사 |
| sisyphus-junior | Sonnet | 단일 태스크 실행 |

### 3-tier 스킬 스코핑 모델

OMC는 스킬을 3층으로 분리하며, 우선순위는 project > user > built-in이다.

| 티어 | 위치 | 용도 |
|------|------|------|
| Built-in | OMC 번들 | 범용 (읽기 전용) |
| User (전역) | Claude user-scope skill directory | 개인/팀 공통 방법론 |
| Project (로컬) | `.omc/skills/` 또는 `{repo}/.claude/skills/` | 프로젝트 고유 |

### 가져온 설계 원칙

- **YAML frontmatter** — 스킬에 name, description, triggers를 기계적으로 관리
- **에이전트 카탈로그** — 역할별 명확 분리 + 모델 차등 배정
- **파이프라인** — 스킬 간 순서와 handoff 명시
- **전역화 기준** — 방법론은 user scope, 코드베이스 고유는 project scope

### 중복 관리 결론

dksu 에이전트들은 OMC를 대체하는 것이 아니라, OMC 인프라 위에서 역할·절차·품질 기준을 재정의한 **커스텀 오버레이**다.
