#!/bin/sh

set -e

MASTER1_PORT=$1
MASTER2_PORT=$2
MASTER3_PORT=$3
SLAVE1_PORT=$4
SLAVE2_PORT=$5
SLAVE3_PORT=$6


docker_run="docker run -d -p ${MASTER1_PORT}:6379 -p ${MASTER2_PORT}:6380 -p ${MASTER3_PORT}:6381 -p ${SLAVE1_PORT}:6382 -p ${SLAVE2_PORT}:6383 -p ${SLAVE3_PORT}:6384 --name redis-cluster vishnunair/docker-redis-cluster:latest"

sh -c "$docker_run"
