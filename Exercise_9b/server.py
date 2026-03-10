import socket

SERVER_MAC = "A0:29:19:77:2A:73"
PORT = 4

server = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)

server.bind((SERVER_MAC, PORT))
server.listen(1)

print("Waiting for Bluetooth client connection...")

client, addr = server.accept()
print(f"Connected to: {addr}")

try:
    while True:
        data = client.recv(1024)

        if not data:
            break

        print("Received:", data.decode("utf-8"))

except OSError:
    pass

client.close()
server.close()