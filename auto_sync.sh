#!/bin/bash
# Repo-friendly Git auto-sync script
# Only commits if there are changes

# Path to your repo (current folder)
REPO="$(pwd)"

cd "$REPO" || { echo "Repo not found!"; exit 1; }

# Check if there are changes
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

