## Makefile Usage

You should pass NAME and VERSION as mentioned in the makefile


make dockerfile # to create a docker file
make build # To create an image with TAG
make push #It creates Dockerfile, creates an image and pushes to the registry.


USAGE:
```
make <OPTION> NAME=<GIVE NAME> VERSION=<GIVE VERSION>
```

Ex:
```
make build NAME=ubuntu-nginx VERSION=2.0
```



#### How to create M4 files

- Actual Docker file
```
FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install nginx -y
```

Creating a m4 files to automate the process.

Step 1: 
- Create a ubuntu m4 file
```
FROM ubuntu:20.04
```

Step 2:
- Create a nginx m4 file
```
RUN apt-get update
RUN apt-get install nginx -y
```

Step 3:
- Create a m4 file
File: ubuntu-nginx.m4
```
include(ubuntu.m4)
include(nginx.m4)
```

Step 4:
- User m4 to create a Dockerfile
```
m4 ubuntu-nginx.m4 > ubuntu-nginx-Dockerfile
```

