
## secret detection

We have several options

1. [TruffleHog](https://github.com/trufflesecurity/truffleHog)
```
trufflehog --json --regex --entropy=False file:///$PWD/ | jq -C
```

2. [Trivy](https://github.com/aquasecurity/trivy)
```
curl -o /tmp/config.yaml https://raw.githubusercontent.com/eth0izzle/shhgit/master/config.yaml
shhgit -config-path /tmp/ -entropy-threshold 0 -debug -local $PWD/
```
