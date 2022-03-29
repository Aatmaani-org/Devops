#!/bin/bash
docker build -t new-nodejs --build-arg GIT_COMMIT=$(git log -1 --format=%h) .
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:node_demo
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:node_demo
