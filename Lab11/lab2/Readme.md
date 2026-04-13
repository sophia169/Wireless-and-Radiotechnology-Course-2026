# Lab 2 — Multi-Sensor IoT Dashboard

## Project Description
This project demonstrates a multi-stage IoT data pipeline. A sensor node simulates environmental data (Temperature, Humidity, and Light), transmits it over a TCP socket to an Edge Device, which then forwards the data to an MQTT Broker for visualization in Grafana.

## System Architecture
1. **Sensor Node (Python):** Generates random sensor data and sends it via TCP.
2. **Edge Device (Python):** Acts as a gateway, splitting the TCP stream into individual MQTT topics.
3. **MQTT Broker:** `broker.emqx.io` handles the message distribution.
4. **Grafana:** Subscribes to the broker and visualizes data in a 4-panel dashboard.

## Sensors Used
| Sensor | Data Type | Range | Unit |
| :--- | :--- | :--- | :--- |
| Temperature | Floating point | 20.00 - 35.00 | °C |
| Humidity | Floating point | 40.00 - 80.00 | % |
| Light | Floating point | 100.00 - 1000.00 | lux |

## MQTT Topics
- `savonia/iot/temperature`
- `savonia/iot/humidity`
- `savonia/iot/light`

## Dashboard Layout
The dashboard is organized into four distinct panels for clarity:
1. **Temperature Graph (Top):** A Time Series graph showing temperature fluctuations over time.
2. **Humidity Gauge (Bottom Left):** A radial gauge showing current humidity percentage.
3. **Light Gauge (Bottom Right):** A radial gauge showing light intensity in lux.
4. **Status Panel (Bottom):** A stat panel showing the most recent temperature reading for a quick status check.

## Screenshots
<img width="1413" height="687" alt="image" src="https://github.com/user-attachments/assets/44d04c72-5159-48cd-9a44-dfbafeb05308" />


## Reflection Question
**Why do we separate each sensor into a different MQTT topic?**
Separating sensors into different topics follows the "Principle of Least Privilege" and improves scalability. It allows subscribers (like a specific gauge in Grafana or a separate database) to listen only to the specific data they need without processing unnecessary information. It also makes it easier to debug specific sensor streams and allows different sensors to have different update frequencies.
