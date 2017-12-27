#!/bin/bash
export CF_VERSION=$(cat cf-cli-release/version)
export CF_DESCRIPTION=$(cat cf-cli-release/body)

# create working directory
mkdir stage/tools -p

# create nuspec file
cat cloudfoundry-cli-chocolatey/template/cf-cli.nuspec \
| envsubst > stage/cf-cli.nuspec

# create the install script
cat cloudfoundry-cli-chocolatey/template/chocolateyinstall.ps1 \
| envsubst > stage/tools/chocolateyinstall.ps1

# run choco pack
# choco pack stage
cat stage/cf-cli.nuspec
cat stage/tools/chocolateyinstall.ps1