#!/bin/bash

docker build -t hello:server .
docker run -d -p 80:81 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf hello:server

# docker build ./

# docker run -d -p 127.0.0.1:80:81 777