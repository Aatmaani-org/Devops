#!/bin/bash
mkdir Production
cd Production
git clone https://github.com/Aatmaani-org/Production.git
cd /var/lib/jenkins/workspace/sharan/nodejs-prod/Production/Production
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
a=`git log -1 --format=%h`
docker build -t new-nodejs .
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$a
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs:$a
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs:dev-latest


a=`git log -1 --format="%h" `
echo $a
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker build -t node-js .
docker tag node-js:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:$a
docker tag node-js:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:$a
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest
