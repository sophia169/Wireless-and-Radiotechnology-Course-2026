import socket
import random
import time

HOST = "127.0.0.1"
PORT = 5000

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))

print("Connected to server")

while True:
    temperature = round(random.uniform(20.0, 30.0), 1)
    message = f"Temperature: {temperature} C"
    
    client_socket.sendall(message.encode())
    print("Sent:", message)

    time.sleep(5)