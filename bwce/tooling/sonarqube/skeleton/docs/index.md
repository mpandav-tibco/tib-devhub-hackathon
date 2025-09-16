# ${{ values.name }}

${{ values.description }}

## Overview

This SonarQube setup includes the TIBCO BusinessWorks Container Edition plugin for comprehensive code quality analysis of BW projects.

**Configuration:**
- SonarQube Version: ${{ values.sonarqube_version }}
- TIBCO Plugin Version: ${{ values.plugin_version }}
- Deployment Type: ${{ values.deployment_type }}

## Getting Started

### 1. Start SonarQube

```bash
docker-compose up -d
```

### 2. Access Dashboard

- URL: http://localhost:9000
- Default credentials: admin/admin

### 3. Scan BWCE Project

Create `sonar-project.properties`:
```properties
sonar.projectKey=${{ values.name }}-scan
sonar.projectName=My BWCE Project
sonar.sources=src
sonar.host.url=http://localhost:9000
sonar.login=your-token
```

Run scanner:
```bash
sonar-scanner
```

## Features

- **Static Analysis**: Comprehensive code quality analysis for BW5/6/CE
- **Quality Gates**: Pre-configured rules and thresholds
- **Metrics**: Code coverage, complexity, and maintainability
- **Integration**: CI/CD pipeline support

## Support

For issues or questions, refer to:
- [SonarQube Documentation](https://docs.sonarqube.org/)
- [TIBCO BusinessWorks](https://www.tibco.com/products/tibco-businessworks)