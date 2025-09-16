# ${{ values.name }}

${{ values.description }}

## Overview

This documentation provides a comprehensive guide for creating TIBCO BusinessWorks Container Edition (BWCE) projects using Developer Hub templates with integrated CI/CD pipelines.

## Features

- **Project Initialization**: Generate BWCE projects with predefined structure
- **GitHub Integration**: Seamless repository publishing and version control
- **Developer Hub Catalog**: Automatic component registration
{% if values.include_jenkins -%}
- **Jenkins CI/CD**: Automated build and deployment pipelines
{% endif -%}
{% if values.include_kubernetes -%}
- **Kubernetes Deployment**: Container orchestration and management
{% endif -%}
{% if values.include_governance -%}
- **Code Quality**: SonarQube analysis and Trivy security scanning
{% endif -%}

## Quick Start

1. **Template Selection**: Choose this template from the Developer Hub catalog
2. **Parameter Configuration**: Fill in project details and deployment preferences
3. **Repository Setup**: Specify GitHub repository location
4. **Generate Project**: Click "Create" to generate the documentation project

## Project Structure

```
${{ values.name }}/
├── README.md
├── catalog-info.yaml
├── mkdocs.yml
└── docs/
    ├── index.md
    {% if values.include_jenkins -%}
    ├── jenkins-integration.md
    {% endif -%}
    {% if values.include_kubernetes -%}
    ├── kubernetes-deployment.md
    {% endif -%}
    {% if values.include_governance -%}
    ├── governance.md
    {% endif -%}
    ├── configuration.md
    └── examples.md
```

## Configuration

This project is configured with:
- **Documentation Type**: ${{ values.documentation_type }}
{% if values.include_jenkins -%}
- **Jenkins Integration**: Enabled
{% endif -%}
{% if values.include_kubernetes -%}
- **Kubernetes Support**: Enabled
{% endif -%}
{% if values.include_governance -%}
- **Governance Tools**: SonarQube and Trivy enabled
{% endif -%}
{% if values.include_images -%}
- **Visual Content**: Diagrams and screenshots included
{% endif -%}

## Resources

- [TIBCO BusinessWorks](https://www.tibco.com/products/tibco-businessworks)
- [TIBCO Developer Hub Documentation](https://docs.tibco.com/products/tibco-cloud-integration)
- [Backstage Documentation](https://backstage.io/docs/)
{% if values.include_jenkins -%}
- [Jenkins Documentation](https://www.jenkins.io/doc/)
{% endif -%}
{% if values.include_kubernetes -%}
- [Kubernetes Documentation](https://kubernetes.io/docs/)
{% endif -%}