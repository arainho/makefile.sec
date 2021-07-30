## GitHub Actions

Automate, customize, and execute your software development workflows right in your repository with [GitHub Actions](https://docs.github.com/en/actions).  
More detailed instructions are available on [quickstart](https://docs.github.com/en/actions/quickstart).

0. Create required the folder
```bash
cd path/to/repository
mkdir -- .github/workflows/
```


1. Download the Makefile to the source code folder `path/to/repository.`
```bash
curl -o Makefile https://raw.githubusercontent.com/arainho/ci-sec/main/Makefile
```

2. Create your workflow
```bash
vi .github/workflows/ci-sec.yml
```

3. Adjust and add customized content to `ci-sec.yml`
```
name: SecretDetection Actions Demo
on: [push]
jobs:
  Run-SecretDetection-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v2
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready!"
      - run: echo "⚡ Running secret detection ..."
      - name: Run secret detection
        run: |
          make secret_detection
      - run: echo "🍏 This job's status is ${{ job.status }}."
```
