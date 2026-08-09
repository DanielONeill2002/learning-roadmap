# Learn to Code — Marketing Data & Analytics Engineering

**Owner:** Daniel O'Neill · **Started:** August 2026 · **Pace:** ~8–10 hrs/week · **Horizon:** ~46 weeks (~11 months)

You've shipped real tools (ads-generator, scrapers, image pipelines) by directing AI. What you can't yet do is read, debug, or design them yourself. This roadmap fixes that: you learn each skill in order, then prove it by building five portfolio projects **with your own hands**. The finish line is concrete: *you can open `C:\Projects\ads-generator` and understand how it works.*

---

## 1. The teaching contract (read this first)

Every study session happens with Claude Code open in this folder, in **tutor mode**. These rules are what make this learning instead of more vibe-coding:

1. **You type every line of project code.** Claude never writes code that lands in a learning repo. Claude MAY write: practice datasets, seed scripts, exercise scaffolds, quizzes, and deliberately-broken code for you to fix.
2. **Struggle first.** Sit with a problem for 20–30 minutes before asking. Then ask properly: what you tried, the full error message, and your current theory.
3. **Hints before answers.** Claude points at the right area; you find the fix. If you're truly stuck, Claude explains the concept, not the solution.
4. **Explain-back rule.** A week isn't done until you can pass its checkpoint out loud, without notes, in a Claude quiz.
5. **Errors are the syllabus.** Debugging is not an interruption to learning — it IS the learning. Read every traceback top to bottom before asking anything.
6. **Claude reviews like a senior dev.** You commit and push, then ask for a code review. You make the fixes yourself.
7. **Work stays separate.** Keep using AI to build company tools at full speed — that's your job. This folder is the dojo. And **never** put Malaberg data, credentials, or client info in these public repos.

### Copy-paste session prompts

Start a lesson:
> Open learning-roadmap/PROGRESS.md to see where I am. Teach me Week N from learning-roadmap/README.md: explain the concepts with small examples, then give me the exercises one at a time. Don't write my solutions — review mine and make me fix what's wrong.

When stuck (after your 20–30 min):
> I'm stuck. Here's what I'm trying to do, what I expected, what actually happened (full error below), and my theory. Give me a hint, not the fix.

Code review:
> Review my latest commits in <repo> like a senior engineer mentoring a junior. List issues by severity, explain *why* each matters, but don't rewrite the code — I'll fix it.

Checkpoint quiz (end of each week):
> Quiz me on Week N until you're satisfied I meet the checkpoint in README.md. Be strict. Then tick it in PROGRESS.md and log the session.

Weekly retro (Fridays, 30 min):
> Run my end-of-week retro: what did I learn, what's shaky, what do I prep for next week? Log it in learning-roadmap/PROGRESS.md.

---

## 2. Weekly rhythm (~8–10 hours)

| When | What | How long |
|---|---|---|
| 2 weekday evenings | Learn + drill with Claude in tutor mode | 90 min each |
| 1 weekend block | Build (exercises early on, projects later) | 3–4 h |
| Friday | Checkpoint quiz + retro, tick PROGRESS.md | 30 min |

**If life happens:** never restart from Week 1. Cut the drills, keep the build moving — the projects are the spine. If you have 15 h/wk instead, everything compresses by roughly a third; ask Claude to rescale the grid.

---

## 3. The map

| Phase | Weeks | You learn | You ship |
|---|---|---|---|
| 0 — Toolbelt | 1–2 | Terminal, Git, GitHub, VS Code | This repo, on GitHub |
| 1 — SQL & PostgreSQL | 3–6 | SELECT → joins → window functions → schema design | A practice marketing DB you can query cold |
| 2 — Python | 7–11 | Syntax → functions → files → APIs → pandas + Postgres | Mini-ETL dry run |
| 3 — **PROJECT 1** | 12–15 | Putting it together | `marketing-data-warehouse` |
| 4 — APIs, scraping, Docker | 16–19 | Auth, scraping, containers, scheduling, S3 | Containerized scheduled collector |
| 5 — **PROJECT 2** | 20–23 | End-to-end automation | `competitor-intel-platform` |
| 6 — FastAPI + LLMs | 24–26 | Web APIs, LLM APIs, prompt engineering | A working API with LLM endpoint |
| 7 — **PROJECT 3** | 27–29 | AI product plumbing | `marketing-analytics-assistant` |
| 8 — Modern data stack | 30–34 | Snowflake, dbt, Airflow | Orchestrated warehouse pipeline |
| 9 — **PROJECT 4** | 35–38 | Analytics engineering | `modern-data-stack-pipeline` |
| 10 — Statistics | 39–40 | A/B testing math | Simulated experiment analyses |
| 11 — **PROJECT 5** | 41–46 | The capstone | `experimentation-platform` |

Two deliberate tweaks to the order you pasted: SQL and PostgreSQL are learned together (you learn SQL *inside* Postgres), and AWS enters at Week 19 where you first need it (S3 image storage for Project 2). A statistics phase was added before Project 5 — its "Statistical Analysis" step needs it and it wasn't on the skill list.

---

## 4. Phase guides

### Phase 0 — Toolbelt (Weeks 1–2) · Setup: SETUP.md §0

**Week 1 — Terminal + editor.** Install the Phase 0 kit. Learn to live in PowerShell: `cd`, `ls`, `mkdir`, `mv`, `cp`, `rm`, paths, tab-completion, `--help`. Tour VS Code (open folder, integrated terminal, command palette). Exercise: create/organize a folder tree entirely from the terminal, no mouse.
**Week 2 — Git & GitHub.** `init`, `status`, `add`, `commit`, `log`, `diff`; branching and merging; cause and resolve a merge conflict on purpose; `.gitignore`; push/pull with `gh`; write READMEs in Markdown. Exercise: version THIS folder and push it to GitHub — your first repo is your own curriculum.
**Checkpoint:** roadmap repo is on GitHub with 10+ meaningful commits, and you can explain what a commit, branch, and remote are — without notes.

### Phase 1 — SQL & PostgreSQL (Weeks 3–6) · Setup: SETUP.md §1

You'll practice on `adops`, a fake marketing database (campaigns, ads, daily spend/clicks/conversions) that Claude seeds with you in Week 3 — so every query feels like your day job.

**Week 3 — First queries.** What a database/table/row/type is. `CREATE TABLE`, `INSERT`, then the core: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`. Meet psql and pgAdmin/DBeaver.
**Week 4 — The analytics bread and butter.** `JOIN` (inner/left), `GROUP BY` + aggregates, `HAVING`. Compute CTR, CPA, ROAS per campaign per week from raw tables.
**Week 5 — Power SQL.** CTEs (`WITH`), subqueries, `CASE`, window functions: `ROW_NUMBER`, `LAG`, moving averages. Week-over-week spend deltas; top-3 ads per campaign.
**Week 6 — Design.** Primary/foreign keys, light normalization, indexes + `EXPLAIN`, views. Design the schema you'll reuse in Project 1.
**Checkpoint:** given 10 business questions in plain English, you write correct SQL for at least 8 without looking anything up.

### Phase 2 — Python (Weeks 7–11) · Setup: SETUP.md §2

**Week 7 — Foundations.** venvs and pip, REPL vs scripts, variables, numbers/strings, f-strings, `input`/`print`. Run everything from the terminal, not a notebook.
**Week 8 — Control flow + collections.** `if`/`for`/`while`, lists, dicts, sets, tuples, slicing, basic comprehensions. Drill heavily — this is where fluency comes from (Exercism track alongside).
**Week 9 — Structure + failure.** Functions, modules, imports; exceptions and `try/except`; **reading tracebacks** (a named skill here); files, CSV, JSON.
**Week 10 — HTTP + APIs.** What HTTP actually is (GET/POST, status codes, headers, params). `requests`, JSON APIs, pagination, API keys in `.env` with `python-dotenv`. Hit a free public API, then Google Trends via `pytrends`.
**Week 11 — pandas + Postgres.** DataFrames from CSV/API, cleaning, `to_sql` via SQLAlchemy, plus raw `psycopg` for real SQL statements. Build a mini-ETL: API → clean → land in Postgres. This is Project 1's dress rehearsal.
**Checkpoint:** from a blank folder, you write a script that pulls an API, cleans the data, and inserts rows into Postgres — unaided.

### Phase 3 — PROJECT 1: Marketing Data Warehouse (Weeks 12–15)

`API → Python ETL → PostgreSQL → SQL views → Power BI` · Setup: SETUP.md §3 (Power BI)

**Week 12 —** Repo scaffold, pick sources, design staging + core schema, write extract scripts. Sources, honestly ranked: Google Trends (`pytrends`; brittle — manual CSV export is the fallback), a Kaggle e-commerce/Shopify dataset, and the Meta Ad Library API (needs a Meta developer account + ID verification; covers political/issue ads globally and EU-served ads).
**Week 13 —** Transform + load: cleaning in pandas, idempotent loads (re-running must not duplicate rows), logging, a config file.
**Week 14 —** The SQL layer: views/materialized views for KPIs, data-quality checks (row counts, null checks, freshness).
**Week 15 —** Power BI dashboard on top of Postgres (trends, top movers). Polish the README with an architecture diagram. **Ship it.**

### Phase 4 — APIs, scraping, Docker, scheduling (Weeks 16–19) · Setup: SETUP.md §4

**Week 16 — Real-world APIs.** Auth patterns (API keys, OAuth2 client-credentials — exactly what Outbrain/Taboola use), rate limits, retries with backoff. Optional (private repo only): authenticate to the Outbrain or Taboola API with work credentials and pull a report — reading your own company's data is the best motivation there is.
**Week 17 — Scraping.** HTML/CSS selectors, BeautifulSoup, polite scraping (robots.txt, delays, terms), why scrapers break. Practice on books.toscrape.com, then a real target.
**Week 18 — Docker.** Images vs containers, writing a Dockerfile for a Python script, `docker compose` with app + Postgres, volumes, env vars. Exercise: containerize Project 1's stack — then open `ads-generator/docker-compose.dev-app.yml` and see how much of it you now understand.
**Week 19 — Scheduling + first AWS.** Windows Task Scheduler vs cron vs GitHub Actions scheduled workflows (use Actions — free and visible in your portfolio). AWS: account with a **billing alarm first**, IAM user, one S3 bucket, upload files with `boto3`.
**Checkpoint:** a containerized script runs on a schedule and writes to both S3 and Postgres.

### Phase 5 — PROJECT 2: Competitor Intelligence Platform (Weeks 20–23)

`Meta Ads → Python → S3 image storage → Postgres → Dashboard → Weekly report`

**Week 20 —** Choose 3–5 competitors and sources (Ad Library pages, landing pages, pricing pages). Schema: ads/creatives with first-seen/last-seen. Collector v1.
**Week 21 —** Creative capture to S3, dedupe by content hash, change detection (what's new this week, what died).
**Week 22 —** Dashboard in **Streamlit** (new skill, pure Python, free hosting) + auto-generated weekly HTML/Markdown digest.
**Week 23 —** Dockerize the whole pipeline, schedule weekly runs, README + demo GIF. **Ship it.**

### Phase 6 — FastAPI + LLM APIs (Weeks 24–26) · Setup: SETUP.md §6

**Week 24 — FastAPI.** Routes, path/query params, Pydantic models, the auto docs at `/docs`, uvicorn. Build a small read-only API over Project 1's warehouse (`/kpis?campaign=...`).
**Week 25 — LLM APIs.** Calling Claude (or OpenAI) from Python: system prompts, messages, temperature, token costs, getting structured JSON out. Prompt engineering as an engineering discipline: role, constraints, examples, evaluation. Prompt-injection basics (you're building on untrusted CSVs).
**Week 26 — The pattern.** File-upload endpoints, schema-aware prompting ("here are the columns, write SQL"), tool use / function calling, validating LLM-generated SQL before running it (read-only connection!).
**Checkpoint:** an endpoint that accepts a CSV + a plain-English question and returns a real answer.

### Phase 7 — PROJECT 3: Marketing Analytics Assistant (Weeks 27–29)

`Upload CSV → Python profiling → SQL → LLM → Insights`

**Week 27 —** Ingestion + profiling: upload, type inference, load to Postgres, auto-generated data summary.
**Week 28 —** The insight engine: prompt design, guardrails (LLM writes SQL → you validate → execute read-only → LLM explains results), caching. Minimal Streamlit front end talking to your FastAPI backend.
**Week 29 —** Docker compose (api + db + ui), docs, demo. Stretch: deploy on a free tier (Render/Railway). **Ship it.**

### Phase 8 — Modern data stack (Weeks 30–34) · Setup: SETUP.md §8 — ⚠ don't create the Snowflake trial before Week 30; it expires in 30 days

**Week 30 — Warehouse concepts + Snowflake.** ELT vs ETL, columnar storage, why warehouses exist. Snowflake trial: databases/schemas/warehouses, load CSVs, query from worksheets. (Free fallback forever: BigQuery sandbox.)
**Week 31 — dbt fundamentals.** Models, `source()`/`ref()`, materializations, `dbt run` / `dbt test`. Point dbt at Snowflake.
**Week 32 — dbt for real.** Staging → intermediate → marts layering, tests (`unique`, `not_null`), docs generation, seeds, incremental models.
**Week 33 — Airflow.** DAGs, tasks, operators, schedules, idempotency, backfills. Runs in Docker via Astro CLI (Airflow doesn't run natively on Windows — SETUP.md handles this).
**Week 34 — Orchestrate.** One DAG: extract API → land in Snowflake → run dbt → notify. Start-to-finish with one `astro dev start`.
**Checkpoint:** you can explain to a colleague why dbt exists and what Airflow adds, and demo the pipeline live.

### Phase 9 — PROJECT 4: Modern Data Stack (Weeks 35–38)

`API → Airflow → dbt → Snowflake → Power BI` — the CV centerpiece.

**Week 35 —** Reuse Project 1's extractors (that's good engineering, not cheating); Airflow lands raw data in Snowflake.
**Week 36 —** dbt: staging + marts for marketing KPIs, tests, generated docs.
**Week 37 —** Power BI on Snowflake; harden the orchestration (retries, alerts, backfill a month).
**Week 38 —** Lineage diagram, README, and a blog-style write-up of the architecture. **Ship it.**

### Phase 10 — Statistics for experimentation (Weeks 39–40)

**Week 39 — Design.** Hypotheses, primary vs guardrail metrics, randomization, sample size and power (practical, with calculators), the peeking problem.
**Week 40 — Analysis in Python.** Proportion z-tests, t-tests, confidence intervals with `scipy`/`statsmodels` — and simulation: fake 1,000 A/B tests in numpy and watch false positives happen. Nothing builds intuition faster.

### Phase 11 — PROJECT 5: Automated Experimentation Platform (Weeks 41–46)

`Users → Experiments → Results → Statistical Analysis → Dashboard` — a public version of what you run at work.

**Week 41 —** Schema (experiments, variants, assignments, events); FastAPI service: create experiment, deterministic hash-based assignment endpoint.
**Week 42 —** Event ingestion + a results-computation job.
**Week 43 —** Stats engine: significance, confidence intervals, minimum-sample enforcement, guardrails.
**Week 44 —** Streamlit dashboard: live experiment readouts.
**Week 45 —** A traffic simulator that generates fake users so the demo is alive; Docker compose for the whole platform. **Ship it.**
**Week 46 —** Buffer + portfolio polish: pin all five repos, write your GitHub profile README, update your CV.

---

## 5. Definition of done (every project)

- Public GitHub repo, clean history, meaningful commit messages
- README: what it does, architecture diagram, screenshots/GIF, how to run it, what you'd do next
- `.env.example` committed, `.env` git-ignored, zero secrets or company data in history
- Runs from scratch on a fresh machine following only the README
- You can walk someone through any file in the repo and explain every line

## 6. Resource shelf (free unless marked)

| Skill | Use these |
|---|---|
| Git | learngitbranching.js.org · Pro Git book (free online) · GitHub Skills |
| SQL | sqlbolt.com → pgexercises.com → Mode SQL tutorial · postgresqltutorial.com as reference |
| Python | Automate the Boring Stuff (free online) · exercism.org Python track · official tutorial |
| HTTP/APIs | MDN "Overview of HTTP" · httpbin.org to poke at |
| Scraping | BeautifulSoup docs · books.toscrape.com sandbox |
| Docker | Docker's official Get Started workshop |
| FastAPI | The official tutorial (genuinely excellent) |
| LLM APIs | Anthropic docs + prompt engineering guide · OpenAI cookbook |
| Power BI | Microsoft Learn "Get started with Power BI" (PL-300 path) |
| dbt | learn.getdbt.com — "dbt Fundamentals" (free badge) |
| Airflow | Astronomer Academy "Airflow 101" |
| Snowflake | quickstarts.snowflake.com "Zero to Snowflake" |
| AWS | Skill Builder "Cloud Practitioner Essentials" (optional) |
| Stats | Khan Academy statistics · Evan Miller's A/B calculators · (paid, optional) *Trustworthy Online Controlled Experiments*, Kohavi et al. |

## 7. Costs

Everything is free except: LLM API credits (~$5 covers Project 3), AWS (pennies for S3 — set the billing alarm), Snowflake after the 30-day trial (switch to BigQuery sandbox, free forever at this scale).
