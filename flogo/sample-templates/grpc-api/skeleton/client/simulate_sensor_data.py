import grpc 
import sensor_pb2_grpc
import sensor_pb2 
import random
import time

def generate_sensor_data():
    return sensor_pb2.SensorData(
        sensor_id="sensor-123",
        temperature=random.uniform(20, 35),
        pressure=random.uniform(1000, 1100),
        humidity=random.uniform(40, 60),
        timestamp=time.strftime("%Y-%m-%d %H:%M:%S")
    )

with grpc.insecure_channel('localhost:9090') as channel:  # Replace with your Flogo app's address
    stub = sensor_pb2_grpc.SensorServiceStub(channel)
    while True:
        SensorData = generate_sensor_data()
        response = stub.SendTelemetryData(SensorData)
        print("Sent sensor data:", SensorData)
        time.sleep(5)