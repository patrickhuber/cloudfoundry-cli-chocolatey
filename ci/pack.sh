#!/bin/bash
export CF_VERSION=$(cat cf-cli-release/version)
export CF_DESCRIPTION=$(cat cf-cli-release/body)

# install envsubst
apt-get update
apt-get -y install gettext-base
apt-get clean 
rm -rf /var/lib/apt/lists/*

# create working directory
mkdir stage/tools -p

# create nuspec file
envsubst \
< cloudfoundry-cli-chocolatey/template/cf-cli.nuspec \
> stage/cf-cli.nuspec

# create the install script
envsubst \
< cloudfoundry-cli-chocolatey/template/chocolateyinstall.ps1 \
> stage/tools/chocolateyinstall.ps1

# run choco pack
# choco pack stage
cat stage/cf-cli.nuspec
cat stage/tools/chocolateyinstall.ps1