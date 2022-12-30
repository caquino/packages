#!/usr/bin/env bash
for package in packages/*/*/recipe.rb
do
  PACKAGE_DIR=$(dirname $package)
  cd ${PACKAGE_DIR}
  fpm-cook clean
  fpm-cook
  cd -
done
mkdir repository
mv packages/*/*/pkg/*.deb repository/
curl -s https://api.github.com/repos/caquino/redis-bash/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
mv *.deb repository/
