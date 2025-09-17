# ${{ values.name }}

${{ values.description }}

## Flogo MQTT Real-time Inventory Management

This project contains a TIBCO Flogo application for real-time inventory management using MQTT messaging.

### Features

- Real-time inventory tracking via MQTT
- IoT device integration
- Event-driven architecture
- Scalable messaging infrastructure

### Configuration

- MQTT Broker: ${{ values.mqttBroker }}
- Inventory Topic: ${{ values.inventoryTopic }}
- QoS Level: ${{ values.qosLevel }}
{%- if values.enableSSL %}
- SSL/TLS: Enabled
{%- else %}
- SSL/TLS: Disabled
{%- endif %}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Project Structure

- `flogo-mqtt-rt-inv-mgnt/`: Main Flogo project directory with MQTT inventory management flows

### Getting Started

1. Import the Flogo application into TIBCO Flogo Enterprise
2. Configure MQTT broker connection settings
3. Set up inventory topic subscriptions
4. Build and deploy the application
5. Connect IoT devices or simulators to test real-time updates

### MQTT Topics

- Inventory updates: `${{ values.inventoryTopic }}`
- Additional topics can be configured as needed

### Documentation

For more information about TIBCO Flogo and MQTT integration, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [MQTT Documentation](https://mqtt.org/)