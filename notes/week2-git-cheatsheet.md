# Week 2 Git Cheatsheet
## Introduction
- Repository, a folder git has been told to watch, the watchin apparatus is hidden within a .git subfolder
- Commit, a snapshot recording the state of the folder at the specific moment you choose

## The three places of change
- Every change occurs in one of three places, important to remember these places aren't like rooms the fle walks inbetween they are records of contents, these three places are the working directory, the stagin area and the history
- working directory, this is the real files and its what we edit
- staging area, this is the loading dock where changes are selected for the next snapshot, it is useful since it alllows us to filter and select what we want to go into the final commit and not just copy a snapshot of everything we had been working on at that moment
- history, this is the permanent snapshot history of the file, here the snapshotted contents are safe
- to transfer a snapshot from the working directory to the staging area we use `git add`, to transfer a snapshot from the staging area to the history we use `git commit`

## The daily cycle
- The daily cycle will be the key structure we employ when updating our repositories to ensure we are correctly updating snapshots with the desired changes and efficiently logging what changes are taking place between commits
- to begin with we run `git status` to identify which files in our repository have been modified or added, are these the files we anticipated to be flagged
- from this we can run `git diff` to specifically identify within the files where the differences between the working directory and stagin area differ, evaluate to ensure the updates made are correct
- if all is correct we can run `git add {file names}`, to select the files we want to have their snapshots transfered to the staging directory
- next we run `git diff --staged` to compared the staging area against the history
- if we are happy with the changes we can run `git commit -m "summary of change made in new commit"` to copy the snapshot to history, ensure that the message used is clear and concise explaining the story of how the project has evolved
- finally run `git log --oneline` to review your git commit history and commit messaging to ensure the new commit is present and the messaging is appropriate for the change it explains

## Git diff
- `Git diff` provides insight into differences between the current snapshots in the three different places, where there is loss of content it will be flagged in red, where there is addition of content it will be flagged in green, it will display the exact differences between the snapshots
- `git diff` alone compares the difference in the snapshot of the working directory against the staging area aka what is different compared to whats been queued whereas `git diff --staged` compares the difference in the snapshot between the staging area and the history aka what will change when I record this new commit
- git diff is an important gating tool for checking there are no mistakes in our project before commiting epscially if the project is live in deployment

## Amending 
- If the content or messaging on the recent commit is broken in some way and needs fixing we can use `--amend` to resolve the error, this only works if the most recent commit is the one with the error
- when amending a commit the hexacode string/hash will still change since as well as a unique identifier it is a fingerprint computed from all of the following information (content, message, author, timestamp, parent) so if any of that information changes so will the hash

## Branches
- A branch is a moveable pointer to a commit, commiting move the pointer forwards one link
- The main branch is represents the real state
- although termed the main branch it has no prioritisation over other branches git considers all branches equally
- the pointer we currently stand on is termed the HEAD

## Command dictionary
- `git status` - breakdown of where everything in the repository is
- `git add` - copies the snapshot from the working directory to the staging area
- `git commit` - copies the queued snapshot from the staging area to the history
- `git diff` - for comparing the difference in repository snapshots between the different locations of the working directory, staging area and history
- `git log --oneline` - displays got commit history with commit messaging`
- `git branch` - lists what branches exist
- `git branch {new branch name}` - create a new branch
- `git switch`, switched the HEAD to the desired branch