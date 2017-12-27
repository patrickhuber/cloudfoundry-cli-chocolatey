#!/bin/bash
export CF_VERSION=$(cat cf-cli-release/version)

# create working directory
mkdir stage/tools -p

# create nuspec file
sed \
 -e 's/$CF_VERSION/'"$CF_VERSION"'/' \
 cloudfoundry-cli-chocolatey/template/cf-cli.nuspec \
> stage/cf-cli.nuspec

# create the install script
sed \
 -e 's/$CF_VERSION/'"$CF_VERSION"'/' \
 cloudfoundry-cli-chocolatey/template/chocolateyinstall.ps1 
> stage/tools/chocolateyinstall.ps1

# run choco pack
# choco pack stage
choco pack stage --out package-directory 