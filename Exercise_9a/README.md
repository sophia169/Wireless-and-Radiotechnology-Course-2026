# TCP Client-Server Sensor System

## Project Description

This project demonstrates a simple TCP client-server communication system using Python sockets.

The server waits for a client connection and prints incoming messages.  
The client simulates a sensor by generating random temperature values and sending them to the server every 5 seconds.

Example message:

Temperature: 23.5 C

---

## Files

server.py - TCP server that receives messages  
client.py - TCP client that sends random sensor data  

---

## How to Run

### 1. Start the Server

Open a terminal and run:

python server.py

Output example:

Server listening on 127.0.0.1:5000

---

### 2. Run the Client

Open another terminal and run:

python client.py

Output example:

Connected to server  
Sent: Temperature: 24.3 C  

---

## Test Results

### Test 1 – Localhost

Server and client were run on the same computer.

Result:
- Server successfully received temperature data
- Data was received every 5 seconds

Example server output:

Received: Temperature: 24.3 C  
Received: Temperature: 26.1 C  
Received: Temperature: 22.8 C  

---

### Test 2 – Second Device (Same WiFi / Hotspot)

Steps:
1. Start server on Laptop A
2. Find Laptop A IP address using:

ipconfig   (Windows)  
ifconfig   (Linux/macOS)

Example:

192.168.1.45

3. Update client.py:

HOST = "192.168.1.45"

4. Run client on Laptop B

Result:
Client successfully connected and sent temperature data.

---

## Screenshot

<img width="917" height="425" alt="{14EBDDA6-DF84-45CA-86E4-AD8A3FEADC04}" src="https://github.com/user-attachments/assets/0df6f833-8c93-4885-b964-5a3a064dd9fc" />


---

## Author

Student TCP Client-Server Assignment
