# ci-sec
Repository with tools, resources, and guidelines to enable security tests into CI/CD pipelines. 
The purpose is to shift-left by injecting the security processes earlier on Software Development Lyfe-Cycle (SLDC).

### Requirements
- [macOS](https://www.apple.com/macos/), [Linux](https://www.linux.org/)
- [Docker](https://docs.docker.com/engine/install/)
- [jq](https://stedolan.github.io/jq/download/)

### General instructions
1. Download the Makefile to your source code folder
```
curl -o Makefile https://raw.githubusercontent.com/arainho/ci-sec/main/Makefile
```
2. Run the desired security test 
```
make secret_detection
```

## Run it now!

Next, we have dedicated entries for all the security tests available.

| Name | Makefile entry | Instructions Status |
| ---- | --------------- | ------------------- |
| [API scan](api/scan.md) | -- | -- |
| [Container scanning](container/scanning.md) | -- | in progress |
| [DAST](dast/analysis.md) | -- | -- |
| [Dependency scanning](dependency/scanning.md) | yes | -- |
| [IaC scanning](iac/scanning.md) | -- | in progress |
| [Kubernetes scan](kube/scan.md) | -- | in progress |
| [SAST](sast/analysis.md) | yes | in progress |
| [Secret detection](secret/detection.md) | yes | in progress |
| | |

Table legend:
- `Makefile entry` indicates whether there is an entry for the specified test (yes) or not (--).
- `Instructions status` indicates whether there is an entry for the test (in progress) or is empty (--).
