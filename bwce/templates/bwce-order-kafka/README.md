# BWCE Order Kafka Processing Template

## Overview
This template provides a comprehensive solution for order processing with real-time event streaming to Apache Kafka using TIBCO BusinessWorks Container Edition (BWCE).

## Key Features
- **Order Processing Service**: RESTful API for order management operations
- **Kafka Integration**: Real-time order event streaming to Kafka topics
- **Maven Build System**: Complete build and dependency management
- **Shared Library**: Reusable components with audit logging and error handling
- **Modular Architecture**: Well-structured project with separate applications and libraries

## Components
- **OrderToKafka**: Main BWCE application for order processing
- **OrderToKafka.application**: Application deployment module
- **OrderToKafka.application.parent**: Maven parent project
- **bwceLib**: Shared library with audit and logging utilities

## Key Processes
- **MP_Order_Service**: Main order service process
- **To_KafkaTopic**: Kafka message publishing process
- **Audit Functions**: Comprehensive audit logging capabilities

## Quick Start
1. Use this template to create a new BWCE project in TIBCO Developer Hub
2. Configure Kafka connection settings
3. Customize order processing business logic
4. Set up Maven build configuration
5. Deploy to your BWCE runtime environment

## Use Cases
- E-commerce order management workflows
- Real-time order tracking and notifications
- Supply chain integration scenarios
- Order analytics and business intelligence
- Event-driven commerce architectures

## Documentation
For detailed documentation, see the [docs](./docs/index.md) folder.