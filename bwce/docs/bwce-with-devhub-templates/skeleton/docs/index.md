# ${{ values.name }}

${{ values.description }}

## BWCE in Minutes: Using Dev Hub Templates

The Developer Hub template simplifies the creation of new TIBCO BusinessWorks Container Edition (BWCE) projects. It automates the process of generating a basic project structure, publishing it to GitHub, registering it in the Dev Hub catalog, and optionally deploying it to Kubernetes or TIBCO Platform.

## Key Features

### Project Automation
- **Project Initialization**: Generates new BWCE projects with predefined structure
- **GitHub Integration**: Seamlessly publishes projects to GitHub repositories
- **Developer Hub Catalog Registration**: Automatically registers projects in your catalog
{% if values.include_jenkins -%}
- **Jenkins Pipeline Trigger**: Triggers automated build and deployment pipelines
{% endif -%}
{% if values.include_kubernetes -%}
- **Flexible Deployment Options**: Deploy to Kubernetes clusters or TIBCO Platform
{% endif -%}

### Architecture Overview

{% if values.include_images -%}
![BWCE DevHub Architecture](https://github.com/user-attachments/assets/f72303d8-d735-4be5-9b92-43d8e301cd98)
{% endif -%}

The template provides an end-to-end solution for BWCE application development and deployment.

## Prerequisites

### Required Components
- **TIBCO Platform Data Plane**: Developer Hub environment
- **Custom Dev Hub Image**: Docker image with Jenkins and Kubernetes plugins
  - Available: `docker.io/mpandav/devhub-custom-130:latest`
{% if values.include_jenkins -%}
- **Jenkins Server**: Configured with required plugins for BWCE builds
  - Quick setup: [Jenkins Installation Script](https://github.com/mpandav-tibco/external-tools-installation/tree/main/jenkins)
{% endif -%}
{% if values.include_kubernetes -%}
- **Kubernetes Cluster**: For containerized deployments (optional)
{% endif -%}
{% if values.include_governance -%}
- **SonarQube Server**: With BW6 plugin for code quality analysis (optional)
  - Quick setup: [SonarQube Installation Script](https://github.com/mpandav-tibco/external-tools-installation/tree/main/sonarqube)
- **Trivy Scanner**: For security vulnerability scanning (optional)
{% endif -%}

## Usage Workflow

### 1. Template Installation
Add the BWCE template to your Developer Hub instance from the marketplace.

### 2. Create New Component
1. Navigate to Developer Hub catalog
2. Click "Create Component" 
3. Select the BWCE template

### 3. Configure Parameters
Fill in the template form with:
- **Project Details**: Name, description, owner
- **Repository**: GitHub URL and location
{% if values.include_governance -%}
- **Governance Options**:
  - Code scanning with SonarQube
  - Security scanning with Trivy
{% endif -%}
{% if values.include_kubernetes -%}
- **Deployment Options**:
  - Target platform (Kubernetes/TIBCO Platform)
  - Namespace and deployment details
  - Authentication tokens and certificates
{% endif -%}

### 4. Execute Template
Click "Create" to generate the project and trigger the automated pipeline.

{% if values.include_jenkins -%}
## Jenkins Integration

The template leverages Jenkins for automated CI/CD processes:

### Pipeline Workflow
1. **Source Code Management**: Clone the specified Git repository
2. **Build Process**: Compile BWCE application into EAR file using Maven
3. **Containerization**: Create Docker image with the application
{% if values.include_governance -%}
4. **Quality Analysis**: Run SonarQube code quality analysis
5. **Security Scanning**: Perform Trivy vulnerability assessment
{% endif -%}
6. **Deployment**: Deploy to target environment (Kubernetes/TIBCO Platform)
7. **Artifact Management**: Push build artifacts back to Git repository

For detailed Jenkins configuration, refer to the [Jenkins Build Script README](jenkins-readme.md).
{% endif -%}

{% if values.include_kubernetes -%}
## Kubernetes Deployment

### Deployment Configuration
When selecting Kubernetes deployment, the template generates:

- **Deployment YAML**: Kubernetes deployment manifest
- **Service Configuration**: Load balancing and networking
- **Resource Management**: CPU and memory limits
- **Health Checks**: Liveness, readiness, and startup probes
- **Labels**: Including `backstage.io/kubernetes-id` for Dev Hub integration

### Visualization
The Backstage Kubernetes plugin enables:
- Real-time resource monitoring
- Pod status and logs visualization
- Deployment management through Dev Hub
{% endif -%}

## Developer Hub Integration

### Catalog Features
- **Centralized Component View**: All project details in one place
- **Ownership Tracking**: Clear component ownership and responsibilities  
- **Lifecycle Management**: Track component status and dependencies
- **Tool Integration**: Easy access to related tools and documentation

### Configuration Requirements
Your Developer Hub `app-config.yaml` should include:

```yaml
auth:
  providers:
    github:
      development:
        clientId: ${GITHUB_CLIENT_ID}
        clientSecret: ${GITHUB_CLIENT_SECRET}

integrations:
  github:
    - host: github.com
      token: ${GITHUB_TOKEN}

{% if values.include_jenkins -%}
jenkins:
  baseUrl: ${JENKINS_BASE_URL}
  username: ${JENKINS_USERNAME}
  apikey: ${JENKINS_API_TOKEN}
{% endif -%}

{% if values.include_kubernetes -%}
kubernetes:
  serviceLocatorMethod:
    type: 'multiTenant'
  clusterLocatorMethods:
    - type: 'config'
      clusters:
        - url: ${K8S_CLUSTER_URL}
          name: production
          authProvider: 'serviceAccount'
          serviceAccountToken: ${K8S_TOKEN}
{% endif -%}
```

## Best Practices

### Project Organization
- Use consistent naming conventions
- Maintain clear project descriptions
- Assign appropriate ownership
- Tag projects appropriately for discovery

### Security
- Use service accounts for automation
- Rotate authentication tokens regularly
- Apply principle of least privilege
- Enable audit logging

{% if values.include_governance -%}
### Code Quality
- Configure SonarQube quality gates
- Address security vulnerabilities promptly
- Maintain code coverage metrics
- Review quality reports regularly
{% endif -%}

## Support and Resources

### Documentation
- [TIBCO BusinessWorks](https://www.tibco.com/products/tibco-businessworks)
- [Developer Hub Documentation](https://docs.tibco.com/products/tibco-cloud-integration)
- [Backstage.io](https://backstage.io/docs/)

### Community
- [TIBCO Community](https://community.tibco.com/)
- [Backstage Discord](https://discord.gg/backstage-687207715902193673)

### Support Channels
- TIBCO Support Portal
- GitHub Issues for template-specific problems
- Internal documentation and knowledge base