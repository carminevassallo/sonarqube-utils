#!/bin/bash

docker build -t sonarqube-pr:$1.$2 --build-arg SONARQUBE_VERSION=$1.$2 --build-arg SONARQUBE_ZIP_URL=https://repox.jfrog.io/artifactory/sonarsource-public-dev/org/sonarsource/sonarqube/sonar-application/$1.$2/sonar-application-$1.$2.zip .
docker run -p 9000:9000 -t sonarqube-pr:$1.$2