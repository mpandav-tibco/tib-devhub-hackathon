# ${{ values.name }}

${{ values.description }}

## Flogo MCP Customer Service

This project contains a TIBCO Flogo application that integrates with Model Context Protocol (MCP) for AI-powered customer service.

### Features

- Model Context Protocol (MCP) integration
- AI-powered customer interactions
- Demo customer service scenarios
- Scalable service architecture

### Configuration

- MCP Server URL: ${{ values.mcpServerUrl }}
- AI Model Provider: ${{ values.aiModelProvider }}
- Max Tokens: ${{ values.maxTokens }}
{%- if values.enableLogs %}
- Detailed Logs: Enabled
{%- else %}
- Detailed Logs: Disabled
{%- endif %}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Project Structure

- `flogo-project.flogo`: Main Flogo application with MCP integration
- `demo-ai-customer-service/`: Demo scenarios and examples
- `demo-recording/`: Recording and demo materials

### Getting Started

1. Import the Flogo application into TIBCO Flogo Enterprise
2. Configure MCP server connection settings
3. Set up AI model provider credentials
4. Build and deploy the application
5. Test with demo customer service scenarios

### Model Context Protocol

This template demonstrates integration with MCP for:
- AI model communication
- Context sharing between services
- Structured AI interactions

### Documentation

For more information about TIBCO Flogo and MCP integration, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [Model Context Protocol Specification](https://spec.modelcontextprotocol.io/)