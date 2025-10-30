#!/bin/bash
# Repo-friendly Git auto-sync script with stash & pull
# Only commits if there are local changes

REPO="$(pwd)"
cd "$REPO" || { echo "Repo not found!"; exit 1; }

# Stash any local changes temporarily
git stash push -u -m "auto-sync-stash" >/dev/null 2>&1

# Pull remote changes
git pull --rebase origin main

# Apply stashed changes back
git stash pop >/dev/null 2>&1

# Check if there are local changes
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Stage all changes
git add .

# Commit with timestamp
git commit -m "Auto-update: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push origin main

echo "Changes synced successfully."

