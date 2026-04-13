## Lab 1 — Sensor to Edge Communication (Socket Programming)

### 1. System architecture diagram

Sensor (Laptop 1)
      ↓ Socket
Edge Device (Laptop 2)
      ↓ MQTT
Main Server (Laptop 1)

### 2. IP addresses used : 192.168.116.98

### 3. MQTT topic used: savonia/iot/temperature

### 4. Screenshot of socket communication: 
![socket_sensor](https://github.com/user-attachments/assets/6520ec1c-e400-40c2-8929-2c94b80d532a)


### 5. screenshot of MQTT messages
<img width="1302" height="961" alt="socket_server" src="https://github.com/user-attachments/assets/2e825751-203e-4abf-b706-3fed10284a41" />

## Lab 2 — Edge Device to Cloud Communication (MQTT)

### 1. System architecture diagram

Laptop 2 (Edge Device)
      ↓ MQTT
MQTT Broker
      ↓
Laptop 1 (Cloud Subscriber)

### 2. IP addresses used : 192.168.116.98

### 3. MQTT topic used: Edge Device to Cloud Communication (MQTT)

### 4. Screenshot of socket communication: 
![lap1](https://github.com/user-attachments/assets/11598d41-b675-4cc7-8679-f07fd04d7950)

### 5. screenshot of MQTT messages
<img width="1462" height="977" alt="lap2" src="https://github.com/user-attachments/assets/3e003331-08a5-4003-a929-0c5870ab700d" />

## Lab 3 — Full IoT Pipeline (Integration)

### 1. System architecture diagram
Laptop 1 (Sensor)
      ↓ socket
Laptop 2 (Edge Device)
      ↓ MQTT
Laptop 1 (Cloud Server)

### 2. IP addresses used : 192.168.116.98

### 3. MQTT topic used: Full IoT Pipeline (Integration)

### 4. Screenshot of socket communication: 
![lap1](https://github.com/user-attachments/assets/f8c4feca-ee4e-44dd-b3e1-47f22a47b431)

### 5. screenshot of MQTT messages
<img width="1422" height="981" alt="edge_device" src="https://github.com/user-attachments/assets/3fef15e8-091c-4440-9c25-470b744db330" />

