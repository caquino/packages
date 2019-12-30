#!/usr/bin/env bash
for package in packages/*/*/recipe.rb
do
  PACKAGE_DIR=$(dirname $package)
  cd ${PACKAGE_DIR}
  fpm-cook clean
  fpm-cook
  cd -
done
mkdir build
mv packages/*/*/pkg/*.deb repository/
