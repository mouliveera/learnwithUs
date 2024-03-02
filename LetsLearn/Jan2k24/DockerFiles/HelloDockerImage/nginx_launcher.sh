#!/bin/sh
 
# Replace the HOST_NAME in the index.html for container
sed -i.bak 's/HOST_NAME/'"$HOSTNAME"'/g' /www/data/index.html
 
# Startup the cmd
exec "$@"
