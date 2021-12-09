#!/bin/bash


containerName=$1
dockerImageTag=$2
apiPort=$3

# delete unused images
docker image prune -f

# check for existing container
containerId=$(docker ps -q -a --filter name=${containerName})

if [[ ${containerId} ]];then
	docker kill ${containerId} > /dev/null 2>&1
	docker rm ${containerId} > /dev/null 2>&1
  docker run -p ${apiPort}:8080 --name ${containerName} -d ${dockerImageTag}
else
  docker run -p ${apiPort}:8080 --name ${containerName} -d ${dockerImageTag}
fi
