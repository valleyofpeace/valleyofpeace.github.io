#!/bin/bash
set -e
REMOTEURL=https://valleyofpeace@github.com/valleyofpeace/valleyofpeace.github.io.git

jekyll build

read -p 'Pushing website to GitHub. Enter commit message for this update: ' commitmessage

git add -A
git commit -m "$commitmessage (sources)"
git push $REMOTEURL sources

cd _site
touch .nojekyll
cp ../CNAME ./
git add -A
git commit -m "$commitmessage (jekyll build to master)"
git push $REMOTEURL master

cd ..

echo 'Successfully built site and pushed site and sources to GitHub.'