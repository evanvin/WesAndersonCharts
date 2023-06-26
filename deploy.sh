#!/usr/bin/env sh
# abort on errors
set -e

git checkout --orphan gh-pages

# build
npm run build


git --work-tree dist add --all
git --work-tree dist commit -m "gh-pages"

echo "Pushing to gh-pages..."

git push origin master:gh-pages --force

rm -r dist

git checkout -f master
git branch -D gh-pages