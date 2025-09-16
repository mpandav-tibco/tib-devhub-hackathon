# BWCE EBX SAP DataSync Integration Template

## Overview
This template provides a robust solution for data synchronization between EBX Master Data Management platform and SAP systems using Business Application Programming Interface (BAPI) integration with TIBCO BusinessWorks Container Edition (BWCE).

## Key Features
- **EBX Integration**: Seamless connectivity to EBX Master Data Management platform
- **SAP BAPI Integration**: Direct integration with SAP systems using standard BAPIs
- **Material Master Management**: Create and manage material masters in SAP
- **Data Transformation**: Comprehensive mapping between EBX and SAP data models

## Components
- **CreateMaterialUsingBAPI**: Core BWCE project for material creation in SAP
- **CreateMaterialUsingBAPI.application**: Application module for deployment
- **Test Data**: Sample JMS messages and REST service data for testing

## Prerequisites
- TIBCO EMS Server (Transport) or any JMS based transport
- TIBCO BusinessWorks version 6.8 or later or equivalent BWCE version
- SAP Solutions plugin for BusinessWorks

## Architecture
The integration architecture handles material data synchronization between EBX MDM Server and SAP R3 Systems. The flow receives new record events from EBX over JMS Server (TIBCO EMS), transforms the data using TIBCO BusinessWorks6/CE, connects with Master Data System over REST APIs, and synchronizes the message into SAP R3 System using TIBCO plugin for SAP Solutions. The master record in EBX is then updated with the SAP Material reference ID.

![image](https://github.com/mpandav/ebx-sap-data-sync/assets/38240734/1cdf9729-0d23-4ffc-859c-949d74e01149)


## Use Cases
- Material master data synchronization
- Product information management
- Master data governance workflows
- SAP integration scenarios

## Quick Start
1. Use this template to create a new BWCE project in TIBCO Developer Hub
2. Configure SAP connection parameters
3. Set up EBX connectivity settings
4. Customize data mapping as per your requirements
5. Deploy to your target environment

## Demo
A short glimpse of the application functionality: 

https://github.com/mpandav/ebx-sap-data-sync/assets/38240734/10ea9eb5-499b-4fc9-97b3-a12010b1eb2b

## Documentation
For detailed documentation, see the [docs](./docs/index.md) folder.

