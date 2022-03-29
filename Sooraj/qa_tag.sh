!#/bin/bash
docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
docker tag new-nodejs:dev-latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:qa-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:qa-latest
