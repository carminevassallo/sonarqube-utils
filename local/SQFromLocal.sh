#!/bin/bash

docker build -t sonarqube-local:$1 --build-arg SONARQUBE_VERSION=$1 --build-arg SONARQUBE_ZIP=$2 .
docker run -p 9000:9000 -t sonarqube-local:$1