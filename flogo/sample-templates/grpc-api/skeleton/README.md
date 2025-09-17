# Flogo and gRPC for IoT: Real-time Anomaly Detection

This demo showcases the power of TIBCO Flogo® Enterprise in building a gRPC server for real-time IoT data processing and anomaly detection.

## Use Case

Imagine a network of IoT sensors sending telemetry data (temperature, pressure, humidity) to a central hub. Our Flogo application acts as a gRPC server, receiving this data from the sensors. It then performs data storage and near real-time calculations, checks for anomalies based on predefined thresholds, and triggers alerts if necessary. Additionally, it sends aggregated data to a time-series database (InfluxDB) for visualization and analysis.

## Architecture

The demo involves the following components:

* **IoT Sensors:** Simulate IoT sensors sending telemetry data via gRPC.
* **Flogo App:** Acts as a gRPC server, processes sensor data, checks for anomalies, triggers alerts, and sends data to InfluxDB.
* **InfluxDB (Optional) :** A time-series database to store sensor data and calculated metrics.
* **Grafana (Optional):** A visualization tool to monitor and analyze the sensor data in real-time.

## Implementation

1. **Define the gRPC service:**
   - Create a Protobuf (`sensor.proto`) file defining the gRPC service and message structures for sensor data.

2. **Generate gRPC code:**
   - Use the `protoc` compiler to generate server and client code from the `.proto` file.

3. **Create the Flogo app:**
   - Create a new Flogo app with a gRPC trigger configured to receive sensor data.
   - Implement the flow to process data, calculate metrics (e.g., average temperature), check for anomalies, trigger alerts, and send data to InfluxDB.

4. **Deploy the Flogo app:**
   - Deploy the app as a gRPC server (standalone executable, container, or serverless function).

5. **Simulate sensor data:**
   - Use a script or application to simulate sensor data and send it to the Flogo app via gRPC.

6. **Visualize data (optional):**
   - Set up InfluxDB and Grafana to visualize the sensor data and metrics.

## Flogo App Details

The Flogo app performs the following tasks:

* **Receive sensor data:** Receives `SensorData` messages via gRPC.
* **Store  data:** Store Data `temperature`, `pressure`, and `humidity` values to postgresql DB
* **Calculate metrics:** Calculates metrics like average temperature over a period.
* **Check for anomalies:** Compares sensor readings against predefined thresholds.
* **Trigger alerts:** Sends alerts (e.g., via email) if anomalies are detected.
* **Store data:** Sends data to InfluxDB for persistence and analysis.

## Demo

* **Run the Flogo app:** Start the Flogo app as a gRPC server.
* **Simulate sensor data:** Run the provided Python script to send simulated sensor data to the Flogo app.
* **Observe logs and alerts:** Monitor the Flogo app logs for processed data and any triggered alerts.
* **Visualize data (optional):** Use Grafana to visualize the sensor data and calculated metrics stored in InfluxDB.

## Benefits

* **Real-time processing:** Process and analyze IoT data in real-time.
* **Anomaly detection:** Detect anomalies and trigger alerts promptly.
* **Data visualization:** Visualize and monitor sensor data for insights.
* **Edge computing:** Deploy the Flogo app on edge devices for low-latency processing.

## Explore the Code

* **Flogo app:** [telemetry-api.flogo]
* **Sensor data simulation script:** [simulate_sensor_data.py]

## Learn More

* **TIBCO Flogo:** [Flogo website](https://docs.tibco.com/products/tibco-flogo-enterprise)
* **gRPC:** [gRPC website](https://grpc.io/)
* **InfluxDB:** [InfluxDB website](https://www.influxdata.com/)
* **Grafana:** [Grafana website](https://grafana.com/)
