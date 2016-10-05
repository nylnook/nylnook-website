#!/bin/sh
DATE=`date`
docpad clean
docpad generate --env static
cp -ur out/* ../nylnook-gandi/htdocs/
cd ../nylnook-gandi/htdocs/
git add .
git commit -m "$DATE"
git push
cd ../nylnook-website/
