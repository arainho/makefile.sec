
## Buildkite

[Builkite](https://buildkite.com/) is a platform for running fast, secure, and scalable continuous integration pipelines on your own infrastructure.  
More detailed instructions are available on [getting-started](https://buildkite.com/docs/tutorials/getting-started).

### requirements
- Cretate a Buildkite account [here](https://buildkite.com/signup)
- Install and run your first agent [+info](https://buildkite.com/docs/tutorials/getting-started#install-and-run-your-first-agent)


### create the pipeline
0. Create required the folder
```bash
cd path/to/repository
mkdir -p -- .buildkite/
```

1. Download the Makefile to the source code folder `path/to/repository.`
```bash
curl -o Makefile https://raw.githubusercontent.com/arainho/ci-sec/main/Makefile
```

2. Create your workflow
```bash
vi .buildkite/ci-sec.yml
chmod +x .buildkite/ci-sec.yml
```

3. Adjust and add customized content to `ci-sec.yml`
```
name: "SecretDetection Example"
steps:
  - label: ":hammer: SecretDetection Script"
    command: "make secret_detection"
    artifact_paths: "artifacts/*"
    agents:
      queue: "${BUILDKITE_AGENT_META_DATA_QUEUE:-default}"
```


