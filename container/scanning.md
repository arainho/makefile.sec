
## Container scanning
To run container scanning tools, do:
```
make container_scanning
```

## Tools

We have several options
1. [Grype](https://github.com/anchore/grype)
```
grype -f high docker.io/alpine:latest
```

2. [Trivy](https://github.com/aquasecurity/trivy)
```
trivy --clear-cache docker.io/alpine:latest
```
