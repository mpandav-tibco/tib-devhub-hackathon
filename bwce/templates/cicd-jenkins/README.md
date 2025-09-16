# BWCE CI/CD Pipeline Template

This Backstage template provides a working Jenkins CI/CD pipeline for TIBCO BusinessWorks Container Edition applications with Docker multi-architecture builds and Kubernetes deployment.

## What Gets Created

### Working Jenkins Pipeline
- **5-Stage Pipeline**: Git checkout, Unit Test, App Build, Artifactory, App Image Processing
- **BWCE Sample Application**: `cicd-demo.module` with Maven parent/child structure
- **Docker Multi-Architecture**: ARM64 and AMD64 platform support using buildx
- **Kubernetes Deployment**: Manifest-based deployment with dynamic image substitution

### Pipeline Stages

1. **Git**: Parallel checkout on Mac agents from GitHub repository
2. **Unit Test**: Maven clean in `cicd-demo.module.application.parent`
3. **App Build**: Maven package to create BWCE EAR file
4. **Artifactory**: Artifact management and storage
5. **App Image Processing**: Docker buildx multi-platform build and DockerHub push
6. **K8s Deployment**: Kubernetes deployment using envsubst for dynamic manifests

## Template Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `name` | string | Project name | - |
| `description` | string | Project description | - |
| `owner` | string | Project owner/team | - |

## File Structure

```
generated-project/
├── README.md                     # Project overview
├── catalog-info.yaml            # Backstage entity configuration  
├── mkdocs.yml                   # Documentation configuration
├── docs/
│   └── index.md                # Pipeline implementation guide
└── src/                        # BWCE application and CI/CD
    ├── cicd-demo.module/       # BWCE module
    ├── cicd-demo.module.application/  # Application project
    ├── cicd-demo.module.application.parent/  # Maven parent
    ├── jenkinsfile             # Jenkins pipeline
    ├── manifest.yaml           # Kubernetes deployment
    └── Dockerfile              # Container build
```

## Requirements

- **Jenkins**: Mac-based agents for pipeline execution
- **Maven**: For BWCE application builds
- **Docker**: With buildx for multi-architecture builds
- **DockerHub**: Registry for image storage with credentials
- **Kubernetes**: For application deployment

## Key Features

✅ **Mac Jenkins Agents**: Pipeline designed for macOS build environment
✅ **Maven Build**: BWCE EAR packaging using parent/child project structure
✅ **Multi-Architecture Docker**: ARM64 and AMD64 support with buildx
✅ **DockerHub Integration**: Automated image push with authentication
✅ **Kubernetes Deployment**: Dynamic manifest substitution with envsubst

## Pipeline Details

### Environment Variables
- `IMAGE`: Container image name (`bwce_cicd.jenkins-build`)
- `VERSION`: Build number for image tagging
- `DOCKERHUB_CREDENTIALS`: DockerHub authentication

### Build Commands
```bash
# Unit Testing
mvn clean

# Application Build  
mvn package

# Docker Multi-Architecture Build
docker buildx build --platform linux/arm64,linux/amd64 -t ${IMAGE}:${VERSION} --push .

# Kubernetes Deployment
envsubst < src/manifest.yaml | kubectl apply -f -
```

## Usage

1. **In Backstage**: Navigate to Create → Choose Templates → BWCE CI/CD Pipeline
2. **Configure**: Provide project name, description, and owner
3. **Deploy**: Template generates working Jenkins pipeline with BWCE sample application
4. **Customize**: Modify jenkinsfile and application as needed

---

*Provides working Jenkins pipeline for BWCE applications with Docker and Kubernetes deployment*

