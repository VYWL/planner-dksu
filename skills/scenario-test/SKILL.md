---
name: scenario-test
description: 테스트 정의 및 커버리지 설계 스킬 - "테스트 정의", "시나리오 테스트", "통합 테스트", "커버리지", "test definition" 요청 시 사용
version: 1.0.0
---

# Scenario Test

Use this skill when the user wants user stories turned into verifiable test definitions.
This skill converts product intent into runtime-checked behavior.
The job is not done when the cases are written; the verification path must also be defined.

## Mission

Convert every user story into testable integration scenarios, functional verification cases, and edge case checks.
Coverage is complete only when all three layers align.

## Core Principle

Start from user-visible behavior, then anchor it to implementation behavior, then stress it with edge cases.
Do not confuse lint, type checks, or static review with behavioral verification.
Real confidence comes from actual runtime checks.

## Coverage Hierarchy

### 1. Scenario tests

Derived from user stories.
These cover all user-facing behavior through:

- happy path
- alternative paths
- error paths

Every user story must map to all three.

### 2. Functional tests

Derived from implementation boundaries.
These verify function-level input/output, module interactions, and contract behavior.

### 3. Edge case tests

Derived from both scenarios and functions.
These must include at least the relevant subset of:

- null
- empty
- overflow
- concurrent
- timeout

### 4. Combined = 100% coverage

Coverage is only complete when the scenario layer, functional layer, and edge-case layer together leave no behavioral gap.

## Mandatory Rule

Convert EVERY user story into testable integration scenarios.
No user story is allowed to stay as plain prose.

If a story exists, it must have:

- at least 1 happy path case
- at least 1 alternative path case
- at least 1 error path case

This means every story has at least 3 test cases.

## Formats

### Scenario cases

Use `templates/test-case.md` as the default skeleton. Fill it with Given-When-Then for scenario cases and Arrange-Act-Assert semantics for functional cases.

### Functional cases

Keep functional cases in the same `templates/test-case.md` shape so scenario/functional/edge cases stay traceable.

## Required Workflow

### Step 1: Enumerate user stories

Write each user story in a stable ID format.

Example:

- US-001: As a new user, I want to create a workspace so that I can start organizing projects.
- US-002: As a returning user, I want to invite teammates so that we can collaborate.

### Step 2: Expand each story into scenario paths

For every story, define:

- happy path
- alternative path
- error path

Questions to ask:

- What success looks like?
- What acceptable variation still counts as success?
- What visible failure or rejection must be handled?

### Step 3: Derive functional test targets

Inspect the implementation or planned module boundaries.
List the functions, services, handlers, and adapters that directly support the scenario.

Then define known input → expected output checks.

### Step 4: Derive edge cases from both layers

Do not invent random edge cases.
Pull them from actual scenario and function risks.

Examples:

- Scenario risk: user submits empty form field
- Functional risk: function receives empty string
- Scenario risk: two users edit the same entity simultaneously
- Functional risk: update function sees stale version token

### Step 5: Map coverage

Create a matrix from user story to test cases.
Every story must show all required scenario coverage and linked function/edge cases.

### Step 6: Define executable verification scripts

For scenario verification, create script targets in this form:

```text
/scripts/verify-{scenario}.sh
```

These scripts must be executable, not just documented.

### Step 7: Verify runtime behavior

Run the scripts or define how they will run against a real environment, local server, or controlled endpoint.
Static analysis alone is insufficient.

## Coverage Matrix Template

Every output must include `templates/coverage-matrix.md`.

Do not leave cells blank.
If something is truly not applicable, explain why.

## Verification Script Standard

Scripts must be real, executable verification tools.
Documentation alone does not count.

Use Arrange-Act-Assert even in shell.

```bash
#!/bin/bash
set -euo pipefail

# Arrange
PAYLOAD='{"name":"Acme"}'

# Act
RESULT=$(curl -s -X POST http://localhost:3000/api/workspaces -H "Content-Type: application/json" -d "$PAYLOAD")

# Assert
echo "$RESULT" | grep '"name":"Acme"' >/dev/null
echo "PASS: workspace creation"
```

## Function-Level Verification Rule

Always verify logic with known input and expected output.

Pattern:

1. call the function with a known input
2. capture the output or side effect
3. compare it against an expected value

Examples:

- `validateEmail("a@b.com")` returns success
- `validateEmail("")` returns validation error
- `mergeAvailability(slotsA, slotsB)` returns a conflict-marked result

## Concrete Example

### User story

US-001: As a freelancer, I want to merge multiple schedule sources so that I can avoid conflicts before messaging clients.

### Scenario cases

#### TC-001: Happy path - merged schedule is shown

- Type: Scenario
- Related user story: US-001
- Given: A user has connected two schedule sources with non-conflicting events
- When: The user opens today's timeline
- Then: The system shows one merged view with both sources represented correctly
- Verification method: Runtime check through local app or API-backed screen
- Script: scripts/verify-schedule-merge-happy.sh

#### TC-002: Alternative path - one source disconnected

- Type: Scenario
- Related user story: US-001
- Given: One connected source becomes temporarily unavailable
- When: The user refreshes today's timeline
- Then: The system shows available events, marks one source as disconnected, and guides recovery without blanking the entire screen
- Verification method: Simulated source failure
- Script: scripts/verify-schedule-merge-partial.sh

#### TC-003: Error path - invalid source auth

- Type: Scenario
- Related user story: US-001
- Given: The user's token for one source is invalid
- When: The system tries to sync events
- Then: The user sees a clear re-authentication action and no misleading "all synced" state
- Verification method: Forced auth failure
- Script: scripts/verify-schedule-merge-auth-error.sh

### Functional cases

#### FC-010: mergeEvents preserves source attribution

- Type: Functional
- Related user story: US-001
- Given: Two event arrays from distinct providers
- When: `mergeEvents(eventsA, eventsB)` is called
- Then: The result is chronologically sorted and each event still carries its provider metadata
- Verification method: Direct function call
- Script: scripts/verify-merge-events.sh

#### FC-011: detectConflict marks overlap correctly

- Type: Functional
- Related user story: US-001
- Given: Two events overlap by 15 minutes
- When: `detectConflict(events)` is called
- Then: The overlapping entries are marked as conflict items
- Verification method: Direct function call with fixture data
- Script: scripts/verify-detect-conflict.sh

### Edge cases

#### EC-020: Empty event list

- Type: Edge Case
- Related user story: US-001
- Given: The user has no events today
- When: Merge logic runs
- Then: The system returns an empty but valid state with a useful empty-state message
- Verification method: Direct call and UI/runtime check
- Script: scripts/verify-empty-schedule.sh

#### EC-021: Concurrent sync update

- Type: Edge Case
- Related user story: US-001
- Given: Two sync jobs update the same day simultaneously
- When: Both updates are processed
- Then: The final merged schedule is consistent and duplicate events are not created
- Verification method: Controlled concurrent execution
- Script: scripts/verify-concurrent-sync.sh

#### EC-022: Provider timeout

- Type: Edge Case
- Related user story: US-001
- Given: One provider does not respond within the timeout window
- When: Sync runs
- Then: The system degrades gracefully and exposes partial state clearly
- Verification method: Forced timeout in provider stub or proxy
- Script: scripts/verify-provider-timeout.sh

## Example Coverage Matrix

| User Story / Function | Scenario Happy | Scenario Alternative | Scenario Error | Functional | Edge Case |
| --- | --- | --- | --- | --- | --- |
| US-001 merge schedules | TC-001 | TC-002 | TC-003 | FC-010, FC-011 | EC-020, EC-021, EC-022 |

## Decision Checklist

Before finalizing test definitions, confirm:

- Has every user story been converted into 3+ scenario cases?
- Do functional cases verify known input → expected output?
- Are edge cases derived from both user flow risks and function risks?
- Does the coverage matrix show no gaps?
- Does every case have a real verification method?
- Are script paths defined under `/scripts/verify-{scenario}.sh` style names?
- Does the plan verify runtime behavior, not only lint or type checks?

## Verification / Completion Rule

- Every case should start from `templates/test-case.md`.
- Every plan should include `templates/coverage-matrix.md` with no unexplained gaps.
- Runtime verification must stay explicit; templates do not replace executable scripts.

## Anti-Patterns (NEVER)

- Never leave a user story as plain prose without happy, alternative, and error scenario cases.
- Never claim 100% coverage from scenario tests alone; functional and edge-case layers are mandatory.
- Never use lint or type checks as a substitute for actual runtime verification.
- Never write verification scripts as pseudo-files that are not executable or runnable.
- Never define functional tests without explicit known input and expected output.
- Never build a coverage matrix with blank cells or untraceable test cases.
