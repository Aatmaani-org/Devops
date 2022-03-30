#!/bin/bash
git_commit=`git log -1 --format="%h" `
echo $git_commit
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker build -t node-js .
docker tag node-js:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:$git_commit
docker tag node-js:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:$git_commit
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest
