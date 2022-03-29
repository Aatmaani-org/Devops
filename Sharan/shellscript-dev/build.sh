#!/bin/bash
mkdir Production
cd Production
git clone https://github.com/Aatmaani-org/Production.git
cd /var/lib/jenkins/workspace/sharan/nodejs-prod/Production/Production
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker build -t new-nodejs .
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format="%h)
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/dev-latest:$(git log -1 --format="%h) 
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format="%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/dev-latest:$(git log -1 --format="%h)
