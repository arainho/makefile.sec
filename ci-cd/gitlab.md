## GitLab CI

Automate, customize, and execute your software development pipelines right in your repository with [GitLab CI](https://docs.gitlab.com/ee/ci/).  
More detailed instructions are available on [quick_start](https://docs.gitlab.com/ee/ci/quick_start/).

0. Change to required the directory
```bash
cd path/to/repository
```

1. Create a .gitlab-ci.yml file at the root of your repository.
```bash
vi .gitlab-ci.yml
```

2. Adjust and add customized content to `ci-sec.yml`
```bash
stages:
  - secret_detection

secrets:
  stage: secret_detection
  image:
    name: python:3-alpine
  variables:
    SECRETS_RESULTS: 'secrets.json'
  script:
    - ls ${CI_PROJECT_DIR}
    - apk add --no-cache jq git --update
    - python -m pip install --upgrade truffleHog
    - trufflehog file:///${PWD}/ --json --regex --entropy=False | grep -v Whhaat | tee ${SECRETS_RESULTS} | jq -C
  artifacts:
    paths: ["${SECRETS_RESULTS}"]
    when: always
  allow_failure: false
```

### Notes
You can find other examples on my repository at GitLab called [secureapps-ci](https://gitlab.com/secureapps-ci/samples).
- [secret detection](https://gitlab.com/secureapps-ci/samples/repo-supervisor/-/blob/master/SecretsDetection-Integration.gitlab-ci.yml)
- [sast](https://gitlab.com/secureapps-ci/samples/moneyx/-/blob/master/.gitlab-ci.yml)
- [dast](https://gitlab.com/secureapps-ci/samples/zap-webgoat/-/blob/master/Security-Analysis.gitlab-ci.yml)
- [secret detection, sast, external sast](https://gitlab.com/secureapps-ci/samples/hello-shiftleft/-/blob/master/Security-Analysis.gitlab-ci.yml)
