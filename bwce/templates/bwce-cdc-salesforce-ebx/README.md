# BWCE CDC Salesforce EBX Integration Template

## Overview
This template provides a comprehensive solution for Change Data Capture (CDC) integration between Salesforce and EBX Master Data Management using Apache Kafka as the messaging backbone and TIBCO BusinessWorks Container Edition (BWCE) for integration logic.

## Scenario
![image](https://github.com/mpandav/cdc-salesforce-ebx/assets/38240734/4e972e0d-36d7-477c-8c73-9be7c1b13836)

## Key Features
- **Real-time Salesforce CDC**: Capture data changes from Salesforce in real-time
- **EBX Integration**: Seamless integration with EBX Master Data Management platform
- **Kafka Messaging**: Reliable message streaming and processing
- **Multi-Application Architecture**: Modular design with separate applications for different integration points

## Components
- **DHL Kafka EBX Integration**: Handles data transformation and routing to EBX
- **DHL SFDC Kafka Integration**: Processes Salesforce CDC events
- **Shared Libraries**: Common utilities and configurations

## Quick Start
1. Use this template to create a new BWCE project in TIBCO Developer Hub
2. Configure your Salesforce CDC settings
3. Set up EBX connection parameters
4. Configure Kafka cluster details
5. Deploy to your target environment

## Use Cases
- Real-time customer data synchronization
- Product catalog updates
- Master data management workflows
- Event-driven data integration

## Documentation
For detailed documentation, see the [docs](./docs/index.md) folder.
