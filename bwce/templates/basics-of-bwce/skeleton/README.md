# ${{ values.name }}

${{ values.description }}

## Learning Guide Configuration

This guide is configured for:
- **Learning Level**: ${{ values.learning_level | title }}
- **Guide Type**: ${{ values.guide_type | title }}
{% if values.include_sample_app -%}
- **Sample Application**: ✅ Included
{% endif -%}
{% if values.include_exercises -%}
- **Hands-on Exercises**: ✅ Included
{% endif -%}
{% if values.include_docker_setup -%}
- **Docker Setup**: ✅ Included
{% endif -%}
{% if values.include_kubernetes_deploy -%}
- **Kubernetes Deployment**: ✅ Included
{% endif -%}
{% if values.include_monitoring -%}
- **Monitoring Guide**: ✅ Included
{% endif -%}
{% if values.include_best_practices -%}
- **Best Practices**: ✅ Included
{% endif -%}

## Quick Start

1. **Prerequisites Check**: Ensure you have TIBCO BusinessWorks Studio and Docker installed
2. **Clone Repository**: `git clone ${{ values.destination.owner }}/${{ values.destination.repo }}`
3. **Follow Documentation**: Start with the [Introduction](docs/index.md)
{% if values.include_sample_app -%}
4. **Run Sample App**: Navigate to `src/sample-scheduler-app` and follow build instructions
{% endif -%}

## Documentation Structure

```
${{ values.name }}/
├── README.md
├── catalog-info.yaml
├── mkdocs.yml
├── docs/
│   ├── index.md                    # Introduction and overview
│   ├── architecture.md             # BWCE architecture concepts
│   ├── development-setup.md        # Environment setup
│   ├── creating-applications.md    # Application creation guide
│   ├── process-design.md           # Process design fundamentals
│   ├── configuration.md            # Configuration management
│   {% if values.include_sample_app -%}
│   ├── sample-application.md       # Sample app walkthrough
│   {% endif -%}
│   {% if values.include_exercises -%}
│   ├── exercises.md               # Hands-on exercises
│   {% endif -%}
│   {% if values.include_docker_setup -%}
│   ├── docker-deployment.md       # Docker containerization
│   {% endif -%}
│   {% if values.include_kubernetes_deploy -%}
│   ├── kubernetes-deployment.md   # Kubernetes deployment
│   {% endif -%}
│   {% if values.include_monitoring -%}
│   ├── monitoring.md              # Monitoring and logging
│   {% endif -%}
│   {% if values.include_best_practices -%}
│   ├── best-practices.md          # Development guidelines
│   {% endif -%}
│   └── resources.md               # Additional resources
{% if values.include_sample_app -%}
└── src/
    └── sample-scheduler-app/       # Sample BWCE application
        ├── sample-scheduler-app/   # Application module
        ├── sample-scheduler-app.application/  # Application archive
        └── sample-scheduler-app.application.parent/  # Parent project
{% endif -%}
```

## Learning Path

{% if values.learning_level == "beginner" -%}
### For Beginners
1. Read Introduction and Architecture Overview
2. Set up development environment
3. Follow the sample application tutorial
4. Complete hands-on exercises
5. Practice Docker deployment
6. Review best practices
{% elif values.learning_level == "intermediate" -%}
### For Intermediate Users
1. Review architecture concepts
2. Explore advanced process design patterns
3. Practice configuration management
4. Implement monitoring solutions
5. Deploy to Kubernetes
6. Apply best practices to real projects
{% elif values.learning_level == "advanced" -%}
### For Advanced Users
1. Deep dive into architecture internals
2. Implement complex integration patterns
3. Optimize performance and monitoring
4. Design production-ready deployments
5. Contribute to best practices documentation
{% endif -%}

## Getting Help

- **Documentation Issues**: Create issues in this repository
- **TIBCO Support**: Contact TIBCO Support for product-related questions  
- **Community**: Join the [TIBCO Community Forums](https://community.tibco.com/)
- **Training**: Consider official TIBCO training courses

## Contributing

We welcome contributions to improve this learning guide:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Resources

- [TIBCO BusinessWorks Container Edition](https://www.tibco.com/products/tibco-businessworks)
- [Official Documentation](https://docs.tibco.com/products/tibco-businessworks-container-edition)
- [Docker Hub Images](https://hub.docker.com/r/tibco/bwce)
- [Community Forums](https://community.tibco.com/)