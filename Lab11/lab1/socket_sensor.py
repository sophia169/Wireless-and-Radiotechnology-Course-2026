import socket
import random
import time

SERVER_IP = "192.168.116.14"
PORT = 5007

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

client.connect((SERVER_IP, PORT))

while True:

    temperature = round(random.uniform(20,35),2)

    message = f"{temperature}"

    client.send(message.encode())

    print("Sensor value sent:", temperature)

    time.sleep(5)