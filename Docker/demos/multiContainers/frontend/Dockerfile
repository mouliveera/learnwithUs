# Use the official Node.js image as a base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 8080 for the Node.js application
EXPOSE 8080

# Command to start the application
CMD ["npm", "start"]

