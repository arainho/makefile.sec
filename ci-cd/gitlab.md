# GitLab CI/CD

Automate, customize, and execute your software development pipelines right in your repository with [GitHub CI/CD](https://docs.gitlab.com/ee/ci/).  
More detailed instructions are available on [quickstart](https://docs.gitlab.com/ee/ci/quick_start/).

0. Change to required the directory
```bash
cd path/to/repository
```

1. Download the Makefile to the source code folder `path/to/repository.`
```bash
curl -o Makefile https://raw.githubusercontent.com/arainho/ci-sec/main/Makefile
```

2. Create a .gitlab-ci.yml file at the root of your repository.
```bash
vi .gitlab-ci.yml
```
