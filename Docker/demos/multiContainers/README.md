**1. `docker-compose.yml`**

This file defines the services, networks, and volumes for your multi-container application.

- `version: '3'`: Specifies the version of the Docker Compose file format.

- `services`: Describes the different containers or services in your application.

  - `frontend`: Configures the frontend service.
    - `build`: Specifies the build context for the frontend service, indicating the location of the Dockerfile.
    - `ports`: Maps the host machine's port 8080 to the container's port 8080.

  - `backend`: Configures the backend service.
    - `image`: Specifies the MongoDB image to use.
    - `ports`: Maps the host machine's port 27017 to the container's port 27017.

**2. `frontend/Dockerfile`**

This Dockerfile defines the steps to build the frontend service.

- `FROM node:14`: Uses the official Node.js 14 image as the base image.

- `WORKDIR /app`: Sets the working directory within the container to `/app`.

- `COPY package*.json ./`: Copies the `package.json` and `package-lock.json` files to the working directory.

- `RUN npm install`: Installs the Node.js application dependencies.

- `COPY . .`: Copies the rest of the application code to the container.

- `EXPOSE 8080`: Exposes port 8080 for the Node.js application.

- `CMD ["npm", "start"]`: Specifies the command to run when the container starts. In this case, it starts the Node.js application.

**3. `frontend/package.json`**

This file contains metadata about the Node.js application and its dependencies.

- `"start": "node server.js"`: Defines a start script that runs the `server.js` file using Node.js.

**4. `frontend/server.js`**

A simple Express.js server that responds with "Hello from the frontend!" when you access the root URL.

**Running the Application:**

1. `docker-compose up -d`: Builds the images and starts the containers in the background.

