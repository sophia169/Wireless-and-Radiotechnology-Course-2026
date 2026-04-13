import paho.mqtt.client as mqtt
import requests

broker = "broker.emqx.io"
topic = "savonia/iot/temperature"

TOKEN = "8287245743:AAFsJLwsFKOpFfLFvQql3SU3f_YPY29WXyA"
CHAT_ID = "1730038415"

threshold = 28

def send_telegram(message):

    url = f"https://api.telegram.org/bot8287245743:AAFsJLwsFKOpFfLFvQql3SU3f_YPY29WXyA/sendMessage"

    payload = {
        "chat_id": CHAT_ID,
        "text": message
    }

    requests.post(url, data=payload)

def on_message(client, userdata, msg):

    temperature = float(msg.payload.decode())

    print("Temperature:", temperature)

    if temperature > threshold:

        alert = f"ALERT: High temperature {temperature} °C"

        print(alert)

        send_telegram(alert)

client = mqtt.Client()
client.connect(broker,1883)

client.subscribe(topic)

client.on_message = on_message

client.loop_forever()
