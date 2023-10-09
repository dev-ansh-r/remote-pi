# Makefile for Machine Control Application

# Variables
BROKER_SERVICE = mosquitto
MQTT_BROKER_PORT = 1883
WEB_APP_PORT = 3000
WEB_APP_DIR = web-application

# Targets
.PHONY: install run-broker run-webapp

install:
	# Install Mosquitto MQTT broker
	# You may need to adjust this command based on your platform
	# On Linux (Debian/Ubuntu):
	sudo apt-get install mosquitto
	# On macOS (with Homebrew):
	# brew install mosquitto
	# On Windows: Download and install from the official website
	# Ensure that Mosquitto is added to your system's PATH

run-broker:
	# Start the Mosquitto MQTT broker on port $(MQTT_BROKER_PORT)
	$(BROKER_SERVICE) -c /path/to/mosquitto.conf

run-webapp:
	# Change directory to the web application folder
	cd $(WEB_APP_DIR) && \
		# Install project dependencies using npm
		npm install && \
		# Start the Node.js server for the web application on port $(WEB_APP_PORT)
		node app.js

# To clean up and stop the MQTT broker, you can add another target like this:
# clean:
# 	-$(BROKER_SERVICE) -c /path/to/mosquitto.conf -d
