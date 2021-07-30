# ci-sec
Repository with tools, resources, and guidelines to enable security tests into CI/CD pipelines. 
The purpose is to guide and improve security process shifting left on Software Development Lyfe-Cycle(SLDC).

## Setup

### Requirements
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

### Security tests available
Next, we have dedicated entries of each type of test.

| Name |
| ---- |
| [Container scanning](container/scanning.md) |
| [IaC scanning](iac/scanning.md) |
| | |

