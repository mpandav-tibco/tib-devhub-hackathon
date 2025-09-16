# SonarQube BWCE Plugin

SonarQube server with TIBCO BusinessWorks Container Edition plugin for comprehensive code quality analysis and static code scanning of BW5/6/CE projects.

## Overview

This template provides a ready-to-use SonarQube server with the TIBCO plugin that supports:
- BusinessWorks 5.x projects
- BusinessWorks 6.x projects  
- BusinessWorks Container Edition projects
- Static code analysis and quality gates
- Continuous integration integration

## Features

- **Pre-configured SonarQube Server**: Version 9.9.8 with TIBCO plugin 1.3.11
- **Docker Support**: Ready-to-deploy Docker image available
- **Kubernetes Ready**: Deployment manifests included
- **CI/CD Integration**: Jenkins and GitHub Actions examples
- **Quality Gates**: Pre-defined rules for BWCE projects

## Quick Start

### Docker Compose Deployment

```bash
# Clone the generated project
cd ${{ values.name }}

# Start SonarQube server
docker-compose up -d

# Access SonarQube at http://localhost:9000
# Default credentials: admin/admin
```

### Kubernetes Deployment

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/

# Port forward to access locally
kubectl port-forward svc/sonarqube 9000:9000
```

### Scanning BWCE Projects

```bash
# Install SonarScanner
# Configure sonar-project.properties
sonar-scanner \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=your-token \
  -Dsonar.projectKey=your-bwce-project
```

## Configuration

### Environment Variables
- `SONAR_JDBC_URL`: Database connection URL
- `SONAR_JDBC_USERNAME`: Database username
- `SONAR_JDBC_PASSWORD`: Database password

### Quality Profiles
- TIBCO BusinessWorks quality profile pre-configured
- Custom rules for BWCE best practices
- Performance and security rule sets

## Support

- SonarQube Version: ${{ values.sonarqube_version }}
- TIBCO Plugin Version: ${{ values.plugin_version }}
- Deployment Type: ${{ values.deployment_type }}

## Resources

- [SonarQube Documentation](https://docs.sonarqube.org/)
- [TIBCO BusinessWorks](https://www.tibco.com/products/tibco-businessworks)
- [Docker Hub Image](https://hub.docker.com/repository/docker/mpandav/tib-sonarqube-community-lts)