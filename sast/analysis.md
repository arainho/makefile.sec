
## SAST
To run Static application security testing (SAST) tools, do:
```
make sast
```

### Tools
| Author | Name | Description |
| ------ | ---- | ----------- |
| ShiftLeftSecurity | [Scan (skæn)](https://slscan.io) | Scan is a free & Open Source DevSecOps tool for performing static analysis based security testing of your applications and its dependencies. CI and Git friendly. |
| SonarSource | [SonarQube](https://www.sonarqube.org/)| Code Quality and Code Security |
||||

### Notes
When there is no specific scanner for your CI/CD system you can [SonarScanner](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/) to send code for analysis at Sonar(Cloud|Cube)
