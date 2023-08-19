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

# Wait for Redis Cluster to be up and running
echo "Waiting for Redis Cluster to start..."
until docker exec redis-cluster redis-cli -h localhost -p 6379 cluster info; do
    sleep 1
done

# Perform additional health check here if needed
# For example, you can check if all nodes are available and part of the cluster

echo "Redis Cluster is up and running!"

# You can add more health check logic here if necessary

# Keep the script running to keep the Docker container running
tail -f /dev/null
