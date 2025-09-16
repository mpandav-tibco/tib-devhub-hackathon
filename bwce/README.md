# BWCE Marketplace Registry

This directory contains the comprehensive marketplace registry for all TIBCO BusinessWorks Container Edition assets.

## Quick Start

To register all BWCE marketplace entries at once, use this single registry file:

```bash
# Register all BWCE marketplace entries
curl -X POST "http://localhost:7007/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{
    "type": "url",
    "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/bwce/bwce-marketplace-registry.yaml"
  }'
```

## What's Included

### 📚 Documentation & Guides (2 entries)
- **BWCE DevHub Integration Guide** - Complete Developer Hub integration documentation
- **BWCE Monitoring Setup Guide** - BWCEMon deployment and configuration

### 🎓 Learning & Tutorials (1 entry)  
- **BWCE Basics Learning Guide** - Fundamentals with hands-on tutorials

### 🏗️ Application Templates (3 entries)
- **Order Processing with Kafka** - E-commerce order management
- **S3 Operations Template** - AWS S3 integration and file processing  
- **Java Operations Template** - Custom Java integration

### 🔄 Integration Templates (2 entries)
- **EBX-SAP Data Sync** - Enterprise data synchronization
- **CDC Salesforce-EBX** - Change data capture and sync

### 🛠️ DevOps & Tooling (2 entries)
- **CI/CD Jenkins Pipeline** - Complete DevOps pipeline
- **SonarQube BWCE Plugin** - Code quality and analysis

## Individual Registration

You can also register individual templates by pointing to their specific mp-entry files:

```bash
# Example: Register just the BWCE basics guide
curl -X POST "http://localhost:7007/api/catalog/locations" \
  -H "Content-Type: application/json" \
  -d '{
    "type": "url", 
    "target": "https://github.com/mpandav-tibco/tib-devhub-hackathon/blob/main/bwce/templates/basics-of-bwce/mp-entry-bwce-basics.yaml"
  }'
```

## File Structure

```
bwce/
├── bwce-marketplace-registry.yaml    # 👈 Main registry file
├── documentation/
│   ├── bwce-with-devhub-templates/
│   │   └── mp-entry-bwce-devhub-guide.yaml
│   └── bwce-monitoring/
│       └── mp-entry-bwce-monitoring.yaml
├── templates/
│   ├── basics-of-bwce/
│   │   └── mp-entry-bwce-basics.yaml
│   ├── bwce-order-kafka/
│   │   └── mp-entry-template-bwce-order-kafka.yaml
│   └── ... (other templates)
└── tooling/
    └── sonarqube/
        └── mp-entry-sonarqube-bwce-plugin.yaml
```

## Benefits

✅ **Single Point of Registration** - One file registers all BWCE assets  
✅ **Organized Categories** - Logical grouping of templates by type  
✅ **Complete Documentation** - Each entry includes descriptions and use cases  
✅ **Bulk Operations** - Easy to manage all templates together  
✅ **Version Control** - Track changes to the entire BWCE marketplace ecosystem  

## Usage in Developer Hub

After registration, all BWCE templates will be available in:
- **Marketplace** - `/marketplace?filters[tags]=devhub-marketplace`
- **Create** - Template catalog for scaffolding new projects
- **Catalog** - Documentation and component registry

Total: **10 BWCE marketplace entries** ready for enterprise integration development! 🚀