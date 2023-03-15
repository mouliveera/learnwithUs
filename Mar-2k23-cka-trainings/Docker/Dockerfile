FROM ubuntu:20.04

# Update the package list and install nginx
RUN apt-get update && \
    apt-get install -y nginx

# Remove the default nginx configuration file
RUN rm /etc/nginx/sites-enabled/default

# Copy the custom nginx configuration file
#COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80 for incoming traffic
EXPOSE 80

# Start the nginx service when the container starts
CMD ["nginx", "-g", "daemon off;"]


# Notes:
# In the Dockerfile for the nginx image, the CMD instruction specifies the command that should be run when a container based on the image is started. In the case of the nginx image, the command specified is nginx -g daemon off;.

# The -g option specifies global directives, which are used to configure the nginx worker process. The daemon off directive is used to run the nginx worker process in the foreground, rather than as a background daemon.

# By default, when you start an nginx container, the nginx process runs in the background as a daemon. This can make it difficult to troubleshoot issues or view the logs from the nginx process.

# Setting daemon off instructs nginx to run in the foreground, which makes it easier to view the logs and troubleshoot issues. The ; at the end of the command is used to terminate the directive.

# So, the command nginx -g daemon off; starts the nginx process in the foreground and sets the global directive to run the process in the foreground as well.