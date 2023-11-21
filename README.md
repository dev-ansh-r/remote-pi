# Raspberry Pi Control Web Application

## Overview

This project allows you to control machines via MQTT messages using a web interface. The web interface is served by a Node.js server, and the Raspberry Pi subscribes to MQTT messages to control the machines.

## Prerequisites

- Node.js installed on your machine.
- An MQTT broker set up (you can use Mosquitto as mentioned earlier).
- Raspberry Pi connected to the same network as your MQTT broker.

### Building from source

- Clone this repository:
```
git clone https://github.com/dev-ansh-r/remote-pi.git
cd remote-pi
```

### Setting Up the MQTT Broker (Mosquitto)

1. Install and configure Mosquitto MQTT broker on your local machine. You can follow the official installation guide for your platform: [Mosquitto Installation Guide](https://mosquitto.org/download/)

- On Linux:
```
  sudo apt-get install mosquitto
```

- On macOS (with Homebrew):
```
  brew install mosquitto
```

- On Windows: Download the installer from the official website and follow the installation instructions.

2. Start the Mosquitto broker:

- On Linux/macOS, you can start it with:
```
  mosquitto -c /path/to/mosquitto.conf
```
  Replace `/path/to/mosquitto.conf` with the actual path to your Mosquitto configuration file, or use the default configuration.

- On Windows, Mosquitto usually starts as a service. You can check the services list and ensure it's running.

- You may need to adjust firewall settings to allow MQTT traffic on port 1883.


## Setup

1. working directory:
```
cd web-applicatoion
```

2. Install dependencies:
```
npm install
```

3. Start the Node.js server:
```
node app.js
```

4. Access the web interface by opening a browser and navigating to `http://localhost:3000`.


## Configuring the Raspberry Pi

1. Make sure your Raspberry Pi is connected to the same network as your MQTT broker.

2. Use the provided Python code (`raspberry_pi.py`) to subscribe to MQTT messages and control the machines connected to the GPIO pins. Modify the code to match your GPIO pin mappings.

3. Run the Python code on your Raspberry Pi:

4. Make sure your Raspberry Pi is connected to the same network as your MQTT broker.

5. Use the provided Python code (`raspberry_pi.py`) to subscribe to MQTT messages and control the machines connected to the GPIO pins. Modify the code to match your GPIO pin mappings.

6. Open the Raspberry Pi's terminal and open the `/etc/rc.local` file for editing:
```
sudo nano /etc/rc.local
```

7. Add the following line before `exit 0` to run the Python code on startup:
```
 sudo python /path/to/raspberry_pi.py
```
 Replace `/path/to/raspberry_pi.py` with the actual path to your Python script.

8. Save the file and exit the text editor.

## Usage

- Click on the "Turn On" or "Turn Off" buttons to control the respective machines.

## Security Considerations

- Implement security measures such as MQTT authentication and access control for your MQTT broker.

## Troubleshooting

- If you encounter any issues, please refer to the troubleshooting section in the code repository or consult the documentation of the MQTT broker.

## License

This project is licensed under the MIT License.

-- copyright -- devansh