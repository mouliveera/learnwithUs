#Dockerfile for nginx service using ubuntu image
```Dockerfile
# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Update the package lists and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for Nginx logs
RUN mkdir -p /var/log/nginx

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
```

Save the above content in a file named `Dockerfile` in a directory of your choice.

Build the Docker image using the following command (make sure you're in the same directory as the Dockerfile):

```bash
docker build -t my-nginx-image .
```

Run the Nginx container:

```bash
docker run -d -p 8080:80 --name my-nginx-container my-nginx-image
```

You can access it on your host machine at http://localhost:8080.
