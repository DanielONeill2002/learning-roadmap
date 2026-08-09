# SETUP.md — Windows 11 install guide

**Rule: install per phase, not everything today.** Each section says which week needs it. Run installs in PowerShell (Windows Terminal), verify with the check command before moving on.

---

## §0 — Phase 0, Week 1: core toolbelt

**Day 0 — fresh learning machine:** copy this `learning-roadmap` folder to `C:\Projects\learning-roadmap` on the new computer, then install your tutor: the **Claude Code** desktop app (download from claude.com → Claude Code), or the CLI from PowerShell:

```powershell
irm https://claude.ai/install.ps1 | iex
```

Sign in with your existing Claude account — subscriptions are per-account, not per-machine. Every session starts by opening Claude Code in this folder.

Windows Terminal is already on Windows 11 — pin it to the taskbar and use the PowerShell tab. (Windows 10 only: install it first with `winget install --id Microsoft.WindowsTerminal -e`.)

```powershell
winget install --id Git.Git -e
winget install --id GitHub.cli -e
winget install --id Microsoft.VisualStudioCode -e
```

**Close and reopen the terminal after installs** (open windows don't see PATH changes). Then verify:

```powershell
git --version
gh --version
code --version
```

Configure Git identity (once):

```powershell
git config --global user.name "Daniel O'Neill"
git config --global user.email "your-github-email@example.com"
git config --global init.defaultBranch main
```

GitHub: create an account at github.com if you don't have one → run `gh auth login` → pick GitHub.com, HTTPS, authenticate via browser.

VS Code extensions to install now: **Python** (ms-python.python), **Pylance**, **Jupyter**. (Docker extension comes in week 18; GitLens optional.)

---

## §1 — Phase 1, Week 3: PostgreSQL

Use the interactive EDB installer (clearer than a silent install because of the password step):

1. Download PostgreSQL 17 for Windows from postgresql.org/download/windows
2. Run it, accept defaults, **untick Stack Builder** at the end
3. When asked for the **postgres superuser password: choose one and write it down** — you'll use it constantly
4. Port 5432 (default) is fine

pgAdmin comes bundled. Optional, nicer client:

```powershell
winget install --id dbeaver.dbeaver -e
```

Add `psql` to PATH: Start menu → "Edit environment variables" → Path → New → `C:\Program Files\PostgreSQL\17\bin`. Open a new terminal, then:

```powershell
psql -U postgres -c "SELECT version();"
```

---

## §2 — Phase 2, Week 7: Python

```powershell
winget install --id Python.Python.3.12 -e
```

(3.13 works too; 3.12 currently has the least friction with data libraries.)

New terminal, then:

```powershell
python --version
pip --version
```

Allow venv activation scripts (one-time):

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

The venv ritual you'll repeat in every project:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install requests python-dotenv
```

The prompt shows `(.venv)` when it's active. One venv per project, always. `.venv/` always goes in `.gitignore`.

---

## §3 — Phase 3, Week 15: Power BI Desktop

Microsoft Store → "Power BI Desktop", or:

```powershell
winget install --id Microsoft.PowerBIDesktop -e
```

Sign in with your Malaberg Microsoft account. Connect: Get Data → PostgreSQL database → server `localhost`, your database name, user `postgres` + your password.

---

## §4 — Phase 4, Weeks 18–19: WSL2, Docker, AWS

**WSL2 first** — in an *administrator* PowerShell, then reboot:

```powershell
wsl --install
```

If it fails: virtualization is probably disabled in BIOS (look for "Intel VT-x" or "SVM" and enable it).

**Docker Desktop:**

```powershell
winget install --id Docker.DockerDesktop -e
```

Start the Docker Desktop app, accept the WSL2 backend, then verify:

```powershell
docker run hello-world
```

**AWS (week 19):**

1. Create a free-tier account at aws.amazon.com
2. **Immediately, before anything else:** Billing console → Budgets → create a zero-spend budget with an email alert
3. IAM → create a user with S3 access → generate an access key
4. Install the CLI and configure:

```powershell
winget install --id Amazon.AWSCLI -e
```

```powershell
aws configure
```

5. Verify: `aws s3 ls` (empty output is success — no error means you're in)

---

## §6 — Phase 6, Week 25: LLM API key

Anthropic: console.anthropic.com → API keys → add ~$5 of credit → in your project venv:

```powershell
pip install anthropic
```

(Or OpenAI: platform.openai.com and `pip install openai` — the roadmap works with either; the skill is the same.)

The key lives in `.env` as `ANTHROPIC_API_KEY=...`, loaded with python-dotenv. Never in code, never in Git — `.env` is in `.gitignore`, and the repo gets a `.env.example` with the variable name but no value.

---

## §8 — Phase 8, Weeks 30–33: Snowflake, dbt, Airflow

**Snowflake — week 30, not earlier (30-day trial):** signup.snowflake.com → Standard edition → AWS → nearest region (eu-west-2 London). Note your account identifier from the welcome email.

**BigQuery sandbox (free fallback, no card, no expiry):** console.cloud.google.com → new project → BigQuery. 10 GB storage / 1 TB of queries per month free.

**dbt (week 31)** — inside a project venv:

```powershell
pip install dbt-snowflake
dbt --version
```

**Airflow (week 33):** Airflow does not run natively on Windows — it runs inside Docker, which you already have. Use the Astro CLI:

```powershell
winget install --id Astronomer.Astro -e
```

Then in a new project folder:

```powershell
astro dev init
astro dev start
```

Airflow UI appears at http://localhost:8080.

---

## Troubleshooting corner

| Symptom | Fix |
|---|---|
| `'git' is not recognized` (or any fresh install) | Close and reopen the terminal — PATH changes don't reach open windows |
| `Activate.ps1 cannot be loaded` | Run the `Set-ExecutionPolicy` line in §2 |
| `wsl --install` errors | Enable virtualization in BIOS; run Windows Update; retry |
| Docker: "cannot connect to the Docker daemon" | The Docker Desktop app must be running |
| `psql` not found | PATH entry from §1 missing, or terminal not reopened |
| pip installed but import fails | venv not activated — look for `(.venv)` in the prompt |
