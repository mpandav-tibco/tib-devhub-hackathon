# ${{ values.name }}

${{ values.description }}

## Flogo RPA Integration

This project contains a TIBCO Flogo application for integrating with RPA (Robotic Process Automation) platforms.

### Features

- RPA platform integration: ${{ values.rpaProvider }}
- Automated workflow orchestration
- API-driven RPA job management
{%- if values.enableScheduling %}
- Automated job scheduling
{%- endif %}
- Process monitoring and control

### Configuration

- RPA Provider: ${{ values.rpaProvider }}
- Orchestrator URL: ${{ values.orchestratorUrl }}
- API Timeout: ${{ values.apiTimeout }} seconds
{%- if values.enableScheduling %}
- Job Scheduling: Enabled
{%- else %}
- Job Scheduling: Disabled
{%- endif %}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Project Structure

- `rpa-integration.flogo`: Main Flogo application for RPA integration
- `rpa-integration.flogotest`: Test configuration for RPA workflows
- `product-api.html`: Demo web interface for product API testing
- `UiPath/`: UiPath-specific automation workflows and configurations

### Getting Started

1. Import the Flogo application into TIBCO Flogo Enterprise
2. Configure RPA orchestrator connection settings
3. Set up authentication credentials for RPA platform
4. Deploy automation workflows to RPA platform
5. Build and deploy the Flogo integration application
6. Test RPA job execution and monitoring

### RPA Integration Features

- Trigger RPA jobs from Flogo flows
- Monitor job execution status
- Handle RPA job results and data
- Error handling and retry mechanisms

### Documentation

For more information about TIBCO Flogo and RPA integration, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [UiPath Documentation](https://docs.uipath.com/)