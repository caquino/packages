#!/usr/bin/env bash

mkdir -p caquino.github.io/repository
cp repository/* caquino.github.io/repository
cd caquino.github.io/repository
dpkg-scanpackages . | gzip -c9 > Packages.gz
git config --local user.email "caquino@users.noreply.github.com"
git config --local user.name "Cassiano Aquino"
git add .
git commit -am "Updating repository"
git push -f
