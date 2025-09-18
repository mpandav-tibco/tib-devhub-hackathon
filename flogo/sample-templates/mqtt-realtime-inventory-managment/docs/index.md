# Real time Inventory Management with Flogo & MQTT
This repository provides the code and configurations for the blog post: **"From Sensor to Sales: Powering Retail with Flogo & MQTT"**.

It demonstrates a real-time inventory management system using simulated IoT sensors (Python), MQTT messaging, a PostgreSQL database, and TIBCO Flogo for orchestration and alerting.

**Blog Post Link:** [Read the full blog post here!](https://walkthrough.so/pblc/lDmKaIIHLfjX/real-time-retail-powering-inventory-with-flogo-and-mqtt)


## Overview

This project implements a real-time inventory management system for retail. It orchestrates data flow from IoT sensor simulations (Python) via MQTT to a PostgreSQL database, where Flogo updates inventory and triggers low-stock alerts. Flogo utilizes two main flows: one for MQTT-to-DB updates and another for reacting to PostgreSQL notifications for alerts.

## Prerequisites

To run this project, you need:
**Python 3** (pip included)
**PostgreSQL**
**MQTT Broker** (e.g., Mosquitto)
**TIBCO Flogo Enterprise**


## Setup Guide

Follow these steps to set up the system:

### 1. PostgreSQL Database Setup
1.  Connect to PostgreSQL (e.g., psql -U postgres).
2.  Create the inventory_master database.
3.  Execute sql/schema.sql to create tables.
4.  Execute sql/mock_data.sql to insert initial data.

### 2. PostgreSQL Database Trigger
1.  Connect to inventory_master database.
2.  Execute the low stock trigger SQL (found in the blog post or sql/ directory). This trigger sends NOTIFY 'low_stock' when stock drops.

### 3. MQTT Broker Setup
Ensure your MQTT broker (e.g., Mosquitto) is running and accessible.

### 4. Python Inventory Simulator
1.  Install dependencies: pip install paho-mqtt.
2.  Configure inventory_simulator.py with your MQTT broker details.
3.  Run the simulator: python inventory_simulator.py. Keep this running.


### 5. Flogo Application Setup
1.  Import the .flogo app 
2.  Import postgrelistener trigger into your custom extension directory

## Testing the System

To test the system:
1.  Ensure the Flogo app build and is running.
2.  Run the Python simulator (python inventory_simulator.py).
3.  Monitor Flogo logs and query PostgreSQL tables for real-time updates.
4.  Manually trigger a low stock alert in PostgreSQL (e.g., UPDATE inventory SET stock_level = 2 WHERE item_id = 'TSHIRT-001' AND store_id = 'munich';) and observe the low_stock_alert_flow being triggered.

:) **Enjoy Exploring!!** :)