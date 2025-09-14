#!/bin/bash

# Read current version
current_version=$(cat version.txt)

# Split version into parts
IFS='.' read -ra VERSION_PARTS <<< "$current_version"
major=${VERSION_PARTS[0]}
minor=${VERSION_PARTS[1]}
patch=${VERSION_PARTS[2]}

# Increment patch version
patch=$((patch + 1))

# Create new version
new_version="$major.$minor.$patch"

# Update version file
echo "$new_version" > version.txt

# Update version in index.html
sed -i '' "s/v[0-9]*\.[0-9]*\.[0-9]*/v$new_version/g" index.html

echo "Version bumped from v$current_version to v$new_version"
