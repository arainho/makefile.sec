# makefile.sec
Repository with tools, resources, and guidelines to enable security tests into CI/CD pipelines.   
The purpose is to shift-left by injecting the security processes earlier on Software Development Lyfe-Cycle (SLDC). 

`Use 'Makefile.sec + Docker' to run security tests in CI/CD pipelines`

### Requirements
- [macOS](https://www.apple.com/macos/), [Linux](https://www.linux.org/)
- [Docker](https://docs.docker.com/engine/install/)
- [make](https://savannah.gnu.org/projects/make/)
- [jq](https://stedolan.github.io/jq/download/)

### General instructions
1. Download the Makefile to your source code folder
```
curl -o Makefile.sec https://raw.githubusercontent.com/arainho/ci-sec/main/Makefile.sec
```
2. Run the desired security test 
```
make -f Makefile.sec secret_detection
```

## Run it!

Next, we have dedicated entries for all the security tests available.

| Name | Makefile entry | Instructions Status |
| ---- | --------------- | ------------------- |
| [API scan](api/scan.md) | -- | -- |
| [Container scanning](container/scanning.md) | -- | in progress |
| [DAST](dast/analysis.md) | -- | -- |
| [Dependency scanning](dependency/scanning.md) | -- | -- |
| [IaC scanning](iac/scanning.md) | -- | in progress |
| [Kubernetes scan](kube/scan.md) | -- | in progress |
| [SAST](sast/analysis.md) | yes | in progress |
| [Secret detection](secret/detection.md) | yes | in progress |
| | |

## Let's pipeline it!

Next, we have entries for CI-CI pipelines definitions available.

| CI/CD system | Instructions Status |
| ------------ | ------------------- |
| [Buildkite](ci-cd/buildkite.md)| in progress |
| [GitHub](ci-cd/github.md) | in progress |
| [GitLab](ci-cd/gitlab.md) | in progress |
| [Go-CD](ci-cd/gocd.md) | -- |
| [Jenkins](ci-cd/jenkins.md) | -- |
| | |

Tables legend:
- `Makefile entry` indicates whether there is an entry for the specified test (yes) or not (--).
- `Instructions status` indicates whether there is an entry for the test (in progress) or is empty (--).
