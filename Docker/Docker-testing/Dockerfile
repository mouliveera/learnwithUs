FROM ubuntu:18.04
RUN apt-get update

RUN apt-get install -y python

COPY hello.sh /tmp/
RUN chmod +x /tmp/hello.sh

#ENTRYPOINT /tmp/hello.sh

#CMD "echo Hello World"
#CMD ['echo', 'Hello world']
#CMD ['/tmp/app.sh']
