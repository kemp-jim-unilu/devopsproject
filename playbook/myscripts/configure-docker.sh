#!/bin/bash

sudo usermod -aG docker vagrant


count=$(docker run --name hello-world hello-world | grep -c "Hello from Docker!" | tail -n 1)


if [ $count != "1" ]; then
	echo "Docker validation failed"
	echo "Exiting..."
	exit 1
fi
docker rm hello-world
docker rmi hello-world
echo "Docker validation successful"

