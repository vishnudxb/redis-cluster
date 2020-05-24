#!/bin/sh

docker_run="docker run -d -p $INPUT_MASTER1_PORT:6379 -p $INPUT_MASTER2_PORT:6380 -p $INPUT_MASTER3_PORT:6381 -p $INPUT_SLAVE1_PORT:6382 -p $INPUT_SLAVE2_PORT:6383 -p $INPUT_SLAVE3_PORT:6384 --name redis-cluster vishnunair/docker-redis-cluster:latest"

sh -c "$docker_run"
