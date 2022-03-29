#!/bin/bash
cd /var/lib/jenkins/workspace/Sooraj/node-app
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
