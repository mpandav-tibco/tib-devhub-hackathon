# BWCE Order Kafka Processing Template

## Overview

This TIBCO BusinessWorks Container Edition (BWCE) template provides a comprehensive solution for order processing with real-time event streaming to Apache Kafka. The template demonstrates enterprise-grade order management workflows with messaging integration capabilities.

## Features

- **Order Processing Service** - RESTful API for order management operations
- **Kafka Integration** - Real-time order event streaming to Kafka topics
- **Order Synchronization** - Seamless order data synchronization workflows  
- **Maven Build System** - Complete Maven-based build and dependency management
- **Shared Library** - Reusable components including audit logging and error handling
- **Test Framework** - Built-in testing capabilities with sample data

## Architecture

The template includes multiple components organized in a modular structure:

### Core Components
- **OrderToKafka**: Main BWCE application handling order processing logic
- **OrderToKafka.application**: Application deployment module
- **OrderToKafka.application.parent**: Maven parent project for build coordination
- **bwceLib**: Shared library with common utilities and audit functions

### Key Processes
- **MP_Order_Service**: Main process handling order service operations
- **To_KafkaTopic**: Process for streaming order events to Kafka topics
- **Audit Functions**: Built-in audit logging for order tracking and compliance

### Data Models
- **Order-Sync-Service API**: RESTful API schema definitions
- **OrderParameterSchema**: Order data structure specifications
- **RESTSchema**: REST service contract definitions

## Getting Started

1. Create a new project using this template in TIBCO Developer Hub
2. Configure Kafka connection settings for your environment
3. Customize order processing business logic as needed
4. Set up Maven build configuration for your target environment
5. Deploy the application to your BWCE runtime

## Use Cases

- **E-commerce Order Management** - Handle online order processing workflows
- **Real-time Order Tracking** - Stream order status updates to downstream systems
- **Order Event Processing** - Process order lifecycle events for analytics
- **Supply Chain Integration** - Integrate order data with inventory and fulfillment systems
- **Customer Notification Systems** - Trigger notifications based on order events
- **Order Analytics** - Stream order data for real-time business intelligence

## Project Structure

```
OrderToKafka/
├── Processes/ordersync/
│   ├── MP_Order_Service.bwp     # Main order service process
│   └── To_KafkaTopic.bwp        # Kafka publishing process
├── Schemas/
│   ├── Order-Sync-Service API_1.0.xsd
│   ├── OrderParameterSchema.xsd
│   └── RESTSchema.xsd
└── pom.xml                      # Maven configuration

bwceLib/                         # Shared library
├── Processes/bwcelib/
│   ├── auditStart.bwp          # Audit logging start
│   ├── auditEnd.bwp            # Audit logging end  
│   ├── logger.bwp              # General logging
│   └── errorLogger.bwp         # Error logging
└── Schemas/                    # Common schema definitions
```

## Configuration

The template supports environment-specific configuration for:
- Kafka broker connections and topic settings
- Order service endpoints and authentication
- Audit and logging configuration
- Maven build profiles for different deployment targets

## Monitoring & Observability

Built-in capabilities include:
- Comprehensive audit logging for order transactions
- Error logging and exception handling
- Order processing metrics and monitoring hooks
- Integration points for external monitoring systems


