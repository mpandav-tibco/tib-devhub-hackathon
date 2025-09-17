# ${{ values.name }}

${{ values.description }}

## Flogo gRPC API Project

This project contains a TIBCO Flogo application that implements high-performance gRPC APIs.

### Features

- gRPC service implementation: ${{ values.serviceName }}
- Protocol buffer definitions
- Client libraries and examples
{%- if values.enableStreaming %}
- Bidirectional streaming support
{%- endif %}
- High-performance communication

### Configuration

- gRPC Port: ${{ values.grpcPort }}
- Service Name: ${{ values.serviceName }}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Project Structure

- `src/`: Flogo application source files
- `client/`: Client implementation and examples
- Protocol buffer definitions and generated code

### Getting Started

1. Import the Flogo application files into TIBCO Flogo Enterprise
2. Configure the gRPC service endpoints
3. Generate protocol buffer code if needed
4. Build and deploy the application
5. Test using the provided client examples

### Documentation

For more information about TIBCO Flogo and gRPC development, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [gRPC Documentation](https://grpc.io/docs/)