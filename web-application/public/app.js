// public/app.js

function sendCommand(machineId, command) {
    const mqttClient = new Paho.MQTT.Client("your_broker_host", 1883, "web_client");
    const mqttOptions = {
        userName: "your_username",
        password: "your_password",
        onSuccess: onConnect,
    };

    mqttClient.connect(mqttOptions);

    function onConnect() {
        const topic = `machine/${machineId}/control`;
        const message = new Paho.MQTT.Message(command);
        message.destinationName = topic;
        mqttClient.send(message);
        mqttClient.disconnect();
    }
}
