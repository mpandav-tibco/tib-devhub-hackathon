# Flogo and RPA: Automating Complex Workflows

This demo application showcases the integration of TIBCO Flogo® with Robotic Process Automation (RPA) tools to automate complex workflows and bridge the gap between modern and legacy systems.

## What is RPA?

Robotic Process Automation (RPA) is a technology that uses software robots (bots) to automate repetitive and rule-based tasks. RPA bots can interact with user interfaces, applications, and systems, mimicking human actions to perform tasks such as data entry, data extraction, and system integration.

## Why Flogo and RPA?

Flogo complements RPA by providing an event-driven orchestration layer. Flogo can be used to:

* Trigger RPA bots based on events or conditions.
* Pass data to and from RPA bots.
* Handle complex logic and decision-making.
* Integrate with various systems and services.

## Use Case: Automating Product Creation

This demo automates the process of creating new products in a web application using Flogo and UiPath.

* Flogo: Receives product data (e.g., from an API call) and triggers a UiPath bot.
* UiPath: Opens a web browser, fills out a product creation form, and submits it.

## How to Use

1. **Set up UiPath:**
    * Install UiPath Studio.
    * Create a UiPath bot that can fill out a web form with provided data. You can refer to Bot app available under directory ` /UiPath `
    * Publish the bot to UiPath Automation Cloud.

2. **Create a Flogo app:**
    * Clone the repo
    * Import the rpa-integration.flogo application into your Flogo Dev Environment.
    * Use  pre-exising .flogotest to verify the behavior
    * Update your configuration of webhook api and schema for your automation process


3. **Run the demo:**
    * Trigger the Flogo app with sample product data.
    * Observe the UiPath bot automating the product creation process.

## Demo

### Flogo Application Implenentation

<img width="1331" alt="image" src="https://github.com/user-attachments/assets/684248f8-3e6c-47d6-844d-382e780d2cdc" />

### Postman calling Flogo API (Send Product Creation Request)
<img width="1296" alt="image" src="https://github.com/user-attachments/assets/bc2c029d-3367-490c-9732-615cf8584e3c" />


### Flogo Processing the Request and Trigger the UiPath Bot workflow automation
<img width="1330" alt="image" src="https://github.com/user-attachments/assets/c795e54d-8cc3-46db-8c68-204288c85ffa" />


### The video showcasing how RAP takes action on Flogo request.

https://github.com/user-attachments/assets/3407cde6-3b29-42d1-893e-adb6bf18172c



## Benefits

* **Increased automation:** Automate complex tasks that involve UI interaction and backend logic.
* **Improved efficiency:** Reduce manual effort and errors in data entry and processing.
* **Legacy system integration:**  Seamlessly integrate with legacy systems that lack APIs.
* **Enhanced flexibility:**  Orchestrate interactions between RPA bots and other systems.

## Explore the Code

* **Flogo app:** [rpa-integration.flogo]
* **UiPath bot:** [/UiPath/RPA_DataEntryAutomation_WorkFlow.uip]

## Learn More

* **TIBCO Flogo:** [Flogo website ](https://docs.tibco.com/products/tibco-flogo-enterprise)
* **UiPath:** [UiPath.com](https://www.uipath.com/)

This demo showcases the power of combining Flogo and RPA to automate complex workflows and improve business efficiency.
