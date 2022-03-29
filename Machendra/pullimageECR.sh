#!/bin/bash
echo "---- Pull the Image to the ECR ----"

docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-app-$(git log -1 --format=%h)
