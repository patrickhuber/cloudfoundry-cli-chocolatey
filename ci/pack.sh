#!/bin/bash
export CF_VERSION=$(cat cf-cli-release/version)
export PACKAGE_TOOLS_FILTER="tools/**"

# create working directory
mkdir stage/tools -p

# create nuspec file
sed \
 -e 's/$CF_VERSION/'"$CF_VERSION"'/' \
 -e 's/$PACKAGE_TOOLS_FILTER/'"$PACKAGE_TOOLS_FILTER"'/' \
 cloudfoundry-cli-chocolatey/template/cf-cli.nuspec \
> stage/cf-cli.nuspec

# create the install script
sed \
 -e 's/$CF_VERSION/'"$CF_VERSION"'/' \
 cloudfoundry-cli-chocolatey/template/chocolateyinstall.ps1 
> stage/tools/chocolateyinstall.ps1

# run choco pack
choco pack stage/cf-cli.nuspec --out package-directory --allow-unofficial