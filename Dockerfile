# Use the official Node.js image as the base image
FROM node:16.20.0

# Set the working directory in the container
WORKDIR /web-application

# Copy package.json and package-lock.json to the container
COPY /web-application/package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY /web-application .

# Expose the port on which the Node.js application will run (replace with your desired port)
EXPOSE 3000

# Start the Node.js application
CMD [ "node", "server.js" ]
