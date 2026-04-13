## Short description of the full system
This system demonstrates a lightweight IoT data pipeline across two machines:

  - Laptop 1 acts as both the sensor (generating random temperature readings) and the main server (receiving MQTT data and hosting the Grafana dashboard).
  - Laptop 2 acts as the edge device — it receives raw socket data from Laptop 1 and forwards it to an MQTT broker.

The full pipeline runs end-to-end in real time, from sensor simulation to live dashboard visualization.

## Socket data flow from Laptop 1 to Laptop 2
Laptop 1 (socket_sensor.py)
        │
        │  TCP Socket (port 5007)
        │  Sends: temperature value as plain string, e.g. "27.43"
        ▼
Laptop 2 (edge_device.py)
        │
        │  Receives socket data
        │  Publishes to MQTT broker
        ▼
MQTT Broker (broker.emqx.io)
        │
        │  MQTT Subscribe
        ▼
Laptop 1 (MQTT subscriber + Grafana)
        │
        ▼
Grafana Dashboard (http://localhost:3000)

## MQTT topic used: Real-Time MQTT Monitoring with Grafana

## Broker used: broker.emqx.io

## Screenshot of the Grafana dashboard
![grafana](https://github.com/user-attachments/assets/baa1fd59-b614-4886-8062-df6bf50c3e60)


## Short explanation of what is shown in the panel
The panel subscribes to the MQTT topic savonia/iot/temperature and displays incoming temperature values in real time. Each data point represents a single reading sent by the simulated sensor on Laptop 1. The panel updates automatically as new messages arrive from the broker, allowing you to observe the temperature fluctuating between 20 °C and 35 °C as the sensor script runs.

## Short note about the limitation of live-only MQTT visualization
The Grafana MQTT data source only shows live, streaming data — it does not store or retrieve historical messages. This means:

  - If Grafana is closed or the panel is refreshed, all previous readings are lost.
  - There is no time-series graph of past values unless a storage backend is added.

To enable historical visualization, a backend such as InfluxDB, Loki, or another time-series database must be integrated into the pipeline to persist incoming MQTT messages before they are displayed in Grafana.

## What is the role of Grafana in this system?
Explained as the visualization layer that subscribes to MQTT and renders live values, without doing any data collection itself.

## Why is MQTT useful for monitoring applications?
Covers its low overhead, publish-subscribe decoupling, broker-based delivery, and real-time push model.

## What is the difference between live monitoring and historical storage?
Answered with a comparison table showing the difference in persistence, use cases, tools, and limitations.
