# BWCE Monitoring Documentation Template

This is a Backstage documentation template that provides comprehensive guidance for setting up TIBCO BusinessWorks Container Edition Monitoring (BWCEMon) with BWCE applications.

## Template Purpose

This documentation template helps teams create complete documentation for BWCEMon deployment and integration with BWCE applications. It covers the entire lifecycle from software download to production monitoring.

## What This Template Provides

### Complete BWCEMon Documentation
1. **Download and Setup**: Step-by-step guide to obtain BWCEMon from TIBCO eDelivery
2. **Docker Image Creation**: Instructions for building BWCEMon container images
3. **Database Configuration**: Setup guides for PostgreSQL, MySQL, and H2 databases
4. **Deployment Options**: Both Kubernetes and standalone Docker deployment approaches
5. **BWCE Integration**: How to connect and monitor BWCE applications
6. **Troubleshooting**: Common issues and resolution techniques

### Generated Documentation Structure
- **Comprehensive Setup Guide**: Complete documentation in `docs/index.md`
- **Deployment Configurations**: Kubernetes manifests and Docker commands
- **Database Setup Scripts**: SQL scripts for database preparation
- **Integration Examples**: Sample configurations for BWCE app monitoring

## Template Features

- **Multi-Environment Support**: Documentation adapts for Kubernetes or Docker deployments
- **Database Flexibility**: Covers PostgreSQL, MySQL, and H2 in-memory options
- **Version Agnostic**: Supports multiple BWCEMon versions (2.8.2, 2.9.0, 2.10.0)
- **Conditional Content**: Documentation changes based on selected deployment type and database

### 1. Download the BWCEMon from official TIBCO download site 
- Login to [TIBCO Software Download](https://edelivery.tibco.com)
- Look for BusinessWorks Container Edition -> latest version
- Under runtime select the Container -> and download bwce-mon-x.x.x.zip

    ![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/4c7b3e97-f727-4988-91a2-bc0d088901b2)



### 2. Build BWCEMon Docker Image
Once you download the bwce-mon-x.x.x.zip file, we need to cretae the docker image for deployment. You can find the steps documented [here in official TIBCO BWCE document](https://docs.tibco.com/pub/bwce/2.8.2/doc/html/Default.htm#bwce-app-monitoring/setting-up-bwce-appl.htm?TocPath=Application%2520Monitoring%2520and%2520Troubleshooting%257CApplication%2520Monitoring%2520Overview%257CApplication%2520Monitoring%2520on%2520Docker%257CSetting%2520Up%2520%2520%2520%2520TIBCO%2520BusinessWorks%2520Container%2520Edition%2520Application%2520Monitoring%2520on%2520Docker%257C_____0 ).  

Follow below steps to build the BWCEMon docker image:
- Extract the bwce_mon-x.x.x.zip 
- Navigate to the bwce_mon directory and build the docker image:

        docker build -t mpandav/bwce-monitoring:282

    ![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/06d048c1-f0fc-42af-aa4f-9ec07230f191)

- If you want you can store your image to docker registry. In my case, I will be hosting it on [here at dockerhub ](https://hub.docker.com/repository/docker/mpandav/bwce-monitoring/general).

### 3. Deploy the BWCE Monitoring Application
Once you build your docker image, you have a choice of deploying it either as a standalone docker container or in K8S cluster. Let's see how we can deploy our BWCEMon Container in one or another. 

Before deploying the BWCEMon we need to satisfy few prequisites:
- A Database instance to store the application monitoring information. You can find supported DB types and versions here.
- Make sure that your DB instance is up & running and rechable from BWCEMon host.

### 1. Deploy as a K8S Service:

To deploy BWCEMon in K8S environment as a service, pls use deployment.yml configuration provided here. 

        kubectl apply -f bwce-mon-deployment.yml

- BWCE Monitoring Application is now ready and available on configured port.

    ![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/972e67d2-f308-4dda-ac22-3d5e192a57df)

- BWCEMon Replication Controller

    ![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/6c68852a-f1a6-4ae1-a5db-df3121f3bc65) 

- BWCEMon POD configurtion
    
    ![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/2200d98d-5894-4ba3-ae8c-bd09bd4b60ab)



### 2. Deploy as a Standalone Container:

To deploy a BWCEMon in standalone container run below docker command. In my case, I will be using postgresql server as a data store for monitoring data.

    docker run -p 8080:8080 -e PERSISTENCE_TYPE="postgres" -e DB_URL="postgresql://postgres:Tibco321@xx.xxx.xx.xxx:5432/postgres" --name bwce-monitoring-282 mpandav/bwce-monitoring:282
![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/1cdb7026-9d8b-406f-a264-09492fc4eac2)

Your BWCEMon app is now ready and accessible on http://localhost:8080 as shown below,

![image](https://github.com/mpandav/tibco-cloud-usability/assets/38240734/cc3a6c75-80d3-4e23-9fe6-b0d2aa31745a)

