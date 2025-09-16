# ${{ values.name }}

${{ values.description }}

## Quick Start

### Using Docker Compose

```bash
# Start SonarQube server
docker-compose up -d

# Access SonarQube at http://localhost:9000
# Default credentials: admin/admin
```

### Configuration

- **SonarQube Version**: ${{ values.sonarqube_version }}
- **TIBCO Plugin Version**: ${{ values.plugin_version }}
- **Deployment Type**: ${{ values.deployment_type }}

### Scanning BWCE Projects

1. Install SonarScanner CLI
2. Create `sonar-project.properties`:
   ```properties
   sonar.projectKey=${{ values.name }}
   sonar.projectName=${{ values.name }}
   sonar.projectVersion=1.0
   sonar.sources=.
   sonar.host.url=http://localhost:9000
   ```
3. Run scanner: `sonar-scanner`

## Features

- Pre-configured TIBCO BusinessWorks quality profiles
- Static code analysis for BW5/6/CE projects
- Quality gates and metrics
- PostgreSQL database included

## Resources

- [SonarQube Documentation](https://docs.sonarqube.org/)
- [TIBCO BusinessWorks](https://www.tibco.com/products/tibco-businessworks)