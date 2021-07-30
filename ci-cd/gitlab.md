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

3. Adjust and add customized content to `ci-sec.yml`
```bash
stages:
- build
- test
- deploy

build-job:
  stage: build
  script:
    - echo "Hello, $GITLAB_USER_LOGIN!"

test-job1:
  stage: test
  script:
    - echo "This job tests something"

deploy-prod:
  stage: deploy
  script:
    - echo "This job deploys something from the $CI_COMMIT_BRANCH branch."

```

