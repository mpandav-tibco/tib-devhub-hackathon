# BWCE Java Operations Template

## Overview

The **BWCE Java Operations Template** is a comprehensive TIBCO BusinessWorks Container Edition template that demonstrates how to integrate custom Java methods within BWCE processes. This template provides a complete example of scheduled execution, Java method invocation, and enterprise-grade deployment capabilities.

## Features

### Core Functionality
- **🕐 Timer-based Scheduler**: Automated process execution at configurable intervals
- **☕ Java Method Invocation**: Integration with custom Java classes and methods
- **📝 Comprehensive Logging**: Detailed process logging and error handling
- **🔧 Custom String Operations**: Example Java functions for string manipulation

### Development Features
- **📁 Multi-module Project Structure**: Organized BWCE application and Java modules
- **🏗️ Maven Integration**: Complete build configuration with dependencies
- **📚 Documentation**: Built-in TechDocs with MkDocs
- **🔍 Code Organization**: Best practices for BWCE and Java integration

### Deployment & CI/CD
- **🐳 Container Ready**: Optimized for containerized environments
- **☸️ Kubernetes Deployment**: Native Kubernetes deployment support
- **🌐 TIBCO Platform Integration**: Direct deployment to TIBCO Platform
- **🔄 Jenkins Pipeline**: Automated build and deployment workflows
- **📦 EAR Generation**: Automated Enterprise Archive creation

### Governance & Security
- **🔍 Code Quality**: Optional SonarQube integration for code analysis
- **🛡️ Security Scanning**: Trivy container security analysis
- **📊 Compliance**: Following TIBCO development best practices
- **🏷️ Metadata Management**: Complete catalog integration

## Template Structure

```
bwce-java-op/
├── template-java.yaml              # Main template definition
├── skeleton/                       # Template skeleton
│   ├── catalog-info.yaml          # Backstage catalog metadata
│   ├── deployment.yaml            # Kubernetes deployment config
│   ├── mkdocs.yml                 # Documentation configuration
│   ├── docs/                      # Project documentation
│   │   └── index.md               # Main documentation
│   ├── Scheduler-Java/            # Main BWCE module
│   │   ├── pom.xml               # Maven configuration
│   │   ├── META-INF/             # Module metadata
│   │   ├── Processes/            # BWCE processes
│   │   │   └── scheduler/java/   
│   │   │       └── Java-Invoke.bwp  # Main process
│   │   └── src/                  # Java sources (if needed)
│   ├── Scheduler-Java.application/ # BWCE application
│   │   ├── pom.xml               # Application configuration
│   │   ├── META-INF/             # Application metadata
│   │   └── manifest-bwce.json    # BWCE manifest
│   ├── Scheduler-Java.application.parent/ # Parent project
│   │   └── pom.xml               # Parent POM
│   └── StringFunctions/           # Custom Java module
│       ├── src/com/tibco/custom/jfunctions/
│       │   └── StringFunctions.java  # Custom Java class
│       └── bin/                   # Compiled classes
```

## Process Flow

### Main Process: Java-Invoke.bwp

1. **Timer Activation**: Process starts based on timer configuration
2. **Java Method Invocation**: Calls custom StringFunctions.concat() method
3. **String Processing**: Demonstrates string concatenation using Java
4. **Logging**: Logs execution results and any exceptions
5. **Error Handling**: Comprehensive exception handling and logging

### Java Integration

The template includes a custom Java class `StringFunctions` with methods:

```java
public class StringFunctions {
    public String concat(String str1, String str2) {
        return str1 + str2;
    }
}
```

This demonstrates how to:
- Create custom Java classes for BWCE
- Invoke Java methods from BWCE processes
- Handle Java method parameters and return values
- Integrate compiled Java code with BWCE runtime

## Parameters

The template accepts the following parameters:

### Basic Information
- **Name**: Unique identifier for the BWCE project
- **Description**: Project description
- **System**: Target system (from catalog)
- **Owner**: Project owner (from catalog)
- **Repository URL**: GitHub repository location

### Governance Options
- **SonarQube Scanning**: Enable code quality analysis
- **Trivy Security Scanning**: Enable container security scanning

### Deployment Options
- **Deploy**: Choose whether to deploy the application
- **Deployment Target**: 
  - **Kubernetes (K8S)**: Direct Kubernetes deployment
  - **TIBCO Platform**: Deploy to TIBCO Platform
- **Namespace**: Target Kubernetes namespace
- **Platform Token**: TIBCO Platform authentication (for Platform deployments)
- **Data Plane URL**: TIBCO Platform data plane URL

## Generated Components

When you create a project from this template, it generates:

### 1. BWCE Application
- Complete BusinessWorks Container Edition application
- Timer-driven process with Java invocation
- Maven build configuration
- BWCE manifest and configuration files

### 2. Custom Java Module
- StringFunctions Java class
- Compiled bytecode
- Maven integration for build process

### 3. Deployment Configuration
- Kubernetes deployment YAML
- TIBCO Platform configuration
- Container specifications

### 4. CI/CD Pipeline
- Jenkins job configuration
- Automated build and test scripts
- Deployment automation

### 5. Documentation
- TechDocs integration
- API documentation
- User guides and examples

## Use Cases

### 1. **Custom Business Logic Integration**
Perfect for scenarios where you need to integrate existing Java libraries or custom business logic into BWCE processes.

### 2. **Scheduled Data Processing**
Ideal for batch processing scenarios that require custom Java functions for data transformation or validation.

### 3. **Learning and Training**
Excellent template for learning BWCE Java integration capabilities and best practices.

### 4. **Enterprise Integration**
Suitable for enterprise scenarios requiring robust error handling, logging, and deployment automation.

### 5. **Microservices Architecture**
Great starting point for microservices that need to combine BWCE orchestration with custom Java logic.

## Prerequisites

- **TIBCO BusinessWorks Container Edition** license and runtime
- **Java Development Kit (JDK)** 8 or higher
- **Maven** 3.6 or higher
- **Docker** (for containerization)
- **Kubernetes** cluster (for K8S deployment)
- **TIBCO Platform** access (for Platform deployment)
- **Jenkins** (for CI/CD automation)

## Getting Started

1. **Install Template**: Use the TIBCO Developer Hub marketplace to install this template
2. **Create Project**: Navigate to Templates and select "BWCE Java Operations"
3. **Configure Parameters**: Fill in project details, deployment options, and governance settings
4. **Generate Project**: The template will create a complete project structure
5. **Build and Deploy**: Use the included CI/CD pipeline or manual deployment options

## Best Practices

### Java Integration
- Keep Java classes simple and focused
- Handle exceptions appropriately in both Java and BWCE
- Use proper data type mappings between Java and BWCE
- Consider performance implications of Java invocations

### BWCE Development
- Follow TIBCO naming conventions
- Implement comprehensive error handling
- Use appropriate logging levels
- Design for scalability and maintainability

### Deployment
- Use proper resource limits in Kubernetes
- Configure health checks and monitoring
- Implement proper secret management
- Follow security best practices

## Troubleshooting

### Common Issues

1. **Java ClassPath Issues**
   - Ensure Java classes are properly compiled
   - Check MANIFEST.MF includes Java dependencies
   - Verify JAR files are in the correct location

2. **Timer Configuration**
   - Check timer expressions for correct syntax
   - Verify timezone settings
   - Ensure proper start/end time configuration

3. **Deployment Issues**
   - Validate Kubernetes cluster connectivity
   - Check TIBCO Platform credentials
   - Verify namespace permissions

### Debug Steps

1. **Check Logs**: Review BWCE application logs for detailed error information
2. **Validate Configuration**: Ensure all configuration files are properly formatted
3. **Test Java Methods**: Test custom Java methods independently
4. **Network Connectivity**: Verify connectivity to deployment targets

## Support and Resources

- **TIBCO Documentation**: [BusinessWorks Container Edition](https://docs.tibco.com/products/tibco-businessworks-container-edition)
- **Community**: TIBCO Community forums and knowledge base
- **Training**: TIBCO Education services and online courses
- **Professional Services**: TIBCO consulting and support services

---

This template provides a solid foundation for building BWCE applications with Java integration. It demonstrates enterprise-grade practices while remaining easy to understand and extend for your specific use cases.