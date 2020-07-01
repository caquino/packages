# packages
This repository holds the builder `Github Actions` of multiple packages.

The list of packages can be seen at [packages](packages/)

To use this packages add the following entry to your apt configuration:
```
echo "deb [trusted=yes] https://syshero.org/repository ./" |\
  sudo tee /etc/apt/sources.list.d/syshero.list
```

After adding apt configuration, apt can be used to install any of the packages available.

# Motivation

This repository was created to package applications that are not available on Debian/Ubuntu and also to test `Github Actions`

The package repository is hosted on `Github Pages`

After commiting packages to this repository, `Github Actions` is triggered which build the packages and push to `Github Pages` repository.


