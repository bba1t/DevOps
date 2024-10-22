#!/bin/bash

# gcc -o server server.c -lfcgi
gcc -c server.c -lfcgi -o server
spawn-fcgi -p 8080 ./server
nginx -g "daemon off;"