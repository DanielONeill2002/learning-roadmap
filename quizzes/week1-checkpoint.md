# Week 1 Checkpoint Quiz — Terminal + VS Code

**Date:** 2026-08-08 · **Result: PASSED** ✅ · Grader: Claude (strict mode, no notes allowed)

Part A answered from memory, no terminal. Part B done live with output verified against the real filesystem.

---

## Part A — concepts, in your own words

**A1. Absolute vs relative paths; meaning of `.` `..` `~`** — ✅

> Absolute path is where you specify your pathing from the root, whereas relative pathing is where you specify the path from your initial starting directory, not the base root. `.` refers to the directory you are currently in, `..` refers to the directory one higher, `~` refers to the home directory.

**A2. Relative path from `C:\Users\Daniel O'Neill` to `C:\Projects\practice`** — ✅

> `cd ..\..\Projects\practice` — the first two `..` take you two levels up to the root, then down into the two directories specified.

**A3. `"$name lives here"` vs `'$name lives here'`** — ✅

> Double quotes use interpolation so the variable's value is substituted in; single quotes read as-is without interpolating.

**A4. Full procedure for "delete all `.log` files"** — ⚠ procedure right, one flag

> First run `ls *.log` to preview what matches and check they're all files I want deleted (a dry run) — `rm` is final, there's no recycle bin. Once happy, run the remove command.

**Grader flag:** answer previewed with `ls *.log` but deleted with `rm *log`. Those are *different patterns* — `*log` also matches names ending in "log" with no dot (`changelog`, `backlog`). **The preview only protects you if the delete uses the identical pattern.** Workflow fix: preview with `ls`, press ↑ to recall the exact command, change only `ls` → `rm`.

**A5. Why "backup.txt" got deleted by `rm *.txt`; what would have protected it** — ✅

> Naming it "backup" doesn't exclude it from the wildcard — it was still a `.txt`. A real backup is a copy with a different extension or in a different directory, outside the blast radius.

**A6. The white dot; why `cat` showed old content** — ✅

> The dot means the current version exists only in VS Code's memory, not on disk — the disk still has the old bytes. `cat` reads the disk, not VS Code's memory.

---

## Part B — live tasks

**B1. Predict then run: `ni warmup\test-a.md` (warmup exists) and `mkdir warmup\sub\deeper` (sub doesn't)** — ✅

Predictions correct: `ni` created the file fine through an *existing* folder; `mkdir` built the whole missing chain. Rule stated: it's not that `ni` can't handle `\` — parent-folder creation is each command's own policy. `ni` refuses to invent missing parents; `mkdir` (and VS Code's new-file box) create them happily.

**B2. Speed run from home: create `quiz\` with `one.txt` + `two.txt`, put `passed` in one, prove it** — ✅ full marks

Done in 4 commands entirely from the home directory using `..\..\` relative paths — including running `mkdir` first, unprompted, because of B1's lesson. Verified against the real filesystem.

**B3. The partially-failed `ni` from the warm-up: what still happened?** — ⚠ half

> It still created `draft.txt` and `final.md`, but not `notes.txt` (typo'd path). Avoidable with TAB completion.

**Grader flag:** TAB is *prevention* — correct. The missing half is *verification*: after any command that errors, `ls` to see what actually happened. Partial success is real; prevention and verification are different habits.

**B4. Open the cheatsheet keyboard-only; the two search shortcuts** — ✅ (completed on follow-up)

> **Ctrl+Shift+P** brings up the command palette — every command VS Code can do. **Ctrl+P** is quick-open — searches files in the workspace.

---

## Post-quiz addendum — the cleanup epilogue

- `rm` on a folder with contents triggers a Confirm prompt unless `-Recurse` is passed — the prompt is a seatbelt, the flag is the deliberate version.
- `rm -?` revealed **`-WhatIf`**: a built-in dry run for destructive commands — preview-first as a first-class flag.
- ALIASES: `rm`, `del`, `rmdir`, `ri`, `erase` are all Remove-Item.
- **Lesson learned the hard way:** declared "cleanup done" while the just-run `ls` still showed `warmup\` with two files in it. Running the verification isn't the habit — *reading it against the goal* is.

## Revision list for Week 2 warm-up

1. Preview pattern ≡ delete pattern (↑ recall, swap only the command)
2. Verify after partial failure, and *read* the verification output
3. Ctrl+P (files) vs Ctrl+Shift+P (commands) — cold
4. `-WhatIf` and `-Recurse` on `rm`
