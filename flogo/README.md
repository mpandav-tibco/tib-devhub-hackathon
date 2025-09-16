# Flogo Marketplace Registry

This directory contains the comprehensive marketplace registry for all TIBCO Flogo Enterprise assets and sample templates.

## Quick Start

To register all Flogo marketplace entries at once, use this single registry file:

```bash
# Register all Flogo marketplace entries
curl -X POST "http://localhost:7007/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{
    "type": "url",
    "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/flogo/flogo-marketplace-registry.yaml"
  }'
```

## What's Included

### 🚀 API Development (2 entries)
- **GraphQL APIs Template** - Flexible data querying from multiple sources
- **gRPC IoT Telemetry** - High-performance real-time data processing

### 🏭 IoT & Real-time Processing (2 entries)  
- **MQTT Real-time Inventory Management** - Retail inventory automation with PostgreSQL
- **RPA Integration** - Robotic Process Automation workflows and UiPath integration

### 🛠️ DevOps & Automation (2 entries)
- **CI/CD Jenkins Pipeline** - Automated AWS Lambda deployment with TIBCO Cloud APIs
- **CI/CD Terraform Pipeline** - Infrastructure as Code automation

### 🤖 AI & Machine Learning (1 entry)
- **AI-Powered Customer Service with MCP** - Revolutionary Model Context Protocol integration

## Key Features

### 🎯 **Enterprise-Ready Templates**
All templates are production-ready with complete implementations, not just proof-of-concepts.

### 📊 **Real-World Use Cases**
- **Retail:** Real-time inventory management with IoT sensors
- **Customer Service:** AI-powered automation with enterprise system integration  
- **DevOps:** Complete CI/CD pipelines for serverless deployments
- **APIs:** Modern GraphQL and gRPC service implementations
- **Integration:** RPA workflows and enterprise system connections

### ⚡ **Lightweight & Scalable**
Built on TIBCO Flogo's lightweight, event-driven architecture for:
- Microservices and serverless deployments
- Edge computing and IoT processing
- High-performance API gateways
- Real-time data processing pipelines

## Individual Registration

Register specific templates individually:

```bash
# Example: Register just the AI Customer Service template
curl -X POST "http://localhost:7007/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{
    "type": "url", 
    "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/flogo/sample-templates/mcp-customer-service/mp-entry-flogo-mcp-customer-service.yaml"
  }'
```

## File Structure

```
flogo/
├── flogo-marketplace-registry.yaml    # 👈 Main registry file
├── extensions/
│   ├── activity/
│   └── trigger/
└── sample-templates/
    ├── graphql-apis/
    │   └── mp-entry-flogo-graphql-apis.yaml
    ├── grpc-api/
    │   └── mp-entry-flogo-grpc-api.yaml
    ├── cicd-jenkis/
    │   └── mp-entry-flogo-cicd-jenkins.yaml
    ├── mcp-customer-service/
    │   └── mp-entry-flogo-mcp-customer-service.yaml
    ├── mqtt-realtime-inventory-managment/
    │   └── mp-entry-flogo-mqtt-inventory.yaml
    └── ... (other templates)
```

## Technology Stack

### 🔧 **Core Technologies**
- **TIBCO Flogo Enterprise** - Lightweight integration platform
- **Go Runtime** - High-performance execution environment
- **Event-Driven Architecture** - Scalable microservices patterns

### 🌐 **Integration Protocols**
- **GraphQL** - Flexible API querying
- **gRPC** - High-performance RPC communication
- **MQTT** - IoT messaging protocol
- **REST APIs** - Standard web service interfaces

### ☁️ **Cloud & DevOps**
- **AWS Lambda** - Serverless function deployment
- **Terraform** - Infrastructure as Code
- **Jenkins** - CI/CD pipeline automation
- **Docker** - Containerization support

### 🤖 **AI & Automation**
- **Model Context Protocol (MCP)** - AI system integration
- **RPA (UiPath)** - Robotic Process Automation
- **PostgreSQL** - Database integration
- **Real-time Analytics** - Stream processing

## Benefits

✅ **Production-Ready** - All templates include complete implementations  
✅ **Lightweight Runtime** - Minimal resource footprint for edge and cloud  
✅ **Event-Driven** - Built for modern microservices architectures  
✅ **Multi-Protocol** - Support for GraphQL, gRPC, MQTT, REST, and more  
✅ **AI Integration** - Revolutionary MCP support for enterprise AI  
✅ **DevOps Ready** - Complete CI/CD pipelines and automation  

## Usage in Developer Hub

After registration, all Flogo templates will be available in:
- **Marketplace** - `/marketplace?filters[tags]=devhub-marketplace`
- **Create** - Template scaffolding for new Flogo applications
- **Catalog** - Documentation and sample code repository

Total: **8 Flogo marketplace entries** ready for enterprise application development! 🚀