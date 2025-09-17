# ${{ values.name }}

${{ values.description }}

## Flogo CI/CD with Jenkins

This project contains a TIBCO Flogo application with complete Jenkins CI/CD pipeline setup.

### Features

- Automated CI/CD pipeline with Jenkins
- Flogo application build automation
{%- if values.enableTests %}
- Automated testing integration
{%- endif %}
{%- if values.enableSonarQube %}
- Code quality analysis with SonarQube
{%- endif %}
- Deployment automation to ${{ values.deploymentTarget }}

### Configuration

- Jenkins URL: ${{ values.jenkinsUrl }}
- Build Agent: ${{ values.buildAgent }}
- Deployment Target: ${{ values.deploymentTarget }}
{%- if values.enableTests %}
- Automated Tests: Enabled
{%- else %}
- Automated Tests: Disabled
{%- endif %}
{%- if values.enableSonarQube %}
- SonarQube Analysis: Enabled
{%- else %}
- SonarQube Analysis: Disabled
{%- endif %}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Project Structure

- `Jenkinsfile`: Jenkins pipeline definition with build, test, and deploy stages
- `src/`: Flogo application source files and configurations
- `config/`: Configuration files for different environments

### CI/CD Pipeline Stages

1. **Checkout**: Pull source code from repository
2. **Build**: Compile Flogo application
{%- if values.enableTests %}
3. **Test**: Run automated tests and generate reports
{%- endif %}
{%- if values.enableSonarQube %}
4. **Code Analysis**: Perform SonarQube code quality analysis
{%- endif %}
5. **Package**: Create deployment artifacts
6. **Deploy**: Deploy to ${{ values.deploymentTarget }} environment

### Getting Started

1. Configure Jenkins server with required plugins
2. Set up build agent with label: ${{ values.buildAgent }}
3. Import the Flogo application into TIBCO Flogo Enterprise
4. Configure Jenkins job using the provided Jenkinsfile
5. Set up deployment credentials and target environment
6. Trigger pipeline or configure automatic builds

### Jenkins Requirements

- Jenkins with Pipeline plugin
- TIBCO Flogo Enterprise CLI tools
- Docker (if using containerized deployments)
{%- if values.enableSonarQube %}
- SonarQube scanner plugin
{%- endif %}

### Documentation

For more information about TIBCO Flogo and Jenkins CI/CD, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [Jenkins Pipeline Documentation](https://www.jenkins.io/doc/book/pipeline/)