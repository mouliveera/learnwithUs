NAME=
VERSION=
REGISTRY=mouliveera
IMAGE=
ifeq ($(NAME),)
  $(error NAME is not set)
endif

ifeq ($(VERSION),)
  $(error VERSION is not set)
endif

#TEMPFILE=$(mktemp /tmp/$NAME-$VERSION-XXX)
TEMPFILE := $(shell mktemp /tmp/${NAME}-${VERSION}-Dockerfile-XXXX)

dockerfile:
	m4 ubuntu-${IMAGE}.m4 > ${TEMPFILE}

build:
	m4 ubuntu-${IMAGE}.m4 > ${TEMPFILE}
	docker build -t ${REGISTRY}/${NAME}:${VERSION} - < ${TEMPFILE}

push: 
	m4 ubuntu-${IMAGE}.m4 > ${TEMPFILE}
	docker build -t ${REGISTRY}/${NAME}:${VERSION} - < ${TEMPFILE}
	docker push ${REGISTRY}/${NAME}:${VERSION}
#name:
#	echo "Enter name: $$NAME" 
#
naresh:
	docker images; docker ps
sysinfo:
	date; \
	uptime; \
	df -h
