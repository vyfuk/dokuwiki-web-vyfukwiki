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
FILES=$(ls -a -I '.docker*' -I 'docker*' -I '.git' -I '.gitmodules' -I 'upgrade.sh' -I '.' -I '..' -I '.vscode' -I 'data' -I '.github' -I 'README.md' -I '/conf/*.local.conf' -I '/conf/acl.auth.php' -I '/conf/local.php' -I '/conf/local.protected.php' -I '/conf/users.auth.php' -I '/conf/user*.css' -I '/conf/user*.js' -I '/conf/words.aspell' -I '/conf/lang/*' -I '/conf/plugin_lang/*' -I '/conf/plugins.local.*' -I '/conf/tpl/*' -I 'conf/tpl/dokuwiki/style.ini')

# Go back to target branch and start resetting
git checkout "$TARGET"
for file in $FILES; do
    rm -rf $file
    git checkout "$TAG" -- $file
done
git submodule update --init --recursive
rm -rf _test
