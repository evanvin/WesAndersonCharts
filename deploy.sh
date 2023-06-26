#!/usr/bin/env sh
# abort on errors
set -e

if [ -z "$(git status --porcelain)" ]; then
    echo "Beginning to deploy..."
else
    echo "\033[1;31mYou have untracked changes\033[0m"
    exit 1
fi

git checkout --orphan gh-pages

# build
npm run build


git --work-tree dist add --all
git --work-tree dist commit -m "gh-pages"

echo "Pushing to gh-pages..."

git push origin HEAD:gh-pages --force

rm -r dist

git checkout -f master
git branch -D gh-pages