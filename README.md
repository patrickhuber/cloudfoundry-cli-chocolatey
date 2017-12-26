# CloudFoundry CLI Chocolatey Package

Includes a concourse pipeline and scripts for building the cf cli chocolatey package

## Deploy to Concourse

```bash
fly -t main set-pipeline -p cloudfoundry-cli-chocolatey -c ci/generate-package-pipeline.yml
fly -t main unpause-pipeline -p cloudfoundry-cli-chocolatey
```

