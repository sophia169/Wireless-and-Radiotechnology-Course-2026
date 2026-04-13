import socket
import paho.mqtt.client as mqtt

HOST = "192.168.116.98"
PORT = 5007
broker = "broker.emqx.io"

# Fixed DeprecationWarning by adding CallbackAPIVersion
mqtt_client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2)
mqtt_client.connect(broker, 1883)

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print(f"Server listening on {HOST}:{PORT}...")

conn, addr = server.accept()
print(f"Connected by {addr}")

try:
    while True:
        data = conn.recv(1024)
        if not data:
            break

        message = data.decode().strip() # Added .strip() to remove extra whitespace/newlines
        
        # Validate that we have exactly 3 values
        parts = message.split(",")
        if len(parts) == 3:
            temperature, humidity, light = parts
            
            mqtt_client.publish("savonia/iot/temperature", temperature)
            mqtt_client.publish("savonia/iot/humidity", humidity)
            mqtt_client.publish("savonia/iot/light", light)
            
            print(f"Forwarded: T={temperature}, H={humidity}, L={light}")
        else:
            print(f"Received malformed data: {message}")

finally:
    conn.close()
    server.close()
    mqtt_client.disconnect()