#!/bin/bash
echo "---- Pull the Image to the ECR ----"

docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:dev-latest

echo "---- Tagging the Image and Push Image to ECR ----"

docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:qa-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:qa-latest

echo "---- Creating the Pods using HELM ----"

cd helm
helm upgrade --install --set image.tag=qa-latest node-dev marvel -n qa -f values-qa.yaml
