FROM nginx
 
RUN apt-get update && apt-get install -y \
 vim wget dialog net-tools
 
# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf
 
# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/
 
RUN mkdir /etc/nginx/logs
 
# Add a sample index file
ADD index.html /www/data/
 
# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
 
# Create a runner script for the entrypoint
COPY nginx_launcher.sh /nginx_launcher.sh
RUN chmod +x /nginx_launcher.sh
 
# Expose ports
EXPOSE 80
 
ENTRYPOINT ["/nginx_launcher.sh"]
 
# Set the default command to execute
# when creating a new container
CMD ["nginx"]
