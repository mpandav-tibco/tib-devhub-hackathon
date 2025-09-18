# TIBCO® Developer Hub - Marketplace Contributions

Comprehensive collection of templates, APIs, systems, and integration patterns for TIBCO® Developer Hub (Backstage).

## 📂 Repository Structure

| Directory | Purpose | Count |
|-----------|---------|-------|
| `/system/` | Backstage System & Domain Definitions | 3 files |
| `/bwce/` | TIBCO BusinessWorks Container Edition | 10 templates |
| `/flogo/` | TIBCO Flogo Enterprise Templates | 7 templates |

## 🏛️ System Components

### System Definitions

| Component | File | Type | Description |
|-----------|------|------|-------------|
| E-Commerce Platform | `ecommerce-platform.yaml` | System & Domain | Microservices e-commerce platform |
| Teams | `team.yaml` | Groups | E-Commerce, Engineering, Inventory teams |
| Documentation | `mkdocs.yaml` | Config | TechDocs configuration |

### Team Structure

| Team | Type | Purpose | Parent |
|------|------|---------|--------|
| E-Commerce Team | Team | Platform development | Engineering |
| Engineering | Organization | Parent organization | - |
| Inventory Team | Team | Inventory management | Engineering |

## 🌐 API Catalog

### E-Commerce APIs

| API Service | File | Type | Description |
|-------------|------|------|-------------|
| Product Catalog | `catalog/catalog-api.yaml` | REST | Product information management |
| Shopping Cart | `cart/cart-api.yaml` | REST | Cart operations |
| Checkout | `checkout/checkout-api.yaml` | REST | Order processing & payment |
| Product Catalogue | `product-catalgue/openapi-product-catalogue.yaml` | OpenAPI 3.0 | Product catalog specification |
| Shipment Tracking | `shipment-tracking/shipping-api.yaml` | REST | Order fulfillment & tracking |
| SOAP Service | `soap-wsdl/api-soap-wsdl.yaml` | WSDL/SOAP | Legacy integration |
| API Registry | `all-apis.yaml` | Multi-API | Comprehensive registry |

## 🔧 BWCE Templates (10 Total)

### Documentation & Guides

| Template | Description | Category |
|----------|-------------|----------|
| BWCE DevHub Integration | Comprehensive integration documentation | Documentation |
| BWCE Monitoring Setup | BWCEMon deployment and configuration | Documentation |

### Learning & Tutorials

| Template | Description | Category |
|----------|-------------|----------|
| BWCE Basics | Fundamentals and hands-on tutorials | Learning |

### Application Templates

| Template | Description | Technologies |
|----------|-------------|--------------|
| Order Processing with Kafka | E-commerce order management | Kafka, Messaging |
| S3 Operations | AWS S3 integration and file processing | AWS, S3 |
| Java Operations | Custom Java integration | Java, Custom Operations |

### Integration Templates

| Template | Description | Systems |
|----------|-------------|---------|
| EBX-SAP Data Sync | Enterprise data synchronization | EBX, SAP |
| CDC Salesforce-EBX | Change data capture sync | Salesforce, EBX, Kafka |

### DevOps & Tooling

| Template | Description | Tools |
|----------|-------------|-------|
| CI/CD Jenkins Pipeline | Complete DevOps pipeline | Jenkins, Docker, K8s |
| SonarQube BWCE Plugin | Code quality analysis | SonarQube, Static Analysis |

## 🎯 Flogo Templates (7 Total)

### API Development

| Template | Description | Technology |
|----------|-------------|------------|
| GraphQL APIs | Flexible data querying | GraphQL, Multi-source |
| gRPC IoT Telemetry | High-performance data processing | gRPC, IoT, Real-time |

### IoT & Real-time Processing

| Template | Description | Use Case |
|----------|-------------|----------|
| MQTT Inventory Management | Retail inventory automation | MQTT, IoT, Retail |

### AI & Machine Learning

| Template | Description | Technology |
|----------|-------------|------------|
| AI Customer Service with MCP | AI integration | Model Context Protocol, AI |

### Enterprise Integration

| Template | Description | Technology |
|----------|-------------|------------|
| RPA Integration | Robotic Process Automation | RPA, Workflow Automation |

### DevOps & Automation

| Template | Description | Platform |
|----------|-------------|----------|
| CI/CD Jenkins Pipeline | AWS Lambda deployment | Jenkins, AWS Lambda |
| CI/CD Terraform Pipeline | Infrastructure as Code | Terraform, IaC |

## 🚀 Quick Setup

### Prerequisites

| Requirement | Purpose |
|-------------|---------|
| TIBCO® Developer Hub | Backstage platform |
| GitHub Token | Template scaffolding |
| BWCE License | BusinessWorks templates |
| Flogo License | Flogo templates |

### Registration Commands

```bash
# BWCE Marketplace
curl -X POST "http://localhost:3000/tibco/hub/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{"type": "url", "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/bwce/bwce-marketplace-registry.yaml"}'

# Flogo Marketplace  
curl -X POST "http://localhost:3000/tibco/hub/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{"type": "url", "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/flogo/flogo-marketplace-registry.yaml"}'

# Platform Solutions Marketplace
curl -X POST "http://localhost:3000/tibco/hub/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{"type": "url", "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/platform-marketplace-registry.yaml"}'

# E-Commerce Platform Components
curl -X POST "http://localhost:3000/tibco/hub/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{"type": "url", "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/e-commerce-platform/ecommerce-platform.yaml"}'
```

## ✨ Template Features

### Common Features

| Feature | BWCE | Flogo | Description |
|---------|------|-------|-------------|
| Backstage Integration | ✅ | ✅ | Full catalog-info.yaml support |
| CI/CD Ready | ✅ | ✅ | Jenkins, GitHub Actions, Terraform |
| Documentation | ✅ | ✅ | README and TechDocs |
| Containerization | ✅ | ✅ | Docker and Kubernetes |
| Testing | ✅ | ✅ | Unit tests and quality gates |
| Security | ✅ | ✅ | Auth, authorization, best practices |

### Technology-Specific Features

| Technology | Features |
|------------|----------|
| **BWCE** | Enterprise Integration (SAP, Salesforce), CDC, Cloud Native, SonarQube |
| **Flogo** | Lightweight Runtime, API-First (GraphQL, gRPC), AI/MCP, IoT/MQTT |

## 🏷️ Technology Stack

### Core Technologies
`tibco` `bwce` `flogo` `backstage` `microservices` `api` `integration`

### Infrastructure & DevOps  
`cicd` `devops` `kubernetes` `docker` `jenkins` `terraform` `sonarqube`

### Integration & Data
`kafka` `mqtt` `aws` `s3` `salesforce` `sap` `ebx` `graphql` `grpc`

### Specialized
`iot` `ai` `rpa` `cdc` `realtime`

## 📚 Resources

| Resource | Link |
|----------|------|
| TIBCO® Developer Hub Docs | [docs.tibco.com/products/tibco-developer-hub](https://docs.tibco.com/products/tibco-developer-hub) |
| BWCE Documentation | [docs.tibco.com/products/tibco-businessworks-container-edition](https://docs.tibco.com/products/tibco-businessworks-container-edition) |
| Flogo Documentation | [docs.tibco.com/products/tibco-flogo-enterprise](https://docs.tibco.com/products/tibco-flogo-enterprise) |
| Backstage.io | [backstage.io/docs](https://backstage.io/docs) |
| TIBCO Support | [support.tibco.com/s/](https://support.tibco.com/s/) |

---
*Accelerating enterprise integration and API development with standardized templates and best practices.*
