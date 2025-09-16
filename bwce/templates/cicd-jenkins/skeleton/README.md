# ${{ values.name }}

${{ values.description }}

## CI/CD Pipeline Configuration

This project is configured with a comprehensive CI/CD pipeline for TIBCO BusinessWorks Container Edition applications.

### Pipeline Configuration

- **Pipeline Type**: ${{ values.pipeline_type | title }}
- **Deployment Target**: ${{ values.deployment_target | title }}
- **Testing Enabled**: {% if values.enable_testing %}✅ Yes{% else %}❌ No{% endif %}
- **Security Scanning**: {% if values.enable_security_scanning %}✅ Enabled{% else %}❌ Disabled{% endif %}
{% if values.blue_green_deployment %}- **Blue-Green Deployment**: ✅ Enabled{% endif %}

### Target Environments

The pipeline is configured to deploy to the following environments:
{% for env in values.environments %}
- **{{ env | title }}**: Automated deployment {% if env == "production" and not values.auto_promote_to_prod %}with manual approval{% else %}enabled{% endif %}
{% endfor %}

### Features Included

{% if values.include_database_migration %}
✅ **Database Migration**: Flyway-based database schema management
{% endif %}
{% if values.include_monitoring %}
✅ **Monitoring**: Prometheus metrics collection and Grafana dashboards
{% endif %}
{% if values.include_logging %}
✅ **Centralized Logging**: ELK stack integration for log aggregation
{% endif %}
{% if values.notification_channels %}
✅ **Notifications**: Configured for {% for channel in values.notification_channels %}{{ channel | title }}{% if not loop.last %}, {% endif %}{% endfor %}
{% endif %}

## Quick Start

### Prerequisites

1. **Development Environment**
   - TIBCO BusinessWorks Container Edition Studio
   - Java Development Kit (JDK) 8+
   - Maven 3.6.0+
   - Docker 20.10+

2. **CI/CD Infrastructure**
{% if values.pipeline_type == "jenkins" %}
   - Jenkins server with required plugins
   - Docker registry access
{% elif values.pipeline_type == "gitlab-ci" %}
   - GitLab instance with CI/CD enabled
   - GitLab Runner with Docker executor
{% elif values.pipeline_type == "github-actions" %}
   - GitHub repository with Actions enabled
   - Docker registry access (GitHub Container Registry or DockerHub)
{% endif %}

3. **Deployment Target**
{% if values.deployment_target == "kubernetes" %}
   - Kubernetes cluster (v1.21+)
   - kubectl configured for cluster access
   - RBAC permissions for deployments
{% elif values.deployment_target == "openshift" %}
   - Red Hat OpenShift cluster
   - oc CLI configured for cluster access
{% elif values.deployment_target == "docker-compose" %}
   - Docker Compose v2.0+
   - Docker Swarm (optional for production)
{% endif %}

### Getting Started

1. **Clone the Repository**
   ```bash
   git clone https://github.com/${{ values.destination.owner }}/${{ values.destination.repo }}.git
   cd ${{ values.destination.repo }}
   ```

2. **Review Configuration**
   ```bash
   # Review pipeline configuration
   {% if values.pipeline_type == "jenkins" %}cat Jenkinsfile{% elif values.pipeline_type == "gitlab-ci" %}cat .gitlab-ci.yml{% elif values.pipeline_type == "github-actions" %}cat .github/workflows/ci-cd.yml{% endif %}
   
   # Review deployment manifests
   ls -la k8s/
   
   # Check environment configuration
   ls -la config/
   ```

3. **Build and Test Locally**
   ```bash
   # Build BWCE application
   mvn clean package
   
   # Build Docker image
   docker build -t ${{ values.name }}:latest .
   
   # Run locally
   docker run -p 8080:8080 ${{ values.name }}:latest
   ```

4. **Deploy to Development**
   ```bash
{% if values.deployment_target == "kubernetes" %}
   # Deploy to Kubernetes
   kubectl apply -f k8s/dev/
   
   # Check deployment status
   kubectl get pods -l app=${{ values.name }}
{% elif values.deployment_target == "docker-compose" %}
   # Deploy with Docker Compose
   docker-compose up -d
   
   # Check service status
   docker-compose ps
{% endif %}
   ```

## Documentation

For detailed implementation guidance, see the [comprehensive documentation](docs/index.md) which covers:

- **CI/CD Pipeline Setup**: Step-by-step configuration guide
- **BWCE Development**: Best practices for container-native development
- **Deployment Strategies**: Multi-environment deployment patterns
- **Monitoring & Observability**: Metrics, logging, and alerting setup
- **Operations Guide**: Troubleshooting and maintenance procedures

## Architecture Overview

```
┌─────────────────┐    ┌──────────────┐    ┌─────────────┐
│   Source Code   │───▶│   Pipeline   │───▶│ Deployment  │
│   Repository    │    │   {{ values.pipeline_type | title }}    │    │ {{ values.deployment_target | title }}   │
└─────────────────┘    └──────────────┘    └─────────────┘
│                     │                   │
├─ Feature Branch     ├─ Build & Test     ├─ Dev Environment
├─ Pull Request       ├─ Security Scan    ├─ UAT Environment
├─ Code Review        ├─ Docker Build     └─ Prod Environment
└─ Main Branch        └─ Quality Gates    
```

## Pipeline Stages

{% if values.pipeline_type == "jenkins" %}
### Jenkins Pipeline Stages

1. **Source Code Checkout**: Clone repository and checkout branch
2. **Build & Package**: Maven compilation and EAR generation
3. **Unit Testing**: Automated test execution
{% if values.enable_security_scanning %}4. **Security Scanning**: Vulnerability assessment and compliance checks{% endif %}
5. **Docker Build**: Container image creation and registry push
6. **Deploy to Dev**: Automatic deployment to development environment
7. **Integration Testing**: End-to-end testing in dev environment
8. **UAT Deployment**: Manual approval for user acceptance testing
{% if "production" in values.environments %}9. **Production Deployment**: {% if values.auto_promote_to_prod %}Automatic{% else %}Manual approval{% endif %} production deployment{% endif %}
{% endif %}

## Environment Configuration

### Development Environment
- **Purpose**: Development and initial testing
- **Deployment**: Automatic on merge to main branch
- **Data**: Mock data and test services
{% if values.include_monitoring %}- **Monitoring**: Basic metrics collection{% endif %}

### UAT Environment
- **Purpose**: User acceptance testing and validation
- **Deployment**: Manual promotion from development
- **Data**: Sanitized production-like data
{% if values.include_monitoring %}- **Monitoring**: Full observability stack{% endif %}

{% if "production" in values.environments %}
### Production Environment
- **Purpose**: Live production workloads
- **Deployment**: {% if values.auto_promote_to_prod %}Automatic after UAT validation{% else %}Manual approval process{% endif %}
- **Data**: Live production data
{% if values.include_monitoring %}- **Monitoring**: Complete observability with alerting{% endif %}
{% if values.blue_green_deployment %}- **Strategy**: Blue-green deployment for zero downtime{% endif %}
{% endif %}

## Monitoring and Observability

{% if values.include_monitoring %}
### Metrics Collection

- **Application Metrics**: Custom BWCE application metrics
- **Infrastructure Metrics**: Container and cluster resource usage
- **Business Metrics**: Integration throughput and error rates

### Dashboards

- **Application Dashboard**: BWCE-specific performance metrics
- **Infrastructure Dashboard**: Kubernetes cluster health
- **Business Dashboard**: Integration KPIs and SLAs

### Alerting

Configured alerts for:
- Application health and availability
- Performance degradation
- Error rate thresholds
- Resource usage limits
{% endif %}

{% if values.include_logging %}
### Centralized Logging

- **Log Aggregation**: ELK stack for centralized log collection
- **Log Analysis**: Structured logging with correlation IDs
- **Retention Policy**: Environment-specific log retention
- **Search and Analytics**: Kibana dashboards for log analysis
{% endif %}

## Security

{% if values.enable_security_scanning %}
### Security Scanning

- **Dependency Scanning**: OWASP dependency vulnerability checks
- **Container Scanning**: Trivy security scanning for Docker images
- **Static Code Analysis**: SonarQube integration for code quality
- **Secret Detection**: GitLeaks for sensitive data detection
{% endif %}

### Secure Configuration

- **Secrets Management**: Kubernetes secrets for sensitive data
- **RBAC**: Role-based access control for deployments
- **Network Policies**: Pod-to-pod communication security
- **TLS Encryption**: End-to-end encryption for all communications

## Support and Maintenance

### Team Contacts

- **Owner**: ${{ values.owner }}
- **Repository**: [GitHub](${{ "https://github.com/" + values.destination.owner + "/" + values.destination.repo }})

### Getting Help

1. **Documentation**: Check the [comprehensive guide](docs/index.md)
2. **Issues**: Create GitHub issues for bugs and feature requests  
3. **Discussions**: Use GitHub Discussions for questions and ideas
4. **TIBCO Community**: Join [TIBCO Community Forums](https://community.tibco.com/)

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests and documentation
5. Submit a pull request

---

*This project was generated using the [BWCE CI/CD Pipeline Template](https://github.com/mpandav-tibco/tib-devhub-hackathon/tree/main/bwce/docs/cicd-jenkins) from TIBCO Developer Hub.*