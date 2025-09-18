import paho.mqtt.client as mqtt
import json
import time
import random
from datetime import datetime
import uuid

# MQTT Broker Details (Replace with your broker's information)
MQTT_BROKER = "localhost"  # e.g., "broker.hivemq.cloud"
MQTT_PORT = 1883
MQTT_USER = ""       # Optional
MQTT_PASSWORD = ""   # Optional

# List of Stores and Items for Simulation
STORES = ["london", "munich", "paris", "berlin"]
ITEMS = ["TSHIRT-001", "JEANS-002", "SNEAKERS-003", "HAT-004", "SCARF-005"]

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("Connected to MQTT Broker!")
    else:
        print(f"Failed to connect, return code {rc}")

def publish_inventory_event(client, store, item_id, quantity_change):
    topic = f"store/{store}/inventory"  # Use a single topic
    timestamp = datetime.now().isoformat()
    event_id = str(uuid.uuid4())
    event_type = "sales" if quantity_change < 0 else "restock"
    payload = {
        "event_id": event_id,
        "item_id": item_id,
        "store_id": store,  # Include store_id in payload
        "quantity_change": quantity_change,
        "event_type": event_type,
        "timestamp": timestamp
    }
    client.publish(topic, json.dumps(payload))
    print(f"Published to topic '{topic}': {payload}")
    time.sleep(random.uniform(10, 20))

def run_sensor_simulation():
    client = mqtt.Client()
    if MQTT_USER and MQTT_PASSWORD:
        client.username_pw_set(MQTT_USER, MQTT_PASSWORD)
    client.on_connect = on_connect

    try:
        client.connect(MQTT_BROKER, MQTT_PORT, 60)
        client.loop_start()

        print("Starting inventory sensor simulation...")

        # Simulate events for a while
        for _ in range(100):
            store = random.choice(STORES)
            item_id = random.choice(ITEMS)
            quantity_change = random.choice([-2, -1, 1, 2])
            publish_inventory_event(client, store, item_id, quantity_change)

        time.sleep(5)

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        client.loop_stop()
        client.disconnect()
        print("Simulation finished.")

if __name__ == "__main__":
    run_sensor_simulation()
