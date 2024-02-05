## Docker Concepts and Examples

### Table of Contents
1. [Introduction](#introduction)
2. [Docker Basics](#docker-basics)
    - [Images](#images)
    - [Containers](#containers)
    - [Services](#services)
3. [Dockerfile](#dockerfile)
4. [Docker Compose](#docker-compose)
5. [Docker Networking](#docker-networking)
6. [Docker Volumes](#docker-volumes)
7. [Docker Registry](#docker-registry)
8. [Docker Commands](#docker-commands)
9. [Docker Best Practices](#docker-best-practices)

## 1. Introduction
Docker is a platform for developing, shipping, and running applications in containers. Containers are lightweight, portable, and consistent environments that include the application and its dependencies.

## 2. Docker Basics

### Images
- Docker images are the blueprints for containers. They contain everything needed to run an application, including the code, runtime, libraries, and system tools.
- Example: Pulling a base image and running a container.
    ```bash
    # Pulling an image
    docker pull ubuntu:latest
    
    # Running a container
    docker run -it ubuntu:latest /bin/bash
    ```

### Containers
- Containers are instances of Docker images. They run in isolated environments, ensuring consistency across different environments.
- Example: Running a simple web server in a container.
    ```bash
    # Running a container with a web server
    docker run -d -p 8080:80 nginx:latest
    ```

### Services
- In Docker, a service refers to a definition of a task or set of tasks that are executed in containers. It is a way to scale and distribute applications across a Docker swarm.
- A Docker swarm is a group of machines running Docker that work together to run and manage a set of services.

### Example: Docker Swarm Service
- Initialize a Docker swarm:
  ```bash
  docker swarm init
  ```

- Create a service:
  ```bash
  docker service create --name my-web-app -p 8080:80 nginx:latest
  ```

- List running services:
  ```bash
  docker service ls
  ```

- Scale a service:
  ```bash
  docker service scale my-web-app=3
  ```

- Remove a service:
  ```bash
  docker service rm my-web-app
  ```

- Additional commands:
  - **Inspect a service:**
    ```bash
    docker service inspect my-web-app
    ```

  - **View logs of a service task:**
    ```bash
    docker service logs my-web-app
    ```

Docker services are particularly useful when working with distributed applications and deploying them across multiple nodes in a swarm. They allow for easy scaling, load balancing, and management of applications in a clustered environment.

## 3. Dockerfile
- Dockerfile is a script that contains instructions to build a Docker image.
- Example: Creating a Dockerfile for a Node.js application.
    ```Dockerfile
    # Use an official Node.js runtime as a base image
    FROM node:14
    
    # Set the working directory
    WORKDIR /usr/src/app
    
    # Copy package.json and package-lock.json
    COPY package*.json ./
    
    # Install dependencies
    RUN npm install
    
    # Copy the application code
    COPY . .
    
    # Expose the port the app runs on
    EXPOSE 3000
    
    # Command to run the application
    CMD ["npm", "start"]
    ```

## 4. Docker Compose
- Docker Compose is a tool for defining and running multi-container Docker applications.
- Example: Creating a Docker Compose file for a web application with a database.
    ```yaml
    version: '3'
    
    services:
      web:
        image: nginx:latest
        ports:
          - "8080:80"
    
      db:
        image: postgres:latest
        environment:
          POSTGRES_PASSWORD: example
    ```

## 5. Docker Networking
- Docker provides networking capabilities to connect containers.
- Example: Creating a user-defined bridge network.
    ```bash
    # Create a bridge network
    docker network create mynetwork
    
    # Run containers attached to the custom network
    docker run -d --network mynetwork --name container1 nginx:latest
    docker run -d --network mynetwork --name container2 nginx:latest
    ```

## 6. Docker Volumes
- Volumes allow persisting data outside containers and sharing data between containers.
- Example: Mounting a volume to a container.
    ```bash
    # Create a volume
    docker volume create myvolume
    
    # Run a container with the volume mounted
    docker run -d -v myvolume:/app/data myapp:latest
    ```

## 7. Docker Registry
- Docker Registry is a repository for storing and distributing Docker images.
- Example: Pushing an image to Docker Hub.
    ```bash
    # Tag the image
    docker tag myapp:latest username/myapp:latest
    
    # Login to Docker Hub
    docker login
    
    # Push the image to Docker Hub
    docker push username/myapp:latest
    ```

## 8. Docker Commands

### Managing Images

- **List all images:**
    ```bash
    docker images
    ```

- **Remove an image:**
    ```bash
    docker rmi image_name
    ```

- **Build an image from a Dockerfile:**
    ```bash
    docker build -t image_name:tag .
    ```

### Managing Containers

- **List running containers:**
    ```bash
    docker ps
    ```

- **List all containers (including stopped ones):**
    ```bash
    docker ps -a
    ```

- **Stop a running container:**
    ```bash
    docker stop container_id
    ```

- **Remove a container:**
    ```bash
    docker rm container_id
    ```

- **Inspect container details:**
    ```bash
    docker inspect container_id
    ```

### Container Logs and Exec

- **View container logs:**
    ```bash
    docker logs container_id
    ```

- **Execute a command inside a running container:**
    ```bash
    docker exec -it container_id /bin/bash
    ```

### Docker Compose

- **Start services defined in a Docker Compose file:**
    ```bash
    docker-compose up
    ```

- **Stop services defined in a Docker Compose file:**
    ```bash
    docker-compose down
    ```

### Docker Networking

- **List Docker networks:**
    ```bash
    docker network ls
    ```

- **Inspect a Docker network:**
    ```bash
    docker network inspect network_name
    ```

### Docker Volumes

- **List Docker volumes:**
    ```bash
    docker volume ls
    ```

- **Inspect a Docker volume:**
    ```bash
    docker volume inspect volume_name
    ```

###

 Docker Registry

- **Login to a Docker registry:**
    ```bash
    docker login registry_url
    ```

- **Push an image to a registry:**
    ```bash
    docker push registry_url/image_name:tag
    ```

- **Pull an image from a registry:**
    ```bash
    docker pull registry_url/image_name:tag
    ```

These additional commands cover various Docker operations, from managing images and containers to working with Docker Compose, networking, volumes, interacting with Docker registries, and understanding Docker services. Customize them based on your specific use case and needs.

## 9. Docker Best Practices
- Keep images small and minimal.
- Use multi-stage builds for production images.
- Minimize the number of layers in your images.
- Use environment variables for configuration.


| RoughNotes: https://docs.google.com/document/d/1BuWeR2izlSvBZabqpz4h8FZh6OgJrxunUPEnTC9SWt8/edit#heading=h.c7fi0hh7rwv2

01:58 - What is Docker?
10:56 - What is a Container?
19:40 - Docker vs Virtual Machine
23:53 - Docker Installation
42:02 - Main Docker Commands
57:15 - Debugging a Container
1:06:39 - Demo Project Overview - Docker in Practice
1:10:08 - Developing with Containers
1:29:49 - Docker Compose - Running multiple services
1:42:02 - Dockerfile - Building our own Docker Image
2:04:36 -  Private Docker Repository - Pushing our built Docker Image into a private Registry on AWS
2:19:06 - Deploy our containerized app
2:27:26 - Docker Volumes - Persist data in Docker
2:33:03 - Volumes Demo - Configure persistence for our demo project


Docker Main commands:
# Docker pull
docker run
docker start
docker stop
docker ps

- Container is a running environment for an IMAGE
- 

Pull different docker images[redis]
Multiple container are running; avoid port conflict
docker run -p 6000:6379 redis
dcoker run -p 6001:6379 redis:4.0

- docker logs, docker exec

---
## What is Docker?
Docker is a platform and a set of tools designed to make it easier to create, deploy, and run applications in containers. Containers are lightweight, standalone, and executable packages that include everything needed to run a piece of software, including the code, runtime, libraries, and system tools.

## Key components:

*Docker Engine*: This is the core of Docker and is responsible for building, running, and managing containers. It consists of a server, a REST API, and a command-line interface.

*Docker Image*: A Docker image is a lightweight, stand-alone, and executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and system tools. Images are used as the basis for creating containers.

*Container*: A container is an instance of a Docker image. It encapsulates the application and its dependencies, ensuring that it runs consistently across different environments. Containers are isolated from each other and the host system.

*Dockerfile*: This is a text file that contains a set of instructions for building a Docker image. It specifies the base image, the application code, dependencies, and other configuration settings.

*Docker Hub*: Docker Hub is a cloud-based registry service where users can share and store Docker images. It provides a centralized repository for managing and distributing Docker images.

---

## Notes:

## What is Docker: 
- Is a tool that helps to create deploy and run applications in a containers. 
- Docker is an open platform for developing, shipping, and running applications. 
- Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. 
- With Docker, you can manage your infrastructure in the same ways you manage your applications. 
- By taking advantage of Docker's methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.
- We can use docker for "Fast, consistent delivery of your applications", "Running more workloads on the same hardware"

## What is container:
- Is a way to package applications with all required dependencies and configurations.
- A container is an isolated environment for your code. 
- This means that a container has no knowledge of your operating system, or your files. 
- It runs on the environment provided to you by Docker Desktop. 
- Containers have everything that your code needs in order to run, down to a base operating system. 
- You can use Docker Desktop to manage and explore your containers.

## Container repository
- DockerHub [Public, private]

## Volumes:
docker volume create my_volume
docker run -d --name my_container -v my_volume:/mouli ubuntu sleep 3000

# Docker hub
docker run -d -p 8088:80 --name welcome-to-docker docker/welcome-to-docker


#Docker Container Image DockerHub MultiContainer[DockerCompose] DockerFile
