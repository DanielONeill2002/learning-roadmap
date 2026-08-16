# Progress Tracker

**Currently on: Week 3 (Phase 1 — SQL & PostgreSQL)** ← keep this line updated; Claude reads it at the start of every session.

Tick a week only after passing its checkpoint quiz with Claude.

## Phase 0 — Toolbelt
- [x] Week 1 — Terminal + VS Code + installs (SETUP §0) ✅ 2026-08-08
- [x] Week 2 — Git & GitHub; this repo pushed public ✅ 2026-08-15 — **PHASE 0 COMPLETE**

## Phase 1 — SQL & PostgreSQL
- [ ] Week 3 — Tables, SELECT/WHERE; `adops` practice DB seeded
- [ ] Week 4 — JOINs + GROUP BY; campaign KPIs in SQL
- [ ] Week 5 — CTEs + window functions
- [ ] Week 6 — Schema design, indexes, views; Project 1 schema drafted

## Phase 2 — Python
- [ ] Week 7 — Setup, variables, strings, venvs
- [ ] Week 8 — Control flow + collections
- [ ] Week 9 — Functions, errors, files
- [ ] Week 10 — HTTP, requests, .env hygiene
- [ ] Week 11 — pandas + Postgres mini-ETL

## Phase 3 — PROJECT 1: marketing-data-warehouse
- [ ] Week 12 — Scaffold, sources, schema, extract
- [ ] Week 13 — Transform + idempotent load
- [ ] Week 14 — SQL analytics layer + quality checks
- [ ] Week 15 — Power BI + README — **SHIPPED**

## Phase 4 — APIs, scraping, Docker, scheduling
- [ ] Week 16 — Auth patterns, rate limits, retries
- [ ] Week 17 — Scraping with BeautifulSoup
- [ ] Week 18 — Docker + compose
- [ ] Week 19 — Scheduling + AWS S3 (billing alarm first)

## Phase 5 — PROJECT 2: competitor-intel-platform
- [ ] Week 20 — Sources, schema, collector v1
- [ ] Week 21 — Creatives → S3, dedupe, change detection
- [ ] Week 22 — Streamlit dashboard + weekly report
- [ ] Week 23 — Dockerized + scheduled — **SHIPPED**

## Phase 6 — FastAPI & LLM APIs
- [ ] Week 24 — FastAPI fundamentals
- [ ] Week 25 — LLM API + prompt engineering
- [ ] Week 26 — Chat-with-your-data patterns

## Phase 7 — PROJECT 3: marketing-analytics-assistant
- [ ] Week 27 — Upload + profiling + storage
- [ ] Week 28 — Insight engine + guardrails + UI
- [ ] Week 29 — Composed + documented — **SHIPPED**

## Phase 8 — Modern data stack
- [ ] Week 30 — Snowflake basics (trial starts NOW, not before)
- [ ] Week 31 — dbt fundamentals
- [ ] Week 32 — dbt layers, tests, docs
- [ ] Week 33 — Airflow via Astro CLI
- [ ] Week 34 — End-to-end orchestrated demo

## Phase 9 — PROJECT 4: modern-data-stack-pipeline
- [ ] Week 35 — Airflow → Snowflake ingestion
- [ ] Week 36 — dbt marts + tests
- [ ] Week 37 — Power BI + hardening
- [ ] Week 38 — Write-up — **SHIPPED** (CV centerpiece)

## Phase 10 — Experiment statistics
- [ ] Week 39 — Design, power, pitfalls
- [ ] Week 40 — Tests, CIs, simulations

## Phase 11 — PROJECT 5: experimentation-platform
- [ ] Week 41 — Schema + assignment API
- [ ] Week 42 — Events + results job
- [ ] Week 43 — Stats engine
- [ ] Week 44 — Dashboard
- [ ] Week 45 — Simulator + compose + docs
- [ ] Week 46 — **SHIPPED** + portfolio polish

## Shipped projects
| # | Repo | URL | Date |
|---|---|---|---|
| 1 | marketing-data-warehouse | | |
| 2 | competitor-intel-platform | | |
| 3 | marketing-analytics-assistant | | |
| 4 | modern-data-stack-pipeline | | |
| 5 | experimentation-platform | | |

## Session log
| Date | Week | What happened | Notes / stuck on |
|---|---|---|---|
| 2026-08-07 | — | Roadmap created | Next: SETUP §0, then Week 1 |
| 2026-08-07 | — | SETUP §0 done with Claude: GitHub CLI 2.97 + Windows Terminal installed, git identity set (name + main branch), VS Code Python/Pylance/Jupyter confirmed, folder placed at C:\Projects\learning-roadmap | Before Week 1: run `gh auth login`, then `git config --global user.email "<your-github-email>"` |
| 2026-08-08 | 1 | GitHub auth complete (account: DanielONeill2002, via device flow), git email set — SETUP §0 fully done. W1 Session 1 (~90 min): shell vs terminal, pwd/ls/cd, absolute vs relative paths (`.` `..` `~`), quoting + interpolation ('' vs ""), TAB completion, mkdir/ni/`>`/cat/cp/mv/rm, wildcards with preview-first habit, `-?` help. Built C:\Projects\practice tree from terminal only; archived 19 old 2023 .py files out of home dir; self-debugged a Move-Item parameter error unaided | Next session: VS Code tour + fluency drills, then Week 1 checkpoint quiz. Open Claude Code in C:\Projects\learning-roadmap |
| 2026-08-08 | 1 | W1 Session 2 (~2.5 h): warm-up recall drill (one hint needed: `..\..` chaining); VS Code tour — `code .`/`code <path>`, Activity Bar vs Explorer, command palette (his terminal toggle is Ctrl+' — layout-specific, verified), integrated terminal, buffer-vs-disk cat experiment, Ctrl+P quick-open; wrote notes/week1-terminal-cheatsheet.md from memory (18 commands, zero factual errors); ni-vs-mkdir parent-folder-policy experiment corrected his slash theory; **PASSED Week 1 checkpoint quiz** — strong on paths, quoting, preview-first, memory-vs-disk; B2 done entirely with relative paths from home | Flagged in quiz: A4 pattern mismatch (`ls *.log` preview but `rm *log` delete — preview must use the identical pattern), verify-after-partial-failure habit under-named, Ctrl+P vs Ctrl+Shift+P distinction shaky. Next: Week 2 Git — init/status/add/commit on this repo; prep: skim learngitbranching.js.org |
| 2026-08-09 | 2 | W2 Session 1 (~2 h): warm-up cleared all four carried flags (catalog trap predicted cold, `-WhatIf` finally seen live). Git: three-places model (working dir / staging / history), `git init` on this repo, status→add→commit→log→diff cycle, `--amend` for tip repair, first diff read line by line. 4 commits, clean tree. The big lesson arc: committed unfixed content twice (once skipping listed fixes, once via empty-dock amend) → learned `git diff --staged` is the pre-commit gate, and that a report must match the artifact. Commit-message norms: meaning required; imperative form advised, Daniel's call going forward. Teaching-format feedback taken: surface questions prominently | Carry-forward: let-the-check-gate-the-action (recurring), deliverables-match-the-ask, `git diff` vs `git diff --staged` cold. Next: Session 2 — branching, deliberate merge conflict, .gitignore, `gh` push public |
| 2026-08-15 | 2 | W2 Session 2 (~2.5 h): branch-as-pointer model proven live (decorations, switch, working-dir materialization — "projected onto disk" in his words); week2 git cheatsheet written from memory on a branch (45 lines, reviewed: `--staging` typo + push-vocabulary collision, both fixed via announced amend); fast-forward merge read correctly after one correction (zero new commits — pointer slide); deliberate conflict caused, markers read, resolved by hand → first two-parent merge commit; `branch -d`; pager keys (q, space, /search); .gitignore with a real bug: PowerShell 5.1 `>` writes UTF-16, Git can't read it — diagnosed via `git check-ignore -v` + raw bytes (FF FE), fixed via VS Code Save-with-Encoding (status-bar encoding dashboard learned); **repo pushed public: github.com/DanielONeill2002/learning-roadmap** (gh repo create, HTTPS auth), remote/origin/push concepts, 10 commits at push | Carry-forward: origin/main tracking-pointer meaning, `git pull` not yet exercised (next: edit README on GitHub web UI, pull it down), `\ No newline` marker seen. Next session: pull demo, then Week 2 checkpoint quiz — commit/branch/remote out loud, no notes |
| 2026-08-15 | 2 | W2 Session 3 (~2 h, same evening): pull two-way street — web edit → fetch (watched origin/main walk) → ff pull; status-staleness explained unprompted before fetching. Reader-side encoding trap: PS 5.1 `cat` renders BOM-less UTF-8 as mojibake — file proven fine via VS Code status bar. **PASSED Week 2 checkpoint quiz → PHASE 0 COMPLETE.** A: commit/branch/remote at full marks; A4 (ff pointer direction, diverged-vs-conflicted) corrected then proven live in B3/B3½; A6 never-rewrite-shared rationale finally *derived* from parent-hash mechanics. B: full practical — conflict resolved, auto-merge seen, teardown with `-Force` (Git write-protects .git\objects). Flags: B1 anomaly lines pasted unread (self-inflicted UTF-16 repeat via `>`), guess-first instinct (dash theory) before model-based reasoning. Extras: vim escape + `core.editor "code --wait"` configured, `git check-ignore -v` | Quiz record: quizzes/week2-checkpoint.md (revision list on it opens W3 warm-up). Owed: `>` warning entry on week1 cheatsheet, then commit+push everything. Next: Week 3 — SETUP §1 first (PostgreSQL 17 EDB installer, write the postgres password down, psql on PATH), then first queries + `adops` DB seeding. Optional prep: sqlbolt.com lessons 1–6 |
| 2026-08-16 | 3 | W3 Session 1 (~2.5 h): Phase 0 repair committed fix-forward (amend correctly ruled out — pushed commit). PostgreSQL 17.11 installed; full PATH debugging arc: psql unrecognized → binary located → `$env:Path` inspected → stale-snapshot rule (same shape as origin/main staleness) → fixed, verified. Client/server model; psql `\` commands vs SQL statements; semicolon-as-terminator experiment (continuation prompts `-#` `(#` read correctly); CREATE DATABASE adops; CREATE TABLE campaigns (trailing-comma parser lesson, caret read); INSERTs (single-quote + ISO-date laws); persistence proof articulated — client ephemeral, server durable. Seeded adops via sql/seed_adops.sql: 14 campaigns / 30 ads / 185 metric rows with embedded teaching stories (NULL outage, missing metrics, spend spike, weekend dips). First WHERE + accidental case experiment ('search' 0 rows vs 'Search' 4) → scoped rule: data is case-sensitive, the language isn't; error-vs-empty distinction; valid ≠ correct | Console codepage warning (850 vs 1252): noted-and-proceed, display-only. Session 2: the SELECT toolkit on adops — ORDER BY, LIMIT, DISTINCT, AND/OR/IN/BETWEEN/LIKE, IS NULL (campaign 8's outage rows await). Optional homework: sqlbolt.com lessons 1–6. This log row left uncommitted on purpose — Session 2 opens with its review + commit |
