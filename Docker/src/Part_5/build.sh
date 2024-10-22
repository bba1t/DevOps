#!/bin/bash

docker build -t hello:server .
docker run -d -p 80:81 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf --name newttena hello:server
docker exec newttena bash dock.sh
export DOCKER_CONTENT_TRUST=1
dockle -i CIS-DI-0010 -i CIS-DI-0008 hello:server
curl localhost:80
curl localhost:80/status
