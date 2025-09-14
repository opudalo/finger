#!/bin/bash

# Check if commit message is provided
if [ $# -eq 0 ]; then
    echo "Usage: ./commit-and-push.sh \"Your commit message\""
    exit 1
fi

commit_message="$1"

# Bump version
echo "Bumping version..."
./bump-version.sh

# Add all changes
git add .

# Commit with the provided message
git commit -m "$commit_message"

# Push to GitHub
git push origin main

echo "✅ Version bumped, committed, and pushed to GitHub!"
