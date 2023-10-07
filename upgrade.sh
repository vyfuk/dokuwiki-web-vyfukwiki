#!/bin/sh
# This script upgrades DokuWiki files to specified tag by resetting all upstream files to their versions.
# This is done to prevent git messing up the files (learnt the hard way, trust me bro)
# Before starting, dont forget to add dokuwiki's official repo as a new remote and fetch all tags.

# Made by Miroslav Jarý <jason@vyfuk.org> - call if any questions arise at any point

# Check if tag even exists
TAG="tags/$1"
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo "Tag found!";
else
    echo "Unknown tag supplied";
    exit 1;
fi

# Branch to be updated
TARGET=$(git branch --show-current)

# Checkout tag
git checkout "$TAG" --detach

# Get files to be reseted
FILES=$(ls -a -I '.docker*' -I '.git*' -I '*.sh' -I '.' -I '..' -I '.vscode' -I 'conf' -I 'data')

# Go back to target branch and start resetting
git checkout "$TARGET"
for file in $FILES; do
    rm -rf $file
    git checkout "$TAG" -- $file
done
git submodule update --init