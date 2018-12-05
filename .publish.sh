#!/bin/bash
set -ex
DATE=$(date);
TMPREPO=$(mktemp -d);
git clone --quiet git@github.com:usegalaxy-eu/usegalaxy-eu.github.io.git $TMPREPO;
mv $TMPREPO/.git _site/;
cp Gemfile Gemfile.lock _site;
cp readme-deployed.md _site/README.md;
rm -rf $TMPREPO
cd _site
git add --all *
#git config --local user.name "UseGalaxy.EU Build Bot"
#git config --local user.email "jenkins@usegalaxy.eu"

git commit -m "Update site ($DATE)"

git push origin master
