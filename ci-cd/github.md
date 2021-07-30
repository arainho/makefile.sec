# GitHub Actions

Automate, customize, and execute your software development workflows right in your repository with [GitHub Actions](https://docs.github.com/en/actions).  
More detailed instructions are available on [quickstart](https://docs.github.com/en/actions/quickstart).

1. Create required the folder
```bash
mkidr -- .github/workflows/
```

2. Create your workflow
```bash
vi .github/workflows/ci-sec.yml
```

3. Ajust and add customized content to `ci-sec.yml`
```
name: GitHub Actions Demo
on: [push]
jobs:
  Explore-GitHub-Actions:
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
