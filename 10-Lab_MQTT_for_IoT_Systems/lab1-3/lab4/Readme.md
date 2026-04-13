## System architecture diagram
<img width="274" height="475" alt="{C36032F1-3C4F-4C85-8B84-275DCFAF8B06}" src="https://github.com/user-attachments/assets/ddf045c6-2679-48e8-a841-dd51bcb10ae6" />

## MQTT topic used
MQTT Alert System with Telegram

## Screenshot of Telegram alert
<img width="454" height="658" alt="{F5121ADA-9B6A-4ADE-B9EE-387817A485A1}" src="https://github.com/user-attachments/assets/3a79d8e4-ea52-48d9-96d1-84ef8372f863" />

## Short explanation of how the system works
This IoT system uses a multi-tier architecture to move temperature data from a local environment to a cloud-based alert service:

- Data Origin: A sensor on Laptop 1 sends raw temperature readings to an edge device via TCP Sockets.

- Edge Gateway: Laptop 2 receives the socket data and publishes it to a central MQTT Broker to make it available over the internet.

- Logic & Alerting: A monitoring script on Laptop 1 (acting as a cloud server) subscribes to the broker and compares incoming values to a 28°C threshold.

- Notification: If the threshold is exceeded, the script triggers a Telegram Bot API request to send a real-time alert to your phone.

## Why is MQTT useful for building monitoring and alert systems in IoT?
MQTT is the preferred protocol for IoT monitoring because it balances minimal resource usage with high reliability in unpredictable network environments. Its effectiveness can be summarized by these five pillars:

- Efficiency: It uses a "binary" format with headers as small as 2 bytes, significantly reducing battery consumption and bandwidth costs compared to text-based protocols like HTTP.

- Scalability (Pub/Sub): By using a central Broker, sensors (publishers) and dashboards (subscribers) are decoupled. This allows you to scale to thousands of devices or add new data consumers without reconfiguring the hardware.

- Reliability (QoS): It offers three Quality of Service levels to guarantee message delivery, ranging from "best effort" to "exactly once" delivery for critical alerts.

- Failure Detection (LWT): The "Last Will and Testament" feature allows the broker to automatically alert the system if a sensor goes offline unexpectedly, providing built-in health monitoring.

- Immediate State (Retained Messages): The broker can store the most recent value from a sensor, ensuring that any new dashboard or user receives the current status immediately upon connecting.

