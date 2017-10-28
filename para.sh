#!/bin/bash

echo "Parar container"
docker stop $(docker ps -aq)

echo "Apagar container"
docker rm $(docker ps -aq)