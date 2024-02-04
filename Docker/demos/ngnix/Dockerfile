FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y nginx

RUN mkdir -p /var/log/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

