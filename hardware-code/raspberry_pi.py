import paho.mqtt.client as mqtt
import RPi.GPIO as GPIO

# MQTT Broker configuration
mqtt_broker_host = "your_broker_host"
mqtt_broker_port = 1883
mqtt_username = "your_username"
mqtt_password = "your_password"

# GPIO pin mapping
machine_pins = {
    1: 17,
    2: 18,
    # Add mappings for other machines here
}

# Function to control a machine based on the received message
def control_machine(machine_id, message):
    if message == "turn_on":
        GPIO.output(machine_pins[machine_id], GPIO.HIGH)
    elif message == "turn_off":
        GPIO.output(machine_pins[machine_id], GPIO.LOW)

# MQTT client setup with authentication
client = mqtt.Client()

# Callback for when a message is received
def on_message(client, userdata, message):
    topic = message.topic
    machine_id = int(topic.split("/")[1])
    control_machine(machine_id, message.payload.decode())

client.on_message = on_message
client.username_pw_set(username=mqtt_username, password=mqtt_password)
client.connect(mqtt_broker_host, mqtt_broker_port)
client.subscribe("machine/+/control")  # Subscribe to control topics for all machines

# GPIO setup
GPIO.setmode(GPIO.BCM)
for pin in machine_pins.values():
    GPIO.setup(pin, GPIO.OUT, initial=GPIO.LOW)

# Start MQTT loop
client.loop_forever()
