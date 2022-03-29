#!/bin/bash
echo "---- Pushing Image to the ECR ----"

docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-app-$(git log -1 --format=%h)
docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-demo
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-app-$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-demo

echo "---- Creating pod using Helm ----"

ls
