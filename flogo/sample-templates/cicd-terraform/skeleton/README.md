# ${{ values.name }}

${{ values.description }}

## Flogo CI/CD with Terraform

This project contains a TIBCO Flogo application with Terraform infrastructure as code for automated deployment.

### Features

- Infrastructure as Code with Terraform
- Cloud provider: ${{ values.cloudProvider }}
- Automated infrastructure provisioning
{%- if values.enableRemoteState %}
- Remote state management
{%- endif %}
- Environment-specific configurations

### Configuration

- Cloud Provider: ${{ values.cloudProvider }}
- Terraform Version: ${{ values.terraformVersion }}
- Environment: ${{ values.environment }}
- Region: ${{ values.region }}
{%- if values.enableRemoteState %}
- Remote State: Enabled
{%- else %}
- Remote State: Disabled (local state)
{%- endif %}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Project Structure

- `main.tf`: Main Terraform configuration for infrastructure
- `src/`: Flogo application source files
- `images/`: Documentation and architecture diagrams

### Infrastructure Components

The Terraform configuration provisions:
- Compute resources for Flogo applications
- Networking and security configurations
- Storage and database resources
- Load balancers and auto-scaling groups
- Monitoring and logging infrastructure

### Getting Started

1. **Prerequisites:**
   - Install Terraform ${{ values.terraformVersion }}
   - Configure ${{ values.cloudProvider }} credentials
   - Install TIBCO Flogo Enterprise CLI

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Plan Infrastructure:**
   ```bash
   terraform plan -var="environment=${{ values.environment }}"
   ```

4. **Apply Infrastructure:**
   ```bash
   terraform apply -var="environment=${{ values.environment }}"
   ```

5. **Deploy Flogo Application:**
   - Build the Flogo application
   - Deploy to provisioned infrastructure

### CI/CD Integration

The template supports integration with:
- GitHub Actions with Terraform workflows
- GitLab CI/CD with infrastructure pipelines
- Jenkins with Terraform plugins
- Azure DevOps with Terraform tasks

### Environment Management

- Separate state files per environment
- Environment-specific variable files
- Automated deployment pipelines
- Infrastructure drift detection

### Documentation

For more information about TIBCO Flogo and Terraform, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [Terraform Documentation](https://www.terraform.io/docs/)