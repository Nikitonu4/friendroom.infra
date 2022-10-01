include .env
export

docker_bin:=$(shell command -v docker 2> /dev/null)
docker_compose_bin := $(shell command -v docker-compose 2> /dev/null)

.DEFAULT_GOAL:=help

help:
    @LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

init: init-folders up

init-folders:
	mkdir services \
	&& mkdir data \
 	&& mkdir data/db \
 	&& mkdir data/redis \
 	&& mkdir data/rabbitmq

build:
	$(docker_compose_bin) build

up:
	$(docker_compose_bin) up -d --remove-orphans

down:
	$(docker_compose_bin) down

clone-services:
	/bin/bash ./scripts/clone-services.sh
