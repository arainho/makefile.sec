# ci-sec
Repository with tools, resources, and guidelines to enable security tests into CI/CD pipelines. 
The purpose is to guide and improve security process shifting left on Software Development Lyfe-Cycle(SLDC).

## Run it now!

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

## Notes

### Container scanning
To run container scanning tools, do:
```
make container_scanning
```

To run other tools view [+info](container/scanning.md)
