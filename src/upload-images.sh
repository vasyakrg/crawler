#!/bin/bash

DOCKER_REPO=vasyakrg
DOCKER_REPO_CRED=.docker-creds

test -s $DOCKER_REPO_CRED && cat $DOCKER_REPO_CRED | docker login --username $DOCKER_REPO --password-stdin || docker login --username $DOCKER_REPO

docker push $DOCKER_REPO/bot-ui:latest;
docker push $DOCKER_REPO/bot-app:latest;
