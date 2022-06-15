## Docker Learn
------------------------------------------------------------------
#### To pull the images from DockerHub
docker pull

#### List the running containers
docker ps

#### List the container[History], whether they are running or not.
docker ps -a

#### To run the image on the containers
docker run  
Ex: docker run redis

Note: It combines both docker pull and docker start

#### Run a container and expose a port.
docker run -p 9090:9090 bitnami/prometheus

#### Start/stop containers
docker start
docker stop

#### Give a NAME to the container
docker run -d -p 9090:9090 --name prometheus bitnami/prometheus

NOTE: -d : detached mode

#### Create a container with USERNAME
docker run -d -p 9090:9090 --name prometheus2 --user root --workdir /root  bitnami/prometheus

#### List networks
docker network ls

#### Remove unwanted images, which are not in use.
docker images prune


NOTE: Dokerfile is a blue print for creating docker images.

RUN: If you want to create any directory or anything with in the containers.

COPY: You can copy anything from your local host to container. It executes on the host[your machine] to remote containers.
Ex:
COPY . /home/app

CMD: Entry point command. We can run scripts and execute any anything.

We can have multiple RUN entries but CMD should be one as an entry point.

Example Dockerfile:
------------------
FROM ubuntu

RUN mkdir -p /home/mveera

COPY ./scripts/sample-bash.sh /home/mveera

CMD ["bash","/home/mveera/sample-bash.sh"]

--------------------
Shell script: file: scripts/sample-bash.sh
#!/bin/bash
while true; do echo "Hello world";sleep 10;done
---------------------

#### How to create an image with Dockerfile
Once you are done with dockerfile composing. Run below commands to create an image with TAGS.
```bash
cd to the dockerfile locations.
docker build -t <IMAGE_NAME>:<TAG> .

Ex:
 docker build -t ubuntu-sleep:1.0 .
```

Check images after dockerfile done with Building.
```bash
docker images
```

Use that image to create containers.
```bash
docker run -d --name sleep-test ubuntu-sleep:1.0
```

###### Logs:
docker logs sleep-test -f
###### Login to that container:
docker exec -it sleep-test bash

---

## JuneLearning
#### Docker
- VM uses high disk[GB's] than containers[MB's]
- IMAGE: Is a package or a template like a VM template.
- CONTAINER: is a running instance for an image.

#### HelloWorld
```
docker run docker/whalesay cowsay HelloWorld
```
---
- Run - Start a containers
```
docker run nginx
```
---
- ps - List containers
- It lists all containers running.
```
docker ps
docker ps -a
```

docker ps -a: Lists the all containers running and exited previously.
---

- Images - list Images
```
docker images
```
---
- Run - Attach and detach

```
docker run nginx
```
It runs in a attached mode. You will see the webService logs on the screen.

- You can run the container in detach mode using -d option
```
docker run -d nginx
```
If you run "docker ps" you will see a container running. You can login or exec to the container by running "docker exec -it <CONTAINER-ID/CONTAINER-NAME> bash"

If you want to go to attach against a container, use "docker attach <Initial digits of container ID>"

- When you run "docker run redis", it uses the latest tag available in the docker registry.

i - Interactive mode
t - 0 terminal
---
#### RUN - Port mapping to local
```
❯ docker run -p 9100:80 nginx
❯ docker run --name demo-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=passWord mysql
```

#### RUN - Volume mapping
- If you want to persist data in container, use Volumes.
- It stores the data outside the containers.

```
docker run -v /opt/datadir:/var/lib/mysql mysql
```

#### Additional details of conatiner, includes ENV variables and other config details
```
docker inspect <CONTAINER>
```

Use "docker logs <CONTAINER>", it shows the logs of a container.


---
#### Dockerfile
- Dockerfile includes a format instruction and arguments
INSTRUCTION ARGUMENT
---------
FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
---------


Ex: Dockerfile
```
FROM ubuntu:18.04
RUN apt-get update

RUN apt-get install -y python

COPY . /tmp/
RUN chmod +x /tmp/app.sh

ENTRYPOINT /tmp/app.sh
```

app.sh
```
echo "Hello World"
```

ENTRYPOINT = It allows us to specify a command that will be run when the images run as a containers
- Create a container with a PWD
```
❯ docker  run -w /home/mveera -i -t  ubuntu
```

- Docker layered SIZE details will be captured. It shows size utilized at each layer.
```
docker history <IMAGE-ID>
Ex:

❯ docker history 298b73d77dfc
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
298b73d77dfc   3 minutes ago    ENTRYPOINT ["/bin/sh" "-c" "/tmp/app.sh"]       0B        buildkit.dockerfile.v0
<missing>      3 minutes ago    RUN /bin/sh -c chmod +x /tmp/app.sh # buildk…   98B       buildkit.dockerfile.v0
<missing>      3 minutes ago    COPY . /tmp/ # buildkit                         229B      buildkit.dockerfile.v0
<missing>      13 minutes ago   RUN /bin/sh -c apt-get install -y python # b…   35.1MB    buildkit.dockerfile.v0
<missing>      21 minutes ago   RUN /bin/sh -c apt-get update # buildkit        41MB      buildkit.dockerfile.v0
<missing>      4 days ago       /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>      4 days ago       /bin/sh -c #(nop) ADD file:40290d9a94ae76c35…   63.1MB
```


#### CMD:
- The main purpose of a CMD is to provide defaults for an executing container.
- We can use them to run commands in container level. It is hard coded.
- We can not run script as process

#### ENTRYPOINT:
- An ENTRYPOINT helps you to configure a container that you can run as an executable.
- We can run a script as process


#### NETWORKS
- When you install docker, it creates 3 default networks
- Bridge[default]
- none
- host

If you want to specify a network for a conatiner.
```
docker run nginx --network=host
```
- BridgeNetwork:
  - Private/ internal network on the host.
  - Cluster level network.
  - containers will connect internally with the ip address.
  - To expose an app to outside world, map these conatiner ports
  ```
  docker run -p 9100:80 nginx
  ```


- HostNetwork:
  - Another way to access these containers externally, by assosiating the conatiner with network "host"

- NoneNetwork:
  - Not attached to any network, they run in isolated environment.

#### Create a network
```
docker network create --driver bridge --subnet x.x.x.x/16 custom-isolated-network

docker network ls # to list the networks
```

- Docker has a default builtIn DNS for the host name resolutions.
- Docker uses network namespaces that creates separate namespace for each container.

#### Docker storage
- Docker volumes helps to persist the data.
- Create a volume.
```
docker volume create data_volume
```
- Use the volume on a container
```
docker run -v data_volume:/data/mveera nginx

(or)
docker run \
--mount type=bind,source=/data/mysql,target=/var/lib/mysql mysql
```
- It stores the data in node level. Check /var/lib/docker/volumes, you can see the list of volumes that you created and data stored on the containers.
- volumeMount: It mounts the volumes from volumes directory on the host.
- bindMount: It mounts the directory from different[any location on the docker host] location.

#### Storage Drivers:
- AUFS
- ZFS
- Device Mapper
- Overlay
- Overlay2

#### Docker compose

- Use "--link" to link the app dependicies.

#### Docker compose versions
- We can remove the links in version 2
- We need to specify version at the TOP.


#### Docker service to manage container
- Dcoker swarm orchestration offers "docker service" which allows us to create multiple instance[container] accross the nodes.
```
❯ docker service create --replicas 2 -p 8082:80 --name nginx-service nginx
```

#### Note:
- "docker service" commands should be run on master node

#### Orchestration[Includes node, container health scaling and monitoring]
- Docker swarm
- kubernetes
- MESOS

#### Docker swarm
- It combines the number of nodes into a cluster.
- Distribution, scaling and loadBalancing.
- We need to install docker on them.
- You need to designate one node as master and other be a workers nodes.
```
docker swarm init # To initiate a cluster on a master node
docker swarm join --tocken <tocken> # to join master, it should run on worker nodes
```

http://localhost/ 80
https 443
