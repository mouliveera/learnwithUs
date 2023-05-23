# Use an official Nginx runtime as a parent image
FROM nginx:latest

# Copy the index.html file into the container
COPY index.html /usr/share/nginx/html

# Copy the background image into the container
COPY background.jpg /usr/share/nginx/html

ENV HOSTNAME=${HOSTNAME}

# Expose port 80 for the Nginx server
EXPOSE 80

# Start the Nginx server when the container starts
#CMD ["nginx", "-g", "daemon off;"]
CMD envsubst < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'
