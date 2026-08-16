# Week 2 Checkpoint Quiz — Git & GitHub

**Date:** 2026-08-15 · **Result: PASSED** ✅ · Grader: Claude (strict mode, cheatsheets closed)

Checkpoint bar: repo public on GitHub with 10+ meaningful commits ✓ (11 at time of quiz) · commit/branch/remote explained without notes ✓

---

## Part A — concepts

**A1. What is a commit?** — ✅ (90%)

> A store of a snapshot of the state of your folder at a moment you choose; includes the folder's state, a message explaining it, and a link to the snapshot before it — the parent.

*Grader:* author + timestamp omitted from the anatomy; the hash-change half answered inside A6 instead. Full component list: content, message, author, timestamp, parent — change any one, the fingerprint changes.

**A2. Three places + the two diffs** — ✅ full marks

> Working directory, staging area, history; `git add` copies a snapshot to staging, `git commit` copies staging to history. `git diff` = working vs staging; `git diff --staged` = staging vs history — the true pre-commit gate, since it shows exactly what's queued to enter history.

**A3. Branch / HEAD / main** — ✅ full marks

> A branch is a movable pointer to a commit; HEAD is the pointer we're standing on; mechanically nothing is special about main — Git treats all branches identically.

**A4. Fast-forward vs true merge** — ⚠ two corrections, both closed

Initial answer inverted the moving pointer and collapsed "diverged" into "conflicting." Corrected and restated:

> FF: the **receiving** branch's pointer slides forward to where the branch stands — zero new commits. Diverged = both sides moved after the fork (forces a true merge, two-parent commit — Git auto-reconciles when different lines changed). Conflicted = the *subset* of diverged where the **same lines** changed — human resolves, then the merge commit is created.

Proven live in B3 (conflict) and B3½ (auto-merge, no markers).

**A5. Remote / origin / origin/main** — ✅ full marks

> A remote is a complete copy of the repository stored elsewhere, known by nickname; origin is the conventional nickname. origin/main is the local record of where origin's main was at last contact — it moves only on push/pull/fetch, otherwise stale. `git status` can claim "up to date" while wrong because it compares against that stale pointer without phoning home; fetch first to compare against reality.

**A6. Amend + the never-after-push rule** — ⚠ rationale took three attempts, then **derived from first principles**:

> Push X publicly → someone builds Y on top; Y's parent field physically contains X's hash. Amend X→X′: Y's parent now points at nothing that exists. Their push is rejected (their lineage contains a commit the remote no longer has); their pull tries to merge two histories that disagree — duplicate commits, conflicts, manual surgery, work at risk. **Amending shared history invalidates other people's chains.**

Conditions: tip-only + never pushed anywhere shared (any remote counts, not just "live/deployed").

**A7. .gitignore + why a committed secret is permanent** — ✅ full marks

> The bouncer: junk stays out of commits; more importantly secrets (passwords, auth keys) never enter history. Removing a secret in a later commit doesn't help — the old snapshot still contains it; anyone can roll back and read it.

---

## Part B — practical (fresh `quiz-repo`, torn down after)

**B1** — ⚠ the session's one real demerit, then a clean repair. Content was written into the file with PowerShell `>` → UTF-16 → Git classified the file **binary** (`Binary files differ`, `0 insertions`) — and both anomaly lines were pasted **unread**, plus a first diagnosis was a guess (filename dash) rather than reasoning from the fresh encoding model. With hints: correct diagnosis (`>` → UTF-16 → null bytes → binary classification), then the key discovery — **a diff has two sides; if either side is binary the whole diff reports binary** — the flawed *committed* snapshot kept the diff broken after the working file was fixed. Repair: `--amend` chosen over fix-forward with correct reasoning (fix-forward leaves a binary blob and unreadable diff in history forever; amend replaces the snapshot; legitimate because tip + no remote). Result: honest `1 insertion(+)`.

**B2** — ✅ clean fork built, gate sequence throughout, all edits via VS Code.

**B3** — ✅ conflict predicted with correctly-scoped reasoning (same line → conflict), resolved, `Merge: 17c4dee 7c83c22` two-parent evidence shown.

**B3½** — ✅ prediction exactly right: no markers, auto-merge, one new commit, two parents (`Auto-merging → Merge made by 'ort'`). The diverged-without-conflict case, now seen not read. Bonus: an unprompted extra fork-merge rep (`monday-weather`) ran between B3 and B3½.

**B4** — ✅ no remote → push errors with no destination (`fatal: No configured push destination`); the real repo's wiring came from `gh repo create --source . --push`. Nuance: bare `gh repo create name` makes the GitHub repo but doesn't wire the local folder.

**B5** — ✅ safety flow run (WhatIf preview → delete → verify), and hit new material: **Git write-protects `.git\objects\`** (immutable snapshot warehouse, read-only attribute) — "access rights" error is the attribute, not admin permissions. Full teardown incantation: `rm <repo> -Recurse -Force`. Preview matters *more* with -Force, not less.

---

## Post-quiz addendum — session extras

- **vim ambush:** merge without `-m` opens Git's editor (default vim). Escape/accept: `Esc`, `:wq`, Enter. Permanent fix applied: `git config --global core.editor "code --wait"`. Template rule: `#` lines are stripped from messages, everything else is kept (one stray line proved it).
- **Reader-side encoding trap (mojibake):** PS 5.1 `cat` reads BOM-less UTF-8 as ANSI → `â€"` garbage on em-dashes. File was fine (VS Code + status bar = truth); the *reader* lied. Symmetric with the writer-side `>` trap: every program touching text has an encoding opinion.
- `git check-ignore -v <file>` = "ask Git why" for ignore rules. `git log --oneline --graph --all` = the shape of history.

## Revision list for Week 3 warm-up

1. **Read every line of output — anomalies are data.** "Binary files differ" on a text file should stop you cold (B1's miss)
2. **Reason from a model before guessing.** The dash theory came from nowhere; the UTF-16 model was two hours old and fit perfectly
3. Diverged vs conflicted — cold, with the auto-merge case
4. The X→X′/Y parent-hash scenario — retell it without prompts
5. `git add`/`commit` = *copy*; `push`/`pull`/`fetch` = *contact* — verb precision
