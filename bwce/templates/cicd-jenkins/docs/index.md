# BWCE Jenkins CI/CD Pipeline

Implementation guide for the Jenkins-based CI/CD pipeline included with this BWCE project.

## Pipeline Overview

This Jenkins pipeline provides automated build, test, and deployment for BWCE applications using Docker multi-architecture builds and Kubernetes deployment.

### Pipeline Stages

1. **Git**: Checkout source code from GitHub using Mac agents
2. **Unit Test**: Run Maven clean in the parent project
3. **App Build**: Create BWCE EAR using Maven package
4. **Artifactory**: Manage and store build artifacts
5. **App Image Processing**: Build multi-platform Docker images and push to DockerHub
6. **K8s Deployment**: Deploy to Kubernetes using dynamic manifests

## BWCE Application Structure

The sample application follows TIBCO's recommended Maven project structure:

```
src/
├── cicd-demo.module/                    # BWCE module
├── cicd-demo.module.application/        # Application project  
├── cicd-demo.module.application.parent/ # Maven parent project
├── jenkinsfile                          # Pipeline definition
├── manifest.yaml                        # Kubernetes deployment
└── Dockerfile                           # Container build
```

## Jenkins Configuration

### Environment Variables

The pipeline uses these environment variables:

```groovy
environment {
    IMAGE = "bwce_cicd.jenkins-build"
    VERSION = "${BUILD_NUMBER}"
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
}
```

### Agent Requirements

All stages run on Mac agents:
```groovy
agent { label 'mac' }
```

## Build Process

### Maven Build Commands

**Unit Testing:**
```bash
cd src/cicd-demo.module.application.parent
mvn clean
```

**Application Build:**
```bash
cd src/cicd-demo.module.application.parent  
mvn package
```

### Docker Multi-Architecture Build

The pipeline builds for both ARM64 and AMD64 platforms:

```bash
docker buildx build --platform linux/arm64,linux/amd64 \
  -t ${IMAGE}:${VERSION} --push .
```

### Artifact Archiving

Build artifacts are automatically archived:
```
groovy
dir('src/cicd-demo.module.application') {
    archiveArtifacts 'target/*.*'
}

│  │  Registry   │──│  Repository │──│   Cluster   │               │
│  └─────────────┘  └─────────────┘  └─────────────┘               │
│                                                                   │
└───────────────────────────────────────────────────────────────────┘
```

### Development Workflow

1. **Feature Development**
   - Create feature branch from main
   - Develop BWCE application using BusinessWorks Studio
   - Commit code changes with descriptive messages
   - Create pull request for code review

2. **Automated Build**
   - Jenkins detects repository changes
   - Triggers automated build pipeline
   - Maven compiles and packages EAR file
   - Docker builds container image

3. **Testing & Validation**
   - Unit tests execution
   - Integration tests with mock services
   - Static code analysis
   - Security vulnerability scanning

4. **Deployment Pipeline**
   - Deploy to DEV environment
   - Automated smoke tests
   - Promote to UAT for user acceptance
   - Production deployment with blue-green strategy

### Environment Strategy

| Environment | Purpose | Deployment | Data |
|-------------|---------|------------|------|
| **DEV** | Development testing | Automatic on merge | Mock/Sample data |
| **UAT** | User acceptance | Manual promotion | Sanitized prod data |
| **PROD** | Live production | Approved release | Live production data |

---

## 4. Prerequisites and Setup

### Development Environment

#### Required Software
```bash
# TIBCO BusinessWorks Studio
- BusinessWorks Container Edition 2.9.0+
- Java Development Kit 1.8+
- Maven 3.6.0+

# Development Tools
- Git 2.25+
- Docker 20.10+
- kubectl 1.21+

# IDE Plugins
- TIBCO BusinessWorks Studio
- Git integration
- Maven integration
```

## Kubernetes Deployment

The pipeline includes automated Kubernetes deployment using dynamic manifest substitution:

### Deployment Process

```bash
# Export environment variables for manifest substitution
export IMAGE="${IMAGE}"
export VERSION="${VERSION}"

# Apply deployment with dynamic values
envsubst < src/manifest.yaml | kubectl apply -f -
```

### Manifest Template

The `manifest.yaml` file uses environment variable substitution:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${PROJECT_NAME}
spec:
  template:
    spec:
      containers:
      - name: bwce-app
        image: ${IMAGE}:${VERSION}
```

## Prerequisites

### Jenkins Requirements

- **Mac agents**: All pipeline stages require macOS build agents
- **Maven**: For BWCE application builds
- **Docker buildx**: For multi-architecture container builds
- **kubectl**: For Kubernetes deployments

### Credentials Setup

Configure these Jenkins credentials:

- **dockerhub-credentials**: DockerHub username and password
- **github-credentials**: GitHub access for repository checkout

## Customizing the Pipeline

### Modifying Build Commands

Edit the jenkinsfile to customize Maven commands:

```groovy
sh 'mvn clean compile'  // Add compilation step
sh 'mvn test'          // Add testing step  
sh 'mvn package'       // Package BWCE application
```

### Adding Deployment Environments

Extend the pipeline with additional deployment stages:

```groovy
stage('Deploy to UAT') {
    when { branch 'develop' }
    steps {
        sh 'kubectl apply -f k8s/uat/'
    }
}

stage('Deploy to Production') {
    when { branch 'main' }
    steps {
        sh 'kubectl apply -f k8s/prod/'
    }
}
```

---

*This pipeline provides a working foundation for BWCE CI/CD with Jenkins, Docker, and Kubernetes.*
