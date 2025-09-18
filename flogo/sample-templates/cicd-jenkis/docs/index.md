# Automated Deployment of FaaS (Lambda) with TIBCO Flogo Enterprise

## Scenario

The architecture diagram isn't updated for AWS Lambda so it shows HTTP Trigger but in application it uses receive lambda invocation trigger


![image](https://github.com/user-attachments/assets/5a24d8a4-9f77-48c9-b085-082d9139ccc5)

## Deployment
- AWS Lambda

## Prerequisites
- We are using TIBCO Cloud Platform APIs to build the app binary. You need to prepare  accessToken to access the platform apis.
- You will need to get your aws credentials for lambda deployment
- jenkins server should have http request plugin installed we are using it for calling TIBCO Cloud PAPI

## Result

Pipeline Overview:

<img width="1713" alt="image" src="https://github.com/user-attachments/assets/44d3ecf9-0ace-43ae-bf50-5b98af4be57c" />

Detailed Stage View

<img width="1713" alt="image" src="https://github.com/user-attachments/assets/78530d65-f9af-4848-a890-73a878fc46f8" />

Workspace View

<img width="1713" alt="image" src="https://github.com/user-attachments/assets/8490aa10-4c99-4e4a-87a8-009ad531bbff" />



Hopefully, it will give you quick peek of how easy it is to build automation around TIBCO Flogo for FaaS deployment!!!
