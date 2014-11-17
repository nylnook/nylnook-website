#!/bin/sh
DATE=`date`
docpad clean
docpad generate --env static
cp -ur out/* ../nylnook.github.io/
cd ../nylnook.github.io/
git add --all
git commit -m "$DATE"
git push
cd ../nylnook-website/
