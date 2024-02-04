#FROM ubuntu:20.04
FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable

RUN apt-get update; apt-get install nginx -y

COPY app.sh /tmp/

RUN chmod +x /tmp/app.sh

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get autoclean -y && \
    apt-get autoremove -y
#CMD ['/tmp/app.sh']
#ENTRYPOINT /tmp/app.sh
RUN rm -rf /tmp/*; rm -rf /var/cache/apk/*

CMD sh /tmp/app.sh 

