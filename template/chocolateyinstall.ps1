$ErrorActionPreference='Stop';

$url="https://packages.cloudfoundry.org/stable?release=windows32-exe&version=$CF_VERSION&source=github-rel"
$url64="https://packages.cloudfoundry.org/stable?release=windows64-exe&version=$CF_VERSION&source=github-rel"

Install-ChocolateyZipPackage `
  -PackageName "cf-cli" `
  -Url $url `
  -Url64 $url64