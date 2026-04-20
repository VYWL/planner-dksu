# Plugins for Claude Natives

Team Attention이 만든 Claude Code용 네이티브 플러그인 컬렉션이다. 13개 실전 플러그인을 포함하며, 특히 clarify 플러그인의 3-lens 요구사항 명확화 패턴이 Step 1 분석 방식에 영향을 줬다.

Related: [Superpowers Skill Framework](./superpowers-skill-framework.md), [Oh-My-ClaudeCode Orchestration Platform](./omc-orchestration-platform.md), agent-roles (base architecture doc), workflow-agent-mapping (base architecture doc)

---

## Detail

### 프로젝트 정보

| 항목 | 내용 |
|------|------|
| GitHub | [team-attention/plugins-for-claude-natives](https://github.com/team-attention/plugins-for-claude-natives) |
| 규모 | ~738 stars · 13개 플러그인 · MIT |
| 언어 | Python 73% · JavaScript 21% |
| 역할 | Plugin layer — "무슨 실제 기능을 붙여서 쓸 것인가" |

### 플러그인 카탈로그

| 플러그인 | 유형 | 하는 일 |
|---------|------|---------|
| **clarify** | 요구사항 | 모호한 스펙 → 정밀한 요구사항 (3-lens) |
| **agent-council** | AI 오케스트레이션 | 다중 모델 합의 도출 |
| **team-assemble** | 에이전트 구성 | 태스크별 전문가 팀 동적 구성 |
| **interactive-review** | UI/UX | 웹 기반 체크박스 리뷰 |
| **doubt** | 검증 | 응답 재검증 강제 |
| **session-wrap** | 세션 관리 | 세션 마무리 분석·인사이트 |
| **say-summary** | 접근성 | TTS 요약 (한국어/영어) |
| **youtube-digest** | 학습 | 영상 요약·번역·퀴즈 |
| **gmail** | 통합 | 멀티 계정 Gmail 관리 |
| **google-calendar** | 통합 | 캘린더 + 충돌 감지 |
| **kakaotalk** | 통신 | 카카오톡 연동 (macOS) |
| **podcast** | 콘텐츠 | 한국어 팟캐스트 생성 |
| **dev** | 개발 도구 | 커뮤니티 스캐닝 + 기술 판단 |

### 5가지 플러그인 패턴

| 패턴 | 대표 플러그인 | 구조 |
|------|-------------|------|
| Multi-skill | clarify | plugin 안에 여러 skill 묶음 |
| Multi-agent | session-wrap | plugin 안에 여러 agent 정의 |
| Hook-based | say-summary | 이벤트 → 스크립트 매핑 |
| MCP-based | interactive-review | MCP 서버로 도구 노출 |
| Config-driven | agent-council | YAML 설정으로 동작 제어 |

### clarify 플러그인 상세 (3-Lens)

clarify는 단일 스킬이 아니라 모호성을 구조적으로 줄이는 **3-lens 시스템**이다.

| 렌즈 | 스킬명 | 하는 일 | 질문 수 |
|------|--------|---------|--------|
| Vague | `vague` | 흐린 요구사항 → 선명하게 | 5~8 |
| Unknown | `unknown` | 가정·블라인드 스팟 점검 | 7~10 |
| Metamedium | `metamedium` | 콘텐츠 vs 형식 관점 전환 | 1~2 |

**핵심 패턴**:
- **Hypothesis-as-Options** — 열린 질문 금지, 항상 2~4개 선택지 제시
- **R1/R2/R3 Depth** — 3라운드로 점진적 깊이 증가
- **Before/After Tracking** — 명확화 전후 변화 가시화
- **Ambiguity Taxonomy** — 범위/행위/인터페이스/데이터/제약/우선순위 6축

### 가져온 설계 원칙

- **가설 기반 질문** — dksu의 "열린 질문 대신 선택지 제시" 규칙
- **플러그인 모듈화** — skill/agent/hook/MCP를 하나의 plugin 안에 묶는 사고방식
- **아티팩트 경계** — plugin.json, skills/, agents/, commands/, hooks/ 가 각각 독립
