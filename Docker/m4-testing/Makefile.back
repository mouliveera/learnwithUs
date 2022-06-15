NAME=
VERSION=
REGISTRY=mouliveera
DCR=docker.io

ifeq ($(NAME),)
  $(error NAME is not set)
endif

ifeq ($(VERSION),)
  $(error VERSION is not set)
endif

TMPDIR := $(shell mktemp -d /tmp/docker-image-${NAME}-XXX)
#TMPDIR=$(mktemp -d /tmp/docker-image-${NAME}-XXX)


dockerfile:
	m4 Dockerfile.m4 > ${TMPDIR}/Dockerfile;

build:
	m4 Dockerfile.m4 > ${TMPDIR}/Dockerfile
	docker build -t ${REGISTRY}/${NAME}:${VERSION} - < ${TMPDIR}/Dockerfile;
	docker push ${REGISTRY}/${NAME}:${VERSION}
