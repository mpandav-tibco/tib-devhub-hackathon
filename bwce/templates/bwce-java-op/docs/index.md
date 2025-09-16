# BWCE Java Operations Template

## Overview

The **BWCE Java Operations Template** is a production-ready template for creating TIBCO BusinessWorks Container Edition applications that integrate custom Java functionality. This template demonstrates best practices for Java method invocation within BWCE processes, scheduled execution, and enterprise deployment patterns.

![BWCE Java Operations](https://img.shields.io/badge/TIBCO-BWCE-blue) ![Java Integration](https://img.shields.io/badge/Integration-Java-orange) ![Deployment Ready](https://img.shields.io/badge/Deployment-Ready-green)

## Key Features

### 🏗️ **Complete BWCE Application Structure**
- Timer-based process scheduler
- Custom Java method invocation
- Comprehensive error handling and logging
- Multi-module Maven project structure

### ☕ **Java Integration Capabilities**
- Custom Java class integration (`StringFunctions`)
- Method parameter passing and return value handling
- Classpath management and dependency resolution
- Runtime Java method invocation from BWCE processes

### 🚀 **Enterprise Deployment**
- **Kubernetes**: Native container deployment with health checks
- **TIBCO Platform**: Direct deployment to TIBCO Cloud/Platform
- **Jenkins CI/CD**: Automated build and deployment pipelines
- **Multi-environment**: Support for development, staging, and production

### 🛡️ **Governance & Quality**
- **SonarQube Integration**: Code quality analysis and metrics
- **Trivy Security Scanning**: Container vulnerability assessment
- **Best Practices**: Following TIBCO and industry standards
- **Comprehensive Testing**: Unit and integration test frameworks

## Architecture

```mermaid
graph TD
    A[Timer Trigger] --> B[BWCE Process]
    B --> C[Java Method Invocation]
    C --> D[StringFunctions.concat()]
    D --> E[Return Result]
    E --> F[Log Output]
    F --> G[Process Complete]
    
    H[Custom Java Module] --> C
    I[Maven Build] --> H
    J[Jenkins Pipeline] --> I
    K[Deployment Target] --> J
```

## Quick Start

### 1. Install Template
Navigate to the TIBCO Developer Hub marketplace and install the "BWCE Java Operations Template".

### 2. Create New Project
1. Go to **Create** → **Templates**
2. Select **"BWCE - Schedule Java Invoke"**
3. Fill in the required parameters:
   - **Name**: Your project name (e.g., `my-java-scheduler`)
   - **Description**: Project description
   - **Owner**: Select from available groups
   - **System**: Target system from catalog
   - **Repository**: GitHub repository location

### 3. Configure Deployment
Choose your deployment options:
- **Governance**: Enable SonarQube and/or Trivy scanning
- **Deployment**: Select Kubernetes or TIBCO Platform
- **Environment**: Specify namespace and platform details

### 4. Generate and Deploy
The template will:
- Create complete project structure
- Set up Maven build configuration
- Configure CI/CD pipeline
- Deploy to selected target (if enabled)

## Project Structure

When you create a project from this template, you'll get:

```
your-project/
├── 📄 catalog-info.yaml              # Backstage catalog metadata
├── 📄 deployment.yaml               # Kubernetes deployment
├── 📄 mkdocs.yml                    # Documentation config
├── 📁 docs/                         # Project documentation
├── 📁 Scheduler-Java/               # Main BWCE module
│   ├── 📄 pom.xml                  # Maven configuration
│   ├── 📁 META-INF/                # Module metadata
│   ├── 📁 Processes/               # BWCE processes
│   │   └── 📁 scheduler/java/      
│   │       └── 📄 Java-Invoke.bwp  # Main process definition
│   └── 📁 Resources/               # BWCE resources
├── 📁 Scheduler-Java.application/   # BWCE application
│   ├── 📄 pom.xml                  # App configuration
│   ├── 📄 manifest-bwce.json       # BWCE manifest
│   └── 📁 META-INF/                # Application metadata
├── 📁 Scheduler-Java.application.parent/ # Parent project
│   └── 📄 pom.xml                  # Parent POM
└── 📁 StringFunctions/              # Custom Java module
    ├── 📁 src/com/tibco/custom/jfunctions/
    │   └── 📄 StringFunctions.java  # Custom Java class
    └── 📁 bin/                     # Compiled classes
```

## Java Integration Example

The template includes a working example of Java integration:

### Java Class (`StringFunctions.java`)
```java
package com.tibco.custom.jfunctions;

public class StringFunctions {
    public String concat(String str1, String str2) {
        String result = str1 + str2;
        return result;
    }
}
```

### BWCE Process Integration
The main process (`Java-Invoke.bwp`) demonstrates:
1. **Timer Configuration**: Scheduled execution
2. **Java Activity**: Method invocation with parameters
3. **Data Mapping**: Input/output parameter handling
4. **Error Handling**: Exception catching and logging
5. **Result Processing**: Working with return values

## Deployment Options

### Option 1: Kubernetes Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bwce-java-scheduler
spec:
  replicas: 1
  selector:
    matchLabels:
      app: bwce-java-scheduler
  template:
    metadata:
      labels:
        app: bwce-java-scheduler
    spec:
      containers:
      - name: bwce-app
        image: your-registry/bwce-java-scheduler:latest
        ports:
        - containerPort: 8080
```

### Option 2: TIBCO Platform Deployment
The template supports direct deployment to TIBCO Platform with:
- Platform token authentication
- Data plane URL configuration
- Namespace management
- Automated capability registration

### Option 3: Jenkins CI/CD Pipeline
Automated pipeline includes:
- Source code checkout
- Maven build and test
- Container image creation
- Security scanning (optional)
- Deployment to target environment
- Health check verification

## Customization Guide

### Adding New Java Methods

1. **Extend StringFunctions class**:
```java
public class StringFunctions {
    public String concat(String str1, String str2) {
        return str1 + str2;
    }
    
    // Add your new method
    public String toUpperCase(String input) {
        return input != null ? input.toUpperCase() : "";
    }
}
```

2. **Update BWCE Process**: Add new Java activity and configure method invocation

3. **Rebuild**: Maven will automatically compile and package changes

### Modifying Timer Configuration

1. Open `Java-Invoke.bwp` in TIBCO Business Studio
2. Select the Timer activity
3. Modify timer properties:
   - **Interval**: Execution frequency
   - **Start Time**: Initial execution time
   - **End Time**: Stop execution time (optional)

### Adding New Dependencies

Update the appropriate `pom.xml` file:
```xml
<dependencies>
    <dependency>
        <groupId>your.group</groupId>
        <artifactId>your-library</artifactId>
        <version>1.0.0</version>
    </dependency>
</dependencies>
```

## Monitoring and Observability

### Health Checks
The template includes:
- **Kubernetes Probes**: Liveness and readiness checks
- **BWCE Health Endpoint**: Built-in health monitoring
- **Custom Metrics**: Application-specific metrics

### Logging
Comprehensive logging includes:
- **Process Execution**: Start, completion, and duration
- **Java Method Calls**: Parameters and results
- **Error Conditions**: Exceptions and error details
- **Performance Metrics**: Execution times and resource usage

### Metrics Collection
Integration with monitoring systems:
- **Prometheus**: Metrics export
- **Grafana**: Dashboard visualization
- **TIBCO Observability**: Native platform monitoring

## Best Practices

### Java Integration
✅ **Do:**
- Keep Java methods stateless
- Handle null parameters gracefully
- Use appropriate exception handling
- Follow Java naming conventions
- Document method signatures and behavior

❌ **Don't:**
- Create heavy computational methods
- Use static variables for state
- Ignore exception handling
- Create memory leaks
- Use deprecated Java features

### BWCE Development
✅ **Do:**
- Use meaningful activity names
- Implement comprehensive error handling
- Add appropriate logging
- Follow TIBCO naming conventions
- Design for scalability

❌ **Don't:**
- Hardcode configuration values
- Ignore error conditions
- Create overly complex processes
- Skip documentation
- Neglect testing

### Deployment
✅ **Do:**
- Use resource limits
- Implement health checks
- Configure proper secrets management
- Use immutable container images
- Plan for scaling

❌ **Don't:**
- Expose sensitive information
- Skip security scanning
- Use default passwords
- Ignore resource constraints
- Deploy without testing

## Troubleshooting

### Common Issues

| Issue | Symptoms | Solution |
|-------|----------|----------|
| **Java ClassNotFoundException** | Process fails during Java invocation | Check classpath and JAR packaging |
| **Timer Not Triggering** | Process doesn't execute | Verify timer configuration and timezone |
| **Deployment Failure** | Container won't start | Check resource limits and dependencies |
| **Method Invocation Error** | Java method throws exception | Validate parameters and method signature |

### Debug Steps

1. **Check Logs**: Review application logs for error details
2. **Validate Configuration**: Ensure all config files are correct
3. **Test Java Methods**: Test independently of BWCE
4. **Verify Dependencies**: Check all required JARs are present
5. **Resource Check**: Ensure adequate memory and CPU

### Getting Help

- **TIBCO Documentation**: [BusinessWorks Container Edition](https://docs.tibco.com/products/tibco-businessworks-container-edition)
- **Community Forums**: TIBCO Community support
- **Professional Services**: TIBCO consulting and support
- **Training Resources**: TIBCO Education and certification

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2024-12-16 | Initial template release |
| 1.0.1 | 2024-12-17 | Added governance features |
| 1.1.0 | 2024-12-18 | Enhanced deployment options |

## License

This template is provided under the TIBCO Developer Hub license terms. See the LICENSE file for complete details.

## Contributing

Contributions are welcome! Please see our contributing guidelines and submit pull requests for improvements.

---

**Need Help?** Contact the TIBCO Developer Hub team or visit our documentation for more information.