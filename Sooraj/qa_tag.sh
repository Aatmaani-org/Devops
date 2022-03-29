!#/bin/bash
image="883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:"
docker pull $image:dev-latest
docker tag  $image:dev-latest $image:qa-latest
docker push $image:qa-latest
