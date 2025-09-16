# BWCE CDC Salesforce EBX Template

## Overview

This TIBCO BusinessWorks Container Edition (BWCE) template provides a comprehensive solution for Change Data Capture (CDC) integration between Salesforce and EBX systems using Apache Kafka as the messaging backbone.

## Features

- **Change Data Capture**: Real-time data synchronization from Salesforce
- **EBX Integration**: Seamless data flow to EBX Master Data Management platform
- **Kafka Messaging**: Reliable message streaming and processing
- **Multi-Application Architecture**: Modular design with separate applications for different integration points

## Architecture

The template includes multiple BWCE applications:

- **Kafka EBX Integration**: Handles data transformation and routing to EBX
- **SFDC Kafka Integration**: Processes Salesforce CDC events
- **Shared Libraries**: Common utilities and configurations

## Getting Started

1. Create a new project using this template
2. Configure Salesforce CDC settings
3. Set up EBX connection parameters
4. Configure Kafka cluster details
5. Deploy to your target environment

## Use Cases

- Real-time customer data synchronization
- Product catalog updates
- Master data management workflows
- Event-driven data integration