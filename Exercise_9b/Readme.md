# Bluetooth Sensor to Gateway with Python

## Project Description

This project demonstrates a simple Bluetooth client-server communication using Python RFCOMM sockets.

The system simulates an IoT sensor node that sends temperature data to a gateway device over Bluetooth.

Client = Sensor device  
Server = Gateway device

The sensor generates a random temperature value every 5 seconds and sends it to the gateway.

---

## Bluetooth MAC Address Used

Example:

A0:29:19:77:2A:73

---
## How to Run

### 1. Start the server

Run on the gateway device:

python server.py


Output example:


Waiting for Bluetooth client connection...
Connected to: ('A0:29:19:77:2A:73', 1)

Received: Temperature: 22.8 C
Received: Temperature: 23.4 C
Received: Temperature: 21.9 C


---

### 2. Start the client

Run on the sensor device:


python client.py


Output example:


Connected to Bluetooth server
Sent: Temperature: 22.8 C
Sent: Temperature: 23.4 C
Sent: Temperature: 21.9 C


---

## Screenshot

<img width="878" height="277" alt="{6D24FB6A-0609-471E-9FEA-7982799B628D}" src="https://github.com/user-attachments/assets/1f5e4aed-90a4-40c1-ac10-b1864cd901c5" />


Example:

Client sending temperature values and server receiving them.

---

## Reflection

### What did you learn?

I learned how Bluetooth socket communication works in Python using RFCOMM. I also learned how client-server architecture can be used in IoT systems to send sensor data from devices to a gateway.

### What was difficult?

One challenge was finding the correct Bluetooth MAC address and ensuring the devices were discoverable and paired. Debugging Bluetooth connections can also be more difficult compared to normal network sockets.

### Where could Bluetooth communication be useful in IoT?

Bluetooth communication is useful in IoT for short-range communication between devices such as smart home sensors, wearable devices, health monitoring systems, and industrial sensors connected to a nearby gateway.

---

## Reflection Question

### What is the difference between Bluetooth socket communication and WiFi socket communication in practice?

Bluetooth socket communication is typically used for short-range communication between nearby devices and consumes less power. It is commonly used for personal devices and IoT sensors.

WiFi socket communication works over IP networks and can communicate over much longer distances through routers and the internet. WiFi generally provides higher bandwidth but consumes more power compared to Bluetooth.


