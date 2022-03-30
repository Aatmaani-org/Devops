#!/bin/bash
echo "---- Pushing Image to the ECR ----"

docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:$(git log -1 --format=%h)
docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:dev-latest
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:dev-latest

commit_id=`aws ecr describe-images --repository-name nodejs-repository-dev --output json | grep -1 dev-latest | awk 'NR==1{print $1}' | tr -d '"',`

echo "---- Creating pod using Helm ----"

cd helm
helm upgrade --install --set image.tag=$commit_id node-dev marvel -n dev -f values-dev.yaml
