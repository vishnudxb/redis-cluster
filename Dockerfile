# Container image that runs your code
FROM vishnunair/docker-redis-cluster:latest
MAINTAINER Vishnu Nair <me@vishnudxb.me>

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]